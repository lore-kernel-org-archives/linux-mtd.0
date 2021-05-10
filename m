Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DDAC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:09:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59924613CD
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59924613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MAjT4B85aJFtd1y1FDcnxyUFzgGiASibOiKw9lmboCc=; b=dzQYjWrM210iL+8ojErki8Eju
	F2NHkxqr4+v7XVC3rb63i8KaHQa3oj8lJeu+OM244v/H612Bv+1Xxv5lqRfnzdKo9gRoOuDs8kPp6
	VzOKl8G4egxHzGuftFBQ0NYYDw3SaAlGQK88Fb8zg1DEs1HzUltljcInHD+s5urDRCNh1wVTBTedp
	KQqttSVpPOjP2PuatZuLUExrtGQwaT+duiMCHR++yp/AVvSpaI6slov2Lu1rgVEsgmuC0JOMqlPwQ
	jciSle7rGzkV+KYfvqWfMDE95bX+9aTPwpTzi8DzAYogGNo7CrVmgl/ReoPUdfx9d4bjC3rnpa4HN
	wTyrUdoWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2qY-00Dsdp-U0; Mon, 10 May 2021 10:09:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2kD-00DrHb-9D
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bm2dF92OX97dkax9sjQz41HztJa9c6l1LKn5OeGT7wI=; b=1vwriPp12O95jPq6vo/E2oRMlL
 gZMhLm6ffpVitSXgv8Ni6uK3fC6HGTOGItHhGK95IZfX+EAZ8YfVXgU8/XcEuOb/2RaNq3HPG5Dt4
 r9biUu7cE9L/wozCiikT/eSDAB8wev341wGXpWpu3V02D81qx1BKnsc2M72waUra0bze4Tnd3fgb5
 oD8CzCwNmVuCCPeeNK6Yi4KmLdaiXiHVZrlUecTA7hn+YiHRdjcuXqplmXFRFZu1ZlITFKCueegb1
 WkI3ND5ANyEPMtR1cnKs80+CRoA8PzQudFmonziB4U98/BmBo4F8IHqYW4UTbRtx1gX8mh+ze5J1b
 Rkxax/HA==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2kA-008VPk-E6
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:02:31 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 58C8A240007;
 Mon, 10 May 2021 10:02:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Baruch Siach <baruch@tkos.co.il>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: qcom_nandc: allow override of partition parser
Date: Mon, 10 May 2021 12:02:27 +0200
Message-Id: <20210510100227.6801-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cf470f05af514acd5bd94548804ffa96b966a0a8.1619029869.git.baruch@tkos.co.il>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'21020becdf0ce946d3fc2c4bf4da33453affcd5a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_030230_629070_3C348F20 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2021-04-21 at 18:31:09 UTC, Baruch Siach wrote:
> Commit 82bfd11f1b03 ("mtd: rawnand: qcom: Add support for Qcom SMEM
> parser") made qcomsmem the only parser for qcom_nandc partitions. This
> might be problematic for systems with both SPI and NAND MTD devices.
> When booting from SPI flash the partition table should not apply to the
> NAND flash.
> 
> Prepend cmdlinepart and ofpart parsers to allow override of the
> partition parser.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
