Received: from mail-it0-f66.google.com ([209.85.214.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVvmW-0007FG-Qg
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 07:44:46 +0000
Received: by mail-it0-f66.google.com with SMTP id e137so13008113itc.0
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jan 2017 23:44:24 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <b31104a5-afa2-06ab-e922-c4d9da5559ea@jinso.co.jp>
References: <b31104a5-afa2-06ab-e922-c4d9da5559ea@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jan 2017 08:43:22 +0100
Message-ID: <CAMuHMdWJ4JaKwPyaxKmqfVdLpAHT5bt2jrv5Qew8Fvuk4thg7w@mail.gmail.com>
Subject: Re: [Lager(H2)-V4.10-rc2]: QSPI-FLASH: Warning message happened when
 writing a data file to SPI-FLASH
To: DongCV <cv-dong@jinso.co.jp>
Cc: Michal Suchanek <hramrach@gmail.com>, Cao Minh Hiep <cm-hiep@jinso.co.jp>,
 duclm <lm-duc@jinso.co.jp>,
 Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
 Simon Horman <horms+renesas@verge.net.au>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CC linux-mtd

On Tue, Jan 24, 2017 at 7:34 AM, DongCV <cv-dong@jinso.co.jp> wrote:
> Dear Michal,
> Cc: Geert,
>
> I've tested the linux v4.10-rc2 for Gen2 Lager and found an issues when
> writing data to SPI-FLASH with jffs2 format
>
> "root@linaro-naro:~# cp test.dat /mnt/media
> [  223.874078] ------------[ cut here ]------------
> [  223.888017] WARNING: CPU: 2 PID: 2008 at
> drivers/mtd/spi-nor/spi-nor.c:1182 spi_nor_write+0x84/0x160
> [  223.915507] Writing at offset 12 into a NOR page. Writing partial pages
> may decrease reliability and increase wear of NOR flash.
> [  223.915543] CPU: 2 PID: 2008 Comm: cp Not tainted 4.10.0-rc2-dirty #166
> [  223.970037] Hardware name: Generic R8A7790 (Flattened Device Tree)
> [  223.988563] Backtrace:
> [  223.995934] [<c010a8a0>] (dump_backtrace) from [<c010aad8>]
> (show_stack+0x18/0x1c)
> [  224.018639]  r6:c04786f0 r5:00000000 r4:600f0013 r3:00404000
> [  224.035626] [<c010aac0>] (show_stack) from [<c033b154>]
> (dump_stack+0x80/0xa0)
> [  224.057294] [<c033b0d4>] (dump_stack) from [<c011e49c>]
> (__warn+0xd4/0x104)
> [  224.078169]  r5:00000000 r4:ef203ba8
> [  224.088894] [<c011e3c8>] (__warn) from [<c011e50c>]
> (warn_slowpath_fmt+0x40/0x48)
> [  224.111337]  r9:c0a2a6cb r8:ef203c8c r7:0000000c r6:00000000 r5:00000000
> r4:eebfa418
> [  224.134564] [<c011e4d0>] (warn_slowpath_fmt) from [<c04786f0>]
> (spi_nor_write+0x84/0x160)
> ..."
>
> Please have a look at the attached testlog file for detail.

I didn't keep the attachment, the test just does

# flash_erase -j /dev/mtd2 0 0
# mount -t jffs2 /dev/mtdblock2 /mnt/media
# dd if=/dev/mtdblock2 of=test.dat bs=512 count=1
# cp test.dat /mnt/media

> And I found the patch which I think it is the cause of this issues.
> The commit name is 'e5d05cb mtd: spi-nor: simplify write loop'
> If I reverted this patch and retested it on H2 board, the issue will be
> gone!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
