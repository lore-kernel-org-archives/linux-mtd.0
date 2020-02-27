Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04085C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDAE12469F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eoPRT0Tr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDAE12469F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vS7IB/atlFtsu7WP7vqxLZUiw86ElNr7bxzOHWpo7U=; b=eoPRT0Trbw15Vt
	HDu5wKsAgD/94mbj7TTL+QUl7I113XrNGhhUiBjyhc4I6aEkaO6SToSDUS+d9lKFbUZ9YaxmUV4Uy
	22eBOfEXlSx5qrVHk91Kaz6W++GMm8GP8Khp8MPJJMfvgdUL/RNTN+0k3oKB+48hSYjzsU9UZFut3
	9WdMgcO1f4xDbmycNZsF4N1z7Eh+Xh4tD2+KX21rn9p7wWQqcQKgNFz/t+HegwI/U7ATurXj/9Py2
	aupx1DcEKYpi2aY4MoFAUvB+QWlfnpq8SqF9+Subxix3chr1rC80APE09isvhWUP0USnszk+RGfw4
	xmxYhjJlCiggXIpWeM6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7MGq-0005cA-SY; Thu, 27 Feb 2020 16:44:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7MGn-0005bW-Il
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 16:44:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 09D71296435;
 Thu, 27 Feb 2020 16:44:09 +0000 (GMT)
Date: Thu, 27 Feb 2020 17:44:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 04/11] spi: spi-mem: allow specifying a command's
 extension
Message-ID: <20200227174406.66bf6f84@collabora.com>
In-Reply-To: <20200226093703.19765-5-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-5-p.yadav@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_084417_750907_F911531D 
X-CRM114-Status: GOOD (  21.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 26 Feb 2020 15:06:56 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
> the "command extension". There can be 3 types of extensions in xSPI:
> repeat, invert, and hex. When the extension type is "repeat", the same
> opcode is sent twice. When it is "invert", the second byte is the
> inverse of the opcode. When it is "hex" an additional opcode byte based
> is sent with the command whose value can be anything.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/spi/spi-mem.c       | 23 +++++++++++++++++++++++
>  include/linux/spi/spi-mem.h | 24 ++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index cb13e0878b95..3838ddc9aeec 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -462,6 +462,29 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
>  
> +int spi_mem_get_cmd_ext(const struct spi_mem_op *op, u8 *ext)
> +{
> +	switch (op->cmd.ext_type) {
> +	case SPI_MEM_EXT_INVERT:
> +		*ext = ~op->cmd.opcode;
> +		break;
> +
> +	case SPI_MEM_EXT_REPEAT:
> +		*ext = op->cmd.opcode;
> +		break;
> +
> +	case SPI_MEM_EXT_HEX:
> +		*ext = op->cmd.ext;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(spi_mem_get_cmd_ext);
> +
>  static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
>  				      u64 offs, size_t len, void *buf)
>  {
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 4669082b4e3b..06ccab17e4d0 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -67,11 +67,31 @@ enum spi_mem_data_dir {
>  	SPI_MEM_DATA_OUT,
>  };
>  
> +/**
> + * enum spi_mem_cmd_ext - describes the command opcode extension in DTR mode
> + * @SPI_MEM_EXT_NONE: no extension. This is the default, and is used in Legacy
> + *		      SPI mode
> + * @SPI_MEM_EXT_REPEAT: the extension is same as the opcode
> + * @SPI_MEM_EXT_INVERT: the extension is the bitwise inverse of the opcode
> + * @SPI_MEM_EXT_HEX: the extension is any hex value. The command and opcode
> + *		     combine to form a 16-bit opcode.
> + */
> +enum spi_mem_cmd_ext {
> +	SPI_MEM_EXT_NONE = 0,
> +	SPI_MEM_EXT_REPEAT,
> +	SPI_MEM_EXT_INVERT,
> +	SPI_MEM_EXT_HEX,
> +};
> +
>  /**
>   * struct spi_mem_op - describes a SPI memory operation
>   * @cmd.buswidth: number of IO lines used to transmit the command
>   * @cmd.opcode: operation opcode
>   * @cmd.is_dtr: whether the command opcode should be sent in DTR mode or not
> + * @cmd.ext_type: type of the command opcode extension in DTR mode
> + * @cmd.ext: value of the command opcode extension in DTR mode. It is
> + *	     only set when 'ext_type' is 'SPI_MEM_EXT_HEX'. In all other
> + *	     cases, the extension can be directly derived from the opcode.
>   * @addr.nbytes: number of address bytes to send. Can be zero if the operation
>   *		 does not need to send an address
>   * @addr.buswidth: number of IO lines used to transmit the address cycles
> @@ -97,6 +117,8 @@ struct spi_mem_op {
>  		u8 buswidth;
>  		u8 opcode;
>  		bool is_dtr;
> +		enum spi_mem_cmd_ext ext_type;
> +		u8 ext;

Could we instead make opcode an u16 (or u8[2]) and pass the number of
bytes, as done for the other addr? Mode can be extracted from the
opcode/nbytes values if really needed, and the caller would be
responsible for filling those fields properly (which shouldn't be too
hard)

>  	} cmd;
>  
>  	struct {
> @@ -361,6 +383,8 @@ int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
>  
>  void spi_mem_driver_unregister(struct spi_mem_driver *drv);
>  
> +int spi_mem_get_cmd_ext(const struct spi_mem_op *op, u8 *ext);
> +
>  #define spi_mem_driver_register(__drv)                                  \
>  	spi_mem_driver_register_with_owner(__drv, THIS_MODULE)
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
