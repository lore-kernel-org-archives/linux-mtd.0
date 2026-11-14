Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB76606A881
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ExZPz2U0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=vzax+X44
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a1UGw7x6fWoDICqTWZOuWSkQPNUEXsPJaHM2ybjsqlM=; b=ExZPz2U0+ubHRNcurVHhTG1n/b
	zUAgMQtzCSXfVpO5qu9ljoeKngVtOteRByYzk5yQyPgbKdDgYSaAhNALypRbtTVnda0OZD28DsE3T
	oJV1zGk9KLoPFf64BQ955lV1XOGzlj7NKh804zu2mdMfFYCyCdd+599q4GFwUibQHyiPZx2JLHMOj
	0s4HhCNa2y7NgRn/l30O9ipD1rUR1Qod6TsKJK0u8n8L5cv7gb2+aS35sjV/v/3lpiKpE8iY4OvIb
	t1gTLAcHSGiPbIRtx8w9z6j1NK/NwFmWzK/w0sbwNZA4KN/2qunSbd0TocJXbJrvg1eApB8hbdfWo
	IC3ew1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeM-0000000FjBD-1eaM;
	Sat, 14 Nov 2026 10:06:22 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeJ-0000000Fj8v-1NEP
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 10:06:20 +0000
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 3706CFA25F;
	Sat, 14 Nov 2026 11:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtxH1rtvVGcCbrpssWyswzGEtKmY8FkdO8ogP+lp3+I=;
	b=vzax+X44GgR+mYPvEMksybA3egCmVsE8nnGqhKJHD4rJ633YS8nOf8mKJpsOzm3z1ceCtr
	fiATtfwlmP/NJvaUJ57LmODHfjZp0pEK/rMXcXI3lb2P3vDaGbgjLM4mFURY+FEaQeg98v
	+YuUjbeiY8BLxRXGr116OEkxkgieVBKSij4wTFaLsJbHMNwPyomY6adoZmal5jooUEZN5i
	RJYP0hYIlXeHJ1RBdoAs2XJs6R2S16386i2GK4JC2kYn2QcD/oyqf3P1a+asikjG4SghMX
	lMK3/DS5ghdjNmZx/ZWbVhy534yHQNPQoU66a0suwNs8AVrArVBeu9R612VDvg==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 5/5] mips: lantiq: danube: rename NOR node on EASY50712 reference board
Date: Sat, 14 Nov 2026 11:06:07 +0100
Message-ID: <20261114100608.3432120-6-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020619_540354_FE7EF9AA 
X-CRM114-Status: GOOD (  12.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes the following warning with the new lantiq,nor binding:
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: nor-boot@0 (lantiq,nor): $nodename:0: 'nor-boot@0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/lantiq,nor.yaml

The MTD device name comes from the driver and not from the node name,
and the board uses a built-in DTB, so only the name of the platform
device changes.

Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 arch/mips/boot/dts/lantiq/danube_easy50712.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/danube_easy50712.dts b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
index c9f7886f57b8..456d5d090c7f 100644
--- a/arch/mips/boot/dts/lantiq/danube_easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
@@ -25,7 +25,7 @@ localbus@0 {
 				1 0 0x4000000 0x4000010>; /* addsel1 */
 			compatible = "lantiq,localbus", "simple-bus";
 
-			nor-boot@0 {
+			flash@0 {
 				compatible = "lantiq,nor";
 				bank-width = <2>;
 				reg = <0 0x0 0x2000000>;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
