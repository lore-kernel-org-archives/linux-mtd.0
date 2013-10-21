Received: from forward4m.mail.yandex.net ([2a02:6b8:0:2519::3:13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYI0m-0007Qk-Ch
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 16:07:21 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Brent Taylor <motobud@gmail.com>
In-Reply-To: <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <183031382371160@web6m.yandex.ru>
Date: Mon, 21 Oct 2013 19:59:20 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
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



04.10.2013, 07:09, "Brent Taylor" <motobud@gmail.com>:
> Here is a patch based on linux-3.12-rc3. šI haven't performed any
> performance testing UBIFS using lz4hc, but I can mount UBIFS volumes
> and haven't seen any problems yet. šThe only think I know that isn't
> correct about the patch is the description for the Kconfig element for
> select lz4hc as a compression option. šI only copied the description
> from the lzo description.

Hi Brent,

I'm testing your patch on my SH4 device. When I create new partition
with lz4hc compressor, it works fine: I can copy file into it, and
md5sums of original and copy match. However, after reboot I cannot
read the file anymore:

UBIFS error (pid 1101): ubifs_decompress: cannot decompress 934 bytes, compressor lz4hc, error -22
UBIFS error (pid 1101): read_block: bad data node (block 1, inode 65)
UBIFS error (pid 1101): do_readpage: cannot read page 1 of inode 65, error -22

The same error appears if I use lz4hc-compressed ubifs image to flash rootfs
(using patched mkfs.ubifs).

Decompression error occurs in lz4_uncompress() function (lib/lz4/lz4_decompress.c),
on the line 101:

/* Error: offset create reference outside destination buffer */
if (unlikely(ref < (BYTE *const) dest))
    goto _output_error;

Brent: are you able to read data from lz4hc volume on your device?
Anyone: any ideas what may happen here?

-- 
Regards,
Konstantin
