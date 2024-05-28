Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A57EC27C44
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMnQCzp4FdFA+wJHp37cZKyxdDMyQm2XzGuoUMu1Xw8=; b=iD97gEECETmDN4
	e1SGbyPkmE3lK9hHjDEmFDm8cb3zKePJfejFJlNf2f61JCP292adc9UQDLZfcn7k+jtUflzk6cUIm
	RwGWkciczYAhtmfJ+da75tsZO9J+XXB1o4S/eqRsOCR4afF8hil79fcdlrtkaqGoe0xWg03pwzAFM
	0qbiY0jBj/wAWEDA+lJIkbddvIaDqCLxie2NRRm/v8fNskvORVXTK5BdI0oYxzKwMWu5Mj9AgdGiI
	GKtZ93paDp4LW8unEzsOhJGsl9wGoiKL3pJr5NoI1FEJ4uBtiii7RmNcMDb0xw92kKKX1Sj8Xb9aa
	0Cc5SltsuD0rCgbNzLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvx8-00000000ah0-40Is;
	Tue, 28 May 2024 12:29:18 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBvx2-00000000afG-2TmN
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 12:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=B+JyFuDIfoWyU83fEPu16Ax2iAw7y4/ySQU7Tr5AVHs=; b=UQ9yPSY0+xZ4W22mwhQYbJvR1s
	qCsqBrSouHS0jViyms/odzKQ20L4VqruYJtzS7RxlVxjnKgkmTHRocWRJaPoBd6HwZXrmgwtrzyJa
	deBKI0ANan3PDDVkXZ/xU+JKvIr5X/DYSqJJumjW8Ugjcr/jZW6vX/g2tP9uTmlGNknyUnLlefAkh
	LnB37nBF5/C6ZSfEo6kp6a3u7oP+p4T03Uf2eAZhpmyDBjgR1cUfTF/19188EsyaXQwDC/BXtSGPC
	750TZqv5a5lOH42ZyvMNb0Bq1KoWW6lAIX5vzWZle8eqgJwTEowfcJWtPsBwVfYqCHvQ8h3j+WAVq
	nF57NIXg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBvwu-000G8z-MP; Tue, 28 May 2024 14:29:04 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBvwt-000CIK-01;
	Tue, 28 May 2024 14:29:03 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 28 May 2024 14:28:53 +0200
Subject: [PATCH v2 2/2] powerpc/configs: Update defconfig with now
 user-visible CONFIG_FSL_IFC
MIME-Version: 1.0
Message-Id: <20240528-fsl-ifc-config-v2-2-5fd7be76650d@geanix.com>
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
In-Reply-To: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716899341; l=963;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=iKUhFoSSSMrh/cb1S2LQj5ELm2cHsPctZeIgLvA69wo=;
 b=8RQGE9EgZX/SGIcrQldXMqMU13oeIlcOwvNVNNpAutnOUf/hrhuSWlbCBqC4Wd+OISRChAkGA
 TPZ4RMCgBSBDQ26tXtYu91XvX/Yyz7zk/0N05SBLuQpWsr4sRyG2OOd
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27289/Tue May 28 10:30:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_052913_164131_D1C4037B 
X-CRM114-Status: UNSURE (   6.85  )
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

With CONFIG_FSL_IFC now being user-visible, and thus changed from a select
to depends in CONFIG_MTD_NAND_FSL_IFC, the dependencies needs to be
selected in config snippets.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 arch/powerpc/configs/85xx-hw.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
index 524db76f47b7..8aff83217397 100644
--- a/arch/powerpc/configs/85xx-hw.config
+++ b/arch/powerpc/configs/85xx-hw.config
@@ -24,6 +24,7 @@ CONFIG_FS_ENET=y
 CONFIG_FSL_CORENET_CF=y
 CONFIG_FSL_DMA=y
 CONFIG_FSL_HV_MANAGER=y
+CONFIG_FSL_IFC=y
 CONFIG_FSL_PQ_MDIO=y
 CONFIG_FSL_RIO=y
 CONFIG_FSL_XGMAC_MDIO=y
@@ -58,6 +59,7 @@ CONFIG_INPUT_FF_MEMLESS=m
 CONFIG_MARVELL_PHY=y
 CONFIG_MDIO_BUS_MUX_GPIO=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
+CONFIG_MEMORY=y
 CONFIG_MMC_SDHCI_OF_ESDHC=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI=y

-- 
2.45.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
