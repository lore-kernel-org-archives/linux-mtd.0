Date: Thu, 10 Apr 2008 17:53:55 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: nickpiggin@yahoo.com.au, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Subject: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
Message-ID: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: joern@logfs.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We faced JFFS2 kernel panic issues on Linux 2.6.24.
Bug is easy reproducible if to perform random file system operations (esepcially trunkate). We have made a trivial tool which reproduces the problem on JFFS2 partiton. Usually less than 10 min is needed to catch a panic. 

The problem is related to introduction  of write_begin and write_end functions instead of original prepare_write & commit_write. The kernel panic has disappeared when we rolled back write_begin and write_end changes in JFFS2. We tried to fix it - but it seems problem is bit tough for us. I would be much appreciate if someone would fix the problem or suggest where the problem is. We made several attempts to identify the source but still have not idea about what exactly is the source of the bug. Each time panic messages are different. 

Here is the log of one of kernel panic messages:

4/103: write f0 [915918,86035] 28
4/104: unlink d3/d6/df/f16 0
4/106: getdents d3 0
4/107: write d3/d6/fd [1352490,60815] 28
10/209: truncate d5/f9 1534232 28
10/210Unable to handle kernel NULL pointer dereference at virtual
address 000000
00
: chown d5/df/d12/d1e 156 28
10/211: rename d5/df/d10/d15/f18 tpgd = c310c000
o d5/d20/f3c 28
10/212: mkdir d5/df/d10/d15/d28/d3d 28
10/213:[00000000] *pgd=a3107031 creat d5/df/d10/d15/f3e x:0 28 0
10/214: fsync d5/df/d10/d15/d, *pte=000000001b/f22 0
10/215: rename d5/df/d12/d1e to d5/df/d12/d3f 28
10/2, *ppte=0000000016: readlink - no filename
10/217: write d5/df/f1c [484960,1048
83] 28
10/218: readlink - no filename
87/134: mkdir d3/d8/d32 Internal error: Oops: 817 [#7]
Modules linked in:
CPU: 0    Tainted: G      D  (2.6.24.2-pxa27x #18)
PC is at shrink_dcache_parent+0x6c/0x108
LR is at __init_begin+0x3fff8000/0x34
pc : [<c008bdbc>]    lr : [<00000000>]    psr: 00000013
sp : c310becc  ip : c3b00324  fp : c310bef4
r10: c3b00358  r9 : 00000000  r8 : c021403c
r7 : c0214010  r6 : c310a000  r5 : c383781c  r4 : 0000000b
r3 : 00000000  r2 : 00000000  r1 : c3b00348  r0 : c383781c
Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a310c000  DAC: 00000015
Process fsstress (pid: 825, stack limit = 0xc310a268)
Stack: (0xc310becc to 0xc310c000)
bec0:                            c383781c 00000000 c3838098 c310bf28 c001e004
bee0: c310a000 0000f510 c310bf08 c310bef8 c0082d80 c008bd5c c383781c c310bf24
bf00: c310bf0c c00830f4 c0082d3c c383781c 00000000 c3fba000 c310bf94 c310bf28
bf20: c0084ff0 c00830b0 c3837e68 c3c0d120 00031837 00000002 c3fba000 00000010
bf40: 00000000 00000000 00000006 c001e004 c310bf6c c310bf60 c007c030 c007bd38
bf60: c310bf88 c310bf70 c0078f58 c007c008 00000000 c30847a0 0000000a bed68de4
bf80: 0000f484 00000028 c310bfa4 c310bf98 c0085080 c0084f50 00000000 c310bfa8
bfa0: c001de60 c0085074 0000000a bed68de4 400006b0 bed689dc bed689d4 bed689dc
bfc0: 0000000a bed68de4 0000f484 00000000 000081cc 00000000 0000f510 bed689c4
bfe0: bed689c8 bed685a4 0000aaa0 0001ffc4 20000010 400006b0 00000000 00000000
Backtrace:
[<c008bd50>] (shrink_dcache_parent+0x0/0x108) from [<c0082d80>]
(dentry_unhash+0
x50/0x9c)
[<c0082d30>] (dentry_unhash+0x0/0x9c) from [<c00830f4>]
(vfs_rmdir+0x50/0xbc)
 r4:c383781c
[<c00830a4>] (vfs_rmdir+0x0/0xbc) from [<c0084ff0>] (do_rmdir+0xac/0xf0)
 r6:c3fba000 r5:00000000 r4:c383781c
[<c0084f44>] (do_rmdir+0x0/0xf0) from [<c0085080>] (sys_rmdir+0x18/0x1c)
 r7:00000028 r6:0000f484 r5:bed68de4 r4:0000000a
[<c0085068>] (sys_rmdir+0x0/0x1c) from [<c001de60>]
(ret_fast_syscall+0x0/0x2c)
Code: e2433001 e5873004 e5912004 e59c3024 (e5823000)
28


Here is a code of trivial tool which reproduces the issue very fast:

/*Code is based on fsstress GPL program*/
#define _LARGEFILE64_SOURCE
#include <sys/stat.h>
#include <sys/statvfs.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <fcntl.h>
#include <malloc.h>
#include <dirent.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <error.h>

#define MAX_FILE_NAME_LEN 256
#define FILE_MASK "file"
#define MNT_POINT "/mnt/mtd8/"
#define BUF_SIZE (128*1024)

char rnd_buf[BUF_SIZE];
int files_created;
char mnt_pnt[256];

enum ops
{
  OPS_CREAT,
  OPS_WRITE,
  OPS_TRUNC,
  OPS_TOTAL
};

void creat_f()
{
  int fd;
  char fname[MAX_FILE_NAME_LEN];
  sprintf(fname,"%s%s.%d",mnt_pnt,FILE_MASK,files_created);
  printf("creat fname=%s\n",fname);
  fd=creat(fname,0666);
  if(!fd)
	return;
  close(fd);
  files_created++;
}

void write_f(int file_num)
{
  printf("write file_num:%d\n",file_num);
  struct stat64 stb;
  int fd;
  __int64_t lr = ((__int64_t)random() << 32) + random();
  off64_t writeofft=0;
  long writelen=0;
  char fname[MAX_FILE_NAME_LEN];
  sprintf(fname,"%s%s.%d",mnt_pnt,FILE_MASK,file_num);
  
  fd=open(fname,O_WRONLY);
  if(!fd)
	return;
  if(fstat64(fd,&stb)<0)
  {
	close(fd);
	return;
  }
  printf("stb.st_size=%lld\n",stb.st_size);
  if(stb.st_size!=0)
	writeofft=(off64_t)(lr%(stb.st_size + BUF_SIZE*4));
  writelen=random()%BUF_SIZE;
  if(writeofft!=lseek64(fd,writeofft,SEEK_SET))
  {
	printf("lseek64 failed with errno %d
%s\n",errno,strerror(errno));
	return;
  }
  memset(rnd_buf,(file_num%127)&0xFF,BUF_SIZE);
  printf("fname=%s writeofft=%lld
writelen=%ld\n",fname,writeofft,writelen);
  write(fd,rnd_buf,writelen);
  printf("after write\n");
  close(fd);
}

void trunc_f(int file_num)
{
  printf("trunc file_num:%d\n",file_num);
  int fd;
  struct stat64 stb;
  stb.st_size=0;
  __int64_t lr = ((__int64_t)random() << 32) + random();
  off64_t truncofft=0;
  char fname[MAX_FILE_NAME_LEN];
  sprintf(fname,"%s%s.%d",mnt_pnt,FILE_MASK,file_num);
  fd=open(fname,O_RDONLY);
  if(!fd)
	return;
  if(fstat64(fd,&stb)<0)
  {
	close(fd);
	return;
  }
  close(fd);
  
  truncofft=(off64_t)(lr%(stb.st_size + BUF_SIZE*4));	
  printf("fname=%s truncofft=%lld\n",fname,truncofft);
  truncate64(fname,truncofft);
}

int main(int argc,char** argv)
{
  int op_num;
  int file_num;
  files_created=0;

  if(argc != 2 || (argc==2 && (strcmp(argv[1],"--help")==0 ||
strcmp(argv[1],"-h")==0)))
  {
	printf("Using: rndops dir\n");
	return 0;
  }
  else
  {
	strcpy(mnt_pnt,argv[1]);
  }

  if(mnt_pnt[strlen(mnt_pnt)-1]!='/')
	strcat(mnt_pnt,"/");

  creat_f();
  
  while(1)
  {
	op_num=random()%OPS_TOTAL;
	file_num=random()%files_created;
	switch(op_num)
	{
	  case OPS_CREAT:
	  creat_f();
	  break;
	  case OPS_WRITE:
		write_f(file_num);
		break;
	  case OPS_TRUNC:
		trunc_f(file_num);
		break;
	}
  }
	
  return 0;
}

Thanks,
Alexey
