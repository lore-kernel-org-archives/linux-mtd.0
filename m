Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD89C43460
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 13:50:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BFAD611AB
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 13:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BFAD611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UK63l86hCCXFcW4A+idbkJhTMIAMem9GJuk6znP70UE=; b=DTkH7lP1XtAW/0fQbrK4LM0BtV
	Z0lm4L7jpIycCFsn6V5pYfsY1lyfuOU5N4U9L1ws+gMQQFBzpSVmdR5Der17xgI2NEFhX5b/nAgS2
	XvDDucR58hC7rD1ZDYXWf7kkfDW8V8ichxQRQqU8iFGqS1WPMEhoz5ndiRlaOW3WhN8QDh6QdEVjb
	HjMiv3ZLD4EOWHdDefeo+X2ErYVMqbtwnCOfwLTzA8+fZF+jgACe7fwTY6aQpP0cfLKA4WilErEUZ
	9H830rEcl/VgGXw7kmuq/p8diFA9AAiE4gPMkUipH/xse1X569wuZ/+l5vHP9G0qqtfj63wqbqwhQ
	yhF2dqWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljj3h-001H6y-RM; Thu, 20 May 2021 13:49:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljj3f-001H6N-5V
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 13:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HAl4y4eVQnB9w2SfzyriV7XRIquVjfN0hPBU2FtBsDY=; b=wBKmwGKg81lZYWIGjYOT2gyBAw
 6YIpnirXYVvmMxWn3+kgoHxc5ouZrKaEau65JVuxBuFk+ouROlx+5mzPfEjK7tp41uHHlz/ogl1gl
 rEy7QqopupoYG2JxWXV6mnMBsVWhEnEgT8OzsG0Z0bsCtzWKQ9DTVK2ez1POhilrXb+f+qotHqSfB
 XBESKd/1uR6LGzAjjIx8+4hd/YXX3lXKGPTpBopfeFMwpUzAFJCoJdVXmKK9g5dkshCBCjoir7Gqa
 QmAv5e6fzgUaZLWO56zDpBF5MO7jy9s9NSA41cEFN89PDWFzYZ3tOa4PYXcBgzmmqr7qdVFVnkAcz
 UAyHmUQQ==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljj3b-00GNx5-EH
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 13:49:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KDniNj041166;
 Thu, 20 May 2021 08:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621518584;
 bh=HAl4y4eVQnB9w2SfzyriV7XRIquVjfN0hPBU2FtBsDY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=VUsViZwwLmnog8JBhbB2dqBuQ1OpESGtqqfGLiXET8ogjYlhNf+qlkqeL0MY4P1aR
 3cz8ExjW6UHgBmMgy/KKIggWn7u9nh7VDGl+JSIevKhk8ai6fD2zmEWpoYpcS/sCId
 ryACSP913aRRVNvmXkaWUwOgIDVfcfAq+2k9wkAQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KDniM1056196
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 May 2021 08:49:44 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 08:49:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 08:49:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KDnhwt109158;
 Thu, 20 May 2021 08:49:43 -0500
Date: Thu, 20 May 2021 19:19:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: implement OTP erase for Winbond and
 similar flashes
Message-ID: <20210520134940.fpyt52mwpdotrp4a@ti.com>
References: <20210510202056.30000-1-michael@walle.cc>
 <20210520122256.fhkzpqmu7nxwjoqt@ti.com>
 <20a7e9725d54c9566ca06c062c15f015@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20a7e9725d54c9566ca06c062c15f015@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_064947_595913_DC7F8BCB 
X-CRM114-Status: GOOD (  74.05  )
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

On 20/05/21 03:20PM, Michael Walle wrote:
> Hi Pratyush,
> 
> Am 2021-05-20 14:22, schrieb Pratyush Yadav:
> > On 10/05/21 10:20PM, Michael Walle wrote:
> > > Winbond flashes with OTP support provide a command to erase the OTP
> > > data. This might come in handy during development.
> > 
> > I am not very familiar with the OTP feature. It is supposed to be "One
> > Time Programmable". So does erasing the OTP area make it programmable
> > again? Or it just erases the data and then the OTP region will forever
> > be 0xff?
> 
> Its programmable and erasable until a lock bit is set, then you can't
> program or erase it anymore. So nowadays it isn't really OTP..
> 
> > Because if you can erase and reprogram it, how is it OTP at all?
> 
> Well, it isn't. Thus there wasn't an erase operation in the first
> place. But Tudor found it useful. Not sure if that applies to all
> SPI flashes, though.
> 
> See also
> https://lore.kernel.org/linux-mtd/d4f74b1b-fa1b-97ec-858c-d807fe1f9e57@microchip.com/

Right. I remember seeing this. I was just curious how this whole system 
is supposed to work.

> 
> > > This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
> > > NXP FSPI controller.
> > 
> > I got the datasheet for this flash from
> > https://www.elinux.org/images/f/f5/Winbond-w25q32.pdf but it doesn't
> > seem to mention the erase OTP command (0x44).
> 
> That seems to be an ancient flash, note it doesn't have any suffix.
> 
> https://www.winbond.com/resource-files/W25Q32JW%20SPI%20RevH%2003172020%20Plus.pdf

Thanks.

> 
> > > Signed-off-by: Michael Walle <michael@walle.cc>
> > > ---
> > > Changes since v1:
> > >  - fixed kernel doc
> > > 
> > > There is also a patch for mtd-utils to add a small tool to issue
> > > the erase:
> > > https://lore.kernel.org/linux-mtd/20210510201319.25975-1-michael@walle.cc/
> > > 
> > >  drivers/mtd/spi-nor/core.c    |  4 +-
> > >  drivers/mtd/spi-nor/core.h    |  4 ++
> > >  drivers/mtd/spi-nor/otp.c     | 73
> > > ++++++++++++++++++++++++++++++++++-
> > >  drivers/mtd/spi-nor/winbond.c |  1 +
> > >  4 files changed, 78 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > > index bd2c7717eb10..fac8717f651f 100644
> > > --- a/drivers/mtd/spi-nor/core.c
> > > +++ b/drivers/mtd/spi-nor/core.c
> > > @@ -166,8 +166,8 @@ static int
> > > spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
> > >  	return nor->controller_ops->read_reg(nor, opcode, buf, len);
> > >  }
> > > 
> > > -static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8
> > > opcode,
> > > -					    const u8 *buf, size_t len)
> > > +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> > > +				     const u8 *buf, size_t len)
> > >  {
> > >  	if (spi_nor_protocol_is_dtr(nor->reg_proto))
> > >  		return -EOPNOTSUPP;
> > > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > > index 28a2e0be97a3..b410e4eec2fb 100644
> > > --- a/drivers/mtd/spi-nor/core.h
> > > +++ b/drivers/mtd/spi-nor/core.h
> > > @@ -214,6 +214,7 @@ struct spi_nor_otp_ops {
> > >  	int (*write)(struct spi_nor *nor, loff_t addr, size_t len,
> > >  		     const u8 *buf);
> > >  	int (*lock)(struct spi_nor *nor, unsigned int region);
> > > +	int (*erase)(struct spi_nor *nor, loff_t addr);
> > 
> > No doc update above?
> 
> Missed that.
> 
> > >  	int (*is_locked)(struct spi_nor *nor, unsigned int region);
> > >  };
> > > 
> > > @@ -481,6 +482,8 @@ extern const struct spi_nor_manufacturer
> > > spi_nor_xmc;
> > >  void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> > >  			     struct spi_mem_op *op,
> > >  			     const enum spi_nor_protocol proto);
> > > +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> > > +				     const u8 *buf, size_t len);
> > >  int spi_nor_write_enable(struct spi_nor *nor);
> > >  int spi_nor_write_disable(struct spi_nor *nor);
> > >  int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
> > > @@ -507,6 +510,7 @@ ssize_t spi_nor_write_data(struct spi_nor *nor,
> > > loff_t to, size_t len,
> > >  int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t
> > > len, u8 *buf);
> > >  int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t
> > > len,
> > >  			   const u8 *buf);
> > > +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr);
> > >  int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
> > >  int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int
> > > region);
> > > 
> > > diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> > > index 61036c716abb..d3ca73c8cc53 100644
> > > --- a/drivers/mtd/spi-nor/otp.c
> > > +++ b/drivers/mtd/spi-nor/otp.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/log2.h>
> > >  #include <linux/mtd/mtd.h>
> > >  #include <linux/mtd/spi-nor.h>
> > > +#include <linux/spi/spi-mem.h>
> > > 
> > >  #include "core.h"
> > > 
> > > @@ -111,6 +112,48 @@ int spi_nor_otp_write_secr(struct spi_nor *nor,
> > > loff_t addr, size_t len,
> > >  	return ret ?: written;
> > >  }
> > > 
> > > +/**
> > > + * spi_nor_otp_erase_secr() - erase one OTP region
> > 
> > Nitpick: The function is called erase_secr() but the comment says erase
> > region. Please use consistent wording.
> 
> Ok, will stick to the wording of the datasheet (which sounds quite odd,
> because
> its "security register"). This also applies to the read, write and lock.

Ah, its "security register". I thought it was an unusual way to shorten 
sector (sect is the more common one I've seen).

> 
> > 
> > > + * @nor:        pointer to 'struct spi_nor'
> > > + * @addr:       offset of the OTP region to be erased
> > > + *
> > > + * Erase one OTP region by using the SPINOR_OP_ESECR commands. This
> > > method is
> > > + * used on GigaDevice and Winbond flashes.
> > > + *
> > > + * Return: 0 on success, -errno otherwise
> > > + */
> > > +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = spi_nor_write_enable(nor);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (nor->spimem) {
> > > +		struct spi_mem_op op =
> > > +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_ESECR, 0),
> > > +				   SPI_MEM_OP_ADDR(3, addr, 0),
> > 
> > Only 3 address bytes needed? Can the OTP region ever require 4 byte
> > addressing? For example, say the flash is switched to 4 byte addressing
> > for the main region. Would it still expect 3 byte addressing for OTP
> > ops?
> 
> It seems you're right. Looking at larger flashes there are sometimes
> 4 bytes. See for example ch 8.2.44
> 
> https://www.winbond.com/resource-files/w25m512jwxiq%20spi%20rev%20c%2012242018.pdf
> 
> Thus it seems it should be fixed for the programming and reading,
> too. Unfortunately, I cannot test any of this.

I don't think any such flash is supported currently, right? So in that 
case we won't at least introduce any new regressions when making this 
untested change. Whenever someone adds support for one of these flashes, 
we can ask them to test this as well.

> 
> > > +				   SPI_MEM_OP_NO_DUMMY,
> > > +				   SPI_MEM_OP_NO_DATA);
> > > +
> > > +		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> > > +
> > > +		ret = spi_mem_exec_op(nor->spimem, &op);
> > > +	} else {
> > > +		nor->bouncebuf[2] = addr & 0xff;
> > > +		nor->bouncebuf[1] = (addr >> 8) & 0xff;
> > > +		nor->bouncebuf[0] = (addr >> 16) & 0xff;
> > > +
> > > +		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_ESECR,
> > > +						       nor->bouncebuf, 3);
> > 
> > Huh, sending address in the "data" parameter of write_reg() is strange.
> > Wouldn't you be better off using spi_nor_controller_ops_erase()? It is
> > an erase operation anyway so it should be the natural choice.
> 
> Its the same as in spi_nor_erase_sector() if there is no
> spi_nor_controller_ops_erase(). spi_nor_controller_ops_erase() is
> just for erasing a sector (thus I'd assume it implies SPINOR_OP_SE).
> 
> Hm.. I should have read on.
> 
> > This was my first thought anyway. Then I looked at
> > spi_nor_erase_sector(). It looks like controller_ops->erase is optional,
> > and the fallback is this same technique.
> > 
> > I see a lot of similarities between this function and
> > spi_nor_erase_sector(). So you can just swap out nor->erase_opcode and
> > nor->addr_width and call that. I am not the biggest fan of this approach
> > but it is widely used in the core so it should be fine. In fact, OTP
> > read and write also use this approach.
> 
> Ok, agreed on both points. This should also solve the "4 byte mode"
> problem, that is, just don't set addr_width.
> 
> > > +	}
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return spi_nor_wait_till_ready(nor);
> > > +}
> > > +
> > >  static int spi_nor_otp_lock_bit_cr(unsigned int region)
> > >  {
> > >  	static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
> > > @@ -316,12 +359,14 @@ static int spi_nor_mtd_otp_write(struct
> > > mtd_info *mtd, loff_t to, size_t len,
> > >  	return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
> > >  }
> > > 
> > > -static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from,
> > > size_t len)
> > > +static int spi_nor_mtd_otp_lock_erase(struct mtd_info *mtd, loff_t
> > > from,
> > 
> > spi_nor_mtd_otp_lock_or_erase()? Or would it make it too long?
> 
> I'm fine with both, its just that the read/write doesn't have an
> "or" neither ;)
> 
> > Anyway, maybe I am bikeshedding too much, but I don't like that you
> > combine two completely independent operations into the same function
> > because they have some common parts. You should make them two separate
> > functions and see how many of the common parts can be split into
> > independent subroutines.
> 
> Given that the whole boilerplate before and after the erase/lock is
> exactly the same, even the while loop is the same, I don't see how
> it can easily be split. Well, you could rename the function to some
> generic spi_nor_mtd_walk() - which would imply it might also be
> used for read/write, which is not true - and provide a callback
> function. But I don't see how this is would make it easier to read.
> And this is just an implemention local to this module.

My suggestion was to make two copies of the same code, and then see if 
you can consolidate some in a clean subroutine. If that is not possible, 
then you can just leave the code duplicated in two places. It is not 
that much duplication so it should be fine IMO.

But I won't press too much on this point. I will leave it to your 
judgement on what works better. Just want to make sure you understand my 
point completely.

> 
> > > +				      size_t len, bool is_erase)
> > >  {
> > >  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> > >  	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
> > >  	const size_t rlen = spi_nor_otp_region_len(nor);
> > >  	unsigned int region;
> > > +	loff_t rstart;
> > >  	int ret;
> > > 
> > >  	if (from < 0 || (from + len) > spi_nor_otp_size(nor))
> > > @@ -337,7 +382,13 @@ static int spi_nor_mtd_otp_lock(struct mtd_info
> > > *mtd, loff_t from, size_t len)
> > > 
> > >  	while (len) {
> > >  		region = spi_nor_otp_offset_to_region(nor, from);
> > > -		ret = ops->lock(nor, region);
> > > +
> > > +		if (is_erase) {
> > > +			rstart = spi_nor_otp_region_start(nor, region);
> > > +			ret = ops->erase(nor, rstart);
> > 
> > This further highlights my point. There are subtle differences between
> > erase and lock and having them in the same function might not be the
> > best idea.
> > 
> > > +		} else {
> > > +			ret = ops->lock(nor, region);
> > > +		}
> > >  		if (ret)
> > >  			goto out;
> > > 
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
