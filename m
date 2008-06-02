Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K330h-0001VO-KU
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 05:55:12 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1091434rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Jun 2008 22:55:10 -0700 (PDT)
Message-ID: <5ed5c4730806012255t368976ebk46d1e102e8b042d0@mail.gmail.com>
Date: Mon, 2 Jun 2008 14:55:10 +0900
From: "KeunO Park" <lastnite@gmail.com>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test
In-Reply-To: <bae050c10806012138p6167f30eu9450563efa5429ab@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10806012138p6167f30eu9450563efa5429ab@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/6/2 Nancy <nancydreaming@gmail.com>:
> Hi,
>   Thank you for sharing your test report!
>   For ubiblk,  cp; sync;  is not enough, cause ubiblk hold back a LEB
> in ram until another logical block number LEB wants to use the
> writecache(in ubiblk) or an block device layer "release" call will
> drive the LEB in writecache to be written on Nand Flash.
>   For FAT, when it write some files, usually, it modify FAT table
> first, then goes the file contends, finally still need to change
> something in FAT table or whatever it is which belongs to the
> Filesystem meta data. That means, the last LEB hold back in ram
> contains the most important data (filesystem meta data). If there
> comes unclean reboot. That may lost lots of data. Though UBI tolerant
> unclean reboot. In this case, you should use tool "dosfsck
> /dev/ubiblockN -a" before you mount ubiblock again. And see what you
> have lost!
>   To be safe, you should do : cp...; sync; flushcache /dev/ubiblockN
>   I'm not sure block device layer's Ioctl "BLKFLSBUF" use in this
> way. Is there any command like sync, not just sync the buffer cache,
> but also the buffer in dirver layer( call that ioctl :-)
>
> /* flushcache.c  */
> #include <sys/ioctl.h>
> #include <linux/fs.h>
> #include <fcntl.h>
> #include <stdio.h>
>
> int main(int argc,char **argv)
> {
>        int fd;
>
>        if( argc != 2 ){
>                printf( "Usage:%s device name(full path)\n", argv[0] );
>                return -1;
>        }
>
>        if( (fd = open( argv[1], O_RDONLY ) ) == -1) {
>                printf( "Open %s failed\n", argv[1] );
>                return -1;
>        }
>
>        if( ioctl( fd, BLKFLSBUF) == -1)
>                printf("flush catche failed\n");
>
>        close(fd);
>        return 0;
> }
>
> --
> Best wishes,
> Nancy
>



hi.  I've tested the speed & load avg again. (I used flushcache
program that you attached. )
here is the new result.
the major difference of the result is the load avg.
even it is higher than ubifs(using ZLIB compressor).

[write test]

>yaffs2
>write: 10.20s, 12.09s, 12.24s avg:11.51s (868KB/s)
>load avg right after copy&sync: 0.03 -> 0.11

>ubifs (LZO)
>write: 14.45s, 14.40s, 14.45s avg:14.43s (693KB/s)
>load avg right after copy&sync: 0.03 -> 0.53

>ubifs (ZLIB)
>write : 27.17s, 27.18s, 27.21s avg:27.18 (367KB/s)
>load avg right after copy&sync: 0.03 -> 0.80

>ubifs (No Compression)
>write: 6.69s, 10.90s, 10.98s avg:9.52s (1050KB/s)
>load avg right after copy&sync: 0.03 -> 0.43

ubiblk(vfat mount)
write: 15.39s, 15.82s, 16.03s avg:15.74s (635KB/s)
load avg right after copy&sync: 0.03 -> 0.85

thank you.


regards,
KeunO Park.
