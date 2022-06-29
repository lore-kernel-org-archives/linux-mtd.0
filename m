Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78406C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2wyvpE8z6z/eMw7Obdzcja/kBCeHhWNRWAE0PL6m2I=; b=YmAFR0bYNbVUT7
	qjuP8DV7pqJr1o4PIn/M7x6/uEYIvHuUeM6sj9NyYT67yVIq6sJ394O2MxZpiL3kS6ANRrRSGcE84
	+2osPjeWd438j5xpxatdE9AOf34As528VniBdkWHkxle8D+pO+jUgF2EoNRo1i1JCnJwUa9uQShkz
	80jC6Q941NZULUlmbctrdGI2JClhu/U9TeJXotYpEGROyGRAc065FiP+DerPMRYUvejGE0eY+oHjO
	hi1h4VzepXNVxBixRrxJ1eImS9H1CLgduL+bH9SfsgD/O3eq1727dywh7lsuczaaBUmiJXhd1IyiP
	V3goO2MT5gxDiBR5IeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W33-00BVfE-0g; Wed, 29 Jun 2022 11:39:57 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W22-00BV8l-5F
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 11:38:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4BB6FFF80D;
	Wed, 29 Jun 2022 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656502729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fU1llwwXY0ybC66qxXpHVtoRu9HLSB96OOB8Toq8OMY=;
	b=PSThL+dv+sNkjFPfH38c7TXkzDpfk35XSxmgR5grGF3EZfOyL4Aok/axiwmZd0epblRNY+
	Ig8gW7wlLSn5d8Pgs5uIEhsPBpwtp8UmeeQr4WRLjZvGVfZsRgymQNI4NxMmhUSpLlQh2w
	2Th9hAD79+FG+VGLesaX6BF8q/cUnDL+ZagjnXFq6K02ufi5QGOlcafH4Jc8mNi9NvT6pw
	WcyYKtBjDEkAepHjeNgKTEWU1MqbNMwiF1NPfU8EZOE1wnU/83Mcgww2eLTMfoQGyS1Jgf
	iteNycL6Yee4niS2jzPhvuuVy8dsEbp++IPHmXFcs4zlypkpNoo83KuHtFaYJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?b?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: mtd: partitions: add additional example for qcom,smem-part
Date: Wed, 29 Jun 2022 13:38:47 +0200
Message-Id: <20220629113847.283696-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622010628.30414-3-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dd638202dfb6507cd529751b6c39680c292e245e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_043854_470591_CDEFEB2A 
X-CRM114-Status: UNSURE (   7.27  )
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

On Wed, 2022-06-22 at 01:06:27 UTC, Christian Marangi wrote:
> Add additional example for qcom,smem-part to declare a dynamic
> partition to provide NVMEM cells for the commonly ART partition
> provided by this parser.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
