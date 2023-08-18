Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2790AC71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYYTYXliVFUK0+vEfFwoTipfh0nxFtfI1DkVKY02CrU=; b=k6QKfPdb6ZnQ6l
	vyZJ/NsJzXvw5LSuT8KknfQYg1Z3CgbXb+qXsWC8IfieevOG6XVPMOpwUhNKPwWcZBZS1pvdbY9lH
	x0uUwwCsVVhcqHF4G21YKhRoS37ecwXwxXzCtBybri4ObUN2bbVasonnmfBHhNRHwcIK+yTks1zbx
	6efqQ0JRwHsMbYDUi5bamGcYHaP9axibBay0edMHMN4UJ7yq8XJrzyc3V26hmHdCavjmHtfDdJFRW
	RrGuSwRChNnCc3wBn6cEgYN0ntmtwLzNtXsy8TakI6W6Rk3A3NUnezcQa8KzGcL/WmFFsfq5TQHff
	vuE0uRO+lQauSXNKbozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fK-009Vj5-2D;
	Fri, 18 Aug 2023 14:41:30 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fF-009VgZ-0u
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96625240005;
	Fri, 18 Aug 2023 14:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vdf4aayJ0vPBWLh4X8ERuVknKut4vB+x850UDEbCdew=;
	b=M5ywLWrJ9DO27wEEih+ZiVSahP+0h+tFT0E0O8vzpJBNotTUAf/98HltMgG/GzDva8Ktmq
	D62mYb6hV8sDwAipA0U6OiZRhvxWGYKxHbFP0YKLclLA80PpRTaVcaFXivtRQ7iUkdkbYL
	1Ae3yDkxB/+o40rjEmaBlF+DcRwI2YLyorbHBDAGbgkWHbygQMS0f+uowTK8959Zzqp3Jk
	bFuVpUptuWAFQ32fgGtTATOU5fAKAknino+FWe8ISEZD86ioYWTrm5k3ct5W2MwPBwA5Hx
	nJWT5om1C5g0oN4s8LkUD6BQ5qtCS/Ra9Ww7XhtoFUYXywoZlq/IxoYqMCTgWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH 07/10] mtd: rawnand: qcom: Unmap sg_list and free desc within submic_descs()
Date: Fri, 18 Aug 2023 16:41:22 +0200
Message-Id: <20230818144122.145966-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-8-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bb7a103d4594bbec8fc74d10da2dd227e21cae35'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074125_479322_C59BC4EA 
X-CRM114-Status: GOOD (  12.03  )
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

On Sat, 2023-08-05 at 17:41:43 UTC, Manivannan Sadhasivam wrote:
> There are two types of dma descriptors being used in this driver allocated
> by, prepare_bam_async_desc() and prep_adm_dma_desc() helper functions.
> These functions map and prepare the descriptors to be used for dma
> transfers.
> 
> And all the descriptors are submitted inside the submit_descs() function.
> Once the transfer completion happens, those descriptors should be unmapped
> and freed as a part of cleanup.
> 
> Currently, free_descs() function is doing the said cleanup of descriptors.
> But the callers of submit_descs() are required to call free_descs() in both
> the success and error cases.
> 
> Since there are no other transactions need to be done after submit_descs(),
> let's just move the contents of free_descs() inside submit_descs() itself.
> 
> This makes sure that the cleanup is handled within the submit_descs()
> thereby offloading the cleanup part from callers.
> 
> While at it, let's also rename the return variable from "r" to "ret".
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
