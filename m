Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5573C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2024 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dZ9fQtpWJR8QXTgcQxYrzErC91FyDKcxNyEaGvAiBV4=; b=DOhjAq+ALi8ctT
	ZNRoYzxgg/6WznMF4HJpxwrFTU6HqmywDCC162F+x953y1T5lV+ZRJYkVsGYnkHZrsipdVZm9HgM8
	9TuCFgvf1XK1EAABX2RkMq+w+AM7ddvacyHRaFY/dTw1pzjTKq5JVnLqDuZSgwP7x83Kqgu9H3vcQ
	Gp8bM4cJcufI77wU5iRNRShav+UbrOQ3r9WvJlhoZNK8XSsNrKGPW1GV5KH9OiFcm7WFsE/jsAhfa
	OwkMIoeJXttH5aifEtbquyGwOJEVaGkFlSzFWbapgNCnF0BZLwwXCf/5E28j+JjK/zKyMMe0vUMgS
	a56b83F3MieaePYHCZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCh3Q-00000007ahz-28kl;
	Thu, 30 May 2024 14:46:56 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCh3L-00000007afr-3cAg;
	Thu, 30 May 2024 14:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=ghtoP556IbQ/4WNCjbdXYdl4SF/fbsBPebHF32JHF24=; b=k4
	I/tL93vaUznDzldj8OIPU2ha2h+e6lf/zM1QEjKjHd2quynoZiN1zahEuzRAZ4+bHOgWq6Tbcs9fw
	WDm+F+bs7JNE35wJf32IceQHAa2k1bYDmfWo+pV1TMAMzOdTngeDMadfuXhAt7PFC/RBhnwTzSX8T
	wHNFXEfLZF+PEC6vTMV7D9qZoO472Z/18NA/Aotrm8RUpFMHDVJ5LikAlBhiB9QYzA1THkfYr95No
	ZeWt5QiDAPIPMwc+SiEFIl8T+fp3u1YZwLBdY+aPN4ew7GLvZ39Ie7N5M+K4R8bgRhbLoAwhs4djm
	wMe4Y08hGige7WNGIuBmJ8nOelEK7RAA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sCh3B-000CAW-Cu; Thu, 30 May 2024 16:46:41 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sCh3A-000N5A-1R;
	Thu, 30 May 2024 16:46:40 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v3 0/3] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
Date: Thu, 30 May 2024 16:46:35 +0200
Message-Id: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEuRWGYC/3WMQQ6CMBAAv0J6dk0p0oIn/2E8QLuFTbQlrWkwh
 L9bOGmMx5lkZmERA2Fk52JhARNF8i5DdSiYHjs3IJDJzAQXJ16LCmy8A1kN2jtLA+hGqZaLXrQ
 KWY6mgJbmfXi9ZR4pPn147f9UbvbvKpVQgkRrVdUbrVBeBuwczUftH2x7JfHZNz+9AA61NapHJ
 WXNzVe/rusbKHPTy+0AAAA=
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717080399; l=1363;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=hec9jZ8GWjjsOhfEAzSjDoHUwtpSRvZqlBCq8AeIrFo=;
 b=buzvR/qD7i5oCABreVm4NXVrvG2Yrha5/9sV9qT58rBe0Y1V0HlLMjxj016UsCkarlgM2PV1D
 qnXPPLMay4qDek66RR3yRO4bP1kvryYBpWSCZwqM67gmus4KuCWQaIZ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27291/Thu May 30 10:29:52 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_074652_159813_B9E6AEB4 
X-CRM114-Status: UNSURE (   8.48  )
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

While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option to
be selectable for platforms using fsl_ifc with NOR flash.

Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")

Changes in v3:
- Refresh arm64 defconfig.
- Link to v2: https://lore.kernel.org/r/20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com

Changes in v2:
- CONFIG_MTD_NAND_FSL_IFC depends on CONFIG_FSL_IFC instead of select.
- Refresh powerpc config snippet accordingly.
- Link to v1: https://lore.kernel.org/r/20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (3):
      memory: fsl_ifc: Make FSL_IFC config visible and selectable
      powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC
      arm64/configs: Update defconfig with now user-visible CONFIG_FSL_IFC

 arch/arm64/configs/defconfig        | 1 +
 arch/powerpc/configs/85xx-hw.config | 2 ++
 drivers/memory/Kconfig              | 2 +-
 drivers/mtd/nand/raw/Kconfig        | 3 +--
 4 files changed, 5 insertions(+), 3 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240523-fsl-ifc-config-c877902b297e

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
