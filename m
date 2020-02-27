Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7056C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:36:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 810B3246A1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JKRlVcmT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 810B3246A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5u3lBdge9xdJ9b/GKxonYrPloZGFTXhjj0xZnyk2724=; b=JKRlVcmTSqZZVc
	18CbnjUamLDyH0UfQVyOgMk6OCL80v0QRzfPf2QXNdAkgmyA51b1NSxtXfdP2rjysDm+u8nCGhHVn
	NXEHbS0cCXoRzLYSgO/tFCQjLwUxqz5pbUvRG5CoCeE2jlL7AdSOoDrQYJ0fjYvkdt3rrYQTJ80f8
	TAq4tK0aPPEvdNGVIFiH+eXKPbSPMCZJybsAvmto2ExQqN7SUPID+af3LCTGUA28C59/kFXASJ9mr
	NXT6gXx1Rn8apVQ2Vbok8EOXv+7OSj+NpzrHyq/1kbxNx4IWDqa9cHIfjGBjcbIqMtfxCO16ZHBTL
	yxqxW1h0ZyxXRs8y5gyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7M9N-0002zE-Ru; Thu, 27 Feb 2020 16:36:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7M9L-0002yq-4L
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 16:36:36 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EFBD52963F3;
 Thu, 27 Feb 2020 16:36:32 +0000 (GMT)
Date: Thu, 27 Feb 2020 17:36:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 03/11] spi: spi-mem: allow specifying whether an op
 is DTR or not
Message-ID: <20200227173630.40da81da@collabora.com>
In-Reply-To: <20200226093703.19765-4-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-4-p.yadav@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_083635_305199_5DA7AA3A 
X-CRM114-Status: GOOD (  21.19  )
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

On Wed, 26 Feb 2020 15:06:55 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> Each phase is given a separate 'is_dtr' field so mixed protocols like
> 4S-4D-4D can be supported.
> 
> Also add the mode bits SPI_RX_DTR and SPI_TX_DTR so controllers can
> specify whether they support DTR modes or not.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/spi/spi-mem.c       | 23 +++++++++++++++++++++++
>  include/linux/spi/spi-mem.h |  8 ++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index e5a46f0eb93b..cb13e0878b95 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -99,6 +99,16 @@ void spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
>  }
>  EXPORT_SYMBOL_GPL(spi_controller_dma_unmap_mem_op_data);
>  
> +static int spi_check_dtr_req(struct spi_mem *mem, bool tx)
> +{
> +	u32 mode = mem->spi->mode;
> +
> +	if ((tx && (mode & SPI_TX_DTR)) || (!tx && (mode & SPI_RX_DTR)))
> +		return 0;
> +
> +	return -ENOTSUPP;
> +}
> +
>  static int spi_check_buswidth_req(struct spi_mem *mem, u8 buswidth, bool tx)
>  {
>  	u32 mode = mem->spi->mode;
> @@ -154,6 +164,19 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>  				   op->data.dir == SPI_MEM_DATA_OUT))
>  		return false;
>  
> +	if (op->cmd.is_dtr && spi_check_dtr_req(mem, true))
> +		return false;
> +
> +	if (op->addr.is_dtr && spi_check_dtr_req(mem, true))
> +		return false;
> +
> +	if (op->dummy.is_dtr && spi_check_dtr_req(mem, true))
> +		return false;
> +
> +	if (op->data.dir != SPI_MEM_NO_DATA && op->data.is_dtr &&
> +	    spi_check_dtr_req(mem, op->data.dir == SPI_MEM_DATA_OUT))
> +		return false;
> +

Not all controllers use spi_mem_default_supports_op(). Those should be
patched to reject DTR ops too.

>  	return true;
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index af9ff2f0f1b2..4669082b4e3b 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -71,6 +71,7 @@ enum spi_mem_data_dir {
>   * struct spi_mem_op - describes a SPI memory operation
>   * @cmd.buswidth: number of IO lines used to transmit the command
>   * @cmd.opcode: operation opcode
> + * @cmd.is_dtr: whether the command opcode should be sent in DTR mode or not
>   * @addr.nbytes: number of address bytes to send. Can be zero if the operation
>   *		 does not need to send an address
>   * @addr.buswidth: number of IO lines used to transmit the address cycles
> @@ -78,10 +79,13 @@ enum spi_mem_data_dir {
>   *	      Note that only @addr.nbytes are taken into account in this
>   *	      address value, so users should make sure the value fits in the
>   *	      assigned number of bytes.
> + * @addr.is_dtr: whether the address should be sent in DTR mode or not
>   * @dummy.nbytes: number of dummy bytes to send after an opcode or address. Can
>   *		  be zero if the operation does not require dummy bytes
>   * @dummy.buswidth: number of IO lanes used to transmit the dummy bytes
> + * @dummy.is_dtr: whether the dummy bytes should be sent in DTR mode or not
>   * @data.buswidth: number of IO lanes used to send/receive the data
> + * @data.is_dtr: whether the data should be sent in DTR mode or not
>   * @data.dir: direction of the transfer
>   * @data.nbytes: number of data bytes to send/receive. Can be zero if the
>   *		 operation does not involve transferring data
> @@ -92,21 +96,25 @@ struct spi_mem_op {
>  	struct {
>  		u8 buswidth;
>  		u8 opcode;
> +		bool is_dtr;

Hm, maybe use a bitfield here so we can pack other fields if needed.
Also not convince the 'is_' prefix is useful.

		u8 dtr : 1;

>  	} cmd;
>  
>  	struct {
>  		u8 nbytes;
>  		u8 buswidth;

Maybe move the dtr field here so the compiler can pack things instead of
adding extra padding for the u64 alignment.

		u8 dtr : 1;

>  		u64 val;
> +		bool is_dtr;
>  	} addr;
>  
>  	struct {
>  		u8 nbytes;
>  		u8 buswidth;
> +		bool is_dtr;
>  	} dummy;
>  
>  	struct {
>  		u8 buswidth;
> +		bool is_dtr;
>  		enum spi_mem_data_dir dir;
>  		unsigned int nbytes;
>  		union {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
