Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZcYY-00046h-Hw
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 09:20:15 +0000
Received: by mail-wi0-f173.google.com with SMTP id bs8so3269970wib.6
 for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2014 02:19:51 -0700 (PDT)
Received: from [192.168.0.2]
 (host36-238-dynamic.248-95-r.retail.telecomitalia.it. [95.248.238.36])
 by mx.google.com with ESMTPSA id iy10sm580930wic.5.2014.10.02.02.19.50
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Thu, 02 Oct 2014 02:19:51 -0700 (PDT)
Message-ID: <542D18B6.3020906@gmail.com>
Date: Thu, 02 Oct 2014 11:19:50 +0200
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Fwd: Re: UBI ECC errors on kernel 3.16.2
References: <542C73B0.7000602@gmail.com>
In-Reply-To: <542C73B0.7000602@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have some additional info:
i added some traces in the mtd nand driver, and see that until a certain
point of the boot, mtddriver reads without any ecc error.

Then, after some other driver inits, the same offset read gives ecc error.


nand_davinci_read_buf: buf c791588c, len 64
nand_davinci_read_buf: buf c883d000, len 512
nand_davinci_read_buf: buf c883d200, len 512
nand_davinci_read_buf: buf c883d400, len 512
nand_davinci_read_buf: buf c883d600, len 512
nand_davinci_read_buf: buf c791588c, len 64
nand_davinci_read_buf: buf c883d800, len 512
nand_davinci_read_buf: buf c883da00, len 512
nand_davinci_read_buf: buf c883dc00, len 512
nand_davinci_read_buf: buf c883de00, len 512
nand_davinci_read_buf: buf c791588c, len 64
nand_davinci_read_buf: buf c883e000, len 512
nand_davinci_read_buf: buf c883e200, len 512
nand_davinci_read_buf: buf c883e400, len 512
nand_davinci_read_buf: buf c883e600, len 512
nand_read(): ret=0
UBI: volume 0 ("rootfs") re-sized from 205 to 456 LEBs
UBI: attached mtd6 (name "rootfs", size 60 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
UBI: good PEBs: 480, bad PEBs: 0, corrupted PEBs: 0
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 1/0, WL threshold: 4096, image sequence 
number: 1641262122
UBI: available PEBs: 0, total reserved PEBs: 480, PEBs reserved for bad 
PEB handling: 20
UBI: background thread "ubi_bgt0d" started, PID 1025
davinci_emac 1e20000.ethernet: failed to get EMAC clock
davinci_emac: probe of 1e20000.ethernet failed with error -16
davinci_emac davinci_emac.1: Runtime PM disabled, clock forced on.
davinci_emac davinci_emac.1: Runtime PM disabled, clock forced on.
davinci_emac davinci_emac.1: Runtime PM disabled, clock forced on.
gpio-keys gpio-keys.0: Unable to get irq number for GPIO 126, error -6
omap_rtc da830-rtc: setting system clock to 2014-10-02 09:06:57 UTC 
(1412240817)
barix-ipam390 barix-ipam390.0: ASoC: platform davinci-pcm-audio not 
registered
ALSA device list:
   No soundcards found.
platform barix-ipam390.0: Driver barix-ipam390 requests probe deferral
nand_davinci_read_buf: buf c791588c, len 64
nand_davinci_read_buf: buf c791b000, len 512
nand_davinci_read_buf: buf c791b200, len 512
nand_davinci_read_buf: buf c791b400, len 512
nand_davinci_read_buf: buf c791b600, len 512
ecc_failed !!
nand_davinci_read_buf: buf c791588c, len 64
nand_davinci_read_buf: buf c791b800, len 512
nand_davinci_read_buf: buf c791ba00, len 512
nand_davinci_read_buf: buf c791bc00, len 512
nand_davinci_read_buf: buf c791be00, len 512
nand_read(): ret=-74


So seems some of the latest driver probe or the ubi attach someway mess 
up the next mtd read.

Regards
angelo
