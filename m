Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA53C4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 20:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4FF20855
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 20:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GdF2Rv7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C4FF20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhrDE6g6xf/gkKY6u9VgJUIhVMmOHCPMSAc/3frifQg=; b=GdF2Rv7PXovzm5
	w81UMmdANlseb5ssjiGrZZYFvgEUBkf9623GVZ16S0Vsy6v37pqTeR9zZmPF2Rg+3sD++mOcO262b
	3257HzkSChuLnnKkgHLM9bYhMGUPi8Sl40BBTjmsC+BHqIF1/b2lgIAr73NP+5hU+HGDARR7hbxKb
	f0r1TRm3r7e54NlQoGUevzGPLxGNmbk3CGLepfIcEs+2ytxoqjllLy3RYfJpAFD2NyZOG3g07VdG9
	CW8uhjhCSsQJMmu2IgrtWRBaqpiY7/l6K8n1mo0Pzgh1AcOQJeDtLEyQVBlcfX2+Di9NDTUi0HYSA
	5B9Qp3ILwJPwau3VbmsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC8dV-0006iR-TJ; Thu, 04 Apr 2019 20:06:57 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC8dQ-0006i5-Fe
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 20:06:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 344F86091849;
 Thu,  4 Apr 2019 22:06:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AcDhIPcZsz1g; Thu,  4 Apr 2019 22:06:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EB3F6609185A;
 Thu,  4 Apr 2019 22:06:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ROGwAdH3wMXh; Thu,  4 Apr 2019 22:06:50 +0200 (CEST)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id ADF886091849;
 Thu,  4 Apr 2019 22:06:50 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] ubifs: Do not skip hash checking in data nodes
Date: Thu, 04 Apr 2019 22:06:50 +0200
Message-ID: <2388716.Aa7BLnGvdY@blindfold>
In-Reply-To: <20190401130044.19811-1-s.hauer@pengutronix.de>
References: <20190401130044.19811-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_130655_156508_023CC71D 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Montag, 1. April 2019, 15:00:44 CEST schrieb Sascha Hauer:
> UBIFS bails out early from try_read_node() when it doesn't have to check
> the CRC. Still the node hash has to be checked, otherwise wrong data
> could be sneaked into the FS. Fix this by not bailing out early and
> always checking the node hash.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Good catch!

I think we need another UBIFS self-check to catch such issues.
How about adding a marker to each in-memory node/page up on checking?
That way a self-check can walk UBIFS in-memory data structures and check
whether everything has the marker set. If not, we found a bug in the auth
code.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
