Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B4EC7EE23
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sw7JhEgSOecTg/nZE1RizahK16fLFfyLFChQgemSYeI=; b=DCClbo1ZrdEmIv
	t+bwlSHVbEAfY/ZDA5mmhzJGxbUEsGI69QgQb9tKWVr2W4EFgpt/Q3fuzeM/s5JovpjFaeDatD+hM
	knLO00K+ZcMUVYjT1nVCfBH/f9ANYa7+zo/+9fvaQiMfgRlReL1NBzvxBnmb0jX3QFOZhmWZSqfsa
	B2BpO1pgq4ptPKgguNt21LjhdXEXe5dOiC1TCyzVnhR4J2svZK1ujimuLjawPLhHR+i31YO3jtcdq
	CScFOusVsTHhUl+ExlM6S45VJrLD179qdIsZ4o5PXzdVEZCasbl3Sb5j1msqBTVYpL/XWvDKW3NUp
	gyKLFALggTU6yFbUgUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4C3M-00Fr4R-2h;
	Wed, 31 May 2023 02:59:12 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4C3H-00Fr1F-09
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 02:59:10 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 97ECF2C0596;
	Wed, 31 May 2023 14:58:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1685501939;
	bh=OMlElmdtZdi259PjJVmy6JwGQG2VyhDI2nE8htIQ6Rk=;
	h=From:To:Cc:Subject:Date:From;
	b=vdY6KV83oo+1h8uD9l7V5YlhyVrD9ZtyKeL41WG5ZP/LfRTinVMZIsoDbWJ+G9t6T
	 Zx8dvWLQhIPtFFxeeA/YCkt3rEzzQoVMp6esiT1KpzV+bfUmO1ivpmWRPhsJw58BoF
	 s7o8tGUuyb8nygG+m9hDnsD02D90gM6/rOsYqNWYCWMNVOzXHFksCESwXnR74yfL3H
	 avoEcQFXF4moOYFDrL8aauwhdqDBMbwk72BQZeK4HzImCOaiLdqu3ILsjqGiFL4MbM
	 tqzlcLOFl+AMqEuAqxeqGTYJWA9OPU89cp6jOUYVlkPC0ACgy5xfEVcbH8m6S0hZ15
	 dRpjOCloOgo1w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6476b7f30000>; Wed, 31 May 2023 14:58:59 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 6949113EDD5;
	Wed, 31 May 2023 14:58:59 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 632ED280AFE; Wed, 31 May 2023 14:58:59 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	daniel.lezcano@linaro.org,
	neil.armstrong@linaro.org,
	f.fainelli@gmail.com,
	christophe.kerello@foss.st.com,
	liang.yang@amlogic.com,
	jdelvare@suse.de
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] mtd: rawnand: marvell: add support for AC5 SoC
Date: Wed, 31 May 2023 14:58:45 +1200
Message-Id: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=VwQbUJbxAAAA:8 a=BTILRwyEkoqLbeD1fBkA:9 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_195907_579753_0D118780 
X-CRM114-Status: GOOD (  10.74  )
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

This series adds support for the NAND Flash Controller on the AC5/AC5X SOC. It
needs to be applied on top of two other recent series [1] (applied to
mtd/fixes, not yet in mainline) [2] (v7 out for review).

I've tried to stick to the minimal changes required to get the NFC working on
the board I have (AC5X + S34ML02G2). Marvell's SDK has hard coded tables of
ndtr values for the different timing modes but so far that seems unnecessary.

[1] - https://lore.kernel.org/linux-mtd/20230525003154.2303012-1-chris.packham@alliedtelesis.co.nz/raw
[2] - https://lore.kernel.org/linux-mtd/20230530235456.1009082-1-chris.packham@alliedtelesis.co.nz/raw

Chris Packham (2):
  dt-bindings: mtd: Add AC5 specific binding
  mtd: rawnand: marvell: add support for AC5 SoC

 .../bindings/mtd/marvell,nand-controller.yaml    |  1 +
 drivers/mtd/nand/raw/Kconfig                     |  2 +-
 drivers/mtd/nand/raw/marvell_nand.c              | 16 ++++++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
