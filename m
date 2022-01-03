Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6E1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lv3Sck3fkZdRWjqGmbWHX/faxPZEZ5txQEo0GCxksho=; b=EOck2ookn5p3Od
	GTD4fWRuyEbPaHNg5XJQZfR88APQrc0bulvEYqPaMp38FgEgzYDIa+GSfJqO/DAUq9jEE21mDOUsO
	GuSBJd47uWzDXNDZVwU/BGGJn/MguxGew6b7ey/qaMjyemWYqzmuLA7o58Y1uO0B/giPgqJgprUTL
	cpxAFnDTm+vof2W57qhISxFOqP6d32Izkaz2Flv0wbaBdfjTD+PcGschF7pnsM+r1jEEqtMTUcBFB
	LeVUcgMepDL/eBeBXlPM1txktIVLg8EvHw1J8g7Y1P8Nz77jN96p+mUryZoTtgcfbTSW4rfrROyjA
	YeIWb4ZFGxg58uNL77KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4IrS-008at0-Us; Mon, 03 Jan 2022 08:38:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4IrP-008asb-Hg
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 08:38:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 701B41F41E6D;
 Mon,  3 Jan 2022 08:38:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641199103;
 bh=/+2NvOoPgYjCW/sZCqGrcDcloFV0Na4KRVsqw1zqQG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W9iDVYgZnbsZsbn8sOIrz20O+ere6mcnp2ebd1U65HKPc3VV34/fGN/jAoxg7Td2S
 OgQWNMj3RagAc/cjho/Gb3w5Va8f28ruOxbLXCKU+pVF4/F0XpG1hC5lQ7Q0wd2o/L
 6IDoGE4FsKP0+K0/Vc5owI0NOqvju53isdS2D867iDc1GumHxbdM6jCiBInCJp16ei
 u7T3qsjxQNyrErcxSukX2mj+WmUtk+DcIdwKzWGwfgzDmbcFLXULdmqKWjgqYTGc5f
 fV2Jnp+Wll1Cpse8813YtZ5taUTiyzOJxy5KbMwtgY2olXOgItI07eKzw1N+KiagjW
 9pcaK8MllGfeA==
Date: Mon, 3 Jan 2022 09:38:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 04/14] spi: cadence: Provide a capability structure
Message-ID: <20220103093819.080e60fb@collabora.com>
In-Reply-To: <20211221120458.4l7expkdznnw6u3u@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-5-miquel.raynal@bootlin.com>
 <20211220185515.wujhgn66mnwns7bw@ti.com>
 <20211221111605.352285f5@xps13>
 <20211221104108.t563gg2hulfqt2uh@ti.com>
 <20211221121947.5c779bfd@xps13>
 <20211221120458.4l7expkdznnw6u3u@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_003831_817978_8FFC4AC5 
X-CRM114-Status: GOOD (  14.52  )
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

On Tue, 21 Dec 2021 17:35:00 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> > 
> > Anyway, do you mind if we move forward first? Not that I don't think
> > that this choice should be discussed further, but I think this can
> > easily be changed in the near future if there is a desire to
> > reorganize spi-mem objects. In fact, these capabilities are accessed
> > through a helper so that hypothetic change would be almost transparent.  
> 
> Okay. I would still like to hear other opinions on this, but fine by me 
> if you want to take this in as-is.

I think we discussed that with Miquel, and I remember complaining about
mixing function pointers and actual data in the spi_mem_ops struct, but
honestly, it's just cosmetic concern, and I don't think it matters much
in practice. So I'm fine either way, make it a field of spi_controller
or spi_mem_ops, spi_mem is definitely not the right place though.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
