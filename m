Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K32bU-0006wM-1x
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 05:29:08 +0000
Received: by wf-out-1314.google.com with SMTP id 28so772842wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Jun 2008 22:29:07 -0700 (PDT)
Message-ID: <bae050c10806012229n78668cf3rf71c44bd396a7fba@mail.gmail.com>
Date: Mon, 2 Jun 2008 13:29:07 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: References:ubifs, ubiblk(formatted with vfat) and yaffs2 test
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    Thank you for sharing your test report!
    For ubiblk,  cp; sync;  is not enough, cause ubiblk hold back a LEB
in ram until another logical block number LEB wants to use the
writecache(in ubiblk) or an block device layer "release" call will
drive the LEB in writecache to be written on Nand Flash.
    For FAT, when it write some files, usually, it modify FAT table
first, then goes the file contends, finally still need to change
something in FAT table or whatever it is which belongs to the
Filesystem meta data. That means, the last LEB hold back in ram
contains the most important data (filesystem meta data). If there
comes unclean reboot. That may lost lots of data. Though UBI tolerant
unclean reboot. In this case, you should use tool "dosfsck
/dev/ubiblockN -a" before you mount ubiblock again. And see what you
have lost!
    To be safe, you should do : cp...; sync; flushcache /dev/ubiblockN
    I'm not sure block device layer's Ioctl "BLKFLSBUF" use in this
way. Is there any command like sync, not just sync the buffer cache,
but also the buffer in dirver layer( call that ioctl :-)

/* flushcache.c  */
#include <sys/ioctl.h>
#include <linux/fs.h>
#include <fcntl.h>
#include <stdio.h>

int main(int argc,char **argv)
{
       int fd;

       if( argc != 2 ){
               printf( "Usage:%s device name(full path)\n", argv[0] );
               return -1;
       }

       if( (fd = open( argv[1], O_RDONLY ) ) == -1) {
               printf( "Open %s failed\n", argv[1] );
               return -1;
       }

       if( ioctl( fd, BLKFLSBUF) == -1)
               printf("flush catche failed\n");

       close(fd);
       return 0;
}


-- 
Best wishes,
Nancy
