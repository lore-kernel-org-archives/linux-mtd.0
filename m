Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6g1b-0002H6-DO
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 08:52:28 +0000
Received: by wwd20 with SMTP id 20so427995wwd.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 01:52:25 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: Latest mkfs.jffs2 is broken.
References: <0D753D10438DA54287A00B02708426976450C42B27@AUSP01VMBX24.collaborationhost.net>
	<1287123245.18576.2.camel@localhost>
	<87pqvbetux.fsf@macbook.be.48ers.dk>
	<1287132218.18576.12.camel@localhost>
Date: Fri, 15 Oct 2010 10:52:21 +0200
In-Reply-To: <1287132218.18576.12.camel@localhost> (Artem Bityutskiy's message
	of "Fri, 15 Oct 2010 11:43:38 +0300")
Message-ID: <87lj5zet2y.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: H Hartley Sweeten <hartleys@visionengravers.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

 >> Artem: Time for a v1.4.1 release?

 Artem> Thanks. If it works, I'll back-port Mike's patch to 1.4.0 and tag it as
 Artem> 1.4.1. So 1.4.1 won't include tons of irrelevant commits.

Great. An easy way to test:

git checkout v1.4.0
make WITHOUT_XATTR=1
./mkfs.jffs2 -e 0x20000 -b -s 0x1000 -d include -o test.jffs2
/usr/sbin/jffs2dump -b -c test.jffs2|head -n 4
Wrong hdr_crc  at  0x00000000, 0x954203f1 instead of 0xf060dc98
Wrong bitmask  at  0x00000004, 0x0000
Wrong hdr_crc  at  0x0000000c, 0xd10532a2 instead of 0xb427edcb
Wrong bitmask  at  0x00000010, 0x0000

git cherry-pick b864c387e8f1
make WITHOUT_XATTR=1
./mkfs.jffs2 -e 0x20000 -b -s 0x1000 -d include -o test.jffs2
/usr/sbin/jffs2dump -b -c test.jffs2|head -n 4
         Dirent     node at 0x0000000c, totlen 0x00000030, #pino     1, version     0, #ino         2, nsize        8, name common.h
         Inode      node at 0x0000003c, totlen 0x00000489, #ino      2, version     1, isize     2939, csize     1093, dsize     2939, offset        0
         Dirent     node at 0x000004c8, totlen 0x0000002f, #pino     1, version     1, #ino         3, nsize        7, name crc32.h
         Inode      node at 0x000004f8, totlen 0x0000011d, #ino      3, version     1, isize      294, csize      217, dsize      294, offset        0

-- 
Bye, Peter Korsgaard
