Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC0C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQO3P/6L1xjGvtidUUaA4XT77ihkCTBY95Q+d99w2QM=; b=3jI8qNfVkXTHXn
	6QI/nv4ZNf4e4Rr3fSLd5bo3oP7He89XgavNyD/r5K3GMGSajsuIwHS1XPV74S/B4cnJYwQA9HDgJ
	do4rm44HfNGfId3NUrvjd544mcrkfDWSjRchz9BcvcPA6palItUJEZB6H2WKJA4q9dH7bHshhZz7r
	WMi5DNLWPLI8YYiGciaZNuD/Axy1P8+J8QmN81jfyLDj6xUuwEsrmigaz4qKSMfI+pS0bBDFw84fN
	UG0H2H6ABXe61haJ0tbIVVIK3fczXQiOSXQVYvkySyYWUiAcNAPFyS9zVEK6mY8PyV1kWXkhbje/Z
	lZHxB8IQxUVk5LYbkpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCJV-00000004RaF-10D9;
	Thu, 07 Mar 2024 11:53:29 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCJR-00000004RXl-2Cp8
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 11:53:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA4FDE0003;
	Thu,  7 Mar 2024 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709812403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGGLMZ44sbGATqaNaoJDLEYsKIQLQdTzH6ZfveCqmGY=;
	b=Nu4ZoBuWsqaK7DokOWSYwb7LGF6h6lKlAgDh2HTD86EH7Om3DrUT7O5LLHldXJKb/vqXzF
	ov+50gtZYoczTYvNiZacRp8jnkMNJRPx/y9l5nq5kAd0WzKb+Ld9r3nRdrpmbgq8woVQja
	4uE5Ow+22qXyajvGZbxdIihsg5/g0Pock6ci2nNxgPvXeICG6YxwTFRy/G2+kYzedd/yil
	h0ftWaF+ypY/hxSm9BOuRpBd6weHOZGEmKsrIjx+MYgE+pRFRvgozDgRsO7tBbTV1VfhEu
	cdO9uJB+nRzSma3b5dabY3/jLwGSYypNVEN+KKfvp7SAUpyvQHKxsHjka9LfzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: rawnand: Ensure continuous reads are well disabled
Date: Thu,  7 Mar 2024 12:53:15 +0100
Message-Id: <20240307115315.1942678-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240307115315.1942678-1-miquel.raynal@bootlin.com>
References: <20240307115315.1942678-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_035325_858533_D00E3A66 
X-CRM114-Status: GOOD (  10.79  )
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

The cont_read.ongoing flag should only be enabled at the beginning of a
read operation, and also disabled at its end, so we never end up
triggering nasty side effects outside of this scope. The mtd core being
highly serialized, we should not be bothered by parallel accesses
anyway.

In case we reach the end of a read operation and the boolean was not
properly disabled, it's a bug, but it's totally manageable. So warn, and
then fix the boolean state.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2479fa98f991..d7dbbd469b89 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3728,6 +3728,9 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	}
 	nand_deselect_target(chip);
 
+	if (WARN_ON_ONCE(chip->cont_read.ongoing))
+		chip->cont_read.ongoing = false;
+
 	ops->retlen = ops->len - (size_t) readlen;
 	if (oob)
 		ops->oobretlen = ops->ooblen - oobreadlen;
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
