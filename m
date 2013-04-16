Received: from mail-vb0-x230.google.com ([2607:f8b0:400c:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1US6hG-00071i-TL
 for linux-mtd@lists.infradead.org; Tue, 16 Apr 2013 14:17:23 +0000
Received: by mail-vb0-f48.google.com with SMTP id p13so398650vbe.21
 for <linux-mtd@lists.infradead.org>; Tue, 16 Apr 2013 07:17:19 -0700 (PDT)
Received: by mail-ve0-f176.google.com with SMTP id cz11so451898veb.21
 for <linux-mtd@lists.infradead.org>; Tue, 16 Apr 2013 07:17:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366040431.2768.83.camel@sauron.fi.intel.com>
References: <51682A79.1010307@gmail.com>
 <1366040431.2768.83.camel@sauron.fi.intel.com>
From: Paul Black <paul.0000.black@gmail.com>
Date: Tue, 16 Apr 2013 15:17:00 +0100
Message-ID: <CACBZTd7kPb4EZ30gNo=eBrTy=Qf9sRKFLqUBbib_d1e-nRj8ew@mail.gmail.com>
Subject: Re: UBIFS Problems After Upgrading Kernel
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 April 2013 16:40, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> On Fri, 2013-04-12 at 16:38 +0100, Paul Black wrote:
> > [    1.650000] UBIFS error (pid 1): ubifs_read_node: bad node type (255
> > but expected 6)
> > [    1.660000] UBIFS error (pid 1): ubifs_read_node: bad node at LEB
> > 0:0, LEB mapping status 0
> > [    1.660000] Not a node, first 24 bytes:
> > [    1.670000] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff ff ff ff ff
>
> UBIFS says that the eraseblock where it expects to find the Master node
> is empty. Somehow the data is not there anymore. Can you compare the
> contents of the corresponding /dev/mtd and /dev/ubi* before and after
> upgrade?


Thanks for the reply.

Got the following difference in the file systems before and after
booting 3.4.40:
< 1737000000    U   B   I   # 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             4255    2349    0001    0000    0000    0000    0000    0000
< 1737000020   \0  \0 002  \0  \0  \0  \b  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0000    0002    0000    0008    0000    0000    0000    0000
< 1737000040   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0000    0000    0000    0000    0000    0000    0000    0000
< 1737000060   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0   N 204   I 204
<             0000    0000    0000    0000    0000    0000    844e    8449
< 1737000100  377 377 377 377 377 377 377 377 377 377 377 377 377 377 377 377
<             ffff    ffff    ffff    ffff    ffff    ffff    ffff    ffff
< *
< 1737400000    U   B   I   # 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             4255    2349    0001    0000    0000    0000    0000    0000
< 1737400020   \0  \0 002  \0  \0  \0  \b  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0000    0002    0000    0008    0000    0000    0000    0000
< 1737400040   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0000    0000    0000    0000    0000    0000    0000    0000
< 1737400060   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0   N 204   I 204
<             0000    0000    0000    0000    0000    0000    844e    8449
< 1737400100  377 377 377 377 377 377 377 377 377 377 377 377 377 377 377 377
<             ffff    ffff    ffff    ffff    ffff    ffff    ffff    ffff
< *
< 1737401000    U   B   I   ! 001 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             4255    2149    0101    0000    0000    0000    0000    0000
< 1737401020   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0000    0000    0000    0000    0000    0000    0000    0000
< 1737401040   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0 004
<             0000    0000    0000    0000    0000    0000    0000    0400
< 1737401060   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0 263  \b 301 301
<             0000    0000    0000    0000    0000    0000    08b3    c1c1
< 1737401100   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0000    0000    0000    0000    0000    0000    0000    0000
< *
< 1737402000  377 377 377 377 377 377 377 377 377 377 377 377 377 377 377 377
<             ffff    ffff    ffff    ffff    ffff    ffff    ffff    ffff
< *
< 1737404000    1 030 020 006 320   I   y 335 001  \0  \0  \0  \0  \0  \0  \0
<             1831    0610    49d0    dd79    0001    0000    0000    0000
< 1737404020   \0 020  \0  \0 006  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             1000    0000    0006    0000    0000    0000    0000    0000
< 1737404040   \0  \b  \0  \0  \0 370 001  \0 251  \a  \0  \0 251  \a  \0  \0
<             0800    0000    f800    0001    07a9    0000    07a9    0000
< 1737404060   \0     265  \0  \0  \0  \0  \0 006  \0  \0  \0 002  \0  \0  \0
<             2000    00b5    0000    0000    0006    0000    0002    0000
< 1737404100  001  \0  \0  \0 001  \0  \0  \0  \b  \0  \0  \0  \0 001  \0  \0
<             0001    0000    0001    0000    0008    0000    0100    0000
< 1737404120  004  \0  \0  \0 001  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0004    0000    0001    0000    0000    0000    0000    0000
< 1737404140   \0  \0   P  \0  \0  \0  \0  \0  \0 312 232   ; 332   - 305 213
<             0000    0050    0000    0000    ca00    3b9a    2dda    8bc5
< 1737404160  251 373   F 332 213   3   $   h 376   ! 300   r  \0  \0  \0  \0
<             fba9    da46    338b    6824    21fe    72c0    0000    0000
< 1737404200   \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
<             0000    0000    0000    0000    0000    0000    0000    0000
< *
< 1737414000  377 377 377 377 377 377 377 377 377 377 377 377 377 377 377 377
<             ffff    ffff    ffff    ffff    ffff    ffff    ffff    ffff
< *


During booting, this is printed out. The addresses shown above, with
offsets accounted for and converted to octal, overlap with the
addresses in the last two lines below.
[    0.720000] atmel_nand: Use On Flash BBT
[    0.720000] atmel_nand atmel_nand: No DMA support for NAND access.
[    0.730000] NAND device: Manufacturer ID: 0xad, Chip ID: 0xda
(Hynix NAND 256MiB 3,3V 8-bit)
[    0.740000] Bad block table not found for chip 0
[    0.740000] Bad block table not found for chip 0
[    0.750000] Scanning device for bad blocks
[    0.880000] Bad block table written to 0x00000ffe0000, version 0x01
[    0.890000] Bad block table written to 0x00000ffc0000, version 0x01

I've also noticed that I don't have the "Use On Flash BBT" on my
working 2.6.36 kernels. Finding and disabling this in the files for my
boards of interest produces a working 3.4.40 kernel.

Thanks for the pointers.


--
Paul
