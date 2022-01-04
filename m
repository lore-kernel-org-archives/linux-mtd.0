Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9BAC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDHsfDc2YdaeYurbp6nKkrov76geYEWQS9GYjSdW238=; b=wJmXknzSfPdHCL
	iwzoIW8EF0cX4EMklG6Y0Ihlpd3y+gLvUr9Tfxp8nDa3MSXhApkakWGD0FBpCF5Ljq2pPwyj9Fet1
	gjhRwgZjkBlGrqiueeFvKI7IXI5kCdcF75HKoIc41kPweq747RsulMgNakV5Ub6viHGokzXlzeQMq
	TI6fY7lbpFgCCFkP4rFLT40wFN1obzZWx85Ra3SiCy4LIy9SMQF6xr5NFiPvUnK/SueOMs/2FRY6L
	Yy0rw58njSy9aAcy4Ud/fHFsBBnrOuJRdoXgtM6/zhvZlikunJ0oV1qvNRFz+TDqyI7wG0MLpq58I
	bKMlqd/xXUsbVV+0waLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4foh-00Athd-P2; Tue, 04 Jan 2022 09:09:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fkb-00AsTG-1a
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 09:05:02 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DC4A21F42D02;
 Tue,  4 Jan 2022 09:04:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641287098;
 bh=tWUUROTUCs0hzh33hvzqpkODT6ELvrGScCBg5y7RChs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NxKwyCjcsbhMbITbs3BBATNXlilmT77keV57xZ1hSffYZde1FGIh/01Xr/E49y/Ov
 S+6a25g6tVwMb8/EjZMQVYIIntaRvLYsZKyu8StxwphVbGdD+UplYejS7a9G/zCuhO
 Z9BVJ0D9l0LqEajzgCClHTaPL5xOCMg53gVFuT5S6pxoup29xmxBmilW+aRgaThV0s
 j+MoFUqLPYaPAhH3jXXIhOVK7J/lBF47k/3aBx066MtjW/Ha0cSU4AEv9svCZeeS2C
 7ztvhvScYGEQCnCSkVnJJ9L8fD4SeMsAmWvYTD59sb2XKPcFJjUWetANTfnYXKmZYg
 jwzJegt7VYGlw==
Date: Tue, 4 Jan 2022 10:04:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 00/13] External ECC engines & Macronix support
Message-ID: <20220104100454.64859a80@collabora.com>
In-Reply-To: <20220104083631.40776-1-miquel.raynal@bootlin.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_010501_284559_DF994EB0 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue,  4 Jan 2022 09:36:18 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Miquel Raynal (13):
>   spi: spi-mem: Introduce a capability structure
>   spi: spi-mem: Check the controller extra capabilities
>   spi: cadence-quadspi: Provide a capability structure
>   spi: mxic: Provide a capability structure
>   spi: spi-mem: Kill the spi_mem_dtr_supports_op() helper
>   spi: spi-mem: Add an ecc parameter to the spi_mem_op structure
>   mtd: spinand: Delay a little bit the dirmap creation
>   mtd: spinand: Create direct mapping descriptors for ECC operations
>   spi: mxic: Fix the transmit path
>   spi: mxic: Create a helper to configure the controller before an
>     operation
>   spi: mxic: Create a helper to ease the start of an operation
>   spi: mxic: Add support for direct mapping
>   spi: mxic: Add support for pipelined ECC operations

All core changes (patches 1 to 8) are

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
