Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842A4C3F2D0
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520F820727
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fsUlbqWj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520F820727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Whv8zaLDHLo2dPEFrFH0/RUdNBfxic8/eDvKIz6y360=; b=fsUlbqWjWmOhT8
	e1NHRtyuZ2GPcMDgVGtBsnzN6xYl1WYHJ1sBDweBTYPBc5E8pktuntondE7rmNB1/ym98Qys8XtZf
	ZexRT/+RLGARnA17ZCpwciWfEIJEazMvMUSpdsc5PWZHFKqzcjGDwIkcCooaDr7Y5V0E+XWZRPYz8
	Tpw3YrKeuJc5Q5JDqW1z1oONhZXEbmJUyWLeEHXwEQoxseRh46a/zSZKR3yEwd1qMqeOQLdKEKpUD
	gYKG+No9k80zA8j6t8JcpNfszjVZfwjM5Dd7q5WyMwh0NAQYYb3CUFOlbZ5JP4ItbpfDXtkxQ8sO2
	q0AcMFqflit1tlh45pXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjgg-0005ry-24; Tue, 10 Mar 2020 18:33:06 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjeI-0003Zm-BP; Tue, 10 Mar 2020 18:30:39 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 323B4C0008;
 Tue, 10 Mar 2020 18:30:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, vigneshr@ti.com,
 miquel.raynal@bootlin.com, han.xu@nxp.com, richard@nod.at,
 mripard@kernel.org, wens@csie.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Subject: Re: [PATCH 6/7] mtd: rawnand: qcom: Use dma_request_chan() instead
 dma_request_slave_channel()
Date: Tue, 10 Mar 2020 19:30:33 +0100
Message-Id: <20200310183033.18183-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227123749.24064-7-peter.ujfalusi@ti.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 32dd1c38d30e0bcc717ce7071aa8fff0c8a19762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_113038_544413_96D9DA9F 
X-CRM114-Status: UNSURE (   5.32  )
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
Cc: vkoul@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-02-27 at 12:37:48 UTC, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
> 
> Use using dma_request_chan() directly to return the real error code.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
