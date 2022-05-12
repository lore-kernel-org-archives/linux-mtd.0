Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432A0C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lHdSFJ8qO9iBFpspW02clhI9yypyqNTqeYE6PeFpp8Y=; b=Dae
	S1/BPywLbrua1YI/WN9nf9KBhkDcAHCG1w9aJzayYG+0t5em7wx2i8ufb6NfTFWvRb9rDs26oDsIz
	MIb6OJnHbqNCWpk0ghvbSw8TAftPmNTOpNBCH7/nznzgcWnfiHPRLsysRy+sr5tuZuOwG8eoRLFB5
	yqoUxg3D9rfnj9obgfo11GQPDQwgRiy4/XvtN0OC09C6XMmqevw+Xcs/LCRC30COkpcFTZGNNp5Pr
	QrqwAOz0P3l4ugVAdMGMxHycp6O9FA5cOWl/t+oJ9wixwYAeL6tx/0j+Wn48Z1rny1GcZdfT70624
	fmk06eq78YnDTs7A6AUgsBqIXNdNbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np5cf-00BGla-AC; Thu, 12 May 2022 10:00:41 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np5cc-00BGje-Le
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 10:00:39 +0000
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-d39f741ba0so5956423fac.13
 for <linux-mtd@lists.infradead.org>; Thu, 12 May 2022 03:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=NxUY/9iRjBhmJScdeOOy8luDxyS2quqIILnyfWQzg6Q=;
 b=N3GIfhaXNJjOSHE/UyDizfVu4ISqw/XG0Q/wNXISclUGnfSt+EwToMkLzX8Z7ucv7f
 wldSTvYwm+E9Ve6PbkjqljuRl9ilODuXMDlvPkmM6bX1vOyWjYl30oM6mDCDBLy9iFcU
 U2qys5ILKIzfZByMOZ2LbkbbzNTW2sePRgrQLiOdu+4RMVA089sYF0wT4wF7fipe6610
 imJ9hCR8xpYuYvM0kWUIhGKFLN/UkfjxzRXSqMOYBZbuL0xg/6hAnxzbifDWGRWbIHZS
 ZxA4ZdJIWx8tWM6UnBW4uHWQR4PskSPyB9q0D6+hseWLFz780VwWLDEVpHacKBR3c1CM
 Rtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NxUY/9iRjBhmJScdeOOy8luDxyS2quqIILnyfWQzg6Q=;
 b=CNfkkZ8BSIxzbAQXSuMOSsHeIPaLVxvW6SedYUP7f4ucogRLIVsdtlM5jtvig/u8/C
 +oV/2NBpoPQGjzmPpojQnPk/qXQYntNVGaaFlWKnfPDETVMTJbarAes9ZoaAHwp7UIEz
 Rom2REcj0aPkcY+DYb60W7L6f4uQbWT+E69YUI3/AuFy/ju4v2vvsm49jXBmmBWJ5eNH
 GeVSJ6IQJcHiuRkQKqG5m6mdD5LHrSSVAJZX4MNax6quEH8ZsdGi/rRr8/di5tQvjDD/
 UU5r4qnEloMROEr1lFoz60RY5m5wo+ROGewel5rKFxftB//GO29+hnen4jsABdBj1i2d
 Qx6A==
X-Gm-Message-State: AOAM530rpP0vFO4wS9cdifWF/dcVoogEzCPYTgUE9XFuRLDFMM2aLmEN
 5w763f1VUlzlvm80+VknOTEtV8KFeJKraQRRD9pw95xTmJw=
X-Google-Smtp-Source: ABdhPJz5943TckMXpqkp/oE3QLdwag1uWIguV+HbmAWKyGN4qx4feRAMY48u2gyahcfgPAt7kMv0lJ9/IYJgC3E4TAc=
X-Received: by 2002:a05:6870:631a:b0:ed:7825:e9ff with SMTP id
 s26-20020a056870631a00b000ed7825e9ffmr5081918oao.54.1652349634599; Thu, 12
 May 2022 03:00:34 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Thu, 12 May 2022 19:59:58 +1000
Message-ID: <CAA=hcWTRdRYjcwPmeyocidG4rMCZAiqQicj88q4og2QDc0dBFg@mail.gmail.com>
Subject: Lost MTD drivers in kernel 5.10 branch
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_030038_741472_1ECCD658 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I could run MTD and UBIFS very well in kernel 4.19 built by Yocto Zeus
branch, after upgrading to kernel 5.10 branch, I could not run MTD and
UBIFS, missing /dev/mtd* drivers and an empty table by cat /proc/mtd.

Given I set the identical MTD and UBI configuration in defconfig and
uboot configure for both kernels, I could not see defconf is causing
the MTD drivers problem in kernel 5.10 branch. Further adding the
debug on

CONFIG_MTD=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_OF_PARTS=y
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_RAW_NAND=y
CONFIG_MTD_NAND_VF610_NFC=y
CONFIG_MTD_NAND_MXC=y
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_BLOCK=y
CONFIG_UBIFS_FS=y

The nand_base.c nand_detect was not called so all of following nand
functions were missing in kernel boot:

[    7.576334] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
[    7.582910] nand: Winbond W29N02GV
[    7.586631] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    7.601297] Bad block table found at page 131008, version 0x01
[    7.608736] Bad block table found at page 130944, version 0x01
[    7.616692] 3 cmdlinepart partitions found on MTD device gpmi-nand
[    7.623021] Creating 3 MTD partitions on "gpmi-nand":
[    7.628466] 0x000000000000-0x000000400000 : "boot"
[    7.651267] 0x000000400000-0x000000500000 : "ubootenv"
[    7.666836] 0x000000500000-0x000010000000 : "storage"
[    8.111031] gpmi-nand 1806000.gpmi-nand: driver registered.

Are there any changes in kernel 5.10 MTD to require some new MTD configurations?

Appreciate your insider advice.

Thank you.

Kind regards,

jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
