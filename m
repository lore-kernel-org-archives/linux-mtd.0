Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYStH-0001Ex-85
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 03:44:20 +0000
Received: by mail-ob0-f174.google.com with SMTP id vb8so2390558obc.19
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2013 20:43:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <183031382371160@web6m.yandex.ru>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <183031382371160@web6m.yandex.ru>
Date: Mon, 21 Oct 2013 22:43:52 -0500
Message-ID: <CAP+RiCDKgRqi8_Y4OMqyJyCUpKJW5BVE=hNwp3WzQ7PuOMWGMw@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
From: Brent Taylor <motobud@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 21, 2013 at 10:59 AM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>
> 04.10.2013, 07:09, "Brent Taylor" <motobud@gmail.com>:
>> Here is a patch based on linux-3.12-rc3.  I haven't performed any
>> performance testing UBIFS using lz4hc, but I can mount UBIFS volumes
>> and haven't seen any problems yet.  The only think I know that isn't
>> correct about the patch is the description for the Kconfig element for
>> select lz4hc as a compression option.  I only copied the description
>> from the lzo description.
>
> Hi Brent,
>
> I'm testing your patch on my SH4 device. When I create new partition
> with lz4hc compressor, it works fine: I can copy file into it, and
> md5sums of original and copy match. However, after reboot I cannot
> read the file anymore:
>
> UBIFS error (pid 1101): ubifs_decompress: cannot decompress 934 bytes, compressor lz4hc, error -22
> UBIFS error (pid 1101): read_block: bad data node (block 1, inode 65)
> UBIFS error (pid 1101): do_readpage: cannot read page 1 of inode 65, error -22
>
> The same error appears if I use lz4hc-compressed ubifs image to flash rootfs
> (using patched mkfs.ubifs).
>
> Decompression error occurs in lz4_uncompress() function (lib/lz4/lz4_decompress.c),
> on the line 101:
>
> /* Error: offset create reference outside destination buffer */
> if (unlikely(ref < (BYTE *const) dest))
>     goto _output_error;
>
> Brent: are you able to read data from lz4hc volume on your device?
> Anyone: any ideas what may happen here?
>
> --
> Regards,
> Konstantin

Konstantin,
   I haven't seen anything like that on my at91sam9m10g45-ek
development board.  I haven't used a flash image from mkfs.ubifs yet.
Is it possible the file system was not umounted cleanly before the
reboot and UBIFS went through a recovery procedure?  Maybe something
breaks with lz4hc when UBIFS does a recovery?  That's just a guess.

Regards,
Brent
