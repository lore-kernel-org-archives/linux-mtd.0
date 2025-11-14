Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B178BCE8D6B
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze4oQiRPpBtGTOHeac7W79z3ZSflRWc8/6qz8wm4YVk=; b=Q+/E2b1eOzsWIz
	VncrWC1uNn6T9lBqCzBz9652vBOGaETj8yGuLIP6YPg1gripqN4lkfq0w10VPomC2iNbzirSQPQDO
	sPJFe1/iRr9NLBNIuoKJDMyV4wge0KiBM5B2gdfao9/35nT2QNvSc/u/HsC71ye1ziYLjlK7HIRy5
	EL4mcj10ArUXuCHGPzxHckkAnPanUjKD9F8jal8bk02rsIbdXgP8tZn7A6WI7tjNb5BHVjyoVbYSu
	DIPgAI9eMNUWAM2N23+UgNExxurxuVCkJ12uZ3/A8E0fe5tcHKBVtjeuez8gxN8GR8gcZFSkB2kuK
	C4erBweYUG3s25dON77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzF-0000000CsxF-1FXK;
	Fri, 14 Nov 2025 17:53:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzC-0000000Csvx-0ODH
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B3E281A1AAD;
	Fri, 14 Nov 2025 17:53:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C2EA6060E;
	Fri, 14 Nov 2025 17:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 287D210371990;
	Fri, 14 Nov 2025 18:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dIy19QMyJg/t0zE0eK24iAdi5JYPA0ElfHJvGBWV4ak=;
	b=LboCQ7ctkFsiaLjIrbN8cnPs8lGodCwOWMgokhv6iPB+BicGFS+lBVQGTrQdxbVteGwkDV
	QnnK51A3jK2Eu96RECQDh91xJtYIv2m+NP2v0vyiuYUHsiJpK3jTS3l94WzXUwJbDUMVAZ
	36Pkt043nFxaMiEltoEyjTMrToB3PMmXP3q59oKAM99PsNkwKbIzlxBH2+rvdwAX+jHU3G
	RLSZvmZCnfmYPzJGCwiW2OC0UzJbu6y8RGfRZ/DXlhqRvCS+MtQKptU6PCMPAXfAbz7r+e
	Hw5mpf/QypVANP6bzj3LMf92SR9G18pNyHgvih5kbKASI60Nn8rzU5a0DGUyhA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:03 +0100
Subject: [PATCH 02/19] mtd: spi-nor: swp: Improve locking user experience
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095326_272946_203A3D87 
X-CRM114-Status: GOOD (  15.44  )
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

In the case of a single block being locked, if the user want to fully
unlock the device it has two possibilities:
- either it asks to unlock the entire device, and this works;
- or it asks to unlock just the blocks that are currently locked, which
fails.

It fails because the conditions "can_be_top" and "can_be_bottom" are
true. Indeed, in this case, we unlock everything, to the TB bit does not
matter. However in the current implementation, use_top would be true (as
this is the favourite option) and lock_len, which in practice should be
reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
a positive number. This is wrong.

An easy way is to simply add an extra condition. In the unlock() path,
if we can achieve the results from both sides, it means we unlock
everything and lock_len must simply be 0.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
For me, this result was clearly unexpected, but I am not sure this
qualifies as a fix.
---
 drivers/mtd/spi-nor/swp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9b07f83aeac76dce2109f90dfa1534c9bd93330d..9bc5a356444665ad8824e9e12d679fd551b3e67d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -281,7 +281,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	use_top = can_be_top;
 
 	/* lock_len: length of region that should remain locked */
-	if (use_top)
+	if (can_be_top && can_be_bottom)
+		lock_len = 0;
+	else if (use_top)
 		lock_len = nor->params->size - (ofs + len);
 	else
 		lock_len = ofs;

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
