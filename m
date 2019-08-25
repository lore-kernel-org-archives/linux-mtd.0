Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD62AC3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:52:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C29206E0
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UDRQhSFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C29206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqY71mPLQW7ny00qWZEoUHrjWqCeKQVAa3k5ynk2XCM=; b=UDRQhSFU+JqSDB
	lR2osx+vb0Kkw4YQE5Ic4Flki4CY2UwwKWwG7BnzycNuY/cGpJdPrWb2ezAq2K0Cn0PTCXEwlXI5y
	mXWq15DMYpLoE6WFsV3JBfpjY2mPguED/YxWcA1XfyeFOEsjkOCF3OAuiSwnOhqZ6eeYipp3sTIf/
	A8i9pnVta//lantxkKLmihOTjwfM6yxk9I+4LJGqVwiz2vAun7V7oIvtAMIneKljmY2wciNwW19eL
	wHn75vX0BoR7KQ5liu4oEEIsQ9ZzyZtApE9vlP5M/83BM2cG2QAaIMgoJu1ueLCTXW99CBOae5c1o
	PtGWbS687CfFQqsyZyEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1rzp-0008H2-Lu; Sun, 25 Aug 2019 12:51:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1rzm-0008Gg-5p
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 12:51:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B932C28A1AB;
 Sun, 25 Aug 2019 13:51:44 +0100 (BST)
Date: Sun, 25 Aug 2019 14:51:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 4/7] mtd: spi-nor: Split spi_nor_init_params()
Message-ID: <20190825145141.71a647ab@collabora.com>
In-Reply-To: <78202b39-1c40-dbaa-3ebc-3481ecbe4643@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
 <20190824120027.14452-5-tudor.ambarus@microchip.com>
 <20190825140302.21ca2623@collabora.com>
 <78202b39-1c40-dbaa-3ebc-3481ecbe4643@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_055146_487348_A8177375 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 25 Aug 2019 12:23:45 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 08/25/2019 03:03 PM, Boris Brezillon wrote:
> > External E-Mail
> > 
> > 
> > On Sat, 24 Aug 2019 12:00:43 +0000
> > <Tudor.Ambarus@microchip.com> wrote:
> >   
> >> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>
> >> Add functions to delimit what the chunks of code do:
> >>
> >> static void spi_nor_init_params()
> >> {
> >> 	spi_nor_legacy_init_params()
> >> 	spi_nor_manufacturer_init_params()
> >> 	spi_nor_sfdp_init_params()
> >> }
> >>
> >> Add descriptions to all methods.
> >>
> >> spi_nor_init_params() becomes of type void, as all its children
> >> return void.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/spi-nor.c | 83 ++++++++++++++++++++++++++++++++-----------
> >>  1 file changed, 63 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >> index c9514dfd7d6d..93424f914159 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -4186,7 +4186,34 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
> >>  		nor->info->fixups->default_init(nor);
> >>  }
> >>  
> >> -static int spi_nor_init_params(struct spi_nor *nor)
> >> +/**
> >> + * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
> >> + * based on JESD216 SFDP standard.
> >> + * @nor:	pointer to a 'struct spi-nor'.
> >> + *
> >> + * The method has a roll-back mechanism: in case the SFDP parsing fails, the
> >> + * legacy flash parameters and settings will be restored.
> >> + */
> >> +static void spi_nor_sfdp_init_params(struct spi_nor *nor)
> >> +{
> >> +	struct spi_nor_flash_parameter sfdp_params;
> >> +
> >> +	memcpy(&sfdp_params, &nor->params, sizeof(sfdp_params));
> >> +
> >> +	if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> >> +		nor->addr_width = 0;
> >> +		nor->flags &= ~SNOR_F_4B_OPCODES;
> >> +	} else {
> >> +		memcpy(&nor->params, &sfdp_params, sizeof(nor->params));
> >> +	}
> >> +}
> >> +
> >> +/**
> >> + * spi_nor_legacy_init_params() - Initialize the flash's parameters and settings
> >> + * based on nor->info data.
> >> + * @nor:	pointer to a 'struct spi-nor'.
> >> + */
> >> +static void spi_nor_legacy_init_params(struct spi_nor *nor)  
> > 
> > Nitpick: hm, I'm not a big fan of the 'legacy' term here as I'm not sure
> > it reflects the reality. I guess this function will stay around, and
> > even new NORs are not guaranteed to provide SFDP tables. How about
> > spi_nor_set_default_params() or spi_nor_info_init_params()?  
> 
> I can rename it to spi_nor_info_init_params() to be in sync with
>                    spi_nor_manufacturer_init_params() and
>                    spi_nor_sfdp_init_params()
> 
> or I can rename all to:
> spi_nor_set_params()
> spi_nor_set_default_params()
> spi_nor_set_manufacturer_params()
> spi_nor_set_sfdp_params()
> 
> Both are ok, but the second option seems better. What would you choose?

Both sound good, pick the one you prefer.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
