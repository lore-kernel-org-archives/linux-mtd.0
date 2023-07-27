Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E190C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6f6C1EDiaJ1R02MrIcLw6+2SDABHQvyzjq35kErS518=; b=fJacsacebHRYCZ
	sjgQ/vQeAQIhAetcBOXGQUjDYZmpWrncy1YcW3Pu/EM8FJI+v1Lyh/nfYZxVHiCU3A+c9L1N7RCPj
	UREwBN/sK10/R0n0rqP0uMVHCfG6RRx6ZWX1VK1hE3J3QLfXY7WeoU2ziyW431ycscHucyONx0nH/
	AZt/xlNCQZBc2ZlDh3p9v4OXbSm8PzL463eEHDWwccrR4ldT0ab58aTJm11So0u+GIPP6eHW/8wvo
	Q34/8/g1FAhOPvQoeAXR53JeYq4qlKjWfgj4k7dhrnMoxxH7QVrOgwMuJwKEkXnn18tI8indXif6a
	Ahm9jIpemaTSlVJ29X2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2lZ-00FmSM-2t;
	Thu, 27 Jul 2023 15:19:02 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2l0-00FluE-09;
	Thu, 27 Jul 2023 15:18:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B481EE0007;
	Thu, 27 Jul 2023 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWVsqfiAbICASCsuV07TQo2D2wCXNnEC6aAuSLdOa4Q=;
	b=XB4iFbsv/Ag8dZs384cd62d1KI7+qhO1fLwQgU/Ho1FbLK7yEueRlXfajHiTEt5u2hTx6C
	duR4pNkAj9oZ5FQdiCxmXxHJEhWWZFdP+yKVZNZ1wefimoATnzcyOzhEibsPi/DApS6Opz
	N9CMJDRgfsBaD925ipffvnXAKVnx0BA5Bzg1H62V6XnpUPsl0PZZ1+kxnTxcs3/t79C/Vo
	6Zb9sRtXztaVoRviKh11IW3pUuDWEZ1TS3YbPXt4aRv8DSmyKqHs1IKA+fJRyj6DYmHcpT
	AxbuU1N8zZtLQHvi1KuqGEEm/p5TDFcxbal+EpIpKWZYh8emxWO1rt1EAraZjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: nand: meson: make ECC properties dependent
Date: Thu, 27 Jul 2023 17:18:19 +0200
Message-Id: <20230727151819.586522-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717053402.1203724-2-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'350301a3d73b217ab3d87ae42d8fcce2795fe097'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081826_233755_D831E856 
X-CRM114-Status: UNSURE (   7.63  )
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

On Mon, 2023-07-17 at 05:34:00 UTC, Arseniy Krasnov wrote:
> ECC properties 'nand-ecc-strength' and 'nand-ecc-step-size' depends on
> each other, so they must be both either set or not set. In first case
> ECC core will try to use these values if possible (by checking ECC caps
> provided by driver), in second case ECC core will select most optimal
> values for both properties.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
