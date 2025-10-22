Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83BFCCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=je7/8xGICxsbS88BnOF+C1BaafT5P3MYf90w+BiKdMQ=; b=sPwB530eeFysan
	zzqH6ZFICd/7fCa2hZpsleT6zKcBWbndVgX+ZyZ/wDtxUkgg6EkR0Yce7OYxj/ZYZjmjoRP3PqSOD
	V9GlzA4MNLrU74azHZBpbA5lEt6GlTJ+tOptep0uYmL5DEBuvS9/3w6wjh+kU8QWCLos0rkLJQoRV
	GfyR/vkiFNKpV0x0aHhxZ0OSlnjtag1/rt1ZZGUrgEWSJPtRvZ9Qx0lwbrz8DDp04O7aJfSi0vxYD
	PhHUMiCEAgYjMD9jIWOaXYjlqxhHvoUCinp/NoHF+hD53It4jRmAcgBj9mAyrFv7R2BKZLhIjcwjQ
	o/wwcIKITZQ+3mn82MoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVl0-00000002PK8-26pl;
	Wed, 22 Oct 2025 10:07:50 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVkv-00000002PHx-0U2f
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:07:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso202488a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761127664; x=1761732464; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f92XMf9NP7Tv9DocHywTTrf52jlw2PZ7QVnvZS/syHw=;
        b=XKw9/ptanu1a5qDESvZdDfFnxjvx0f49E5bwunEpI68W/L7MYIISCBMhzcrjLgpCOw
         y8up7Qto3D1EjQZOivuygR6XpMtaldmVAVewjz9tsKAvSRjHttrGNvG0aSvkIKpLsfyx
         a0xPS+WZU7Swp/FlLv4LNX2hlqP2fWtOHNj6dLiiYqV7Ljt8sjaFzuNzRhC1kEIrHsYs
         pDzeV0EiWeBg6oj1y/Vk+LcClPKr3HczNe+vub1NkvPZ0M7Zg/wybN1wOhsXCS5s/h9M
         7oiaVpU+9DUN1814GKMVMOPsA9rtGsyAlCwIgKOjEiTom7i86osl2Mc4N7YLx72EeFRs
         WMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127664; x=1761732464;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f92XMf9NP7Tv9DocHywTTrf52jlw2PZ7QVnvZS/syHw=;
        b=LuCGjs4vNeCEWGNAp8qDpFY+tJsaifFJWxtGUNSrs3hgHB4ADmVOvUHjEhtdhO94aF
         f0fRCTz7R2Dbf/yiL9JGTYXA+J/1jwNf9j781+I+PYCWQreicja7wybj/NqN2hgfERmn
         AKyc38HUluiDPgXqn29cOnIyg0scu+7V7LhJZwb/sf91sphhvTtFliOMIac6CQX26jrA
         FoxXzG9nvA3ejFbf3ovrp9Mg8ZwVqefCnho8NBJ582BdP82I9WFI7WoZhP1Lt/RC47w1
         9VfeMPCn1iq8S5QeB7IBugDPtccFBsocH55uDTjltF0QVm15Elak2e/sUiF4NSfKrJZL
         i/ew==
X-Gm-Message-State: AOJu0Yxh4dIWxVQSwH3+V0ORcIehns96xJjNbZWLspMK1v/6FsnxuVib
	0NVp0PsF2IsTh/qee/sZM4XgDdBFIGtS91MFJUrc+wcH1/H/Qcf7mEjnlS1k+A==
X-Gm-Gg: ASbGncupqSy6Ufrz5BIR72OnBqZP3R4bj9JnZckm6g4/Mf/bxMdWAhKIue0H5rCIW+B
	Eh3Ud9+EzKfyYnIR+5Wnk4F8yPUlfOmHTk3barbm7i3hsSHPgibGDS8Uzf4s3Oa5+1jldxxb/ei
	IHAZ2S9Vd7qI+xaeE7ML0ZvAochNB9Mr34pEZjnzmacuOFihgqJXDEXqUXO92dqE8Jh3Xy8qX6S
	hlRj/DgAF1emi9GXFw3mtstbxg24OQApFaAMGNC7+bFvAPS/g+3reAnt0KUPTlEkMUaF20fdSLh
	v2Lh/qWYPqzoH45l5BRZgcQ7eYbNPwHUlmuWvYFUI58gYPsCJ+WV7AWXNtNMdQYjYoQehojrZ5Q
	4RKxj8/6+rrXzpd9DNbyNFpggDM2JQ3nOf6du5dsTxu4etiTJMlP9JSqqBooprZM263b82pRawv
	pSaHVS1apDbgNxiMVmIcCaVY92ulb/WfcTZiWI+7OXvoDOm2iY6UOcQ8EW1om3t1H5MhekFBMg5
	CLe1Ys=
X-Google-Smtp-Source: AGHT+IEXr/LW8jVYa3wL+tCY+iIfEcYp5iQKeVrsH+ZUfi9WgSAQn6+2NR/op1D993OnUR3J85rNrw==
X-Received: by 2002:a17:902:cf0b:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-290cb66025amr274024445ad.58.1761127663928;
        Wed, 22 Oct 2025 03:07:43 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdd10sm133774585ad.83.2025.10.22.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:07:43 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
Date: Wed, 22 Oct 2025 19:07:19 +0900
Message-Id: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANes+GgC/x2MSQqAQAwEvyI5G3CCg8tXxINL1BzUYaIiiH83S
 J2KovsB5SisUCcPRL5EZd9MXJrAsHTbzCijOVBG3mVEqOQnRWMNB05ynwHHoSq4dL7Iewc2DJE
 t/KdN+74fmEbdsWQAAAA=
X-Change-ID: 20251022-s25fs-s-smpt-fixup-dc97e81574b1
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761127659; l=869;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=CQGSJ9G5NTFb+nnyJMlZJY34ul4EgxAU+ZVsDLweE+c=;
 b=qxSRzHnY8WxzKYNe7J1Rxe27i7izSPgca+sVC28ds80oyWATLJS5halsvk2LJMEN5pUauGEzE
 4IgELIparSCCyqUjKrBuCFswcrCoiP0BaSzuX9mfOHSCkytY/n2v11D
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030745_160508_7CBD7706 
X-CRM114-Status: UNSURE (   7.14  )
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

Suggest new series as the result of discussion in the thread:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20240914220859.128540-1-marek.vasut+renesas@mailbox.org/

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Takahiro Kuwano (3):
      mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup hook
      mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
      mtd: spi-nor: spansion: SMPT fixups for S25FS-S

 drivers/mtd/spi-nor/core.h     |  6 ++++++
 drivers/mtd/spi-nor/sfdp.c     | 30 ++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/spansion.c | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 2 deletions(-)
---
base-commit: 17926cd770ec837ed27d9856cf07f2da8dda4131
change-id: 20251022-s25fs-s-smpt-fixup-dc97e81574b1

Best regards,
-- 
Takahiro Kuwano <Takahiro.Kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
