Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B51C02192
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2025 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xHku1Gzqpi6kKa/Bm4Gi8bLoPdFX+6s4K8Ms9Ui04Zc=; b=Dqu4gNd7ISzzrd
	YuEEAx0HYQiZN0juZU48FNqNiEln9H9gqs21+ccv65WN5cLSS2gZIyxxJlW5VNkRVO5KovUOehD0W
	YUv5aBPMSEMb+5IQqQ9eI5c04E3Did2Y+D/A3rEs4PT9OFuxG9QotRAFsio503zZjdGl4W3mrSvdv
	0KUpVlRsdnaiKi/AF5ErIIFHyS2ZvxlW3PYhnSQBQ6vrYK06xjozjqJnwRpwxSLAJLSWpxkyNpzpV
	QTQ/ATNrhZLvTQepzhTtU2J2w3kfVtUkYg+0Z6cRyenP+pSR5PkZWK/WY2sqdcp8YrMrJqU1+z8I0
	I7IKj6sHt7oZkhY/nJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf49j-0000000Ggnb-34XR;
	Mon, 03 Feb 2025 21:38:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf41n-0000000GfQK-3yh6
	for linux-mtd@lists.infradead.org;
	Mon, 03 Feb 2025 21:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9833A5C6898;
	Mon,  3 Feb 2025 21:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A9CC4CED2;
	Mon,  3 Feb 2025 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618247;
	bh=w/B2PvR+rOYxS9BmE/d4TKVImkrqlQOtKXqLwF4auMk=;
	h=From:To:Cc:Subject:Date:From;
	b=B+Nw3wLH4wcKtwW9y2gBt16zd3vDkmxLaqkk5Sz9rEhwOqqOC2oSFyzjjnsiF1znM
	 UwpAtxL0jCIKY3CSVgd/IyRrD4CX6douZyyuWUHdneVm8ru5SPAk0vvopmdG/VrNBb
	 UrT8xs2V6vEz2i0A8ZKqa3vWVPEKCSQq9cibY91jynn1mZtu5z3eQlZ0cvK8KoU8OE
	 dFINc9H4O4d+VVDofJUl6QZuM47ia+aEnfWBi2wVHHrh9eDPRRoiIbsvCoLkvg4yzm
	 0wMRFyLi7ChParoDW9YeUbQqkmjhDSeSlCsi8VcqAG1SB3XYnoir3gWzkFiZYf01kC
	 9/ys9u12xY5/A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: arasan,nand-controller: Ensure all properties are defined
Date: Mon,  3 Feb 2025 15:30:41 -0600
Message-ID: <20250203213042.12657-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_133048_024509_68C0B2F5 
X-CRM114-Status: UNSURE (   8.28  )
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

Device specific schemas should not allow undefined properties which is
what 'unevaluatedProperties: true' allows. Fix this constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/arasan,nand-controller.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
index 15b63bbb82a2..b90d3b48c2f2 100644
--- a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
@@ -42,7 +42,7 @@ required:
   - clock-names
   - interrupts
 
-unevaluatedProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
