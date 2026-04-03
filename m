Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B837E85371
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/rj28kWFrVzjSNJpCyYu1oHZQgIhujnZpiCt8McUc8=; b=CUgZ8pT3oA4Qch
	u8rgwkjJZuPSjL5TjmUEHSJyeYsZggSY/fGw44bQX02ja7LX8pHiFNejaJi22Z3JByhju+b2qEDgW
	1zGpaaJqntzEqgrkgrOcQo+ocnctSlc9iMGcY+UkCOhCS/9A9Jj4/a0/DctYvo58+Lxfk+hoDoW/c
	4Af7ez6RCd7wEfSQfjG1WaTVu5MYwDLzWGOCYogsBbpANn6zv4i4Tp6ir1XkC60vLD9YhBwVlXmig
	+PyXFR7Lf7wEgZugNPGf+pOKHLw6SGQZDeoEQPMioYMDxeYo84hhi5sBWRGN6jZIu4QXOfBVR++5C
	nW+gLCB9o/0hjPcoympA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5x-00000002H4q-2NoL;
	Fri, 03 Apr 2026 16:10:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5u-00000002Gyl-1QH4
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mfKlFM5DiGOhHJ1K9VJE1K/I5oWuny30sbh2IlUETAU=; b=I5isBpepGIVR404heLdUHUXwua
	a1t5VFtGybkpj1JKeQJ1SqgkPjKsxqBtt8s/nmJQbbmy0Y7jXyW/HjA1lU1TYRg3jc/zrG+La0QcK
	9sx1db0Cc+tF5p8OeaU5ODZc/ASeZ259mfrb1LVeWmukDncMDyS1LL4Z48UMh5LfGg4RnW1mvVCet
	ptD6AJwQZzGAB69JW20t7rl5t1CCfqLsnmdsuFVNBKIsu24J40hTDJ+nFIQKI4DLCpZDV3o1nF+0X
	0lbSsBFO9Hrpqsd/bEUoVuMgnMAWVAmM7HmcqiRJfsnXtsC4w+mY0Rt4jXfKWFFbLGBIKNs2Wucj5
	ggD9R9NQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5o-00000004OLR-2ZuZ
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:09:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 961251A312D;
	Fri,  3 Apr 2026 16:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BC1E603C1;
	Fri,  3 Apr 2026 16:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B386D1045010A;
	Fri,  3 Apr 2026 18:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mfKlFM5DiGOhHJ1K9VJE1K/I5oWuny30sbh2IlUETAU=;
	b=Ki2kEhL/JO8VidYg5ks4h+IeDSHZzT9+wxi83xrg35C40ExITmee9IgiLmAf5swMwKDIk2
	YgaJr9DmYluzBhOGeDEshGusZOsZ08M9r8HEwlB9tExHg2A7I+lRKovZQ3iP6qLEhiRKyQ
	/M4eM0aOF09QKuuEN6ylnJv6yI0oQaMa73kWQ6HSxgk3MH1nmpU0SpTQK1OzmKpvg5dLZg
	1fOk9tpGL6FbmdDNv7p2SO3+wXqTy0n2+bHfD2LXZtEUSvhGcWsr3jFbxCV8QapX6yV7vv
	064CLCEQImJMy53DRqpjgJ2os6g5D7KTdkkX0R2GbVTJTnjXDFYb+qgPYkxi6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:26 +0200
Subject: [PATCH v4 08/27] mtd: spi-nor: swp: Clarify a comment
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-8-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_170956_777451_CDEAC435 
X-CRM114-Status: GOOD (  10.59  )
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

The comment states that some power of two sizes are not supported. This
is very device dependent (based on the size), so modulate a bit the
sentence to make it more accurate.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 64a917543928..246f6d5ca8dd 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -303,7 +303,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		/* Some power-of-two sizes are not supported */
+		/* Some power-of-two sizes may not be supported */
 		if (val & ~mask)
 			return -EINVAL;
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
