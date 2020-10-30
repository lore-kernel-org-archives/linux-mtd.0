Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01246C00A89
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:28:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A56520756
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="da24fX/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A56520756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JVOEIw5WFpov3FLT3Nieo3uAN2Mr+R2iRK5YjNoRrCk=; b=da24fX/+2REaSTC5HLjLcjAxc
	Cf09qwjd9ECNlYxubocpjGl1UBqMKxUqGp4/cx9LJ25LtvgIXA+9JkTVPKf1FJ8Lmgn/6wderDGv/
	pJNqqeQlAmBYlcaqf6rUV5fhd/pSjLE6xAhm++8KZsSfIQLdpKKMROLolwNDlYF9pf970HEAHwtMa
	FvGTbeDI7j+xiyQGVXWmXwvarc2oqPE7ni6KWsuIAZR+4vQQO/9nmBkPxczlL7HtnCGf+rUXfFYuT
	9brsbcCaEu/GuqQ62yWOdpSmrTX+mqIkljfmsTkCQgYiUARifx50ZWZBH32JmyK9FLUCvGok+pad3
	6oHdJZ55w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYBn-000509-4X; Fri, 30 Oct 2020 17:27:47 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYBj-0004yA-5B
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:27:44 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8AB1360004;
 Fri, 30 Oct 2020 17:27:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Praveenkumar I <ipkumar@codeaurora.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sivaprak@codeaurora.org,
 peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix DMA sync on FLASH_STATUS register
 read
Date: Fri, 30 Oct 2020 18:27:38 +0100
Message-Id: <20201030172738.29290-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1602230872-25616-1-git-send-email-ipkumar@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e6ad7a4080245f2e3ff674786f0c8371804718c3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_132743_340594_605B1DD2 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: kathirav@codeaurora.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-09 at 08:07:52 UTC, Praveenkumar I wrote:
> After each codeword NAND_FLASH_STATUS is read for possible operational
> failures. But there is no DMA sync for CPU operation before reading it
> and this leads to incorrect or older copy of DMA buffer in reg_read_buf.
> 
> This patch adds the DMA sync on reg_read_buf for CPU before reading it.
> 
> Fixes: 5bc36b2bf6e2 ("mtd: rawnand: qcom: check for operation errors in case of raw read")
> Signed-off-by: Praveenkumar I <ipkumar@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
