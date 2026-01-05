Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58083CD040A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fFEm2ew8zPAcp7BR/ezMCs6QhwBIREjBQz0zpyGjmDQ=; b=Y6BaS9UBtNk6XD
	xYHmq1CKTZMqUcaUSqY0M2x6uvwKS7qOxJ1XAGHfaJSNaKl+xe/ExaPVE5M7Kx5aE9olGqn++VEw7
	/a47I07gILdj4dsNOhDb0xw5yJr/vkDFEGvCDsr+4pW9a1mXhuMR9go8rVY8HiJLOxPPaPdlCqx4i
	59YEuMffNAnO89i2q9FIGDMe/7P95fWdcNbV8fN1Y51FQ2gM3H+6ac5/EXwpeTrDvEuFxzn5qnTWn
	/gbmJJl9d7Kp0JDmZZqp98ZNoXW+u1ocwd2YJVAa2ZGFYhCKQHdzA1m8yIX6h/y7Lq9K02yGhxLKS
	JsDyHH74qlGzhh6mp6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrmw-0000000C5nT-48rP;
	Mon, 05 Jan 2026 21:06:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrmt-0000000C5lZ-2T2m;
	Mon, 05 Jan 2026 21:06:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A17BB4079E;
	Mon,  5 Jan 2026 21:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6883DC116D0;
	Mon,  5 Jan 2026 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767647210;
	bh=vgIKhiITZo8Rsj2kJJV4QLNruYSdES9wetKIFYKZ3zE=;
	h=From:Subject:Date:To:Cc:From;
	b=o7IlEK8L/KJCQTwTM4ke+O58lICYB0g8b8potUisdygO7Xnt6XX9spI/7ZO6Z6wye
	 /TaM4fum5V5vKj0NmUiovIDou+FhAN3hFQC2EWn6hYeG5wXbfGBjsVQTs6Dq3oPzDG
	 ehjbJ9FGV+CWzIwh1FVRpPAx3M31DzTigqulYSJlxD7z20KV50EODSaMgh+WYzgB1V
	 jVsuAL14/UtlAxPaqoxPnfCfxcbxhY8P/RJIRGcf43efGL3zPw4GhlOqnYqar36nVM
	 CiZZHrToJk2cTmbJLBw6pPYmBrnQQN0GK+ksO6NlHyEmkSjvGGJBBmdyHWAGrr6Xmy
	 pPVSf4JHdA5wQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 0/3] at91: Remove of_platform_default_populate() calls
Date: Mon, 05 Jan 2026 15:06:42 -0600
Message-Id: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOInXGkC/23MQQ7CIBCF4as0sxYDY2rAlfcwXQAdWqIpzdAQT
 cPdxa5d/i953w6ZOFKGW7cDU4k5pqXF5dSBn+0ykYhja0CJvVIohd2MEisnRwJlcJ6MvY7KQTu
 sTCG+D+wxtJ5j3hJ/Drvgb/3LFBRSaK97g0Eiabo/iRd6nRNPMNRav/U2LYWlAAAA
X-Change-ID: 20251120-at91-probe-20fbce9a6d1b
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_130651_651116_DDB733B5 
X-CRM114-Status: UNSURE (   9.53  )
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

This is another attempt at removing of_platform_default_populate() calls 
on at91 platforms. The last attempts were in 2018[1] and 2023[2]. The 
problems reported are PM and NAND failures. Both of these depend on SRAM 
pool which doesn't have any fw_devlink tracking. Also, the PM code is 
not a driver, so fw_devlink wouldn't help. For the NAND driver, we can 
simply defer probe. For the PM init, we can move it to the .late_init 
hook.

Rob

[1] https://lore.kernel.org/all/20180712192222.32481-1-robh@kernel.org/
[2] https://lore.kernel.org/all/3908fa6f-dc33-4aac-c21f-4a676a3a6b23@microchip.com/

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
- Fixup mismatch in my author vs. Sob.
- Fixup the split between patch 2 and 3 to fix bisection
- Use dev_err_probe() in NAND driver
- Link to v2: https://patch.msgid.link/20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org

---
Rob Herring (Arm) (3):
      mtd: nand: atmel: Defer probe if SRAM is missing
      ARM: at91: Move PM init functions to .init_late hook
      ARM: at91: remove unnecessary of_platform_default_populate calls

 arch/arm/mach-at91/at91rm9200.c              | 12 +-----------
 arch/arm/mach-at91/at91sam9.c                | 12 +-----------
 arch/arm/mach-at91/sam9x60.c                 | 12 +-----------
 arch/arm/mach-at91/sam9x7.c                  | 12 +-----------
 arch/arm/mach-at91/sama5.c                   | 21 +++------------------
 arch/arm/mach-at91/sama7.c                   | 11 +----------
 drivers/mtd/nand/raw/atmel/nand-controller.c |  6 ++----
 7 files changed, 10 insertions(+), 76 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251120-at91-probe-20fbce9a6d1b

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
