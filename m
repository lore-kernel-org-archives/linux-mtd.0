Received: from rproxy.gmail.com ([64.233.170.193])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0fcH-0000QE-7A
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 07:46:18 -0500
Received: by rproxy.gmail.com with SMTP id y7so663389rne
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2005 04:46:14 -0800 (PST)
Message-ID: <f6d0cd0605021404467195684f@mail.gmail.com>
Date: Mon, 14 Feb 2005 18:16:13 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Compilation of MTD Utils
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to compile the MTD utils ( Specifically mkfs.jffs2  ) for
ARM-Linux platform. I am getting lot of errors while compiling this.
Does anyone already have mkfs.jffs2 executable for ARM-Linux platform
then pl. send it to me.

Or if you can help me how to do this compilation then it will be of
great help. I am getting following error. It's not able to find
deflate() etc functions.

arm-linux-gcc  -o mkfs.jffs2 crc32.o compr_rtime.o mkfs.jffs2.o
deftree.o deflate.o compr_zlib.o compr.o compr_lzari.o compr_lzo.o
-L./libz.so.1.1.4
compr_zlib.o(.text+0x34): In function `jffs2_zlib_compress':
/root/temp/mtd/util/compr_zlib.c:68: undefined reference to `deflateInit_'
compr_zlib.o(.text+0x98):/root/temp/mtd/util/compr_zlib.c:80:
undefined reference to `deflate'
compr_zlib.o(.text+0xe4):/root/temp/mtd/util/compr_zlib.c:88:
undefined reference to `deflate'
compr_zlib.o(.text+0xf4):/root/temp/mtd/util/compr_zlib.c:93:
undefined reference to `deflateEnd'
compr_zlib.o(.text+0x128):/root/temp/mtd/util/compr_zlib.c:82:
undefined reference to `deflateEnd'
compr_zlib.o(.text+0x158): In function `jffs2_zlib_decompress':
/root/temp/mtd/util/compr_zlib.c:113: undefined reference to `inflateInit_'
compr_zlib.o(.text+0x188):/root/temp/mtd/util/compr_zlib.c:124:
undefined reference to `inflate'
compr_zlib.o(.text+0x198):/root/temp/mtd/util/compr_zlib.c:127:
undefined reference to `inflateEnd'
collect2: ld returned 1 exit status
make: *** [mkfs.jffs2] Error 1

Thanks
Niraj
