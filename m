Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04236D637D1
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 22:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1PmejsQ3CWbI3iLrbcMeCmxgFv79KU/1WW7IpTSD+g4=; b=HohqsnNqlXi/xH
	/r7zQ181yTaXER8IKgiXeA24+p3RN78gogCq3SxazhI4pM9vaO6zxgiTw9G9npn3SjDNegeSAjhVY
	kpxThCBmJOS5pOZHF2JsSuyqKcDg7nXm15uj5rzEbCvtd+myy6zdbEtpzzRoHrbB1eltgCs+lnqXA
	oy3TgKqEqZX57jTnuXJwd2o81zY1MOEOEqsZ4G6abphqMVOU8SX3H6ffpxn6LAfi6PTfcecfNDQfd
	QdUV04B0Iydz47l/K85C9h54nAcI1oDrtS6/JBA+qKtlF12ebIKFUk5+x4rU9DIrYANDxhu/GaQMZ
	cUPR2OdrGXQ77y8V9fPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBMJb-00000008DOI-428d;
	Wed, 13 Nov 2024 22:58:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBMHw-00000008D4r-1KiM
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 22:56:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64F4B5C0286;
	Wed, 13 Nov 2024 22:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35280C4CEC3;
	Wed, 13 Nov 2024 22:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731538599;
	bh=04iCwCCCRuAs3errPNW10EDAYykPH5V9SmAAGv4dzm0=;
	h=From:To:Cc:Subject:Date:From;
	b=jZ2MD6ZO/vmL+VFDrhvd4vyST4HgnoTGRiiy1tOioOemCoegTA40wYQ1Wgz4dLcLu
	 YcibPkKH/lu4iLG2UpeIzpVIFS81pT8q+z/50Gun/FRuZIBr8a5DpCX4KAiRUqCqKy
	 NzC8oh+ShLgkdwsr2/ByoqzTaEaQ4XkrboWJj40PVifgCDPwsjM6oY5ZMwsMDSK+4E
	 Y80HJoE2UabumFf4/E6jqqvfu9ENCYvA6BPO2ThWTHvDUf4LM4oOdEXASzfoMewSPj
	 HfoAL9HyBYpxcSJbh+S2iLSUizxOYfpBcC22gjfbeMSYRpBe71rO6vGkf5i2USar1z
	 ros8Y0eb+3SLw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: fixed-partitions: Fix "compression" typo
Date: Wed, 13 Nov 2024 16:56:31 -0600
Message-ID: <20241113225632.1783241-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_145640_482584_68B0D1FF 
X-CRM114-Status: UNSURE (   9.13  )
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

The example erroneously has "compress" property rather than the
documented "compression" property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 058253d6d889..62086366837c 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -82,7 +82,7 @@ examples:
 
         uimage@100000 {
             reg = <0x0100000 0x200000>;
-            compress = "lzma";
+            compression = "lzma";
         };
     };
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
