Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C3E85371
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP7osXsYpIb/ggkIJvAPmNDHFM/pw64DBK9822qriWs=; b=3Ntiq8hCCzZTJD
	WmBFpQoohtsTg44xMkIcgG4PoThHBFYu3MlOjgiXnbaT2rp625EJfdEp9VW8JO4dEvBTjdj6+WR6V
	DsAku5TAhYcsZwO0uh7yiLSPoaZg2+Am/U081zL3wlECujbTXe4Cewi/pOPMYK9Ti/zDt1DtVY0x6
	S8ziuYBEYEUgxrMBtuLlymiHXoTfzOjz6nET1LJ2pf96Dn94FvrSMwHW5Ev/bQlUdxbKieFmK4rKv
	IDDp2H0GqWbGjbn8aPM1SBQBXUmIqYDSEKY/YpMRBS/UsJHP0Hv2JsRXqmBHsF89dIpsQaczMBR9V
	M2yT+El86fDW94QBuLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5r-00000002GwD-1iRu;
	Fri, 03 Apr 2026 16:09:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5p-00000002GsX-48Sn
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=380DMxOtkVf4S8j1lpaF5rnIUMKJfHDNDSHsb4bomqI=; b=qbJFdaGRYjQWLB21hN3p2JM6gz
	3pSxlGgrr47lO17u2H+Q5b5lHvfdJausmo0WDzuI6HEyu7iUJhjpqQwEdVrCztHjg0RsXF67Fd9ZK
	tlkIf1NNjmShufO+1Lcve/STHoghQrq+JnwOMeFsr5P/v14tsBbT0gBEOa9g5amdZ1LW+iQ7cwdFD
	xkyn1uIIt91mS10zjdYj6a/6iDbb4fJrT3Xm0T/EQKSGKP+mr7N1CVIP1f5Cn8aLVuBG5T8WUpzlJ
	2//nRHSDyBFkyGo2oCRYMQKElOyLQgVpVjZBhlKtyIgq69KC32U7b+BF72JagSIrsRD2/Q3tMruHB
	wHgYfO1g==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5l-00000004OKB-0MCN
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:09:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ABBBDC59F65;
	Fri,  3 Apr 2026 16:10:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC2C2603C1;
	Fri,  3 Apr 2026 16:09:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07CE010450109;
	Fri,  3 Apr 2026 18:09:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=380DMxOtkVf4S8j1lpaF5rnIUMKJfHDNDSHsb4bomqI=;
	b=mk8QuibAk95VamgZNE+FL3M989pwdgmWpqW4LMiT+KCNbITz2GPesT6IeR31Px2Vl9dy3A
	pnp2GYNhrn6fVGfxksGFmKjufllajN9DVXXN7nh4C46w+RjLRtPO+Pv2s+k7Mfesi0UkwG
	7H4XojzYgaFAmnjh4dX8guOXXPBP5/lY2wS3xH+BppNNwH9Jg4MNEScIIA51GQJCqaHl/j
	u98bo7CJrqMFr2gEtZoqeO/vjiI1uNZAkXTgVFlAtlEMbqDmzJiK3AkmNudydq9oxjkz5H
	kNKmRjYRIf5GJS4upyXfmnHQyyHSxbjgVuhKsSA9CRRK54/OCqTHYYebCZD2zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:24 +0200
Subject: [PATCH v4 06/27] mtd: spi-nor: debugfs: Enhance output
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-6-833dab5e7288@bootlin.com>
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
X-CRM114-CacheID: sfid-20260403_170954_181325_75641642 
X-CRM114-Status: GOOD (  10.30  )
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

Align the number of dashes to the bigger column width (the title in this
case) to make the output more pleasant and aligned with what is done
in the "params" file output.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 69830ad43990..d0191eb9f879 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
-	seq_puts(s, " ------------------+------------+----------\n");
+	seq_puts(s, " ------------------+------------+---------\n");
 	for (i = 0; i < erase_map->n_regions; i++) {
 		u64 start = region[i].offset;
 		u64 end = start + region[i].size - 1;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
