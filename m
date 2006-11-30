Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GplUV-0000x5-9j
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 07:58:17 -0500
Message-ID: <456ED562.5080307@valcom.com>
Date: Thu, 30 Nov 2006 07:58:10 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Upgrading mtd-utils in uClinux.
References: <456C4306.8070205@valcom.com>
	<Pine.LNX.4.64.0611290842530.5328@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0611290842530.5328@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> Unless someone here has had this specific problem, some form of output
> from the compilation indicating what is going wrong would be helpful.
>
>   
Yes, of course.  I have a couple more direct question. First, I found
the mtd-utils code is not properly using zlib. 

m68k-elf-gcc -Wl,--fatal-warnings -Wl,-elf2flt -Wl,-move-rodata
-msep-data -o mkfs.jffs2 crc32.o compr_rtime.o mkfs.jffs2.o compr_zlib.o
compr.o -L/home/glen/src/c/linux/uClinux-dist-20060803/lib/zlib
warning: .rodata section contains relocations
mkfs.jffs2.elf2flt: In function `jffs2_zlib_decompress':
/home/glen/src/c/linux/uClinux-dist-20060803/user/mtd-utils/compr_zlib.c:118:
undefined reference to `inflateInit_'
/home/glen/src/c/linux/uClinux-dist-20060803/user/mtd-utils/compr_zlib.c:127:
undefined reference to `inflate'
/home/glen/src/c/linux/uClinux-dist-20060803/user/mtd-utils/compr_zlib.c:132:
undefined reference to `inflateEnd'
mkfs.jffs2.elf2flt: In function `jffs2_zlib_compress':
/home/glen/src/c/linux/uClinux-dist-20060803/user/mtd-utils/compr_zlib.c:73:
undefined reference to `deflateInit_'
/home/glen/src/c/linux/uClinux-dist-20060803/user/mtd-utils/compr_zlib.c:80:
undefined reference to `deflate'
/home/glen/src/c/linux/uClinux-dist-20060803/user/mtd-utils/compr_zlib.c:87:
undefined reference to `deflateEnd'
/home/glen/src/c/linux/uClinux-dist-20060803/user/mtd-utils/compr_zlib.c:98:
undefined reference to `deflateEnd'
collect2: ld returned 1 exit status
make[3]: *** [mkfs.jffs2] Error 1

The warning: .rodata section contains relocations is printed and it
appears all other attempts to use libz.a are dropped.  I Googled this
warning and there were a couple of places where it mentioned
configure.in.  Is this the real problem?  If so how can it be fixed, not
familiar with autoconf)?

Secondly, once I get the code to compile it appears I still need to add
a section to the Makefile to install the files into the romfs image. 
Can I just pull this out of the old mtd-utils/Makefile or what? 
Suggestion's/recommendations?
Thanks,
Glen Johnson
