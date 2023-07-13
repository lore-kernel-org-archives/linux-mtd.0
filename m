Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B057EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7VbUkLq3eB/JGYx7lu6H64A7aKlYIf7vGDiv0tYHcA=; b=uf2rkTPRfVec0p
	99zXZM011NhTitsTF21PdqIT0L1iOuWyhQ0m8Ufz0gEe2r2s/AhtsG7DOhEDLOv8d5pp84IwCPGrL
	8vAEC3YOjKAodAJtkQsi1znEpRmlP96TPP3o0Jf15qmOKNeTm2RqfW7MLUuT7ToOns2WqbdoETL9n
	+KG1SvUPQXH6i2spfaYgQBIFVuK7fZd1oJ5RafN8zNbB726VeDyGcOl0GRZz2vPK/99g2UFCs2Fj7
	iXJvEJMLsucooJOhypF2lPefincmD+Z/c+ZbxWjIsz55ECSixS4Wwc03MGVjhY+m4shTBQYuSZM3U
	sqdpc5yGx6LgZKM1xj1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrE0-002KJV-1S;
	Thu, 13 Jul 2023 07:58:56 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDw-002KDp-28
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B96A1E0008;
	Thu, 13 Jul 2023 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btfcTaMxTQ02PSlnbX5V3o2sBc1OCsVPCe9sHQUY0AQ=;
	b=i5gFwm9c0W4b8Kq3SQR47prgKPw792/M8EFlTQZWMOXe99ZwXKhuLl/WiI58Owu2cBbJLc
	WIjsLx4KPTsF9xcBVtW4HnnRRfBge6/zt30sT5cpp/yjbrpkj67blmA+opX6QHCinZZ+Y5
	PXO3ksb9GQnn8hTgb0NKl+RpbCrIXMHDojFboGUENuPV9vWbumF7Vodkg0UHP3AlHEor3r
	ekW0h1TZ4AYL7Di6ChJPG2TVXkJ8x9CrId1KEE81pdZrrR482KhhgRsYUfbd556n2BFsOK
	to5FDO96WqqRvpET/yYSGsLb0OZMqoBGS3mVDnHGXDmYMlK+lZphqapy0Us6lw==
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
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v4 1/5] mtd: rawnand: brcmnand: Fix ECC level field setting for v7.2 controller
Date: Thu, 13 Jul 2023 09:58:48 +0200
Message-Id: <20230713075848.486574-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706182909.79151-2-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2ec2839a9062db8a592525a3fdabd42dcd9a3a9b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005852_840434_25479073 
X-CRM114-Status: UNSURE (   6.69  )
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

On Thu, 2023-07-06 at 18:29:05 UTC, William Zhang wrote:
> v7.2 controller has different ECC level field size and shift in the acc
> control register than its predecessor and successor controller. It needs
> to be set specifically.
> 
> Fixes: decba6d47869 ("mtd: brcmnand: Add v7.2 controller support")
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
