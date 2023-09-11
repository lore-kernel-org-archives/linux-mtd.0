Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935A9EE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RW11Mw03DiEgdkhxyLjmXX/fJZclU53QrVXf3wJapyA=; b=el6oQ+MKgu86zF
	Ijoa+g4nSS32pk3WrBrrxmYVelG7aesjAJWjekTfc4BksaHKWRRBQ6e+7S9YoRnVQATlnpuCiR7mV
	OiWyjeoGSHxwSdr4YxYO/g2tD05C3mtID+hYUDDir4EuMGtfrdN3hA1IJ5GozahibjjcUBefjH6QY
	3uCcIaTM79cPJjd0i6YRbbbLE24EeqBke6SHBOTQxHq5YJyGvkrtWNoIdhgKm9xN5QK0Wh7rc5TJl
	63ofZQv4atKH0odN5lO5ZTJL4WCdP/N9oOQNTK9jG7RprawSO6IHRuPi6aSKegSXnQ6OYzkj1IaH3
	FcBLzG/4eL8WWUM2EpEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjLz-000xpZ-1f;
	Mon, 11 Sep 2023 16:01:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjLw-000xoV-2R
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 16:01:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 075FAE0013;
	Mon, 11 Sep 2023 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694448090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sT3sIEgnDAPmbMmKAxi4DaIOxp4PPYZ7A94TCO0dIuo=;
	b=ThG5mr0cHWyhgG4lKLmP54mpyWzMKVUbvyH+GzhbI9IYmq2/obfQjzUvpyS/SO254F8UxB
	/DbpU2qz8IaM4kTOZahiYEBJ5r7OF2QFVUga9xbMvnVj4WRm9O6LkCqHlIMhmJRLYWg/YT
	FJDTzYc1GoesqLDa6su7pMF1CaSmIfzdg5IFzi2N4LDWqU10OwiSxD0fBmkm74eMA/W60s
	YCL6SpZXilKpplgMT5pW2fRdS2TvfvbDDhIREg90XPyGR6GS3fPjemoHzpiAQESv8Yy7Sq
	sWRqQOtlazITMpWflHaAHWPfKldvAzXBqLVwPJ17cbrpNbZtFTm9YEAGbQngSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: martin.blumenstingl@googlemail.com,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	nicolas.ferre@microchip.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Fix check 0 for platform_get_irq()
Date: Mon, 11 Sep 2023 18:00:29 +0200
Message-Id: <20230911160029.764619-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821084622.218442-1-yiyang13@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c29cc4a95fa84c2c1dc8b1b990365a86a5458070'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_090132_942668_56BB198E 
X-CRM114-Status: UNSURE (   6.01  )
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

On Mon, 2023-08-21 at 08:46:22 UTC, Yi Yang wrote:
> Refer to commit a85a6c86c25b ("driver core: platform: Clarify that IRQ
> 0 is invalid"). Do not check 0 for platform_get_irq(), because
> platform_get_irq() never return zero, and use the return error code of
> platform_get_irq() instead of -ENODEV.
> 
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
