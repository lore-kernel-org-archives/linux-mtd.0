Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10482EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=063QA3g13JiZKrxl+vQE3ElVfgh8YfgOSY5nkR6sxOU=; b=2Dj3HsG/GbcwBV
	LCo+oVbvVPXaWInisXToOz0PmqXzY4WdcaMBHb17aHaTdk55Mvy46uhDk/SK7InxcXFYUueXAmqth
	+h+VxJrXDJ1381qg4c4D0xJcm0LLaZ2Ex92DUrYfwO5SzXBl8pLwOhAxOQqLVKOemkG6fhcNZDv7l
	dk5d2qFM2uKKBiaOKFxIqf4tcTuULQpbG53e0btqvdOAmC0ZbrUsUg/KuWq6v9gyNy44PHmgjnLWY
	MPIdfzL4mSQxgzFHqPDM/C4EnWwXV2aT59JxfHG3qCEYgzaQ3qrVVj1JmHESg1hUHqzKbmnLVjIzk
	QvGPEGytj0KVKZ686m3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrEB-002KUf-1u;
	Thu, 13 Jul 2023 07:59:07 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrE2-002KJq-0k;
	Thu, 13 Jul 2023 07:59:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EF3020002;
	Thu, 13 Jul 2023 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U09Vpk4jVodMcQ2qeli5P34cL4GuLHAspMHmhi1Yoe4=;
	b=IUmDzSAwtPyScCxXj//Z5cDvFLVBJgELYrblhe8XwcdS98XBmHPrdqiy1qWQO1LHRslscf
	axHEO0uSD4LmqxlgDrw/M2fTqIQM+4CH5RpDghO8i9NOnDS6VorLn9oDhenmv86OXijiMa
	dYYpVN89EUlzEZIHoLZrvOu8TE/puQh4ZZ6Hp7uC5cJ25e9CSd26yzUXjc20ObyXjnNgPu
	S2WHZC2rw6hfFNBLEvQNecGU1tDEoWkPWvGvQsGDHXikWLBw83vRJ/Pq7EFPFslAiTotEg
	lak0EvwALaCyHuML2iSyAGm/DNFLTcQ8TEfS3vXVoJMrrsxpr8ldspB7nz66Uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Adam Borowski <kilobyte@angband.pl>,
	ChenXiaoSong <chenxiaosong2@huawei.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?utf-8?b?TWljaGHFgiBL?= =?utf-8?b?xJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mtd: rawnand: meson: use NAND core API to check status
Date: Thu, 13 Jul 2023 09:58:53 +0200
Message-Id: <20230713075853.486622-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705104403.696680-3-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cda24ab77374ea823af413249eb19ff5f49bf9ad'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005858_463640_49274DE9 
X-CRM114-Status: UNSURE (   5.62  )
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

On Wed, 2023-07-05 at 10:43:58 UTC, Arseniy Krasnov wrote:
> NAND core API already has functions to send NAND_CMD_STATUS and leave
> status checking mode by sending NAND_CMD_READ0, so use both of them
> instead of direct access to the controller registers.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
