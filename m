Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF50CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj28u3jORogBNvf1jhIyz1k685YoNss6zQ89ftFHb74=; b=NwSfD5f/ailLxQa2Acgf/pG5N8
	O8TpXETC+8rJkTBcIr7kpb3z/OwIa5E381muUgnB33S+L4JFoZFm9VETp+oHY7rXBytP5ZGY5IV9n
	L6699JkX8kksiVhsJYaouZbI5rsMTO1UYop/W1hysQoX8fwP3HWJgy8HOBxAww17UwvvzJFmlSab3
	3bYhgBFq9z37h4pq08b51123Vm7BNHKR2dE0va2P8cdlas8oWP/mJqPamiIAj5YpmELyI+1REjjoj
	578ETqjQtBaICtvdpvoL/qErZg4MJFA661NIxmDQwYaL6ZO11j218CGIaR59vrlP7q/82hhVvWBeh
	/2yXcUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrhm-000K5X-0Y;
	Thu, 12 Oct 2023 09:10:06 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrhh-000K42-2Q
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 09:10:04 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7AD5D5E8;
	Thu, 12 Oct 2023 11:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1697101795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VeoSUfuRgn8xJ4ZHuVid0DPFRcqKLMgBLMh6hcZTKo=;
	b=oOJn704IeBsJswgjeF3YqAIG2kRvFokmfqR6xDbJYiylFz9QObyY4fB3MQW88jXUF2uGVb
	hgOzTX9fXUp7peJQrQSAzvMv1LSXotNFkRRJkUYfDBuAwP9rB01Tu/l7qVPV18qHxKLpMw
	aBjLvAW9CfrG6SNW63lReqwanGnejHTeJ3PsQOVBpcFW2gmPYruqENGF/DwAou3EPyau7i
	oyysexnrgoUplgcACa/zqHHnsHWIDpiU6Knj1V2MBf8ykOMv/5/hzjSZpDQIK9YU5/EXJY
	6H1bTD2Esxf8LanQFseH2LdmE9Qlizuo6IFDqq+bAvPdj4bzGy1oWVz5PcRqxw==
MIME-Version: 1.0
Date: Thu, 12 Oct 2023 11:09:55 +0200
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
In-Reply-To: <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com>
 <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org>
 <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org>
 <cdd8fb4d9261892345588388a5de262f@walle.cc>
 <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
Message-ID: <5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_021002_083476_B1A5CB04 
X-CRM114-Status: GOOD (  25.55  )
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

>> >>>>>> I see this flash supports 1-1-1, 8-8-8, and 8d-8d-8d, there are no
>> >>>>>> mixed
>> >>>>>> modes supported, thus a 8d-8d-8s mode seems just like a hardware
>> >>>>>> bug to
>> >>>>>> me. So my proposal is to leave the core away and to handle the
>> >>>>>> read id
>> >>>>>> hack just in the macronix driver.
>> >>>>>
>> >>>>> +1
>> >>>>
>> >>>> I've looked at the xspi spec. There is no RDID specified. So I'd
>> >>>> argue,
>> >>>> the only pseudo standard is that RDID was only ever used with
>> >>>> 1s1s1s.
>> >>>> But
>> >>>> we added spi_nor_read_id() with parameters suited for the "unusual"
>> >>>> 8d8d8d
>> >>>> case with additional address and dummy cycles. Just for checking
>> >>>> whether
>> >>>> the
>> >>>> octal-dtr switch was successful. Therefore, we've already added
>> >>>> parameters to
>> >>>> spi_nor_read_id() which are not standard. Then we can just add one
>> >>>> more.
>> >>>> It's
>> >>>> just how macronix is doing it. Again there is no standard.
>> >>>> If we'd only put standard (or for the 9F pseudo standard) things in
>> >>>> the
>> >>>> core,
>> >>>> then spi_nor_read_id() would need to check whether the flash is in
>> >>>> 1s1s1s
>> >>>> mode. And no I wouldn't prefer that ;)
>> >>>>
>> >>>
>> >>> If we really want to be catholic, we should switch to 8d-8d-8s mode
>> >>> and
>> >>> then issue the read id and the core will handle the readid correctly.
>> >>> But there is no such a thing, because macronix considers that it is
>> >>> in
>> >>> 8d-8d-8d mode at the time of issuing 8d-8d-8s read id. That's why I
>> >>> say
>> >>> it's a bug on their side. The core is meant to be generic, I don't
>> >>> want
>> >>> to pollute the core with manufacturer specific fixes.
>> >>
>> >> Then why does spi_nor_read_id() have the following parameters:
>> >>
>> >>  * @naddr:      number of address bytes to send. Can be zero if the
>> >> operation
>> >>  *              does not need to send an address.
>> >>  * @ndummy:     number of dummy bytes to send after an opcode or
>> >> address. Can
>> >>  *              be zero if the operation does not require dummy bytes.
>> >>  * @proto:      the SPI protocol for register operation.
>> >>
>> >> They aren't standard either. It's just the way spansion and micron
>> >> transfers
>> >> the ID via RDID in octal DTR mode. And now there's macronix who does
>> >> it
>> >> slightly
>> >> different. But *neither* of them are standard. Why should one be in
>> >> the
>> >> core and
>> >> one shouldn't.
>> >>
>> >> spi_nor_read_id() should just handle proto == SNOR_PROTO_8D_8D_8S.
>> >
>> > Yes, it should, but mx is in 8d-8d-8d at the time it issues the read
>> > id,
>> > thus it passes the core proto == SNOR_PROTO_8D_8D_8D, isn't it?
>> 
>> The flash device is in octal dtr mode, which means it will expect the
>> opcode in octal dtr mode. But the data phase mode depends on the 
>> opcode
>> (and theoretically, the address phase, too). If you use the
>> (non-standard) RDID on this flash command has to be executed as 
>> 8d8d8s.
>> 
>> > If you
>> > care about this, please send a patch addressing it, it's better to talk
>> > on code. I don't see yet how you will handle it, but I'm open to review
>> > some code.
>> 
>> I really don't have time right now. But something along:
>> 
>> spi_nor_read_id(.., proto) {
>>    bool emulated_8d8d8s;
>> 
>>    op = assemble_op(.., proto);
>> 
>>    /* Emulate 8d8d8s if the controller doesn't support it */
>>    if (!spi_mem_supports_op(op) && proto == 8d8d8s) {
>>       op = assemble_op(.., 8d8d8d);
>>       emulated_8d8d8s = true;
>>    }
>>    execute_op()
>>    if (emulated_8d8d8s) {
>>       /* discard every other byte of the response */
>>    }
>> }
> After checking with Macronix designer, a-a-b-b-c-c is the data 
> arrangement for
> read id operation of flash in 8D-8D-8D.

Could you please point to any specification? I doubt there is one
and every vendor will do it slightly differently. I mean we already
have some flashes which (apparently) reply to RDID in 8d8d8d.

For example, see the Semper flash datasheet:
https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t

Have a look at Table 78 (or search for RDIDN_4_0) and Figure 28.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
