Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92046C54798
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Feb 2024 01:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=on4iRchaLcXXB8oj9D/UPaKJtto5hTyZZOivsz/tZ5k=; b=GAVzHUmn9Jt5LH
	2FBVnt+OPiCYqbIcbT1MZ8U7ALRiZhgR+yrnLVLdsziUGRtDtazAOp4C0aw0uO1vUyKaWf/jRz6Lv
	Jv7G6xMJ2a2749bot3UBq3y9Rck3bM2vr/fsrovAOVoMADlG24Cczcqs88Feb98DY+nFnkxuiugzd
	q6BnFgMSRww4JxAXHYvc05UU+9WQnTSIqcHzBHQ/3Qpf9CCjq4XP93rTAOLwhNi0C/kvCz0S/dj6x
	9WJALR6bM+o1+JwmbEtpnvWkKhDV8FplkzU6aMN/knVrgG7JVzrG4CbuN1No1yOhMLGXfI8Q7V5LM
	wV6Pl48Qrs35nTrLI6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdh7l-0000000Bp1Z-1rEk;
	Sat, 24 Feb 2024 01:46:45 +0000
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdh7g-0000000Bp1H-2IfP;
	Sat, 24 Feb 2024 01:46:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: hynix: remove @nand_technology kernel-doc description
Date: Fri, 23 Feb 2024 17:46:39 -0800
Message-ID: <20240224014639.16145-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
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

Remove the extraneous kernel-doc description for @nand_technology to
eliminate a kernel-doc warning:

nand_hynix.c:39: warning: Excess struct member 'nand_technology' description in 'hynix_nand'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/raw/nand_hynix.c |    1 -
 1 file changed, 1 deletion(-)

diff -- a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -31,7 +31,6 @@ struct hynix_read_retry {
 
 /**
  * struct hynix_nand - private Hynix NAND struct
- * @nand_technology: manufacturing process expressed in picometer
  * @read_retry: read-retry information
  */
 struct hynix_nand {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
