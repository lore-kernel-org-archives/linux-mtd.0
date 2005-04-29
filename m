Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DRWH5-0000tS-8O
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2005 10:15:24 -0400
Received: by zproxy.gmail.com with SMTP id 8so746944nzo
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2005 07:15:27 -0700 (PDT)
Message-ID: <57258408050429071549faab15@mail.gmail.com>
Date: Fri, 29 Apr 2005 10:15:27 -0400
From: Talat Ozyagcilar <tozyagcilar@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: mtd erase error
Reply-To: Talat Ozyagcilar <tozyagcilar@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am trying to write a rootfs on flash.  I have made an jffs2 image of
the rootfs and I am using "cat rootfs.jffs2 > /dev/mtdblock/3", but I
am getting the following output:
----------------------------------------------------------
# cat rootfs.jffs2 > /dev/mtdblock/3
mtdblock_open
ok
mtdblock: read on "RootFS" at 0x282000, size 0x1000
mtdblock: write on "RootFS" at 0x0, size 0x1000
mtdblock: write on "RootFS" at 0x1000, size 0x1000
mtdblock: write on "RootFS" at 0x2000, size 0x1000
mtdblock: write on "RootFS" at 0x3000, size 0x1000
mtdblock: write on "RootFS" at 0x4000, size 0x1000
mtdblock: write on "RootFS" at 0x5000, size 0x1000
mtdblock: write on "RootFS" at 0x6000, size 0x1000
mtdblock: write on "RootFS" at 0x7000, size 0x1000
mtdblock: write on "RootFS" at 0x8000, size 0x1000
mtdblock: write on "RootFS" at 0x9000, size 0x1000
mtdblock: write on "RootFS" at 0xa000, size 0x1000
mtdblock: write on "RootFS" at 0xb000, size 0x1000
mtdblock: write on "RootFS" at 0xc000, size 0x1000
mtdblock: write on "RootFS" at 0xd000, size 0x1000
mtdblock: write on "RootFS" at 0xe000, size 0x1000
mtdblock: write on "RootFS" at 0xf000, size 0x1000
mtdblock: write on "RootFS" at 0x10000, size 0x1000
mtdblock: write on "RootFS" at 0x11000, size 0x1000
mtdblock: write on "RootFS" at 0x12000, size 0x1000
mtdblock: write on "RootFS" at 0x13000, size 0x1000
mtdblock: write on "RootFS" at 0x14000, size 0x1000
mtdblock: write on "RootFS" at 0x15000, size 0x1000
mtdblock: write on "RootFS" at 0x16000, size 0x1000
mtdblock: write on "RootFS" at 0x17000, size 0x1000
mtdblock: write on "RootFS" at 0x18000, size 0x1000
mtdblock: write on "RootFS" at 0x19000, size 0x1000
mtdblock: write on "RootFS" at 0x1a000, size 0x1000
mtdblock: write on "RootFS" at 0x1b000, size 0x1000
mtdblock: write on "RootFS" at 0x1c000, size 0x1000
mtdblock: write on "RootFS" at 0x1d000, size 0x1000
mtdblock: write on "RootFS" at 0x1e000, size 0x1000
mtdblock: write on "RootFS" at 0x1f000, size 0x1000
mtdblock: write on "RootFS" at 0x20000, size 0x1000
mtdblock: writing cached data for "RootFS" at 0x0, size 0x20000
Chip reports voltage low on erase: status 0xa8
mtdblock: erase of region [0x0, 0x20000] on "RootFS" failed
end_request: I/O error, dev 1f:03 (mtdblock), sector 256
mtdblock: write on "RootFS" at 0x21000, size 0x1000
mtdblock: writing cached data for "RootFS" at 0x0, size 0x20000
Chip reports voltage low on erase: status 0xa8
mtdblock: erase of region [0x0, 0x20000] on "RootFS" failed
end_request: I/O error, dev 1f:03 (mtdblock), sector 264
mtdblock: write on "RootFS" at 0x22000, size 0x1000
mtdblock: writing cached data for "RootFS" at 0x0, size 0x20000
Chip reports voltage low on erase: status 0xa8
mtdblock: erase of region [0x0, 0x20000] on "RootFS" failed
end_request: I/O error, dev 1f:03 (mtdblock), sector 272
mtdblock: write on "RootFS" at 0x23000, size 0x1000
mtdblock: writing cached data for "RootFS" at 0x0, size 0x20000
Chip reports voltage low on erase: status 0xa8
mtdblock: erase of region [0x0, 0x20000] on "RootFS" failed
end_request: I/O error, dev 1f:03 (mtdblock), sector 280
mtdblock: write on "RootFS" at 0x24000, size 0x1000
mtdblock: writing cached data for "RootFS" at 0x0, size 0x20000
Chip reports voltage low on erase: status 0xa8
mtdblock: erase of region [0x0, 0x20000] on "RootFS" failed
end_request: I/O error, dev 1f:03 (mtdblock), sector 288
mtdblock: write on "RootFS" at 0x25000, size 0x1000
mtdblock: writing cached data for "RootFS" at 0x0, size 0x20000
Chip reports voltage low on erase: status 0xa8
mtdblock: erase of region [0x0, 0x20000] on "RootFS" failed
end_request: I/O error, dev 1f:03 (mtdblock), sector 296
mtdblock: write on "RootFS" at 0x26000, size 0x1000
------------------------------------------------------

Is this really a hardware problem, or has anybody come across this?=20
Any help is appreciated...

Regards
