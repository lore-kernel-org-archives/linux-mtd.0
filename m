Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C41C10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+6XzzXrBnFP+zOG1eDYN9DsZ7H21qgGdYeWWjp/wZ4=; b=duehNiDY994ZlL
	+dQICQLQl00Kp7Gs4aKI/mEZn6HkuUxCKGkbnddn5EyVESGE5hXCLYkwOgK4rbEXx93FNDibvV//g
	syyuxbORfTE79VkXbIONjmysHlwgEJaCli5rZazLCFWqFSQmV3y4t03nPE63HgkYSekX5A9nvCCtG
	fm6iDqton9dc5KkH7f4vw4hAwDAl5h19d+RetCv4dtJKFl4UalfA6jYphEwoUoSWMEVhSSIvPxetD
	hUVTNuJqQxYSSu07KC/T+mG1JiP8qQYB7x6vG39t/cEZ4BICwJrgAadu+fkcq6z2TQVIsCNE5kqm0
	qYjQKxS3JpNCF+6chFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NKG-0000000Brs3-2dss;
	Tue, 07 May 2024 16:05:56 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4NKB-0000000Brp4-2tOK
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 16:05:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F253C000A;
	Tue,  7 May 2024 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715097949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUiREoZxMWf/CCR7ayPhlx2AOXCj5xYQ5c1EZwZhtqM=;
	b=a21jvZOqr53j9NlFYWqWL3JNKEg5NbdDXImcCwTIPhKPmzeU/9j0M5+uKnyMtsxRkCIbjy
	vjRFBGD672Ipha/BviPj9gI7UmyWcw87Mt8z28rxfTwzIFsOst47084t0kgtgLxOQpEX13
	cZJWcOL5xDG3BACvLs+An9PuB5RHB6DumlzAmHNQ1IY3IR1dicSFR2pQyHqFxY+BwDdAP8
	izl5RUs8XHoMtuiqE1GypYTPTfRuJr8PZV9rTvZvu4L91E347kcfeYpj1/d/3GQ8Lu623H
	HdstrnyaA0kObOvdbM7rPVkFZlJ4Duw1c4p+ohh6dx4t+xS6dIQ8p89SCy3TgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org,
	Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>
Subject: [PATCH 1/2] mtd: rawnand: Fix the nand_read_data_op() early check
Date: Tue,  7 May 2024 18:05:45 +0200
Message-Id: <20240507160546.130255-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507160546.130255-1-miquel.raynal@bootlin.com>
References: <20240507160546.130255-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_090552_148079_F89E4D73 
X-CRM114-Status: GOOD (  15.10  )
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

The nand_read_data_op() operation, which only consists in DATA_IN
cycles, is sadly not supported by all controllers despite being very
basic. The core, for some time, supposed all drivers would support
it. An improvement to this situation for supporting more constrained
controller added a check to verify if the operation was supported before
attempting it by running the function with the check_only boolean set
first, and then possibly falling back to another (possibly slightly less
optimized) alternative.

An even newer addition moved that check very early and probe time, in
order to perform the check only once. The content of the operation was
not so important, as long as the controller driver would tell whether
such operation on the NAND bus would be possible or not. In practice, no
buffer was provided (no fake buffer or whatever) as it is anyway not
relevant for the "check_only" condition. Unfortunately, early in the
function, there is an if statement verifying that the input parameters
are right for normal use, making the early check always unsuccessful.

Fixes: 9f820fc0651c ("mtd: rawnand: Check the data only read pattern only once")
Cc: stable@vger.kernel.org
Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-mtd/20240306-shaky-bunion-d28b65ea97d7@thorsis.com/
Reported-by: Steven Seeger <steven.seeger@flightsystems.net>
Closes: https://lore.kernel.org/linux-mtd/DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com/
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index acd137dd0957..248e654ecefd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2173,7 +2173,7 @@ EXPORT_SYMBOL_GPL(nand_reset_op);
 int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
 		      bool force_8bit, bool check_only)
 {
-	if (!len || !buf)
+	if (!len || (!check_only && !buf))
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
