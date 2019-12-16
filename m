Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAA9C3F68F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 10:30:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C25206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 10:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sRZRvVuE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="dFQ0qLp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91C25206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QabbrwD+D7Ozm20fQ1Uu8Hs6h3l9F26GSCBrXOoUhAM=; b=sRZRvVuECq2gMkCdkNfswH9/f
	42LJrGv25oh9RNLH9mq6aB3MrJyu7W7gXmuv6K/UCalOmiWvW7VjBk9LNomJpkx/ap7J6PVlMjwfu
	MQoFZ7ju6KWucnZT5e6ec/bsqPK7MmkE3CsmawJUn0XGiJrjM6LvWy28RD98ZwZWOoVFjw2mEs7aG
	Ns6Jn8I9dcWBa3tcSdkhiTsxf2su6irmDVNkiCw/qlKEU9TvzEcRNtPjCX2GFe27d4ayDuQEZ5nOn
	TfZhW17nkm9O2piY2TzYd9hI1acOZIx6Hvjh5UcyuEAmiUaV1wCnybuWzEDrqmdTjGO0c/aDAsdRq
	D8E0VoJ4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igndi-0007Bc-6B; Mon, 16 Dec 2019 10:30:10 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igndd-00063H-BL
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 10:30:07 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 018D122FE5;
 Mon, 16 Dec 2019 11:29:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1576492195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4kAjv7YRRzabrvv/6fAB8ptr1Y7vtGS1qtFHYNcntg=;
 b=dFQ0qLp8tLxtrzaf8lnp3rj7WZ0UbGT8K1ogwps/IdyDRNOfTy9wV2f6wyfjoxFxxBO/c7
 F3xUHOZSXl4Dh67exbCyhfjlR7Ge9LFFIZ3rD58nk6ZvgmLXRbpm9zCtwvaBhEJUNFMkFB
 cFG3ygRFOlPb+gBH5n7LRcCh0BstI9w=
MIME-Version: 1.0
Date: Mon, 16 Dec 2019 11:29:52 +0100
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: document new flag
In-Reply-To: <556fe468-0080-ad05-8228-5ff8f1b3dac6@ti.com>
References: <20191214191943.3679-1-michael@walle.cc>
 <556fe468-0080-ad05-8228-5ff8f1b3dac6@ti.com>
Message-ID: <af3692dba69e85fa8136ab3d170bef39@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 018D122FE5
X-Spamd-Result: default: False [1.40 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[dt];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; NEURAL_HAM(-0.00)[-0.678];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_023005_739490_CDDAA23C 
X-CRM114-Status: GOOD (  25.77  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2019-12-16 09:54, schrieb Vignesh Raghavendra:
> Hi,
> 
> On 15/12/19 12:49 am, Michael Walle wrote:
>> Document the new flag "no-unlock".
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> Does the property need a prefix? I couldn't find any hint. If so, what
>> should it be? "m25p," or "spi-nor," ?
>> 
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt 
>> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> index f03be904d3c2..2d305c893ed7 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> @@ -78,6 +78,12 @@ Optional properties:
>>  		   cannot reboot properly if the flash is left in the "wrong"
>>  		   state. This boolean flag can be used on such systems, to
>>  		   denote the absence of a reliable reset mechanism.
>> +- no-unlock : By default, linux unlocks the whole flash because there
>> +		   are legacy flash devices which are locked by default
>> +		   after reset. Set this flag if you don't want linux to
>> +		   unlock the whole flash automatically. In this case you
>> +		   can control the non-volatile bits by the
>> +		   flash_lock/flash_unlock tools.
>> 
> 
> Current SPI NOR framework unconditionally unlocks entire flash which
> I agree is not the best thing to do, but I don't think we need
> new DT property here. MTD cmdline partitions and DT partitions already
> provide a way to specify that a partition should remain locked[1][2]

I know that the MTD layer has the same kind of unlocking. But that
unlocking is done on a per mtd partition basis. Eg. consider something
like the following

  mtd1 bootloader  (locked)
  mtd2 firmware    (locked)
  mtd3 kernel
  mtd4 environment

Further assume, that the end of mtd2 aligns with one of the possible
locking areas which are supported by the flash chip. Eg. the first 
quarter.

The mtd layer would do two (or four, if "lock" property is set) unlock()
calls, one for mtd1 and one for mtd2.

My point here is, that the mtd partitions doesn't always map to the
locking regions of the SPI flash (at least if the are not merged 
together).

> SPI NOR framework should instead set MTD_POWERUP_LOCK flags in 
> mtd->flags
> for flash devices that power up with lock bits set. And MTD core will
> take care of unlocking flash regions while taking into account 
> partition
> flags defined by user as part of MTD partitions defined in DT or
> via cmdline args.
> 
> So that change should to be set MTD_POWERUP_LOCK for
> in SPI NOR core. Can you check below[3] (untested) diff helps?
> This should prevent unlocking partitions that are to remain locked
> as specified in DT/cmdline

As this change may help my use-case, unlocking is skipped because the
partitions are marked as read only; I fear that the old behaviour will
change. See above.

Mhh. thinking more about it, doesn't the calls also wear out the
non-volatile bits in the NOR flash?

In any case, I'll try your suggestion.

-michael

> 
> [1] Documentation/devicetree/bindings/mtd/partition.txt
> [2] drivers/mtd/parsers/cmdlinepart.c (see "lk" parameter)
> 
> [3]
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c 
> b/drivers/mtd/spi-nor/spi-nor.c
> index 1082b6bb1393..6adb950849f6 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -4914,23 +4914,6 @@ static int spi_nor_quad_enable(struct spi_nor 
> *nor)
>  	return nor->params.quad_enable(nor);
>  }
> 
> -/**
> - * spi_nor_unlock_all() - Unlocks the entire flash memory array.
> - * @nor:	pointer to a 'struct spi_nor'.
> - *
> - * Some SPI NOR flashes are write protected by default after a 
> power-on reset
> - * cycle, in order to avoid inadvertent writes during power-up. 
> Backward
> - * compatibility imposes to unlock the entire flash memory array at 
> power-up
> - * by default.
> - */
> -static int spi_nor_unlock_all(struct spi_nor *nor)
> -{
> -	if (nor->flags & SNOR_F_HAS_LOCK)
> -		return spi_nor_unlock(&nor->mtd, 0, nor->params.size);
> -
> -	return 0;
> -}
> -
>  static int spi_nor_init(struct spi_nor *nor)
>  {
>  	int err;
> @@ -4941,11 +4924,11 @@ static int spi_nor_init(struct spi_nor *nor)
>  		return err;
>  	}
> 
> -	err = spi_nor_unlock_all(nor);
> -	if (err) {
> -		dev_dbg(nor->dev, "Failed to unlock the entire flash memory 
> array\n");
> -		return err;
> -	}
> +	/*
> +	 * Flashes may power up locked. Set this flag so that MTD core
> +	 * takes care of unlocking partitions as required.
> +	 */
> +	nor->mtd.flags |= MTD_POWERUP_LOCK;
> 
>  	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
>  		/*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
