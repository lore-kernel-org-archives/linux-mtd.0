Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0gQV-0000rG-Ch
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 08:38:13 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
In-Reply-To: <f6d0cd0605021404467195684f@mail.gmail.com>
References: <f6d0cd0605021404467195684f@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 14 Feb 2005 16:37:39 +0300
Message-Id: <1108388259.26412.11.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compilation of MTD Utils
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 18:16 +0530, Niraj Maheshwari wrote:
> Hi,
> 
> I am trying to compile the MTD utils ( Specifically mkfs.jffs2  ) for
> ARM-Linux platform. I am getting lot of errors while compiling this.
> Does anyone already have mkfs.jffs2 executable for ARM-Linux platform
> then pl. send it to me.
> 
> Or if you can help me how to do this compilation then it will be of
> great help. I am getting following error. It's not able to find
> deflate() etc functions.
> 
Looks like you need to link zlib library...

> arm-linux-gcc  -o mkfs.jffs2 crc32.o compr_rtime.o mkfs.jffs2.o
> deftree.o deflate.o compr_zlib.o compr.o compr_lzari.o compr_lzo.o
> -L./libz.so.1.1.4
> compr_zlib.o(.text+0x34): In function `jffs2_zlib_compress':
> /root/temp/mtd/util/compr_zlib.c:68: undefined reference to `deflateInit_'
> compr_zlib.o(.text+0x98):/root/temp/mtd/util/compr_zlib.c:80:
> undefined reference to `deflate'
> compr_zlib.o(.text+0xe4):/root/temp/mtd/util/compr_zlib.c:88:
> undefined reference to `deflate'
> compr_zlib.o(.text+0xf4):/root/temp/mtd/util/compr_zlib.c:93:
> undefined reference to `deflateEnd'
> compr_zlib.o(.text+0x128):/root/temp/mtd/util/compr_zlib.c:82:
> undefined reference to `deflateEnd'
> compr_zlib.o(.text+0x158): In function `jffs2_zlib_decompress':
> /root/temp/mtd/util/compr_zlib.c:113: undefined reference to `inflateInit_'
> compr_zlib.o(.text+0x188):/root/temp/mtd/util/compr_zlib.c:124:
> undefined reference to `inflate'
> compr_zlib.o(.text+0x198):/root/temp/mtd/util/compr_zlib.c:127:
> undefined reference to `inflateEnd'
> collect2: ld returned 1 exit status
> make: *** [mkfs.jffs2] Error 1
> 
> Thanks
> Niraj
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
