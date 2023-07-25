Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF273C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k4UDSgfknqPJ7LWgXCgTGXs+WTDVQzOYL0UfaA7G2g=; b=cyblCbhyMhl1f6E8LcsZNZhG5U
	wYPeFuWQXW3bRInQmge+0QeyoDRDgL4fNU6jSj1eU7caKurtMmd6CnB4no3yPYZneOWsZa65gZ13s
	Na/ZQBiYxeiez1CyTz1ZMo+vNEbWXpkjPUQQWtFaMYn68+pmbyCpppm/szum/XxRXIMEjI/xlEWge
	ylLpzPup8gtdSgD1JkvDo41WC+zkUJ8nVl7HqJrGYS6M08ndUviMCBckDDxSVlnMnRViGTszy6r3Z
	UD9qJAF09o1+joZRCRQktTJOqULKghMGm9P2uvacNmk6PjtyxAgok36KBmY0OUQDLal9pTWclzuor
	vA7kLbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOELB-006w6F-0A;
	Tue, 25 Jul 2023 09:28:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEL8-006w3c-1d
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 09:28:24 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BE2E5A57;
	Tue, 25 Jul 2023 11:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690277298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkTrErNYhpOag/Xtq5gQcvWjyWNjDyMxinVj4au4DRA=;
	b=zLRyJlxAuMpJKzBT2gs0KM4Krvpfqw3pKAjd0PuSK1z4aIDBLd7Hq5UoERLVy5I0bSKz9J
	tpMe7+QTr2sTwozay2lcBlsXabt6/9YEKd/q7vbFLetvTy2g1Gd3rgZCNvwy5Ol2W8933S
	50oBik5vF/kYMeDdKw1wcfT4Lc2DuVnnZ8iSssuHV1kq4gxiNiGyQZeLZZF+e7Y5WrrDmH
	WxADigVYWbnbQMjpNddixtIz774z//p21tULUminjqCplvgHsfy3EvJHge/hssRnf3Xxua
	by5XY4CJ4gJNidFPbIgnzhhSxWk0lMGsaUDmEytF0Z+4tOn7gnbtKqmWiWPtzA==
MIME-Version: 1.0
Date: Tue, 25 Jul 2023 11:28:18 +0200
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
Subject: Re: [PATCH v1 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
In-Reply-To: <CAAQoYRnfEEtRhVcWXAyokgS1G8fGsMhvUfoe6PcuVBEQ8sW2Hg@mail.gmail.com>
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-2-jaimeliao.tw@gmail.com>
 <0acced240c27dd34cf1348ac4a24dba3@walle.cc>
 <CAAQoYRnfEEtRhVcWXAyokgS1G8fGsMhvUfoe6PcuVBEQ8sW2Hg@mail.gmail.com>
Message-ID: <84c5907c5f1b31fd97a4974a702cfabd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_022822_699637_90154FA1 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

>> You write "We" in your next patch. "We" as in macronix? Then please
>> use your macronix email address for the patches. Please note, you
>> can still send them through your gmail account.
> Yes I am Macronix engineer and sorry for the company mail
> issue so that I can't send and reply patch on Macronix mail.

Thus I was saying that you should use the macronix mail for the
patch author and the SoB and send your mails with your gmail
account (git will take care of the difference).

>> While cleaning up the flash_info db I come around this and it is
>> copied all over the place. Please work on factoring this (also the
>> other code in micron-st.c and spansion.c) out into a helper.
> Let me clearify the data order for read ID on Macronix flashes.
> Read ID
> SPI mode : c2-84-3c-c2-84-3c
> OPI DTR mode : c2-c2-84-84-3c-3c

So you are basically duplicating the id bytes in DTR mode. The same
byte is transferred both on the falling and rising edge of a clock
cycle. I think this needs further changes to the core. I means that
if the core will do a rdid in octal mode, it returns "garbage" for
now.

How is the data transferred in octal DTR mode? Reading the same data
in SPI and octal DTR mode should return the exact same bytes.

So one test would be to use the flash in SPI mode, write some data,
enable octal DTR mode and read it back and compare it. They must
match.

> So that I create a specify judement for checking ID via 8D-8D-8D
> on Macronix flash.

No, please make it a common helper for all flashes.

>> > +     op = (struct spi_mem_op)
>> > +             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
>> > +                        SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
>> > +                        SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
>> > +                        SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
>> > +
>> > +     if (enable)
>> > +             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>> > +
>> > +     ret = spi_mem_exec_op(nor->spimem, &op);
>> > +     if (ret)
>> > +             return ret;
>> > +
>> > +     if (enable) {
>> > +             for (i = 0; i < nor->info->id_len; i++)
>> > +                     if (buf[i * 2] != nor->info->id[i])
>> > +                             return -EINVAL;
>> 
>> Why is the ID now swapped? Doesn't look right.
> Actullay 6 bytes data are c2-c2-84-84-3c-3c which are got by 8D-8D-8D 
> read id
> on Macronix flash.

See above.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
