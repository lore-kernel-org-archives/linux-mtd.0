Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB17C43217
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPMI4lA1+ERqkfmJpdc+le/NAeHPgxCEsSdo7LWZdeM=; b=CosAJB1LHghWdm
	7JBjkHlfItt8AOZRZ40VgYheOLfnmoJb6PkEP7Hnpgx1seASrp5Cmbfa4ntBpEfWh+x2QW48z/Myt
	XKoamhVmsWNTwPlZZlExCZaazxFPgfEICIa5m3or4Q8gS7hExtBAFqBSDs4lX6iqziEpYGtvpafi1
	9lA3KnXoQevStAP09xoPuYERAzcTNThErT6JFlVwWfL0gUsf9scOJoimMmUkQ3T+nN418v2wOPSEV
	q3jJCxJHvR/quppXq8INROkykrEP6E3f7RGDi+t5vwwwJ4t5RrNQjxx0lC4T0Tek7B9QziKzRngv7
	uhNQ5SW562eAaeLFHN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os55U-00GEP6-30; Mon, 07 Nov 2022 16:35:04 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4tK-00G8rC-Bt; Mon, 07 Nov 2022 16:22:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 592CC20014;
	Mon,  7 Nov 2022 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1voTN4LOSxnG5Yjl7R7hFiznO+MJNTPM5HgV+HO9Oc=;
	b=SglMUE/Y6qtcDNFpdlirWQm77GeroELPQgBDBkzaJRJTEIZ6ZH2G9lbmTE6XchNstJvMAV
	CtaD4o8VRma5ZaMZ1WDRhDMGCHf7+tn2M9CjEDt34d8EZfvBxG6kncFHPqKOx0dZP010Y0
	2TzksIXCiJsxPGu34hwtwA4O3LfoO3qr8A7AX29F2cGSGr34bp7Y7HYSf/U6SFh4cFAtL/
	HA+J5TKjzqFxXyhNBVjuwfdosWWJ3l/7zjiuWBUiL2g4RgKsCAYTyCGjTYChH8ST0btQq7
	QPqlcVkZQcCm4Qb0s/XpOFtkt0w11/CNyHegNBmgOz4nRM/UdfB+I2uafRBUNA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 06/11] mtd: remove lart flash driver
Date: Mon,  7 Nov 2022 17:22:19 +0100
Message-Id: <20221107162219.49208-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021155000.4108406-7-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a6c5f12b0df22574f8eb02b0159bc71ac66c1a64'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082230_567614_B7FE26B6 
X-CRM114-Status: UNSURE (   7.06  )
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

On Fri, 2022-10-21 at 15:49:36 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The sa1100 lart platform was removed, so its flash driver is
> no longer useful.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
