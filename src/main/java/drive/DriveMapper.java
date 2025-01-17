package drive;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DriveMapper {
	List<Drive> selectDriveInfo(int d_id);
	List<Folder> selectFolderAll();
	Folder selectBydr_id(int dr_id);
	Folder selectByfd_id(int fd_id);
	Folder selectBySfd_id(int sfolder_id);
	Folder selectFolder_name(int folder_id);//폴더 이름 출력
	Folder selectShare_name(int sfolder_id);//공유폴더 이름 출력
	Drive selectDrive(int drive_id);
	
	List<Folder> selectBydr_id1(int drive_id);
	List<Folder> selectBydr_id2(int drive_id);
	List<Folder> selectBypr_id (int parent_id);
	List<Files> selectByf_id(int folder_id);
	Files selectByff_id(int files_id);
	Files selectBysff_id(int sfiles_id);
	void insert_folder(Folder folder);//폴더 생성
	void insert_folder2(Folder folder);
	void insert_sfolder(Folder folder);//공유 폴더 생성
	
	void update_folder(Folder folder);//폴더 수정
	void update_sfolder(Folder folder);//공유 폴더 수정
	
	void insert_files(Files files);//파일 업로드
	void deleteFolder(int folder_id);//폴더 삭제
	void deleteSFolder (int sfolder_id);//공유 폴더 삭제
	void deleteFiles(int files_id);//파일 삭제
	void deleteSFiles(int sfiles_id);//공유 파일 삭제
	void insert_favorites(@Param("id") int id, @Param("folder_id") int folder_id);//폴더 즐겨찾기
	void insert_favorites_drive(@Param("id") int id, @Param("drive_id") int drive_id);//드라이브 즐겨찾기
	
	//공유파일
	List<Files> selectBySfiles_id(int sfolder_id);
	List<Files> selectBysf_id(int sfolder_id);
	void insert_sfiles(Files sfiles);
	Folder openSfolder(int sfolder_id);
	
	//파일
	int selectCount();
	List<Drive> selectPage(Pagination pagination);
	
	//폴더
	int selectCount2();
	List<Drive> selectPage2(Pagination pagination);
	
	int inSfolder(Folder folder);
}
