Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6mpJ-0001Mh-8g
	for linux-mtd@lists.infradead.org; Thu, 12 Jun 2008 13:26:54 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2466085wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2008 06:26:52 -0700 (PDT)
Message-ID: <bae050c10806120620q9682370s19515023f1eec00f@mail.gmail.com>
Date: Thu, 12 Jun 2008 21:20:34 +0800
From: Nancy <nancydreaming@gmail.com>
To: Hyphen79 <hyphen79@web.de>
Subject: Re: Last sector of flash root partition will not be flashed
In-Reply-To: <4850F86D.90505@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4850F86D.90505@web.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 12, 2008 at 6:20 PM, Hyphen79 <hyphen79@web.de> wrote:
> Hello,
>
> the problem is, that the last sector of the mtd root partition
> (cramdisk) will not be flashed:
>
> mtdblock: write on "File System" at 0x1f5e00, size 0x200
> mtdblock: write on "File System" at 0x1f6000, size 0x200
> mtdblock: writing cached data for "File System" at 0x1f5000, size 0x1000
> mtdblock: write on "File System" at 0x1f6200, size 0x200
> mtdblock: write on "File System" at 0x1f6400, size 0x200
> mtdblock: write on "File System" at 0x1f6600, size 0x200
> mtdblock: write on "File System" at 0x1f6800, size 0x200
> mtdblock: write on "File System" at 0x1f6a00, size 0x200
> mtdblock: write on "File System" at 0x1f6c00, size 0x200
> mtdblock: write on "File System" at 0x1f6e00, size 0x200
>
> But the last call to "write_cached_data" will not be done - even not
> after an explicit  "sync".
> For example: "mtdblock: writing cached data for "File System" at
> 0x1f6000, size 0x1000"
> Has anyone an idea?
You shoud umount it or write a program to flush the cache in mtdblock.c
For example:
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

# cp ....; sync; flushcache /dev/mtdblockN

But why you use cramdisk as your rootfs ? Why do not use Nand awared
filesystem as its rootfs file system?


-- 
Best wishes,
Nancy
