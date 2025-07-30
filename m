Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1553AC87FCB
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 19:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yekMGynCLhWwzCK+zYoikZ+30mhFaCPUn5jN/9PkxNo=; b=KzMQ5uRzjs8qyP
	n8qEvh0qusfv3J8Wx4GTAS4cNKTIRP21R7kf+W8SUBeUymOVoOZcB0TYVpmfE5PYXhEVjsCrperbT
	EmHYgwDZBknYCnPG9lkG2l4Yp/98+07MbQxpmlEHa5VOICKnn4zf9LxZsxsl/CVmWcm/CuviA+9+5
	DT4aEAL7NeTlGQ3emCL2b5DQk3h945Afj7zqXbNbszQsqfMUu4nWOE9vMenVjRhgDAkgmVpyQQaMk
	rI8fGaFEQ8RIUgApysRmfjt6xyeyyc+7KpWB2w+ZI167lRK0XMXg+fSNDw7BOV9BXqibYIqGu/0s1
	Xqjjh61yQO9UZIEJzN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCmS-00000002J1E-3hcR;
	Wed, 30 Jul 2025 19:48:04 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCmQ-00000002J0W-2Wcu;
	Wed, 30 Jul 2025 19:48:04 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id hCmHu9fPBsl3lhCmHuCkHa; Wed, 30 Jul 2025 21:47:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753904877;
	bh=S8vcU+qlyvgic/IsK7WROuRtOUR18FvRKrLARPKltNk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Z3w+Ybc635EoBM2qQeo4lmiMQozrgmQluSGV5HEJ/q+765q/Y1h38zD8gQRTtEtDi
	 zqb3VwIyVYSphJ9dXMbYpWR5znReF3TxgBjPYr1aXILW77pkGN8UK+AByzjTgWVKp1
	 2DVBxamqAH0yg/Ur5zomCRCsqbtM7n7vNks8q9oi3sGokNo0bFW67NoaK0GGp7d0Qz
	 ixAvy5sX86OfxxEPYGkwlSFrKLko2KDe013lctPsfTXYgxggSf3EfyU6YncChAoz83
	 a3cnyqw0ovRdSSEO611YoyamSFQyytFwV5IHm1fxMLt3mMrDg2UW28FMqKeuNxu89+
	 Jlp9SB3XfZtlA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 30 Jul 2025 21:47:57 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: rawnand: nuvoton: Fix an error handling path in ma35_nand_chips_init()
Date: Wed, 30 Jul 2025 21:47:46 +0200
Message-ID: <a2a4ca2010ac4aa2aee0bec151d2e57e812510a0.1753904852.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_124802_770682_EDC410A3 
X-CRM114-Status: GOOD (  12.27  )
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

If a ma35_nand_chip_init() call fails, then a reference to 'nand_np' still
needs to be released.

Use for_each_child_of_node_scoped() to fix the issue.

Fixes: 5abb5d414d55 ("mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index c23b537948d5..1a285cd8fad6 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -935,10 +935,10 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 
 static int ma35_nand_chips_init(struct device *dev, struct ma35_nand_info *nand)
 {
-	struct device_node *np = dev->of_node, *nand_np;
+	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node(np, nand_np) {
+	for_each_child_of_node_scoped(np, nand_np) {
 		ret = ma35_nand_chip_init(dev, nand, nand_np);
 		if (ret) {
 			ma35_chips_cleanup(nand);
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
