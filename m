Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7D3C7618B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 12:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ADE322C7B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 12:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XlQGmzHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ADE322C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wi88TBDaCe5qKwVTggRvOCcNt4GV9xl4lvrC+yz9YA=; b=XlQGmzHu3NgAgU
	OUoVbugnGew1q7HFIC6C83XaR6Y//qPvYC0TCd0Zr6iDb9qaHePeGi8u6kSBf122kcf2NVFds12jf
	1qL64d4GZRe7PZHnm7fL/qHyWxjeMVr2H0ie9pbvNiVrF2aNgnFyU967eik0VLo0ccepdcVHm6RAS
	RuJo3Eml1TVUUgMIMFt+pkb0x5e3tB1Uk/u4Bvy9VwwlPI8NVKtVyCivZHNA5J961Rass5Qs0vuco
	n0RxhtIoZ/B2EzpAUHkDimgMCjvrQgom6S9OclfY6BuXdVRoTk8YqlStFWqgrhG3IuDP9s2zD8gEK
	nTUOKeljOdvPXSiYO8Uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqd0L-0004l8-Gg; Thu, 25 Jul 2019 12:37:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqd0I-0004kN-Fb
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 12:37:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C053828AC0F;
 Thu, 25 Jul 2019 13:37:47 +0100 (BST)
Date: Thu, 25 Jul 2019 14:37:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Message-ID: <20190725143745.634efcd6@collabora.com>
In-Reply-To: <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
References: <20190720080023.5279-1-vigneshr@ti.com>
 <20190720080023.5279-2-vigneshr@ti.com>
 <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_053750_784455_3629F654 
X-CRM114-Status: GOOD (  25.27  )
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
Cc: yogeshnarayan.gaur@nxp.com, vigneshr@ti.com, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 25 Jul 2019 11:19:06 +0000
<Tudor.Ambarus@microchip.com> wrote:

> > + */
> > +static int spi_nor_exec_op(struct spi_nor *nor, struct spi_mem_op *op,
> > +			   u64 *addr, void *buf, size_t len)
> > +{
> > +	int ret;
> > +	bool usebouncebuf = false;  
> 
> I don't think we need a bounce buffer for regs. What is the maximum size that we
> read/write regs, SPI_NOR_MAX_CMD_SIZE(8)?
> 
> In spi-nor.c the maximum length that we pass to nor->read_reg()/write_reg() is
> SPI_NOR_MAX_ID_LEN(6).
> 
> I can provide a patch to always use nor->cmd_buf when reading/writing regs so
> you respin the series on top of it, if you feel the same.
> 
> With nor->cmd_buf this function will be reduced to the following:
> 
> static int spi_nor_spimem_xfer_reg(struct spi_nor *nor, struct spi_mem_op *op)
> {
> 	if (!op || (op->data.nbytes && !nor->cmd_buf))
> 		return -EINVAL;
> 
> 	return spi_mem_exec_op(nor->spimem, op);
> }

Well, I don't think that's a good idea. ->cmd_buf is an array in the
middle of the spi_nor struct, which means it won't be aligned on a
cache line and you'll have to be extra careful not to touch the spi_nor
fields when calling spi_mem_exec_op(). Might work, but I wouldn't take
the risk if I were you.

Another option would be to allocate ->cmd_buf with kmalloc() instead of
having it defined as a static array.

> 
> spi_nor_exec_op() always received a NULL addr, let's get rid of it. We won't
> need buf anymore and you can retrieve the length from op->data.nbytes. Now that
> we trimmed the arguments, I think I would get rid of the
> spi_nor_data/nodata_op() wrappers and use spi_nor_spimem_xfer_reg() directly.

I think I added the addr param for a good reason (probably to support
Octo mode cmds that take an address parameter). This being said, I
agree with you, we should just pass everything through the op parameter
(including the address if we ever need to add one).


> > +
> > +/**
> > + * spi_nor_spimem_xfer_data() - helper function to read/write data to
> > + *                              flash's memory region
> > + * @nor:        pointer to 'struct spi_nor'
> > + * @op:         pointer to 'struct spi_mem_op' template for transfer
> > + * @proto:      protocol to be used for transfer
> > + *
> > + * Return: number of bytes transferred on success, -errno otherwise
> > + */
> > +static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
> > +					struct spi_mem_op *op,
> > +					enum spi_nor_protocol proto)
> > +{
> > +	bool usebouncebuf = false;  
> 
> declare bool at the end to avoid stack padding.

But it breaks the reverse-xmas-tree formatting :-).

> 
> > +	void *rdbuf = NULL;
> > +	const void *buf;  
> 
> you can get rid of rdbuf and buf if you pass buf as argument.

Hm, passing the buffer to send data from/receive data into is already
part of the spi_mem_op definition process (which is done in the caller
of this func) so why bother passing an extra arg to the function.
Note that you had the exact opposite argument for the
spi_nor_spimem_xfer_reg() prototype you suggested above (which I
agree with BTW) :P.

> 
> > +	int ret;
> > +
> > +	/* get transfer protocols. */
> > +	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
> > +	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> > +	op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
> > +
> > +	if (op->data.dir == SPI_MEM_DATA_IN)
> > +		buf = op->data.buf.in;
> > +	else
> > +		buf = op->data.buf.out;
> > +
> > +	if (object_is_on_stack(buf) || !virt_addr_valid(buf))
> > +		usebouncebuf = true;
> > +
> > +	if (usebouncebuf) {
> > +		if (op->data.nbytes > nor->bouncebuf_size)
> > +			op->data.nbytes = nor->bouncebuf_size;
> > +
> > +		if (op->data.dir == SPI_MEM_DATA_IN) {
> > +			rdbuf = op->data.buf.in;
> > +			op->data.buf.in = nor->bouncebuf;
> > +		} else {
> > +			op->data.buf.out = nor->bouncebuf;
> > +			memcpy(nor->bouncebuf, buf,
> > +			       op->data.nbytes);
> > +		}
> > +	}
> > +
> > +	ret = spi_mem_adjust_op_size(nor->spimem, op);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = spi_mem_exec_op(nor->spimem, op);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
> > +		memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
> > +
> > +	return op->data.nbytes;
> > +}
> > +
> > +/**
> > + * spi_nor_spimem_read_data() - read data from flash's memory region via
> > + *                              spi-mem
> > + * @nor:        pointer to 'struct spi_nor'
> > + * @ofs:        offset to read from
> > + * @len:        number of bytes to read
> > + * @buf:        pointer to dst buffer
> > + *
> > + * Return: number of bytes read successfully, -errno otherwise
> > + */
> > +static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t ofs,  
> 
> s/ofs/from? both flash and buf may have offsets, "from" better indicates that
> the offset is associated with the flash.

The semantic is well documented in the doc just above the function, but
I have the feeling that you're in 'nitpick' mode, so I'll just let you
pick the one you prefer :).

> 
> > +					size_t len, u8 *buf)
> > +{
> > +	struct spi_mem_op op =
> > +		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> > +			   SPI_MEM_OP_ADDR(nor->addr_width, ofs, 1),
> > +			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> > +			   SPI_MEM_OP_DATA_IN(len, buf, 1));
> > +
> > +	op.dummy.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
> > +
> > +	/* convert the dummy cycles to the number of bytes */
> > +	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> > +
> > +	return spi_nor_spimem_xfer_data(nor, &op, nor->read_proto);  
> 
> stop passing nor->read_proto and do all buswidth initialization here. This way
> we'll keep the inits all gathered together, and will have the xfer() that will
> do just the transfer (with bouncebuffer if needed). Function that does a single
> thing.

Indeed, doesn't make sense to pass this info since it could be passed
through the op->data field.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
