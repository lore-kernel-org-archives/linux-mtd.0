Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEeQH-0004YM-Jp
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2015 14:09:34 +0000
Received: by oibn4 with SMTP id n4so24068963oib.3
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jul 2015 07:09:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55A3C342.9010704@gmail.com>
References: <55A3C342.9010704@gmail.com>
Date: Mon, 13 Jul 2015 16:09:12 +0200
Message-ID: <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
Subject: Re: UBIFS errors when file-system is full
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 13, 2015 at 3:55 PM, Bhuvanchandra DV
<bhuvanchandradv@gmail.com> wrote:
> Hello,
>
> Facing some issues with UBIFS mounting when NAND flash is almost near to
> full.
>
> Hardware:
> SOC: Freescale Vybrid
> COM: Colibri VF50
> Flash: Macronic NAND 128MB, 3.3V, 8-Bit
>
> By default the Linux Image flashed on the NAND flash almost occupies ~93% of
> the flash.
> Observed this issue when power resetting the module for about 500 times,
> with journalctl
> enabled, after around 500 power cycles the debug log fills up the nand
> flash. When the
> flash menory is about to full, the ubifs partation is un-mountable.
>
> The nand flash controller driver is under review and passed all MTD tests.
> https://lkml.org/lkml/2015/6/18/847
>
>
> Debug log during UBIFS mounting from U-Boot:
>
> U-Boot 2015.04 (May 18 2015 - 15:37:34)
>
> CPU: Freescale Vybrid VF500 at 396 MHz
> Reset cause: POWER ON RESET
> DRAM:  128 MiB
> NAND:  128 MiB
> MMC:   FSL_SDHC: 0
> *** Warning - bad CRC, using default environment
>
> In:    serial
> Out:   serial
> Err:   serial
> Model: Toradex Colibri VF50 128MB V1.1A, Serial# 04815679
> Net:   FEC
> Hit any key to stop autoboot:  0
> Booting from NAND...
> UBI: default fastmap pool size: 50
> UBI: default fastmap WL pool size: 25
> UBI: attaching mtd1 to ubi0
> UBI: attached by fastmap

Is this a recent kernel with all fastmap fixes applied?

-- 
Thanks,
//richard
