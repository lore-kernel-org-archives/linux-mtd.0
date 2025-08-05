Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C350BC87FD1
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZSMmyWXX5B76W52UXhUDvENGjLtQoXwZrBgJYX6Ut8=; b=Uq9wR74a3IoQ09
	9D2HhC3RBDRYdEFLHc9etI5S5QYQVDWVFI33QYAJ39H++sqReFB7RakIONdzBHrD/L3pzKnx/jvFt
	0HjuVgUdzLlULkVVAn9rl/oENPNO0nlazH6qZj/HXEJ5a39wCbv6jZYmF1AnitV6zeIUnpVfyOn/C
	iRODw601yAxvn2BzpFEdTlCfrpRbZ9+FFmFyA8TiI2jSE6nZx4hCB0w9quKF+xxeTKNEwYYZGTG9S
	13fWAC2F1+j7XQ4UZPKS1IMhs0ZbhbY9H9zYZXFPw+t8zDqF+IhZYv0mubzVKfeN3mUCPs5p7gYKQ
	V67fjErOeDreh//5/Ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKdb-0000000DJOe-3EsJ;
	Tue, 05 Aug 2025 16:35:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJcM-0000000D90y-1S5V;
	Tue, 05 Aug 2025 15:30:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6530C43A0E;
	Tue,  5 Aug 2025 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754407819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgEzWtcjDyKuxbmCqKV4hy0KTKvQ/vKyVEQYqrgBHyY=;
	b=pgUOwV3ki0x/OqoP8gQIxOi/isGPmWOV76dFtkEXV+TRXpoHunlxrIRxHGPgqisHsTEJx7
	xooSvd5EkjdxOhz2p8XGcG7qnHFeLP8ovBJ1RCP9hy92NnIxjxJq/05hbSGMvhdlCQDKHw
	LxvcYugBw+2nhYzfuBqmxU2mv5tOw6sOi43GzDeN9tan1gpYH7dcQDdTqqn97cdYsye68c
	Rb2hS2ElRdng1BobEiNXBwy0XLVVyP1RA/qUFM4Hp98k1tBQQEVJ/IwrrNZcssi+o3a/oZ
	LdxY/vWLvk4pDG3VBNBLafNe+BiVf4vdZna5sUWeMSyPVUkAgG8KC+WTsDMicg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/4] drivers: mtd: spi-nand: try a regular dirmap if
 creating a dirmap for continuous reading fails
In-Reply-To: <20250804192132.1406387-3-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Mon, 4 Aug 2025 22:21:30 +0300")
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
	<20250804192132.1406387-3-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 17:30:16 +0200
Message-ID: <87jz3hhjlj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepmhhikhhhrghilhdrkhhshhgvvhgvthhskhhihiesihhophhshihsrdgvuhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhorhgvnhiioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrhidrlhhiuhesrghirhhohhgrrdgtohhmpdhrtghpthhtohepsghrohhonhhivgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_083022_881588_3821A58A 
X-CRM114-Status: GOOD (  24.06  )
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

On 04/08/2025 at 22:21:30 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu> wrote:

> Continuous reading may result in multiple flash pages reading in one
> operation. Typically only one flash page has read/written (a little bit
> more than 2-4 Kb), but continuous reading requires the spi-controller
> to read up to 512 Kb in one operation without togling CS in beetween.
>
> Roughly speaking spi-controllers can be divided on 2 categories:
>  * spi-controllers without dirmap acceleration support
>  * spi-controllers with dirmap acceleration support
>
> Usually, first of them have no issues with large reading support.
> Second group often supports acceleration of single page only reading.
> Thus enabling of continuous reading can break flash reading.

I would be more conservative, I believe it is very implementation
dependent; many controller drivers do not even advertise a max size.

I agree though that controllers with dirmap support may express
limitations such as the mapped size which may lead to splitting
operations into smaller chunks, possibly leading to CS changes which
would break the continuous read mode on the chip's side.

> This patch tries to create dirmap for continuous reading first and
> fallback to regular reading if spi-controller refuses to create it.

no '-'                              ^

>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/mtd/nand/spi/core.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index b42c42ec58a4..ff6a1e2fcfdc 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1114,11 +1114,32 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
>  
>  	spinand->dirmaps[plane].wdesc = desc;
>  
> -	if (spinand->cont_read_possible)
> +	desc = NULL;
> +	if (spinand->cont_read_possible) {
> +		/*
> +		 * spi-controllers may return an error if info.length is
> +		 * too large
> +		 */
>  		info.length = nanddev_eraseblock_size(nand);
> -	info.op_tmpl = *spinand->op_templates.read_cache;
> -	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
> -					  spinand->spimem, &info);
> +		info.op_tmpl = *spinand->op_templates.read_cache;
> +		desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
> +						  spinand->spimem, &info);
> +	}
> +
> +	if (IS_ERR_OR_NULL(desc)) {

Here if the problem is continuous reading, I expect an error and not a
NULL pointer.

> +		/*
> +		 * continuous reading is not supported by flash or

Not by the flash, here if we get an error, it is the spi controller
(still without '-' ;) ) that fails (please fix the comment).

> +		 * its spi-controller, try regular reading
> +		 */
> +		spinand->cont_read_possible = false;
> +
> +		info.length = nanddev_page_size(nand) +
> +			      nanddev_per_page_oobsize(nand);
> +		info.op_tmpl = *spinand->op_templates.read_cache;
> +		desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
> +						  spinand->spimem, &info);
> +	}
> +
>  	if (IS_ERR(desc))
>  		return PTR_ERR(desc);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
