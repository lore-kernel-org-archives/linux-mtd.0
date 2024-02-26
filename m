Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5460C54E41
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=un4rb3EjRyE/kSg1htbpdLUi4WT0dIQcM3NJhmp2niI=; b=UTJgCrD6jrZ/sg
	Sayi9fORtbblhXlpu4xB5uQ7pwKMhFj/3Zgs2RReyeq3dNwnMrXUR8SlT7386oub5OhBG+O0clVBf
	9T+OdHs9QBFLyr2UmSgewhUo5/wMCRMzYNfjKchfbe5iJQS0Bfd5fcqXrS0x6mMAIfWJYjN/R0I4D
	uA893yGxi9x/Q3/YSeM3iE+fyEobOvBs/wfwjFPGpq4fXmqtpAeHS1PUMolh3uWPcjxHL6bwmXMWC
	zqF+ujxBxBwpbpLbTT0xK6eiDc/w898axqyFPth+DgPCVEMcR6G3WMQUbZ41ubf4C4xGPQoLeLRnD
	AWhd5cjutABvrGRKB8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebXs-00000000xv1-2haY;
	Mon, 26 Feb 2024 14:01:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTB-0000000096P-3jr5;
	Mon, 26 Feb 2024 10:44:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C74171BF207;
	Mon, 26 Feb 2024 10:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0jfSaNWPM8c7hemQqNUqquDEQ7dm7utmz7Pw/Vpj80=;
	b=OCtf67biXRAmquLsBCLSCV19/ukE313faNhAeIO05ukEICb/E+Xz0ZY5SHoT3rSTLRkkgf
	tSB0HPPzhqM+tSh1SAhft0qghO9Vr2LB2uG5D7lYvi8xap9hnKpCxjynTCn9qdXVdPGuVj
	ggVc/zvfQUZcdQRm/ucm9o6dWKw5mtLNt8R+JugDx/8G3ZnurUnwqeF1c6tQhrTkR3qrtg
	sP5Gt+X6VXPoK1wm/yVsxvdmVavM5/8/qyb2hj3RGBaaYQfqU+lZoh2FwfZAcKTpiIDuw6
	O0fTTH431PldL3VPxKZ1vUbwId1iktgkDt5WWlfoZh5P/+0VMbmTWYkIolTZHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 05/13] dt-bindings: mtd: brcmnand: Add WP pin connection property
Date: Mon, 26 Feb 2024 11:44:22 +0100
Message-Id: <20240226104422.489635-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-6-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'638eff86cf9ae36796d704bec24b83e3a4e348bd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024426_209441_C1A0082C 
X-CRM114-Status: UNSURE (   5.47  )
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

On Fri, 2024-02-23 at 03:47:50 UTC, William Zhang wrote:
> Add brcm,wp-not-connected property to have an option for disabling this
> feature on broadband board design that does not connect WP pin.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
