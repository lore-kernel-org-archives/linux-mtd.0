Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C3DC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 09:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA032065F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 09:00:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iIK7BlAd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA032065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4yER9cmcNN4LXQBDXDNHdT6J6zUYe+pURptS6oEzsm8=; b=iIK7BlAdh0YRl0
	NuTALLyLKc35vOGM+7NkFFV27HDGltNdUn2ZvvQTgUzygcwkZyfmSGJPEVw6j4jY2DAW3gvSoo28b
	QssCyzVzWcYMziQEGLMQf+wVrX/NOsU6d2SIhYApaGSzyIzkVoiRph5wKMH1+6bHGr1+nwGmy6XUD
	bYgD2xQ6SCxy67XD1SLK61XCNwZp5sjyuQLxCj6P6I3BEYCOfvzb2LaGCwBI/Hx1JWCCCDG047QJn
	coTE/yVRfZ//pH1jaGoifSHxTUYak+Dv1VzOpWqWjlsqk8mwU9PqkA6xoji9HawGbjDENmZ8/wW0I
	BfXVEzzDnRZEUUO6iYRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkkyL-0003Jq-Su; Mon, 15 Jun 2020 09:00:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkky7-0002um-0d
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 08:59:52 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1B37720008;
 Mon, 15 Jun 2020 08:59:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/2] mtd: rawnand: qcom: set BAM mode only if not set
 already
Date: Mon, 15 Jun 2020 10:59:46 +0200
Message-Id: <20200615085946.22390-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1591948696-16015-3-git-send-email-sivaprak@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 7c9765940d6f1835a39bba2e77d80d26d64f5dd2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_015951_210334_FA264D3C 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On Fri, 2020-06-12 at 07:58:16 UTC, Sivaprakash Murugesan wrote:
> BAM is DMA controller on QCOM ipq platforms, BAM mode on NAND driver
> is set by writing BAM_MODE_EN bit on NAND_CTRL register.
> 
> NAND_CTRL is an operational register and in BAM mode operational
> registers are read only.
> 
> So, before enabling BAM mode by writing the NAND_CTRL register, check
> if BAM mode was already enabled by the bootloader, and enable BAM mode
> only if it is not enabled already.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
