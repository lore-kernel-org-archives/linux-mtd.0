Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6093310A88E0
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpecBloclOvTYwKUxRIm4yV6Kbsa0mdVf73o+tV4+SI=; b=z30TiibYPcgJ1D
	mXUxGF2lGBVQfNGUdrgVkpqsmkh7nvSa/xuMr3ENcNye+XATzGOI1q9Yv5bKIzm5lI46P6zHtQ7T4
	0uFWtNSTJxq7hHpZKzDSFu014P1msEzmInSwpq837AR3J0TOeoUImnalC0BTFrfWjqHikBQ3FEeAF
	uQT2ZeJzAsaEDjts9xCm/tRJLTJox5BMNVtk54MMtXxftasQbwNWZZRGE8W8YHYzusP8pzBsXQINt
	myia/L7Kcpjx91QTXBkXQx9FvDl6uPSDQ6jqhizWoVoTVyd3/Ma69e9+8YhgkFfW3WXfmiXKj8T0E
	e2OoGm7S4jtXd3lN2+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrv-00000005ssI-0aV7;
	Thu, 26 Mar 2026 16:47:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrp-00000005sol-0mIh
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:47:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D9E414E42811;
	Thu, 26 Mar 2026 16:47:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB10D601FA;
	Thu, 26 Mar 2026 16:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6583D10450CCF;
	Thu, 26 Mar 2026 17:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774543649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ebNUwgP/GGdkmoEPbwrY9xjw3LbvdfCwLlwmJ4VgFuQ=;
	b=QVrOi4JpUMJpUVQsP16RBS+GBel4hrhhmq83cSzANaPfLpVokx7Ajcpdkmm22BjXx1NfTB
	iyXvmEYjNe69ORbDFwDNmEvJFddySbIRXqOXC1J8WvtkKi2zZBMm3qh14KBUwmWz7i3gq/
	v/Uiv7un6B8LYLWwmm2OdeBcJamEVosTmZBPN9/HVRkOfCsoYeQywSUXiHNQn12ggePS0e
	NfkEBDGF5wxPh86ARdsp3+QbU51s8mevxR6G3Mk0/43v0aMA0OP3Kzl9VtG/f0vxgo12hW
	znlmqC8czInGrHDlq6fE4VJe8df+qQYbByw6PqU+Ti+NjKLNM3g/fsLLdCMTbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:47:15 +0100
Subject: [PATCH 1/4] spi: spi-mem: Add a no_cs_assertion capability
MIME-Version: 1.0
Message-Id: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-1-0d626e1dfb2b@bootlin.com>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Steam Lin <STLin2@winbond.com>, 
 Santhosh Kumar K <s-k6@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_094733_361108_6983B8EA 
X-CRM114-Status: GOOD (  14.00  )
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

Some controllers are 'smart', and that's a problem.

For instance, the Cadence quadspi controller is capable of deasserting
the CS automatically whenever a too long period of time without any data
to transfer elapses.

This 'feature' combined with a loaded interconnect with arbitration, a
"long" transfer may be split into smaller DMA transfers. In this case
the controller may allow itself to deassert the CS between chunks.

Deasserting the CS stops any ongoing continuous read. Reasserting it
later to continue the reading will only result in the host getting
garbage.

In this case, the host controller driver has no control over the CS
state, so we cannot reliably enable continuous reads. Flag this
limitation through a spi-mem controller capability.

The inversion in the flag name (starting with 'no_') is voluntary, in
order to avoid the need to set this flag in all controller drivers. Only
the broken controllers shall set this bit, the default being that the
controller masters its CS fully.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
I am open to suggestions regarding the naming of this flag.
---
 include/linux/spi/spi-mem.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index bd2a73d46980..de153719a08e 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -373,7 +373,10 @@ struct spi_controller_mem_ops {
  * @swap16: Supports swapping bytes on a 16 bit boundary when configured in
  *	    Octal DTR
  * @per_op_freq: Supports per operation frequency switching
- * @secondary_op_tmpl: Supports leveraging a secondary memory operation template
+ * @no_cs_assertion: The controller may automatically deassert the CS if there
+ *                   is a pause in the transfer (eg. internal bus contention or
+ *                   DMA arbitration on an interconnect). Features such as NAND
+ *                   continuous reads shall not be leveraged.
  */
 struct spi_controller_mem_caps {
 	bool dtr;
@@ -381,6 +384,7 @@ struct spi_controller_mem_caps {
 	bool swap16;
 	bool per_op_freq;
 	bool secondary_op_tmpl;
+	bool no_cs_assertion;
 };
 
 #define spi_mem_controller_is_capable(ctlr, cap)	\

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
