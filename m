Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2B2C7618B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 14:00:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030972075E
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 14:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/DkUqYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030972075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqk8fXwpSqAhE6bvw4V8wTSyzU2XaiaiIS9Cq/ReZBA=; b=W/DkUqYUKqI9tZ
	HhVaez0uG3WsBL0uBDCOlgeR7bT5jSmatmx2zruhceLgVjTyaAoRqyqsEzy+9+r3F9DMvqw6EQpKH
	gy1dAf4Ezqm1u3CC92xMo/ShwhWiAnDoimDoO7E/sENoDwTNvZ+x2apaxNRF1fxRLWjaNhn1btr2/
	47p1t9OKs1Yzn5oksTsnzmQmiFV6aq/XC5Cl+JoJFQugdUUvl0KYykW8FsPFQoUiZS8bnAETWvGbR
	GDWKYnNmcwm1lQy17mkD6wAgiNi9taGl6PmBSb8eQDZNCT41byZBVm2dF5yPYhJ7OQ4UBy91DnpWJ
	eWtH4rBsVyuvxIp0NU0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqeIL-0005H6-Uu; Thu, 25 Jul 2019 14:00:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqeII-0005AR-Vm
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 14:00:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ECBEC28A131;
 Thu, 25 Jul 2019 15:00:28 +0100 (BST)
Date: Thu, 25 Jul 2019 16:00:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Message-ID: <20190725160025.2d8e24f8@collabora.com>
In-Reply-To: <dbb33973-bb6f-9a01-b821-693387aff98a@microchip.com>
References: <20190720080023.5279-1-vigneshr@ti.com>
 <20190720080023.5279-2-vigneshr@ti.com>
 <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
 <20190725143745.634efcd6@collabora.com>
 <dbb33973-bb6f-9a01-b821-693387aff98a@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_070031_299866_A7F18402 
X-CRM114-Status: GOOD (  28.77  )
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

On Thu, 25 Jul 2019 13:17:07 +0000
<Tudor.Ambarus@microchip.com> wrote:

> Hi, Boris,
> 
> On 07/25/2019 03:37 PM, Boris Brezillon wrote:
> > External E-Mail
> > 
> > 
> > On Thu, 25 Jul 2019 11:19:06 +0000
> > <Tudor.Ambarus@microchip.com> wrote:
> >   
> >>> + */
> >>> +static int spi_nor_exec_op(struct spi_nor *nor, struct spi_mem_op *op,
> >>> +			   u64 *addr, void *buf, size_t len)
> >>> +{
> >>> +	int ret;
> >>> +	bool usebouncebuf = false;    
> >>
> >> I don't think we need a bounce buffer for regs. What is the maximum size that we
> >> read/write regs, SPI_NOR_MAX_CMD_SIZE(8)?
> >>
> >> In spi-nor.c the maximum length that we pass to nor->read_reg()/write_reg() is
> >> SPI_NOR_MAX_ID_LEN(6).
> >>
> >> I can provide a patch to always use nor->cmd_buf when reading/writing regs so
> >> you respin the series on top of it, if you feel the same.
> >>
> >> With nor->cmd_buf this function will be reduced to the following:
> >>
> >> static int spi_nor_spimem_xfer_reg(struct spi_nor *nor, struct spi_mem_op *op)
> >> {
> >> 	if (!op || (op->data.nbytes && !nor->cmd_buf))
> >> 		return -EINVAL;
> >>
> >> 	return spi_mem_exec_op(nor->spimem, op);
> >> }  
> > 
> > Well, I don't think that's a good idea. ->cmd_buf is an array in the
> > middle of the spi_nor struct, which means it won't be aligned on a
> > cache line and you'll have to be extra careful not to touch the spi_nor
> > fields when calling spi_mem_exec_op(). Might work, but I wouldn't take
> > the risk if I were you.
> >   
> 
> u8 cmd_buf[SPI_NOR_MAX_CMD_SIZE] ____cacheline_aligned;
> 
> Does this help?

I guess you'll also need one on the following field to guarantee that
cmd_buf is covering the whole cache line. TBH, I really prefer the
option of allocating ->cmd_buf.

> 
> > Another option would be to allocate ->cmd_buf with kmalloc() instead of
> > having it defined as a static array.
> >   
> >>
> >> spi_nor_exec_op() always received a NULL addr, let's get rid of it. We won't
> >> need buf anymore and you can retrieve the length from op->data.nbytes. Now that
> >> we trimmed the arguments, I think I would get rid of the
> >> spi_nor_data/nodata_op() wrappers and use spi_nor_spimem_xfer_reg() directly.  
> > 
> > I think I added the addr param for a good reason (probably to support
> > Octo mode cmds that take an address parameter). This being said, I
> > agree with you, we should just pass everything through the op parameter
> > (including the address if we ever need to add one).
> > 
> >   
> >>> +
> >>> +/**
> >>> + * spi_nor_spimem_xfer_data() - helper function to read/write data to
> >>> + *                              flash's memory region
> >>> + * @nor:        pointer to 'struct spi_nor'
> >>> + * @op:         pointer to 'struct spi_mem_op' template for transfer
> >>> + * @proto:      protocol to be used for transfer
> >>> + *
> >>> + * Return: number of bytes transferred on success, -errno otherwise
> >>> + */
> >>> +static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
> >>> +					struct spi_mem_op *op,
> >>> +					enum spi_nor_protocol proto)
> >>> +{
> >>> +	bool usebouncebuf = false;    
> >>
> >> declare bool at the end to avoid stack padding.  
> > 
> > But it breaks the reverse-xmas-tree formatting :-).
> >   
> >>  
> >>> +	void *rdbuf = NULL;
> >>> +	const void *buf;    
> >>
> >> you can get rid of rdbuf and buf if you pass buf as argument.  
> > 
> > Hm, passing the buffer to send data from/receive data into is already
> > part of the spi_mem_op definition process (which is done in the caller
> > of this func) so why bother passing an extra arg to the function.
> > Note that you had the exact opposite argument for the
> > spi_nor_spimem_xfer_reg() prototype you suggested above (which I
> > agree with BTW) :P.  
> 
> In order to avoid if clauses like "if (op->data.dir == SPI_MEM_DATA_IN)". You
> can't use op->data.buf directly, the *out const qualifier can be discarded.

Not entirely sure why you think this is important to avoid that
test (looks like a micro-optimization to me), but if you really want to
have a non-const buffer, just use the one pointed by op->data.buf.in
(buf is a union so both in and out point to the same thing). Note that
we'd need a comment explaining why this is safe to do that, because
bypassing constness constraints is usually a bad thing.

> 
> pointer to buf was not needed in spi_nor_spimem_xfer_reg(), we could use
> nor->cmd_buf.

Do you mean that callers of spi_nor_spimem_xfer_data() should put data
into/read from ->cmd_buf and let spi_nor_spimem_xfer_data() assign
op->data.buf.{in,out} to ->cmd_buf?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
