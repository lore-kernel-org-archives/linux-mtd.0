Received: from 81-7-68-229.static.zebra.lt ([81.7.68.229] helo=teltonika.lt)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0y0o-0002kY-UM
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 12:42:59 +0000
Message-ID: <491D724D.2030804@teltonika.lt>
Date: Fri, 14 Nov 2008 14:42:53 +0200
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
MIME-Version: 1.0
To: Avik Sil <savik@zilog.com>
Subject: Re: MTD XIP related issue
References: <130F820E6D339446BB9EEC7FAF40A06DDEDF4B@mailziel.zilog.org>
In-Reply-To: <130F820E6D339446BB9EEC7FAF40A06DDEDF4B@mailziel.zilog.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Avik Sil wrote:
> While porting Linux kernel 2.6.26 on an ARM922T based custom board for
> XIP kernel, I came across the following bug report during boot-up:

Had the same problem. See my comments on your config file

[...]

> My kernel configuration is:

[...]

> #
> 
> # RAM/ROM/Flash chip drivers
> 
> #
> 
> CONFIG_MTD_CFI=y
> 
> # CONFIG_MTD_JEDECPROBE is not set
> 
> CONFIG_MTD_GEN_PROBE=y
> 
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> 
> CONFIG_MTD_MAP_BANK_WIDTH_1=y
> 
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> 
> CONFIG_MTD_MAP_BANK_WIDTH_4=y

Select only the supported BANK_WIDTH.
The problem is that if multiple bank widths are selected, then in code which is placed
in RAM for XIP to work appears reference to __udivsi3(if I remember correctly) and
this function is on FLASH and FLASH at that moment is inaccessible.
Sometimes it works because this function is already cached by CPU.

Nicolas: I think there should be some way to work around this... If not maybe we should
add compile #error if multiple bank widths and XIP are selected...
 
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> 
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> 
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> 
> CONFIG_MTD_CFI_I1=y
> 
> CONFIG_MTD_CFI_I2=y

Don't remember, but this may have the same effect also.
 
> # CONFIG_MTD_CFI_I4 is not set
> 
> # CONFIG_MTD_CFI_I8 is not set
> 
> # CONFIG_MTD_CFI_INTELEXT is not set
> 
> CONFIG_MTD_CFI_AMDSTD=y
> 
> # CONFIG_MTD_CFI_STAA is not set
> 
> CONFIG_MTD_CFI_UTIL=y
> 
> # CONFIG_MTD_RAM is not set
> 
> # CONFIG_MTD_ROM is not set
> 
> # CONFIG_MTD_ABSENT is not set
> 
> CONFIG_MTD_XIP=y
