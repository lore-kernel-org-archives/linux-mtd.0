Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD66AC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rito0rlXn7Dc6UKs1fS9BEsAA1an032shj31k9dZLI=; b=adkJOaNZKtwgnA
	q4AjK4wVTpBWXUzC2/15U4ObDs8hp/A1eaAYsqeBxa6GmlM9R16sxd99BiKbgkM5U0rhTE3mJtQuH
	uArIvUmn84PDJzQvgfpcYITpk5Zsud9mVZ2nD4gsBhGPSRq0Q1RY4KxBYxysbAN5Fhy4D0XB9DepI
	nf7HqZQdjtBWpwULIuh9XMK63QYi7U/XFV9WQ5Zrz1oFPg0lSKqJJMRcFwPlJ9hmZWwJwe/pBBnUp
	VXrhbfiL6drY87Jwip7XjUiJbqcbEQP5r8rH74ErSEeOxLrWJLoxB8JS5kiQRCVdXUOiz46C1v8Lu
	cZ8yoXeJShBwY75wHAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeim-0013Qx-VJ; Sun, 23 Jan 2022 15:24:01 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBei8-0013Ix-KO
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B4091200002;
 Sun, 23 Jan 2022 15:23:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ansuel Smith <ansuelsmth@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: parsers: qcom: Fix kernel panic on skipped
 partition
Date: Sun, 23 Jan 2022 16:23:16 +0100
Message-Id: <20220123152316.529559-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220116032211.9728-1-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3c4539442c775a11d681784ade12c77adba34893'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072320_857297_B7DDAEA0 
X-CRM114-Status: UNSURE (   8.51  )
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

On Sun, 2022-01-16 at 03:22:10 UTC, Ansuel Smith wrote:
> In the event of a skipped partition (case when the entry name is empty)
> the kernel panics in the cleanup function as the name entry is NULL.
> Rework the parser logic by first checking the real partition number and
> then allocate the space and set the data for the valid partitions.
> 
> The logic was also fundamentally wrong as with a skipped partition, the
> parts number returned was incorrect by not decreasing it for the skipped
> partitions.
> 
> Fixes: 803eb12 ("mtd: parsers: Add Qcom SMEM parser")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
