Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4751CC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 14:28:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF37650AD
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 14:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF37650AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lUYKbJIyrX/odu8TLFz7tr4+BS/mvTZSdWFB7oDJB5I=; b=F8n+M3o/wD8E+wZoC8fMPdvDr
	ycO9bip5Adm8aaz232+J3cJdzixaVCTNGmGvRuHtRBD2dS+qGxU9grY799OgwUVPekwZgN+qLEB+1
	bXC0cVhRpsQtXm9RCbJe7hASAM/7UYL7V1rTv9S1MeYg22uRRfDjN3dZF300xYN1cEU0HVAjGMukS
	h7V19qqnpe3YyLheHYCucpAA2E+4RzTPYYKjiHQGdn98v4EQCzsqx0xUKQ9j3zuZio001E6L8R1no
	8s2XZOZUcumgkLJML5TpAwQYvmWPzSPoylDESQCJaw2uYnOyQnDtZlddPkjGUPn0aYEhdnXxI66ZJ
	/YxNl7CuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l825E-00024R-75; Fri, 05 Feb 2021 14:27:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l825B-00023u-TT
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 14:27:38 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l8252-0001iw-Sd; Fri, 05 Feb 2021 15:27:28 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l8252-0003U0-D2; Fri, 05 Feb 2021 15:27:28 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: nand: fix error handling in nand_prog_page_op() #2
Date: Fri,  5 Feb 2021 15:27:25 +0100
Message-Id: <20210205142725.13225-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205142725.13225-1-s.hauer@pengutronix.de>
References: <20210205142725.13225-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_092737_990311_680BCB6A 
X-CRM114-Status: GOOD (  18.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On success nand_exec_prog_page_op() returns the NAND status byte, but on
failure it returns a negative error code. nand_prog_page_op() interprets
the return value as NAND status byte without error checking.  This means
a failure in nand_exec_prog_page_op() can go through unnoticed.

The straight forward fix would be to add the missing error checking. To
clean the code a bit we can move the nand status check to
nand_prog_page_op().  This way we can get rid of the overloaded return
value from nand_exec_prog_page_op() and return a plain error code which
is less error prone.

nand_exec_prog_page_op() is only called from one other place and in this
call the 'prog' parameter is false in which case the nand status check
is skipped, so it's correct to not add the NAND status check there.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/nand_base.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d2b2a1f70fde..73d76f4a262f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1294,8 +1294,6 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 	};
 	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 	int naddrs = nand_fill_column_cycles(chip, addrs, offset_in_page);
-	int ret;
-	u8 status;
 
 	if (naddrs < 0)
 		return naddrs;
@@ -1335,15 +1333,7 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 		op.ninstrs--;
 	}
 
-	ret = nand_exec_op(chip, &op);
-	if (!prog || ret)
-		return ret;
-
-	ret = nand_status_op(chip, &status);
-	if (ret)
-		return ret;
-
-	return status;
+	return nand_exec_op(chip, &op);
 }
 
 /**
@@ -1449,7 +1439,8 @@ int nand_prog_page_op(struct nand_chip *chip, unsigned int page,
 		      unsigned int len)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int status;
+	u8 status;
+	int ret;
 
 	if (!len || !buf)
 		return -EINVAL;
@@ -1458,8 +1449,14 @@ int nand_prog_page_op(struct nand_chip *chip, unsigned int page,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-		status = nand_exec_prog_page_op(chip, page, offset_in_page, buf,
+		ret = nand_exec_prog_page_op(chip, page, offset_in_page, buf,
 						len, true);
+		if (ret)
+			return ret;
+
+		ret = nand_status_op(chip, &status);
+		if (ret)
+			return ret;
 	} else {
 		chip->legacy.cmdfunc(chip, NAND_CMD_SEQIN, offset_in_page,
 				     page);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
