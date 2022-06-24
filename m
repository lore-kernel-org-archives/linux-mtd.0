Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6E8C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jun 2022 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLswHkEn67KL2Lfq492GKnW9ZMgyTaUe6wmKjeXxudo=; b=4sLgDOC0D4E0kp
	aWiKC3FCgQtkruNpXq3NvrbNVdq2tMSVUHp70o03n/KzM+shMCf7KH8Jtz0ATs+GmXrJpY+fsI2YH
	CrEnngkUeLKqNPBER5ks7YSF/ZlL61tH6NOEjf0BLnHgG5Bgl1f2SLgkFC0OT1XP+kYcLdeIIun9a
	uWaHdjbLVFw7MNlOzNaqS0LIizjpWQzFql3Jq5FGbleBJNBge06DsiA50W0zB42O1d+C78uXK1YxC
	yGt76fIS2aPc28s40IBLgBJxTzEdXIKm6/Pp0sQwXrwx3Z74OEjr/ny6geSOJRv05Wg9T1AQU6LyO
	b6jPRdVxdtUbNPKnKQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oMT-003X5U-TH; Fri, 24 Jun 2022 18:48:57 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oMR-003X40-G9
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2022 18:48:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F2B5F240004;
	Fri, 24 Jun 2022 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656096530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NsFFzx1ZqddmooYcmOkKPNNpttj4rUPujwIQIvfidCM=;
	b=XV+R/+oG80eEK5vtp5x2tr6CNB1rIFVGy7Q+VPveVqQRigjT1x7nD3xSZRh9vWvED5kZdC
	VMvVPws3NKKC91J+dEaq/DQqFsKZMXEswXpe5SGlphE5+aa2uu5nqjbSt/8QIL5f1OfEQT
	qzh9JaMdXbyOlhWeKprhF5wKD0hN+MeIBuOwogXkt/sc8ki7/eQQCc+UqkDD4ul68YYCGz
	h7G9zgmSGDsr+cZrlfdm587q2RrANViW7GC6UD/9CiXvR/MpozhbNiOK8yg3Z6296ZIm1j
	2QTVXSQw67qsc4Yj2jqlPppyvX7xW6LLMRU5KH/T+r3Fl3WmEBTG72VMnWhJoQ==
From: miquel.raynal@bootlin.com
To: Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: dataflash: Add SPI ID table
Date: Fri, 24 Jun 2022 20:48:48 +0200
Message-Id: <20220624184848.1887993-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620152313.708768-1-broonie@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ac4f83482afbfd927d0fe118151b747cf175e724'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_114855_713972_F095BA83 
X-CRM114-Status: UNSURE (   8.44  )
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

From: Miquel Raynal <miquel.raynal@bootlin.com>

On Mon, 2022-06-20 at 15:23:13 UTC, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding an id_table listing the
> SPI IDs for everything.
> 
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
