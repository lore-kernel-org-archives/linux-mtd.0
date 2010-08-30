Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Opzer-0008SS-0m
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 08:24:01 +0000
Received: by yxf34 with SMTP id 34so2320111yxf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 01:24:00 -0700 (PDT)
Subject: Re: [PATCH 0/4 v2] NAND: add support for reading ONFI parameters
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201008181401.03741.florian@openwrt.org>
References: <201008181401.03741.florian@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 11:23:53 +0300
Message-ID: <1283156633.12995.21.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-08-18 at 14:01 +0200, Florian Fainelli wrote:
> Hi,
> 
> This is the second version of the patch series adding support for ONFI 
> parameters to NAND device.
> 
> Florian Fainelli (4):
>   NAND: add NAND_CMD_PARAM (0xec) definition
>   NAND: denali should also handle NAND_CMD_PARAM
>   lib: add crc16_le helper
>   NAND: add support for reading ONFI parameters from NAND device

Hi,

since I did not review your patches, I am picking them and pushing to
l2-mtd-2.6.git / dunno branch. I'll try to encourage dwmw2 to look at
them and take them to the mtd tree, so they would have some exposure in
the -next tree.

But some "Tested-by" / "Reviewed-by" tags would certainly be useful,
anyone?

Also, the last patch did not apply cleanly, could you take a look
whether the patch utility got it right?

Applying: mtd: nand: add support for reading ONFI parameters from NAND device
error: patch failed: drivers/mtd/nand/nand_base.c:2943
error: drivers/mtd/nand/nand_base.c: patch does not apply
Patch failed at 0001 mtd: nand: add support for reading ONFI parameters from NAND device
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".
[dedekind@brekeke l2-mtd-2.6]$ patch -p1 < .git/rebase-apply/patch 
patching file drivers/mtd/nand/Kconfig
patching file drivers/mtd/nand/nand_base.c
Hunk #6 succeeded at 2991 (offset 1 line).
Hunk #7 succeeded at 3020 (offset 1 line).
Hunk #8 succeeded at 3045 with fuzz 2 (offset -3 lines).
Hunk #9 succeeded at 3084 (offset -3 lines).
Hunk #10 succeeded at 3107 (offset -3 lines).
Hunk #11 succeeded at 3117 (offset -3 lines).
Hunk #12 succeeded at 3135 (offset -3 lines).
patching file include/linux/mtd/nand.h

My tree is here:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Thanks. 
-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
