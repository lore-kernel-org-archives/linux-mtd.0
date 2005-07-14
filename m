Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dt7Ik-0000rh-Bk
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2005 13:15:13 -0400
Message-ID: <42D69D78.80406@yandex.ru>
Date: Thu, 14 Jul 2005 21:14:32 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: rick@efn.org
References: <E1DqvgV-000275-00@amazonia.client.comcast.net>	<1121093753.27264.117.camel@hades.cambridge.redhat.com>	<E1Ds2ma-0005ta-00@amazonia.client.comcast.net>	<1121108481.27264.129.camel@hades.cambridge.redhat.com>	<E1Ds4AF-00063d-00@amazonia.client.comcast.net>	<1121115438.3430.6.camel@localhost.localdomain>	<E1DsMIp-0004U9-00@amazonia.client.comcast.net>	<1121181101.12169.4.camel@hades.cambridge.redhat.com>	<E1DsNHk-0004bq-00@amazonia.client.comcast.net>	<1121186381.12086.6.camel@localhost.localdomain>	<E1DsOD0-0004iT-00@amazonia.client.comcast.net>	<1121189272.12224.10.camel@localhost.localdomain>	<E1Dspqm-0003zl-00@amazonia.client.comcast.net>	<1121294622.12224.87.camel@localhost.localdomain>
	<E1Dt4R6-0005UI-00@amazonia.client.comcast.net>
In-Reply-To: <E1Dt4R6-0005UI-00@amazonia.client.comcast.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: infinite loop in jffs2_flush_wbuf_gc()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rick,

sorry for long delay in my reply, I've forgotten about you :-(

'cvs log gc.c' has the following entry:
----------------------------
revision 1.146
date: 2005/03/20 17:45:25;  author: dedekind;  state: Exp;  lines: +7 -1
Make sure the erase_pending_wbuf_list's blocks are taken into account
when picking the block to GC.
----------------------------

This was the fix of the endless GC bug. Probably this is what you faced. 
May be there was one more modified file, don't remember, probably 
wbuf.c. You may find this out if you may use cvs. Try to make the same 
changes.

AFAIR, the bug was easily reproduced if you unlink a file then fsync it. 
I've even found the test for you (don't mind - it isn't nice):

#include <sys/vfs.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>

#define JFFS2_SUPER_MAGIC 0x72b6

#define FNAME "tmp"

void print_jffs_stat(char *path, struct statfs *fsinfo){
     if (statfs(path, fsinfo) == -1){
	perror("statfs() failed"); exit(1);
     }
     if (fsinfo->f_type != JFFS2_SUPER_MAGIC){
	fprintf(stderr, "%s is not jffs2 file system\n", path); exit(1);
     }
     printf("--- JFFS2 stat ---\n");
     printf("f_bsize   = %d\n", fsinfo->f_bsize);
     printf("f_blocks  = %d\n", fsinfo->f_blocks);
     printf("f_bfree   = %d\n", fsinfo->f_bfree);
     printf("f_bavail  = %d\n", fsinfo->f_bavail);
     printf("f_files   = %d\n", fsinfo->f_files);
     printf("f_ffree   = %d\n", fsinfo->f_ffree);
     printf("f_fsid    = %d\n", fsinfo->f_fsid);
     printf("f_namelen = %d\n", fsinfo->f_namelen);
}

int main(int argc, char *argv[]){
     if (argc < 1){
	fprintf(stderr, "%s jffs_root\n", argv[0]); return 1;
     }
     if (chdir(argv[1]) == -1){
	perror("chdir to jffs2 root failed"); return 1;
     }

     struct statfs fsinfo;
     struct stat   fdinfo;

     /* get initial jffs2 stat */
     print_jffs_stat(argv[1], &fsinfo);

     int		i, fd, cnt;
     off_t	pos;
     char	buf[fsinfo.f_bsize];

     printf("\ncreate file filled by zero with size more then flash\n");
     printf("it should fit flash since it maybe compressed perfectly\n");
     bzero(buf, fsinfo.f_bsize);

     if ((fd = open(FNAME, O_WRONLY | O_CREAT, 0664)) == -1){
	perror("can't open temporary file"); return 1;
     }
     unlink(FNAME);

     for(i = 0; i < fsinfo.f_blocks ; i++){
	cnt = write(fd, buf, fsinfo.f_bsize);
	if (cnt != fsinfo.f_bsize){
	    fprintf(stderr, "write to tmp file failed\n"); return 1;
	}
     }

     printf("\nfill the file with random data. Now in should not fit on 
flash\n");
     printf("so the error 'No space left on device' should appear\n");
     srand(1); for(i = 0; i < fsinfo.f_bsize; i++) buf[i] = rand();

     pos = lseek(fd, 0, SEEK_SET);
     if (pos == (off_t)-1){
	perror("lseek failed"); return 1;
     }

     for(i = 0; i < fsinfo.f_blocks ; i++){
	cnt = write(fd, buf, fsinfo.f_bsize);
	if (cnt != fsinfo.f_bsize) break;
     }
     if ((cnt != -1)||(errno != ENOSPC)){
	perror("Warning!!! Expected ENOSPC:"); return 1;
     }
     fsync(fd);
     printf("Ok. ENOSPC occured. Thats fine!\n");

     close(fd);
}

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
