Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7566FE6FE53
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EUoCNRf9gFvc1MtPaxrQdfQetjf1cmo1y3+V/9eswc=; b=0GXaWCllTbEHFC
	Q/gtvSYsLc4UANut7o/Jj4Tdhh/exB5ll4Jgncu+c5ccu1+yIX6iz/0JYTeCBGx873hCbzajXx8yo
	MMBl6FM3+F01fB26purdG1FK8lXou/VHsk8NMMozWfVhB8cIOgjlZQNrqfhV9asFT8f0/QEBsfrsE
	Uo1D4DOSoE85fQvkRMDQBPFxrL50QJGECIru/SohvltBxlAM7a7SSWgvNDat9+9uuIFXNOaxWPQGS
	vxTdLOSXQVxlqI6Pbze4CgvbCvDWhvDd8g58+6brxXTy//1kzjKHkZSvQ7/oIYJWhYBq5ftmeCHHF
	HC0F186O0nm1Sme0LVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smrRU-0000000EjYq-1nXr;
	Sat, 07 Sep 2024 09:09:16 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smrRR-0000000EjXi-1cRD
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 09:09:14 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 564EDA01;
	Sat,  7 Sep 2024 11:09:01 +0200 (CEST)
Mime-Version: 1.0
Date: Sat, 07 Sep 2024 11:09:00 +0200
Message-Id: <D3ZXN8C7ABAT.SS2W1C409F4I@kernel.org>
To: "Renjun Wang" <renjunw0@foxmail.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for XM25Q series chips.
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <tencent_E68F624B67F256EA24115857B3DEB5E84907@qq.com>
In-Reply-To: <tencent_E68F624B67F256EA24115857B3DEB5E84907@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_020913_586453_FBD99205 
X-CRM114-Status: UNSURE (   5.44  )
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

On Sat Sep 7, 2024 at 8:31 AM CEST, Renjun Wang wrote:
> Add support for XM25QH32A, XM25QH64C, XM25QU64C, XM25QH128B, XM25QH128C,
> XM25QU128C, XM25QH256C. These series chips are already tested on Orange
> Pi boards[1].

I've just checked a few but they all had SFDP. Thus they don't need
an entry in the database as it is covered by the generic driver.

Also please read https://docs.kernel.org/driver-api/mtd/spi-nor.html

> [1]https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/drivers/mtd/spi-nor/xmc.c

That's an ancient kernel.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
