Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DD3jQ-0005Du-2P
	for linux-mtd@lists.infradead.org; Sun, 20 Mar 2005 11:56:54 -0500
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 588FF22B01
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Mar 2005 19:56:19 +0300 (MSK)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sun, 20 Mar 2005 19:56:18 +0300
Message-Id: <1111337779.21179.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH] 100% GC loop fix
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

the bellow inserted test reproduces the problem when the GC thread loops
infinitely and doesn't sleep, consuming all the given CPU cycles.

In a nutshell, the problem arises because of:
1. jffs2_find_gc_block() doesn't take care about the c-
>erasable_pending_wbuf_list's blocks which contain no valid data and may
be erased after the wbuf is sync-ed to flash.
2. c->erasable_pending_wbuf_list's blocks' space is accounted as dirty
space. This, in turn, makes the silly jffs2_thread_should_wake() return 

Thus, the jffs2_garbage_collect_pass() can't find any block to GC, but
jffs2_thread_should_wake() returns 1.

Since it looks that it is normal that c->erasable_pending_wbuf_list may
contain block for a very long time, I decided to fix jffs2_find_gc_block
() and to teach it to take care about those blocks as well.

Index: gc.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/gc.c,v
retrieving revision 1.145
diff -u -r1.145 gc.c
--- gc.c        9 Feb 2005 09:09:01 -0000       1.145
+++ gc.c        20 Mar 2005 16:24:27 -0000
@@ -50,6 +50,7 @@
           put the clever wear-levelling algorithms. Eventually.  */
        /* We possibly want to favour the dirtier blocks more when the
           number of free blocks is low. */
+again:
        if (!list_empty(&c->bad_used_list) && c->nr_free_blocks > c-
>resv_blocks_gcbad) {
                D1(printk(KERN_DEBUG "Picking block from bad_used_list
to GC next\n"));
                nextlist = &c->bad_used_list;
@@ -79,6 +80,11 @@
                D1(printk(KERN_DEBUG "Picking block from erasable_list
to GC next (clean_list and {very_,}dirty_list were empty)\n"));

                nextlist = &c->erasable_list;
+       } else if (!list_empty(&c->erasable_pending_wbuf_list)) {
+               /* There are blocks are wating for the wbuf sync */
+               D1(printk(KERN_DEBUG "Synching wbuf in order to reuse
erasable_pending_wbuf_list blocks\n"));
+               jffs2_flush_wbuf_pad(c);
+               goto again;
        } else {
                /* Eep. All were empty */
                D1(printk(KERN_NOTICE "jffs2: No clean, dirty _or_
erasable blocks to GC from! Where are they all?\n"));



The following is the test which reproduces the problem.
===================================================================
*
 * JFFS2 file expansion test.
 * Author: Mikhail Kshevetskiy
 */

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

    int         i, fd, cnt;
    off_t       pos;
    char        buf[fsinfo.f_bsize];

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
