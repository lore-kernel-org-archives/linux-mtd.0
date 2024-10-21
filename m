Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA47BD0E6D8
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQYRci2U90wegKqophBEMOxkFcS+hz7gbbQcPR/3Mns=; b=cSccWQDz/t+lTF
	E1bOJ1rbGzz/QV8fmsY61wD+kvTLQAfzvJuVpH7M5c3kZcBgUhN6/DxFwCcbcvoIgNPA1Q6wOW8RQ
	GenEEZOjast0uPXzni2O9twJZvKzxMjTqrqy7x1OmI4b6b6ZuOXG6nHzFwRstXXf7ZKbe8jaZTDpg
	8OJ+LtJZiR1iYWwEYsHMeJmGmq+c0Jftj7LXEr7elLNn1mpkNC73t/YPM+03ZpDcx3XmMCNlTfLH1
	klvS9usBJSYaMJNSvk0E1qStt/vUALKaY+2p6AbPiB5tzZoTOYuik8ZlBzMLAjo1Xn0Z+ORAQ8EMs
	Gvc7hNuCRvpd/Up+r9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pGy-00000006oKD-3qnl;
	Mon, 21 Oct 2024 10:04:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pF5-00000006nni-1L1k
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C856FF80F;
	Mon, 21 Oct 2024 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhjQjm/nJ4BVC4PtoW7b1H1lLafHXxGKyuZiO/l6ZpU=;
	b=T0yp/L3k3iX3tN3C1XgRliUk1oqAR3awkUOhuRIYtJ1GO0beX6zodiFJLvzDVHK1eEJhvs
	oG77+WRWs3rnxxwhCiyBPPf2+cScI4gtLGy/BO4NRX4IvqRfieKB7W8yTG59yBphQh1cm4
	9nzLK7k7d2CT2tXBfW5I2ZBOvWeb4S54Yvs0ywQ6uc+yixAmx6hXCjy11pVUjRpwMdQ6R9
	1QQYAkBfJWmplsCeYMuGG2y9GIEwSwOK6o6+V/xt9FnYd9nOgtwEJk9vHWYKczLm3I29jz
	QfwdYqAfHLpVdUApOIrNEqX0t1ABWCm2xbyMwyKj0UlI46XstDCvrRPB3uQrfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>
Subject: Re: [PATCH 3/4] mtd: spi-nand: winbond: Ignore the last ID characters
Date: Mon, 21 Oct 2024 12:02:23 +0200
Message-ID: <20241021100223.173272-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009125002.191109-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ff97ceb6c4addb4a6044c623119d4c1fd83eae6d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030227_509798_7EB199BC 
X-CRM114-Status: UNSURE (   9.20  )
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

On Wed, 2024-10-09 at 12:50:01 UTC, Miquel Raynal wrote:
> The last 4 characters in Winbond's branding indicate:
> - the package type (ZE/SF/TB),
> - the temperature grade (I/J),
> - special options, typically the continuous read vs. page read feature
>   support and its default (G/T/F/R),
> 
> None of these information impact us, at the software level (well, the
> continuous read mode by default is impacting, but is already handled
> gracefully by disabling it in the initialization phase), so let's get
> rid of it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
