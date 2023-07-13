Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41808C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4r6j6TUQKE6+HFohvbcUC32qqwcWB9hSfOyAnZJWGY=; b=a+A0Ndyqqt+LaB
	s1VCFfkzV3RMLBpq6rGTTlbemENTfNoR1wdboty5mHj9BqdL6cGFEHpUlQBRslChp2G+SN7u8XlNf
	SXJPDRVRVbtvYFwOCow4l86ntHYdlQ/VoTv4rPgYz/fEqvdfgBwD1c0/JzPh1BGMJlvVsqH0u+rrA
	Be9xq0BI3jRmiX9gsbz7GuiLZuEUs/mIUpWa0119PhzTf8DXd/TfkcH2mrsTdvMh/fqjWLhQ1kwfS
	ZFdz/1km2r/eK6zcKXY/mGup9uzAVGvmkriIvBH/k/MNrsxC1Vbchz5wLvk/J2egG5I9Pn9AMVLFP
	cC1ILcquvxnrH7PCDCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDx-002KGD-0k;
	Thu, 13 Jul 2023 07:58:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDt-002K4B-0f
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BD64FF805;
	Thu, 13 Jul 2023 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMw82xarIgJk+pRCxPkRsMQk1JAXiBa8tbjef/Uncoo=;
	b=p6iJ9BzShzr1+CKoyehGxqpNs4S2XE/jgLVBUzcATe+Xww002z7MACEo5vwGjF7tHp1nX0
	TWwHB6jQrwMg9Pmu5Q8h3Gk4H62dlGe0TrFe7fHEkKtGVQWOgw/ArQS/gDxGC2kjqyxLh7
	7uIZIITXbmmU56AW5WB1H1UVmCf38o+kfoa/Uap4t2xst27L2IjzUxsH9OFlZfrDxhqXvY
	aH2QWst2F4beq84ppBtgfERhwaK1EJtpoeJX6jAF+2Dvw6hmIgZzBQQklHDgI/+cet3iTq
	doZ6wsqozU3RLzQN1OkuAVJ2bTqqs6ObFztGaDjP+G72x5Koznqk8md07G10LA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v4 3/5] mtd: rawnand: brcmnand: Fix crash during the panic_write
Date: Thu, 13 Jul 2023 09:58:38 +0200
Message-Id: <20230713075839.486507-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706182909.79151-4-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e66dd317194daae0475fe9e5577c80aa97f16cb9'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005849_432514_AACC720E 
X-CRM114-Status: UNSURE (   6.55  )
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

On Thu, 2023-07-06 at 18:29:07 UTC, William Zhang wrote:
> When executing a NAND command within the panic write path, wait for any
> pending command instead of calling BUG_ON to avoid crashing while
> already crashing.
> 
> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Reviewed-by: Kursad Oney <kursad.oney@broadcom.com>
> Reviewed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
