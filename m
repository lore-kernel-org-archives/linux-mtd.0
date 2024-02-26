Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4893C5478C
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhrWc33T27A4u+1C2wYOG6LRoMNyW9nE/EdRkW1K+WE=; b=eg9x8rVPdMNNV+
	HpQqoODfdyL155QKMapjN44ELTba4UtrqV8Zv96rreuX+oqP3eZ4dw1OQjY0HfC0k+OPthoeKIn/2
	r4LiLBXFBOK0iYMZqT3soxJEX0gtcIaR2+qgi0vF2u9XibYYWjTxt6cAj18DgNg+7PArvWg6AsNJz
	wbv2muGASH39uZTQcsXICrnRaiKxWbHaXqiezxp9Smo8ng9lXQ5A+1fpvJNxL6mP7wMfTT2JhqaBj
	Uh/5pOJ7XKPQMYoRFkFHFV3m0IJyPjCYHr3OIt/wMNR/J/6tt9XGxr1RSq1sTa2ViTaU810bhi4TA
	BJX2yCuxc+nSAYOiJ5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWk7-0000000H9Am-0CYe;
	Mon, 26 Feb 2024 08:53:47 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWiF-0000000H7rm-1dYK
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 08:51:55 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7A1DBA59;
	Mon, 26 Feb 2024 09:51:39 +0100 (CET)
Mime-Version: 1.0
Date: Mon, 26 Feb 2024 09:51:39 +0100
Message-Id: <CZEVS9033HET.1NPH0K6PQLR87@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Christian Marangi" <ansuelsmth@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, "David Bauer" <mail@david-bauer.net>
X-Mailer: aerc 0.16.0
References: <20240220200325.19089-1-ansuelsmth@gmail.com>
 <f7c45e7b-993c-444b-8710-042da7512bbf@linaro.org>
 <65d9d08f.df0a0220.988bb.3177@mx.google.com>
In-Reply-To: <65d9d08f.df0a0220.988bb.3177@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_005151_771624_FE908BCE 
X-CRM114-Status: UNSURE (   7.48  )
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

Hi,

On Sat Feb 24, 2024 at 12:18 PM CET, Christian Marangi wrote:
> The user just tested this and It seems there is a problem in JEDEC id?
>
> [    0.726451] spi spi0.0: setup: ignoring unsupported mode bits a00

What SPI controller is used in this case?

> [    0.732850] spi-nor spi0.0: unrecognized JEDEC id bytes: 68 40 18 68 40 18
> [    0.739725] spi-nor: probe of spi0.0 failed with error -2

And what kernel version is this? This should only happen if the SFDP
header is wrong, but according to your dump, it is correct.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
