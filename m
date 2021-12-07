Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA7DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dH96b0aNSFf6rl6TU9fZjINJ1Gm80hYH6jWfbiNXAKs=; b=2uoSGHqss8Br5b
	i2dD022glwgiGm7I5jiN7piqfC2KkgPvw8HtW/ns9ig5jDiD9m9/MlH+80a728q9MYvXKwQ9TZGrF
	MV+KCmue6DTIrwLwgCzNG1AErRHnyZakmXZvT7iTsJkvIaFSXmc4TJ90y3aSzk9jRhs8+9IKKtbCU
	k8ejwy1D+iDChuLNrTs4U1VN2yuLsM1RqSszNRyEB32U1PiNIkCvFVVJj9Aq+QqtxYo8JUymwWN5h
	zHZFLCmw05UYTVFgb55INye4dIUoiShwiUBfhtn265dChDgyZ952kAkY3dROEl2MnExKJK7ETZRY9
	nTFxQ7VLXtaSl8KiHFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muXnd-0083TV-AY; Tue, 07 Dec 2021 10:34:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muX3S-007s6o-R3
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 09:46:36 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF4191F443CB;
 Tue,  7 Dec 2021 09:46:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638870391; bh=gFarT2bn0dBlXD9xDafM6ZB+hovPkSFhEjfxaGGqIQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PDAHjih2IAuQNziUOIoXbNjowaV5khrAUR7yqCgTOdT8gqayoIZ4TzMqjOzgKy06r
 WcwI4uewzDXOJfs3SUmFcqdPE4zJZA3WCmzm+At+7Oon5SCpGiejfuFr4yxZkM66s+
 /kFF2HgQjTjZTYSa/CS0eM6f0g9vF7Lv429Xd0i6Zhr1k0G/IxImI6Xw19n4QiDu2g
 HCRVXIq0BCvsNTRxCHs2jeOFpwesAQnh7D7vQ4v4aEjEfhkVqbH0tEcpuX8qjBj8U4
 GqVPD3iGGDeRRZK+kPWw/HAja/JVGv9tvhA3oIu6jh5JJU1j0ftu3my7OTUSfgVv4r
 2kb8eNkZ+XASw==
Date: Tue, 7 Dec 2021 10:46:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Xiangsheng Hou
 <Xiangsheng.Hou@mediatek.com>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 17/22] mtd: spinand: Create direct mapping
 descriptors for ECC operations
Message-ID: <20211207104627.7bbad94d@collabora.com>
In-Reply-To: <20211207093422.166934-18-miquel.raynal@bootlin.com>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
 <20211207093422.166934-18-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_014635_092853_88A824E7 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue,  7 Dec 2021 10:34:17 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

>  /**
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 85e2ff7b840d..3be594be24c0 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -94,6 +94,7 @@ enum spi_mem_data_dir {
>   *		 operation does not involve transferring data
>   * @data.buf.in: input buffer (must be DMA-able)
>   * @data.buf.out: output buffer (must be DMA-able)
> + * @ecc_en: error correction is required
>   */
>  struct spi_mem_op {
>  	struct {
> @@ -126,6 +127,8 @@ struct spi_mem_op {
>  			const void *out;
>  		} buf;
>  	} data;
> +
> +	bool ecc_en;
>  };

I really think this should be in it's own commit. And you need to make
sure all existing drivers reject operation that have ecc_en set to
true (that shouldn't be too complicated since most of them use generic
helpers to do the check).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
