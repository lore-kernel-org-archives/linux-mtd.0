Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d25Ru-0004pI-0d
 for linux-mtd@lists.infradead.org; Sun, 23 Apr 2017 00:32:23 +0000
Received: by mail-io0-x242.google.com with SMTP id k87so38944157ioi.0
 for <linux-mtd@lists.infradead.org>; Sat, 22 Apr 2017 17:32:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170421163026.24884-1-andrew.smirnov@gmail.com>
References: <20170421163026.24884-1-andrew.smirnov@gmail.com>
From: Chris Healy <cphealy@gmail.com>
Date: Sat, 22 Apr 2017 17:31:59 -0700
Message-ID: <CAFXsbZq47s8-CnHb2vGHgaq4A8Bre4RrfNyWKSedPkLEN-qi+w@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] mtd: dataflash: Replace C99 types with their
 kernel counterparts
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index f9e9bd1..a566231 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -84,7 +84,7 @@
>
>

On a Freescale i.MX51 SoC I tested this full patchset with both the
AT45DB642D and AT45DB641E SPI NOR devices.  Both were correctly
identified:

With AT45DB642D part:
[    2.560788] mtd_dataflash spi0.1: at45db642d (8192 KBytes) pagesize
1024 bytes (OTP)
With AT45DB641E part:
[    2.572970] mtd_dataflash spi0.1: at45db641e (8192 KBytes) pagesize
256 bytes (OTP)

Tested-by: Chris Healy <cphealy@gmail.com>
