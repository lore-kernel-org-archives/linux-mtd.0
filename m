Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88BACD5BB1
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7UsUBfwyfgPuTQiXycHo1vK/Bq6BN2fRawDWkT8AVM=; b=J6MLtmdet7Ae03
	DIsuXNKOCKVaU+d0ZgtZxjyc81sgtxntMeXh4Sl9KfhUW4N3eyoue/dNw04W3XmaTbjiSx8lmc3z/
	fS84b4UV44LUki+kWJqzMs4Rs+8a1EkZzvYfH0sBoevh/Ih22WDguk9jNSTCKCV4WzLuSp4FLDho0
	BBnrAc0CtgyajtWp3bpBj6o3rjKQoEyijwlfK9STjoQXWHb7c1DAXg+6wubrc7qqG39NBsTrRaN0P
	KqVcQqetnC2SXJXYoNF098A3jtzSUilj7oz8yv8MnI9XgmNgJZynVPhcwyrObR6FVf4gRM+Zu572+
	ZivLHxtjrofzP7eKdnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDQ-00000002FUY-00Nj;
	Tue, 26 May 2026 14:57:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDN-00000002FRc-439N
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 94F6C1A363F;
	Tue, 26 May 2026 14:57:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64C3C6073E;
	Tue, 26 May 2026 14:57:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8A22108888D5;
	Tue, 26 May 2026 16:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6W7hkrB9Ol3hQ/s59VqFJffbxfuvvEc6vOXwL3BRK50=;
	b=TYFWBBrgBtB3JeLDOHyxu7jzI2Pdr2hO6M52WaznlBaq4tJXvzdFcIiLTif/Sznd4oakEV
	VpkYtaLKqAE44/SewR4guIZ+ajxVGZB+0d/wwW+8Bb7MsJa8AOZAWGrkP0Bg0OJuM400Qg
	N0LVLywE3tEMM3ERa3GCv9gsqEuBzVTDVgdH44f9WrJzl1xL2gYAeCs9OFI8pBrLY2+Ip/
	P/p42GgeOvusFO/6MZlhGlslG8HYSo8dV89ugZTFSFLZRpPyhVYucOP3BxbbMvm4IuSy1r
	sS+NQXwrJ9zyhgQsFsKP85zDPH31qFIXVEK6LXNZ3/Stm5a4dzj33L95OSfFYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:33 +0200
Subject: [PATCH v6 09/28] mtd: spi-nor: swp: Clarify a comment
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-9-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075706_452122_6DDDF740 
X-CRM114-Status: GOOD (  11.42  )
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
index d5f4bf555cfc..f221d6361b57 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -305,7 +305,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
