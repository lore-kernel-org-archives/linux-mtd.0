Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTWUI-0004gR-4E
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 13:06:22 +0000
Date: Fri, 28 Mar 2014 14:05:59 +0100
From: Gerhard Sittig <gsi@denx.de>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC] mtd: nand: Preparatory patch for adding on-die ECC
 controller support. This patch adds NAND_ECC_HW_ON_DIE and all other changes
 to generic code.
Message-ID: <20140328130559.GD3998@book.gsilab.sittig.org>
References: <1395975504-11301-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9437@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB9437@DBDE04.ent.ti.com>
Cc: David Mosberger <davidm@egauge.net>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-03-28 at 05:48 +0000, Gupta, Pekon wrote:
> 
> Here, I'm bit skeptical on enabling "NAND_ECC_HW_ON_DIE" mode automatically,
> based on ONFI parameters. ONFI params just advertise the current NAND device's
> capability and features, whether to use that feature or not should be under
> control of individual vendor drivers or passed by user via DT | platform-data.
> Example: "MT29F4G16ABADAWP" is supported on-die 4-bit ECC correction. But user
>    can use 8-bit ECC correction on same device,  using ECC-schemes supported by
>    vendor controller driver.
> 
> (1) So it would be nice if instead of enabling  chip->ecc.mode=NAND_ECC_HW_ON_DIE
> in nand_scan_tail(), you advertise the availability of this feature in nand_scan_ident(),
> and then let user choose whether to enable 'on-die' ECC or not.
> 
> (2) At-least in the datasheet "m60a_4gb_8gb_16gb_ecc_nand.pdf" I have,
> - "internal ECC" is _not_ mentioned in vendor specific ONFI params. Rather
> - "internal ECC" is mentioned in 4th byte of READ_ID command.
> So, I don't know if using chip->onfi_get_feature() is correct API to use here,
> because it uses NAND_CMD_GET_FEATURES (0xeeh) not READ_ID (0x90h) 
> 
> (3) If "internal ECC" is mentioned via some vendor specific ONFI params, 
> Then you should put this code under nand_base.c : nand_onfi_detect_micron()

There are two things here.  With chip identification you can
learn whether the chip's model _supports_ on-die ECC.  With the
feature get/set requests, you can learn and adjust whether this
mode is _enabled_ within the chip.  Without support you cannot
enable the feature (will reflect "off" upon re-read).  But with
support, it's orthogonal whether the feature is in use.

The motivation might be that when some previous stage in the boot
process did enable on die ECC mode, you have to "pick up" there
and keep using it.  There still is the option to disable it for
yourself and continue without ECC or with differing methods.  But
at first you find the chip using it, which puts constraints on
how you talk to the chip.

There too is the option to find the chip in a specific mode, and
already knowing whether the user wants to run it in this mode,
and adjusting subsequent operation early, during detection
already.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
