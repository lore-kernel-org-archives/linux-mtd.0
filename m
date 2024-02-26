Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EBFC54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQ41hii5aVid+GeUoLCC6WzCUNna1EBAzY6+Ld0+gR8=; b=I/GFdT7b/eiZy6
	0nN0WGEflOwg0vuEUGWCo+wZA4uWl7RMTv8SgjO8HLUYDB87sgaMWD2X2xa9R+yWxekuCKDNU5aEa
	HbOr+8g5SJKcBgXoEGf8BeJHRYHl8FAwzuM0HiMD3EvJ+0orobVqjfPCS2NAMdNmLbNxGkZoWimkq
	lcldBopl7PK3Vg0Jn2u0sMQkvLUOfHFROw9HKb/GZYbD3inG8595/F27si7taagzkdJeYhjetm2nR
	V4wRUspGS+zpgW17RrywCzbKj3Eg7EEea6EYzPE39HGAQ+cgL5ct+iqzUCNp6u80/+TIbDa9SGsU+
	OA5bi6ErfBRjs4vDnmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTJ-000000009Ad-43On;
	Mon, 26 Feb 2024 10:44:33 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSZ-000000008gM-1Dz6;
	Mon, 26 Feb 2024 10:43:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C070AFF804;
	Mon, 26 Feb 2024 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbuG9zKlK6ziqZGMdcv8Imk0IwSOjhpEoUUTm5M8p7I=;
	b=ccjhfYPRzGq4Vk3DqllusYqNYAwB2BN5xggKYeKVaKP2EEWfNew/SZroBqrrz6vZ+ic8aV
	gp67fl3aQKY4eT5Lr//50VQayl1gH5fnYrTiEPjiIEwBqEOybJOXe8vG0mG4opEisUnS5P
	1Bu6HrhlrHGhhxjofOHJbT6FXQWtnEad3u4jsvbT5xKN2v2sdS3IkQETYsDxp6rYJQiOcf
	dgquHrTFfyT1SG/nNqx0EPFjYZlnnnjhzDLz5q1SqqJN34Oq7sk2OZaR5PERjHKnbqfjSG
	vh9F9rEQNYmOxtVHKeJ9KcHAL2yajQIfPDAZOHgdHJdi5ljQ8kSu8TdVuP0Z9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/39] dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
Date: Mon, 26 Feb 2024 11:43:44 +0100
Message-Id: <20240226104344.489249-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223172520.671940-1-varshini.rajendran@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3c1f9b7fa20aed8b3227d4ed7ed630da6077304b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024348_083188_8E7BCF72 
X-CRM114-Status: UNSURE (   4.37  )
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

On Fri, 2024-02-23 at 17:25:20 UTC, Varshini Rajendran wrote:
> Add microchip,sam9x7-pmecc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
