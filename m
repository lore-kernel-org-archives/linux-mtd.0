Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A743EE6FE30
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3DknAjLr6L8lE+b8zFuundjCdPsAXUoE4p1JvCn+UQ=; b=SFoXGYsQwGW02m
	4XL37r9A9uO2foNhyX7+foCg63C+G5T+nvqLN9J2EMKeqt+l/AaKyiKub+6OYuTc3FBaHXX/2rSd+
	egm2wOAmK29Al4/BYBujiWpUu+WLRii1GYpS3/WcPFdF1aNAd+Q2TEjb7xH4o5Z5VJPWhBBYsFCmZ
	jQRZ/HTwSTGcSbR+IJ2mCTXRhbza6SDEBRKH2BW8jtNcNnNgix0TMN7/A8kthhX2rcU6p+jQCkfVz
	Z/iLbdHaPzWqT8cZgwcwu4cmKXiVzBhRw6iFETYpS/uYR1SXa93vfMYXduSW+xYyCQATrcvovjrK2
	huJXOTrgwqqUZRyqqixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smapo-0000000Cl4h-3o0Z;
	Fri, 06 Sep 2024 15:25:16 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smabU-0000000Ci2u-2ygf
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:10:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2273C60008;
	Fri,  6 Sep 2024 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TlWUjv85UmB/FzR7qBD8k/0BSGkObn4DwgKFQhETorg=;
	b=pUXCenkNv+uLK7//UHJoWJ7iq8w2tLMEh5eb3Za6lkA7wiVPjOAhoAfRUJjZfnO1cMVS09
	9vLnHkNX7Eg2jUK3XZDJs8Db2BMOLhB4fxywPKpiLXrpv8shdeorcloOZ1OmUEsMbKml0F
	3gH8nrzNcED57LDamv+WGTKNSe4h6Rqx8GXUIUKNkej9/gN774fkGE6UH3I2ssrUZ357ax
	JITZdg/JengIA3Q6T0u3SkXVLjl0M7xR6WkjV70Jvwfc507aYSwqfPhqvLm6COwKOSrGtL
	Da6LiWrkfLKA5/oHMdwJCmX58wrV8fnH5ZE9TLgY+UImQTnhzwgkZMqEXmzVig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Charles Han <hanchunchao@inspur.com>,
	robh@kernel.org,
	miquel.raynal@bootlin.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	tudor.ambarus@linaro.org,
	liuyanming@ieisystem.com,
	linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] mtd: powernv: Add check devm_kasprintf() returned value
Date: Fri,  6 Sep 2024 17:10:24 +0200
Message-ID: <20240906151024.736454-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828092427.128177-1-hanchunchao@inspur.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'395999829880a106bb95f0ce34e6e4c2b43c6a5d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_081028_936502_2BA26528 
X-CRM114-Status: UNSURE (   6.15  )
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

On Wed, 2024-08-28 at 09:24:27 UTC, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure but this
> returned value is not checked.
> 
> Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
