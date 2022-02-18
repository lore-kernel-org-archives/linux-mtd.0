Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5385DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaMQz/SnK5KTX9bCD4Y6wVAEWUUdz/wQ9Gvwdhc9rv0=; b=Mu7eIEDhQE6AZ3
	onMjRyAy+HMG5hl6fBuguvCYxrrkVnp0R3oog43j9noeS264QOCCeYbPkg8rkW7UrMWzCgZqmqKFf
	RZZrOg5Pxz6kOWvtFahz9y+Q7jjfAv43gp5icOTAPA2KCMYhFiclu1/qMBS6e5+MJBvHh6CuNu9mW
	kfCR2qh2iVxrRw1wcUybsTEQ9MgweVfSTEKjSeubEOcUNhorPNLAEFwIKLupv4D0E4bMaeZuZggmY
	Q+f6zEhga4gUs3Yzeqv1UVsDuBYbgTnBPOG/yZNuYNjgZljYF8Vm/L5oaf8YJ85jZ43K3eGtGhjiY
	YXfH2dsR369a0w1ffU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4KY-00En8T-S8; Fri, 18 Feb 2022 14:33:55 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4Jl-00EmoW-TZ
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:33:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F401B100002;
 Fri, 18 Feb 2022 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IF+bBotb8aWY1Kt+8zVVFsrxJD/Qv2pWkySdFRv0E2A=;
 b=UUQl85JcyGBt47wLgD57UsAYqU8DebleUhgDNJs5+u1WzG9uV0IxVeUh+eiWFXC7I55332
 S2HIrAb88CM8z5IqavD0fFygRI2Rb9LeHGB5iYNfztGhJ3zi+0AQkf2sj7sPggw8ZLkEnt
 UeKWszGs5WzG5ux77IhBoPMVxqn2n1hUwRXi49YUyl1svtg5e/znT5cq0hyGwO5FpasbFp
 G+DE4ETy+9IpKkQDbyAN8gl9F9RwRYrDfCg2azGWwH6ceRDR2nfLcTzurKYOQp//TgfsDm
 EP5TFzr34OaXVmBF++UuS/VvPVE2KCytwT/ir2l5PTPqG9JieFbZ/zLNw3W3Sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 chenshumin86@sina.com
Subject: Re: [PATCH v3 2/4] mtd: rawnand: stm32_fmc2: Add NAND Write Protect
 support
Date: Fri, 18 Feb 2022 15:33:00 +0100
Message-Id: <20220218143300.322209-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220217144755.270679-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ffb16c1c42670356c579926aabdac0ac7bbc16d8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_063306_152239_0D482BA1 
X-CRM114-Status: UNSURE (   5.90  )
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

On Thu, 2022-02-17 at 14:47:53 UTC, Christophe Kerello wrote:
> This patch adds the support of the WP# signal. WP will be disabled in
> probe/resume callbacks and will be enabled in remove/suspend callbacks.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
