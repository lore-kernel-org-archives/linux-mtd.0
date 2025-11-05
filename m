Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB952CCFA04
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FSB9JvrRxpIEvoVblGhbYfDlf9BscN+LncZBWsmx3hA=; b=SpgWpxOqICKAur
	DG1g/uulL9LmXV03+Vy3xQvrEPQ5JFacFcEY9JoDx48tZwor7+OR0Fxhgv0BM55SBwqTACo8Q3C6x
	eRTI94hcyLjhz3hEsIBww3AuhmQFt/EplsxKunzgiFVGAjhN0diuXjVtBwAqiMpjQdQ7XV5eqFPwl
	Mh2pvA+xE+cz22lz5E8R5RiFs4vfgaE0gxlpVEwumu9qQsCoekNENsZqDQ8LF+ZT9F/MbXtdEfsV9
	u+2JGJMhe6qDEFuKJ9wgKgm7Tu1iBDwuASp1cz9dhgtpnpJSmQYfItKWBUop9TmgJm386etR1iUTZ
	CUGvBlf+d1HkQzte2UwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGC-0000000DEA1-2CRo;
	Wed, 05 Nov 2025 07:48:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYG8-0000000DE9c-0lNX
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 07:48:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-295df6ad56cso25458385ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2025 23:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762328927; x=1762933727; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uL1GP7iRekfu70kjpjjUo5sATbjXbXDsppPEJx4S9Ps=;
        b=AWfGgKITAps/YqT4xnWX/lTOijpLJgPpuDVqRL0BKQjTbpqp1LI452MwsRoIK0PH9Z
         iKT4H8Lwuv7JgXy7S/Mo6FkcUJjKpfVzgBChpaAYgCzw4Z8/njl1Ap85aiBl62aUiNBu
         qtWgvu2FW/n1QNI/axZ9cOPdx/BTJ683GGYH+Z0O/gEpa/rFDnDhHtyOfaKLoP7zyQpO
         2vJTDAvB+5720TFjn4tAvOsoH0UnB19XigSMl2szmeUoPcUpSeZOsqif7nUWhDGo/QuG
         WVDqTakywNvmHztC7mJtwwsOu003QP7R7Zv3bADsyBWgJ9Fb1FLc80eiuKhiAhDBgM+I
         Mr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762328927; x=1762933727;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uL1GP7iRekfu70kjpjjUo5sATbjXbXDsppPEJx4S9Ps=;
        b=WG7pxcpk5q3+DMsWjH4ltHfelTf2kXwMpLRWRF4zbd5rjPUslO1ubwGPTv47Q9yngd
         pyHpoD5gJXGsjOelusPmLEJWZ3JpowE/VtQpZ7jEU+Xp9Zb9L5z9IT7TX18njnykyil6
         j5TYonx7FzJyxwIDFieV3vjF4Y4stJhiF3fcnM0lct/PjU1gslY6FyyKuGhvq7OMv9BH
         aqToCQB7g3A0B+equB2VSAVKALuysIbNasqiDWN0Yjv8HcYer1btUz8ewqFO/IjhkAt/
         X/wlA+hf+N6IB2aL6G7hr099xrgWaJboo6LMAl3YjiKpUlP+vvZRhDNW0QY0xZlIRaVy
         r5KA==
X-Gm-Message-State: AOJu0YzbWnOoKzEJ9x46nH10uFtqyLu7r/GaH0+5cA54+92pyiRW5Hr9
	qMhUT9lcxjQWJHC0ALYhNsGzh9GZOr59jI1uE7pj0gNKcsGASA5bWdv7
X-Gm-Gg: ASbGnctaw5SEcJ3CXh2Xe/qQnjMBJxl87TnKy1zUPkqt8AK45/goWN6ln+JM4H/AAUD
	4WDptWyhsiRmMefUlvhEM39pt4RXZRgJS2WD5R9D9bDiX3Dw/lkI8MG+y2swe2JbDsX6FkCD2Y/
	qcna8941QjTkMfO1+eGbhaXeQYjuJ9sPXkuS6fyA2kD9Ai97PwKXTeIo3zNqMJZsK8qSItyfGcO
	soZXNm5BJRcmPeai4SRSZdxncV8Olt5PY2rojRpFkpvKifvRm4Xp39RP5pVK2dXCbEcd4pa7Eqc
	RpAnWsAkQmtSd0GFLG7cIl7kAy5zw8a1yH1P3fodO7SjWUmXiZOfa8tqYzzSE2wRw2VlaLMIAZn
	ulLy7vxe/10Fs02u7Z1LWLUfgXnVHo1cB+3QkXoeYA0+LeDjcOtarByS7mwOJiAFw0Nu0H4IxCL
	MiwM0A9MAdjGnO/pjn6gke8Grp0Tk5UMPt68Q1Zn/0MdfPxBT905jjSKkLgeixC7TjLt+Y
X-Google-Smtp-Source: AGHT+IFOFf9xTz6pOGnc531uSNVsJlw5qCZM62WsFSgEWlN8iBURroLwLvev8uSaRoieuDIvDc10Cg==
X-Received: by 2002:a17:903:2f4b:b0:295:5972:4363 with SMTP id d9443c01a7336-2962acd5179mr31353655ad.0.1762328926879;
        Tue, 04 Nov 2025 23:48:46 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d74csm52174625ad.76.2025.11.04.23.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:48:46 -0800 (PST)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
Date: Wed, 05 Nov 2025 16:47:57 +0900
Message-Id: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC0BC2kC/32NwQ6CMBBEf4Xs2TXthgp64j8MB2m3sgda0iLRE
 P7dygeYOb2ZzMwGmZNwhlu1QeJVssRQgE4V2PERnoziCgMpMloRYSbjMxZN84Je3q8Znb023Gr
 T1IOGUpwTl+AYvfeFR8lLTJ/jY9U/9+/cqlGhZbq4WrX1QK6T4CVwDGcbJ+j3ff8Cs8yctbcAA
 AA=
X-Change-ID: 20251022-s25fs-s-smpt-fixup-dc97e81574b1
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762328922; l=1086;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=NOKQIR5btRps3wC4qpEiz2d9Wi7VoS6HMlLpi4LAbfI=;
 b=wuqyFyHxGCoOUHn9gt736DIgiDoFoalQEsyffbImu0RTyJ0w1rF8XT/+LFmIsICZKFKbASvVx
 ZNl3DmXod7lD8GIFHRlitRPv7XJZOZkA4geWD1W0Bb1xkJJep9TXJBA
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_234848_230307_DE2B6219 
X-CRM114-Status: UNSURE (   7.49  )
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
Changes in v2:
- Update commit description in 1/3 and 2/3 patches
- Update block comment in 3/3 patch.
- Link to v1: https://lore.kernel.org/r/20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com

---
Takahiro Kuwano (3):
      mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup hook
      mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
      mtd: spi-nor: spansion: SMPT fixups for S25FS-S

 drivers/mtd/spi-nor/core.h     |  6 ++++++
 drivers/mtd/spi-nor/sfdp.c     | 30 ++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/spansion.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 2 deletions(-)
---
base-commit: 17926cd770ec837ed27d9856cf07f2da8dda4131
change-id: 20251022-s25fs-s-smpt-fixup-dc97e81574b1

Best regards,
-- 
Takahiro Kuwano <Takahiro.Kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
