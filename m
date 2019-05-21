Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81BCC04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B828621479
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gENBhZ5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B828621479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UXh3hAl3nhVyqiXTggfP7poC7zKxSBdlnB4+hDdTEs=; b=gENBhZ5Inje6EB
	AmTeFhMfkEJYspAbB0KYHSAEzsclzlEAFvgsILYyHOuG1DvK8A4sSPKO0oRY3mPC1deA1uup2Rx1v
	2kQSYT/YDdPAd/SfY72jcCchX51HFdaVBOh6qOts34psPENtJmN1bzyYA/Rf8F6vSNmySj+rRm4jn
	2AcRSm87lnNwsjHp8VWJRyqpVgTfKtIgOIeu1HsA0bTHbRfaSfJnbdN7MuCdyN8FJMI8PQtrmr0L/
	+YNaFyCgzKUFAepl3utxW4zRJglXNdcaJ151wKkEyZ0Os3FN70t/9askIjNUStd4bRrwUUQRQXb+c
	HkplXuTwWmgvR7+gZVrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT1G2-0001qh-58; Tue, 21 May 2019 09:40:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT1Fz-0001oD-Dh
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 09:40:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9F95427E953;
 Tue, 21 May 2019 10:40:25 +0100 (BST)
Date: Tue, 21 May 2019 11:40:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: initialize ntargets with maxchips
Message-ID: <20190521114022.2c3bbc77@collabora.com>
In-Reply-To: <20190521090417.7883-1-miquel.raynal@bootlin.com>
References: <20190521084335.15026-1-s.hauer@pengutronix.de>
 <20190521090417.7883-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_024027_597982_7CB37569 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 May 2019 11:04:17 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> On Tue, 2019-05-21 at 08:43:35 UTC, Sascha Hauer wrote:
> > memorg->ntargets is initialized with '1'. It should be initialized with
> > the maxchips argument from nand_scan() instead. Otherwise multi chip
> > support errors out on the secondary chip selects when trying to call
> > nand_reset() on them:
> > 
> > WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/internals.h:114
> > nand_reset_op+0x194/0x1c4
> > 
> > With this memorg->ntargets is initialized with the maximum number of
> > chip selects supported by the driver. After having detected the number
> > of actually connected chips memory->ntargets is updated with that
> > number.
> > 
> > Fixes: 32813e288414 ("mtd: rawnand: Get rid of chip->numchips")
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Are you sure it's mtd/next? I'd expect it to be queued in mtd/fixes not
mtd/next.

> 
> Miquel


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
