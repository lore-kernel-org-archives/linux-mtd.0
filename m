Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1057ED0E6DD
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrX8bTzApAc3/6xDlVJzlgtKslQyCN5Dtn8YiDrYYkw=; b=1HfnQSlQFu+A9x
	iihZBtUPRRIRDskY+vNFqsgSPRqTdaaQ7jdmD9WTc5QzWX951bPNP+tKbAyMw0cBWIgeI2K/6/ucG
	UOPRKJWbVQoVy+YfjN/HZudjIZbbjpmizM1fuyqka/2H2zrz+RgtJ5IqnJmrrMNowOO6Za11a51EX
	RAotYLWmBE+mHsplVbf8nbl+Ub1lqMn496PqNR46IZyuqN2R8W66o1B80ArJYMX756PS99YB0Y73a
	AulksLz3K7mOAlhfV4LBv4wIBYfXuU00UCL+xdCLu69mPNZd7grtW6Wsx/LxD1q1wf+BmCc0ghA8j
	FUlLQnZLqSJ5pmt9YWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pGy-00000006oJi-0jIS;
	Mon, 21 Oct 2024 10:04:24 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pF1-00000006nma-3VAE
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1DBD240003;
	Mon, 21 Oct 2024 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvxIJEkIpMCFwUT4H7ccPVTQW18WobfYy9Wn/MtPQ18=;
	b=NNGjL8Wf/4yaEvDBev+kCrUwCIuqjGRKdH0A9lYnUdoctZi28bmg9XOuOQNGcByqZLtFTa
	gEp6E6nxLO1r8/XR8k3NswL2IirEMEuXTOyZxxhwo/mUlbhswM/HpcSQ+nWp8WSj07TIR2
	kTSzJI276lI73kjrzlsjKnV1fd0gCW+X3M6aNNampGrvEQFvgHtw6fslZeEJqe0DV+/dxc
	flGxFkDnlmS7fyQ3tw1w33OUOb/pA24ZVZVP+QJyCVvYL2Y8REh+J5/QJQKmSi/bqnIe47
	IKIDQV8AFHW6rEz8M830Bgrc071fSIRj1pn6t98E95nG6uisqk6yr+j6paqYHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mailing list for GPMI NAND driver
Date: Mon, 21 Oct 2024 12:02:18 +0200
Message-ID: <20241021100218.173185-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011182603.346435-1-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7b2e57c26d45d55aa00d9f2904db12633596ffdb'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030224_043238_741CA309 
X-CRM114-Status: UNSURE (   6.82  )
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

On Fri, 2024-10-11 at 18:26:03 UTC, Han Xu wrote:
> Add the imx@lists.linux.dev mailing list for the GPMI NAND driver.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
