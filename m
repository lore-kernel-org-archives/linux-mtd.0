Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eVX1-0005yr-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2002 07:51:55 +0100
Message-ID: <006501c24295$f436fd40$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Cc: <tglx@linutronix.de>, <cms@gv.com.tw>, "? ??" <djh@gv.com.tw>
Subject: jffs2_mark_node_obsolete() called with wbuf active but alloc_sem not locked!
Date: Tue, 13 Aug 2002 14:52:12 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0062_01C242D9.020DF200"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------=_NextPart_000_0062_01C242D9.020DF200
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

test program: lls.c attached
usage: "./lls /"
---------------------------
jffs2_mark_node_obsolete() called with wbuf active but alloc_sem not locked!
kernel BUG at nodemgmt.c:400!
Unable to handle kernel paging request at virtual address 00000000, epc ==
80094
dd8, ra == 80094dd8
Oops in fault.c:do_page_fault, line 204:
$0 : 00000000 10003c00 0000001e 00000001 801ce7d0 00000001 00000001 00810303
$8 : b4000090 0000001e b4000098 80000000 0000000d 0000000a 50000000 fffffff9
$16: 8018c9fc 808930e8 00000000 8018c350 80bb7620 80893120 00000001 00000004
$24: ffffffff 80dafc8a                   80dae000 80dafdd8 802ae1ec 80094dd8
Hi : 00001b1c
Lo : 00000265
epc  : 80094dd8    Not tainted
Status: 10003c04
Cause : 8000000c
Process rmdir (pid: 96, stackpage=80dae000)
Stack: 8018c350 8018c9fc 00000190 008102e2 801e74cc 801e74ce 800184a8
00000400
       808930e8 8009e1d0 8018dfea 808930e8 802c4640 00000000 802c4640
00000000
       806aef00 808a0560 0000002c 808930e8 00000001 80097f1c 8018dfb4
802c4655
       00000350 00000000 00000004 004c830c 00000000 80e4a970 004c830c
00001cf4
       806aef00 802ae190 808a04b8 808a0430 802ae190 808a04b8 00000002
00000001
       7ffffcb0 ...
Call Trace: [<8018c350>] [<8018c9fc>] [<800184a8>] [<8009e1d0>] [<8018dfea>]
[<8
0097f1c>]
 [<8018dfb4>] [<8008ed38>] [<8005e33c>] [<8008fd54>] [<8005103c>]
[<80050e70>]
 [<800544f4>] [<80052c10>] [<800547a4>] [<80054694>] [<800107ac>]

Code: 02002821  0c006099  24060190 <08025397> ae400000  3c02801d  8c42f76c
0000
0000  3042007f
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing


------=_NextPart_000_0062_01C242D9.020DF200
Content-Type: application/octet-stream;
	name="lls.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lls.c"



/* Directory tree lister / File information shower */

#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pwd.h>
#include <sys/types.h>
#include <sys/stat.h>

//#include <sys/kdaemon.h>//bdflush(1,0)//bdflush can't use under 2.2.12

#define Success 0
#define Failure 1

#define JmpWidth    4

#define PutStr(d,s)     printf("%*s%s",d,"",s)      /* d: depth, s: =
string */
#define fPutStr(d,s)    fprintf(fp2,"%*s%s",d,"",s) /* d: depth, s: =
string */

char	buf[128];

char		buf2[1024];
unsigned long 	chksum,c1,c2,pass;
FILE		*fp2;

unsigned long putchksum(char *fname)
{
	int sizeread,i;
	FILE *fp;

	chksum=3D0;
	if( !(fp=3Dfopen(fname,"rb")) ) return;
	while( (sizeread=3Dfread(buf2,1,1024,fp)) )
	{
		for (i=3D0; i<sizeread; i++)
		{
			chksum+=3Dbuf2[i];
		}=09
	}
	fclose(fp);

	printf(" (chksum:%08x)",chksum);
	fprintf(fp2," (chksum:%08x)",chksum);

	return chksum;
}

int ListDir (depth)
    int     depth;
{
    DIR             *dir;
    struct dirent   *ent;
    struct stat     fbuf;

    if ((dir =3D opendir (".")) =3D=3D NULL)          /* open directory =
*/
    {
        PutStr (depth, "");
        perror ("Unable to open this directory");
        return Failure;
    }

    while ((ent =3D readdir (dir)) !=3D NULL)       /* read directory */
    {
        if ((! strcmp (ent->d_name, ".")) || (! strcmp (ent->d_name, =
"..")))
            	continue;

	if ((!strcmp(ent->d_name,"1")) || (!strcmp(ent->d_name,"2")))
	    	continue;

	if ((!strcmp(ent->d_name,"proc")))
	    	continue;

	//name:
        PutStr (depth, ent->d_name);
        fPutStr (depth, ent->d_name);//

        lstat (ent->d_name, &fbuf);

        if (S_ISLNK (fbuf.st_mode))=20
	{//link
		printf (" (Inode:%lu)", fbuf.st_ino);
		fprintf (fp2," (Inode:%lu)", fbuf.st_ino);

	    	memset(buf,0,sizeof(buf));//jmt:init buf[]
	    	readlink (ent->d_name, buf, sizeof(buf));

	    	printf (" -> %s\n", buf);   =20
	    	fprintf (fp2," -> %s\n", buf);   =20
	}=20
	else if (S_ISDIR (fbuf.st_mode))
        {
		printf ("/ (Inode:%lu)\n", fbuf.st_ino);
		fprintf (fp2,"/ (Inode:%lu)\n", fbuf.st_ino);

		if (chdir (ent->d_name))
		{//error
			PutStr (depth + JmpWidth, "");
			perror ("Change directory failed");
		}
		else
			ListDir (depth + JmpWidth);

		if (chdir (".."))
		{//error
			perror ("Change to parent directory error");
			puts ("This error will cause incorrect output, aborting!");
			exit (3);
		}
        }=20
	else if (S_ISCHR (fbuf.st_mode))=20
	{=20
		printf (" (Inode:%lu)", fbuf.st_ino);
		fprintf (fp2," (Inode:%lu)", fbuf.st_ino);

		puts (" (character special file)");//str+newline=20
		fputs (" (character special file)\n",fp2);=20
	}
	else if (S_ISBLK (fbuf.st_mode))=20
	{
		printf (" (Inode:%lu)", fbuf.st_ino);
		fprintf (fp2," (Inode:%lu)", fbuf.st_ino);

		puts (" (block special file)");//str+newline=20
		fputs (" (block special file)\n",fp2);=20
	}
	else=20
	{
		if ((S_IXUSR & fbuf.st_mode)|
	       	    (S_IXGRP & fbuf.st_mode)|
		    (S_IXOTH & fbuf.st_mode))
		{
		 	printf ("*");
		 	fprintf (fp2,"*");
		}

		printf (" (Inode:%lu)", fbuf.st_ino);
		fprintf (fp2," (Inode:%lu)", fbuf.st_ino);

		printf (" (Size:%lu)", fbuf.st_size);
		fprintf (fp2," (Size:%lu)", fbuf.st_size);

		putchksum(ent->d_name);

		putchar ('\n');
		fputc('\n',fp2);
	}
    }

    if (closedir (dir))
    {
	perror ("Unable to close directory.\n");
	return Failure;
    }

    return Success;
}


int main (argc, argv)
    int     argc;
    char    **argv;
{
    	struct stat     fbuf;
    	struct tm       *t;
    	struct passwd   *p;
    	char            tmp[128],argvx[256];

	pass=3D0;
	if (argc !=3D 2)
	{
		puts ("Usage: lls <Directory | Filename>");
		return 1;
	}
	strcpy(argvx,argv[1]);
again:
	if (lstat (argvx, &fbuf) =3D=3D -1)
	{
		perror ("Error on stat");
		return 2;
	}

    	if ((S_ISDIR (fbuf.st_mode)) && (!S_ISLNK (fbuf.st_mode)))
    	{
        	printf ("Under directory [%s]:\n", argvx);

        	if (chdir (argvx))
        	{
            		PutStr (JmpWidth, "");
            		perror ("Change directory failed");
            		return Failure;
        	}

		if( !(fp2=3Dfopen("/1","w")) )
		{
			printf("unable to open logfile1\n");
			return Failure;
		}=20
		ListDir (0);
		if (fp2) fclose(fp2);
		sync(); //bdflush(1,0);//bdflush can't use under 2.2.12
		printf("chksum1: ");
		c1=3Dputchksum("/1");
		printf("\n");

		printf("mkdir /test\n"); fflush(stdout);
		system("mkdir /test");
		printf("cp /bin/* /test\n"); fflush(stdout);
		system("cp /bin/* /test");
		printf("rm /test/*\n"); fflush(stdout);
		system("rm /test/*");
		printf("rmdir /test\n"); fflush(stdout);
		system("rmdir /test");

		if( !(fp2=3Dfopen("/2","w")) )
		{
			printf("unable to open logfile2\n");
			return Failure;
		}=20
		ListDir (0);
		if (fp2) fclose(fp2);
		sync(); //bdflush(1,0);//bdflush can't use under 2.2.12
		printf("chksum2: ");
		c2=3Dputchksum("/2");
		printf("\n");

		printf("chksum1=3D%08x\n",c1);
		printf("chksum2=3D%08x\n",c2);

		if (c1=3D=3Dc2)
		{
			pass++;
			printf("\nTest passed(%lu) ^__^\n",pass);
			printf("3,"); fflush(stdout);
			sleep(1);
			printf("2,"); fflush(stdout);
			sleep(1);
			printf("1,"); fflush(stdout);
			sleep(1);
			printf("go"); fflush(stdout);
			goto again;
		}
		else
			printf("\nTest error @__@|||\n");
    }
    else
    {=20
        p =3D getpwuid (fbuf.st_uid);
        t =3D localtime (&fbuf.st_atime);
        strftime (tmp, sizeof(tmp), "%a %D %R", t);

        printf ("File name        : %s\n", argv[1]);
        printf ("File type        : ");
            if (S_ISLNK (fbuf.st_mode)) puts ("symbolic link"); else
            if (S_ISCHR (fbuf.st_mode)) puts ("character special file"); =
else
            if (S_ISBLK (fbuf.st_mode)) puts ("block special file"); =
else
            if (S_ISREG (fbuf.st_mode)) puts ("regular file"); else
            if (S_ISSOCK(fbuf.st_mode)) puts ("socket"); else
            if (S_ISFIFO(fbuf.st_mode)) puts ("pipe or FIFO special =
file"); else
                                        puts ("Unknown (not checked)");=20
        printf ("Permission mode  : ");
            if (S_IRUSR & fbuf.st_mode) putchar ('r'); else putchar =
('-');
            if (S_IWUSR & fbuf.st_mode) putchar ('w'); else putchar =
('-');
            if (S_IXUSR & fbuf.st_mode) putchar ('x'); else putchar =
('-');
            if (S_IRGRP & fbuf.st_mode) putchar ('r'); else putchar =
('-');
            if (S_IWGRP & fbuf.st_mode) putchar ('w'); else putchar =
('-');
            if (S_IXGRP & fbuf.st_mode) putchar ('x'); else putchar =
('-');
            if (S_IROTH & fbuf.st_mode) putchar ('r'); else putchar =
('-');
            if (S_IWOTH & fbuf.st_mode) putchar ('w'); else putchar =
('-');
            if (S_IXOTH & fbuf.st_mode) putchar ('x'); else putchar =
('-');
            if (S_ISUID & fbuf.st_mode) printf (" (SetUID)");
            if (S_ISGID & fbuf.st_mode) printf (" (SetGID)");
                                        putchar ('\n');
        printf ("Owner            : %s\n", p->pw_name);
        printf ("I-node number    : %lu\n", fbuf.st_ino);
        printf ("Hard link number : %lu\n", fbuf.st_nlink);
        printf ("Size             : %lu byte(s)\n", fbuf.st_size);
        printf ("Last access time : %s\n", tmp);
    }

    return Success;
}



------=_NextPart_000_0062_01C242D9.020DF200--
