Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D922C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:57:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88EB61AA2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B88EB61AA2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=su8TjyHtkq0LehgqaJ2aUyqGWc96BFfLixMhsOv6y1c=; b=koB42XTNwcEZJW
	jlVGHG6daS0AorTTRg+fXGre7j0373v00+ea/dirJ68PP6Ez5cDQSf6f8oWT4nQzNr04IbwJsSb91
	x/EjppIarmrweuIafWAbAOruhBYy3Hu2uXgRx0zBpx2RKrDfq9kpB0XMJrN1JVnEaUG1UdG67nLiA
	kB0FbzTA3k5pnGgR3qOx2Ts7pZLyEG2SWt3ZacIC5Rw6Ah23lQlcwK7lyqIzpLNM6BedlY+2F9C2J
	l++pYczs6p7W8yHivuHvoAbnWIrACN6St7m6cBMzRJWGCMryYKavUNHVsszeGSYMQ5CqzlJURphPt
	WVdBPhVxWybHjTCvC51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo944-00BMzE-Ja; Fri, 19 Nov 2021 18:56:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8rV-00BKSq-QC
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:43:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7EE91FF804;
 Fri, 19 Nov 2021 18:43:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Stefan Riedmueller <S.Riedmueller@phytec.de>, Han Xu <han.xu@nxp.com>,
 Greg Ungerer <gerg@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Christian Hemp <C.Hemp@phytec.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Riedmueller <s.riedmueller@phytec.de>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Remove explicit default gpmi
 clock setting for i.MX6
Date: Fri, 19 Nov 2021 19:43:46 +0100
Message-Id: <20211119184346.1404296-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211102202022.15551-1-ceggers@arri.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'aa1baa0e6c1aa4872e481dce4fc7fd6f3dd8496b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_104350_029082_C7A711FA 
X-CRM114-Status: UNSURE (   8.50  )
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

On Tue, 2021-11-02 at 20:20:21 UTC, Christian Eggers wrote:
> From: Stefan Riedmueller <s.riedmueller@phytec.de>
> 
> There is no need to explicitly set the default gpmi clock rate during
> boot for the i.MX 6 since this is done during nand_detect anyway.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Cc: stable@vger.kernel.org
> Acked-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
