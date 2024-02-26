Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AABC54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsAr55cFwGzM61ro11NIM8mCnFFeaBjJV/OOXTqFN3c=; b=SKTz7luwZlwWlM
	YcScUVDSojlm5B6A9p+U39QKjDZL5cppZT0ocYnZFF8/sG02KwGRza1yXCq6PMmBhUcneJYKXjD+L
	fPlT9jc47HI4AptSXv6N3JBy7pNT9H37pvUM5l55na5kFPRrAoVYYTTvpDZa1fOUa2t7sbsqFV1n2
	2ohbF4pDg1Mk3OnOAhv78nt5BSvm4yvGvfLFc5e0Z/apLtzmMyR1lEn6Uy59lQCmbEc53BeY4cUx2
	fF792QreKCBmVlE5XbIWGA7SJZhbuXMCB5bbFNBN+hh8o7dgm73Fnf/5KAWcFB4g7m34gbW07L0GV
	dA1hEFuJ/6MMHPviHIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaNd-00000000fTF-0XMZ;
	Mon, 26 Feb 2024 12:46:49 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYT9-0000000094V-1HL5;
	Mon, 26 Feb 2024 10:44:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD0CC240004;
	Mon, 26 Feb 2024 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVWZdJzIt0sMRE0sF1Fi2eHeNg9G/wm4KdgqiJdEH80=;
	b=nlVOK+dOs1yaI5QT3ei8fQBNTi7qk+B9IwGRaGEcWl+nXu8tNkOgBAtJUCw9H4zyL4gUe2
	loDiJiVhee7gxN73gr17hQJnReOnWgDqMwik2qzWVK2TSDQO0qqsAhyCqiPFg6V7LW313z
	Yc3Anpz0ESPrxsvQz7pB7R4AjrDosSqphB9/hLrZQuobBM3GX6XlibinLs6YJhc1PhqWlT
	JM+5I7CYt3Q3PnXqz5VLUfFX3LTAVQvy9YZvlgckD0tM3mb2piTT4R4e8oTRo0sJthRsf3
	teZ+RYYBbOdGpOvlnGtEkP+lf6feuckGN3HoZ4+8JzZ5l2o3wjs+A8sX4GsnHQ==
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
	devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 06/13] dt-bindings: mtd: brcmnand: Add ecc strap property
Date: Mon, 26 Feb 2024 11:44:18 +0100
Message-Id: <20240226104418.489578-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-7-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'280962d413e873c7b2ff82b0767d04c60cbe0615'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024424_566377_86172C83 
X-CRM114-Status: UNSURE (   6.34  )
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

On Fri, 2024-02-23 at 03:47:51 UTC, William Zhang wrote:
> Add brcm,nand-ecc-use-strap to get ecc and spare area size settings from
> board boot strap for broadband board designs because they do not specify
> ecc setting in dts but rather using the strap setting.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
