Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz5Mk-0007Zw-2J
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 14:04:47 +0000
Message-ID: <52C6C362.2020209@denx.de>
Date: Fri, 03 Jan 2014 15:04:18 +0100
From: Stefano Babic <sbabic@denx.de>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: UBIFS seeing corrupt blank pages when image flashed via u-boot
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
 <1388753970.25123.124.camel@sauron.fi.intel.com>
In-Reply-To: <1388753970.25123.124.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: artem.bityutskiy@linux.intel.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Gupta,

On 03/01/2014 13:59, Artem Bityutskiy wrote:

> Basically, "ubiformat" is the "correct" UBI-aware flasher, while
> u-boot's "nand write" seems to be a dumb flasher.

It is, it is *not* recommended for UBI volume without "ubinizing" your
image.

> I guess you have 2
> options:
> 
> 1. Teach u-boot's "nand write" to skip empty pages, or may be implement
> a separate "clever" flashing command.

You can also add (my preferred way) UBI support to your U-Boot, if it
does not yet have. Then you will have "ubi part" (corresponds to
ubiattach in Artem's MTD utilities), "ubi createvol" and "ubi writevol"
(respectively, ubiupdatevol and ubimkvol). If you use dumb nand
utilities, you have to erase the flash first with "nand erase", and this
will lose the erase counters.

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
