Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D381C63777
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 20:47:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8082521D7F
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 20:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyTsA7PZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="WV6K/ji3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8082521D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LuvVsOVMoJ7hEjMsJErrcw+FblPcb2mI93lJgYb3gHM=; b=eyTsA7PZLm3/+tvjFTeD1WHvW
	fE+RjMxdt9VaIXWWxkf62GJ6cFTwcosZjDLnfagda9KYDmgXkn/3Tf8S18Q7hjLgVy060o73O69Gu
	mnJTibMFmxjhC5nUqvcbdFwZ01cO+yP9fMwqWD4+AOyVejv9mwE2vEy3nbhdTkpAFz8J09aQDzOLu
	Mc3Esyuu9XBYNYjglLvnTBEkMIbtWcXBBSlDije0SVBk/YOYOl6mlyzdjmsczDZmZok6KA4yQuWjR
	X5MVgC7WizRq+Lp641OY67g5VxZ1NTAbShbmy/8duwa6TLi9WJ5iIpKSsHAPZH+Clbljf0ut4OLav
	Vss81cieQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiOAB-0001DQ-Us; Thu, 26 Nov 2020 20:46:47 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiOA8-0001Cu-S7
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 20:46:46 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0FACC22FB3;
 Thu, 26 Nov 2020 21:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606423603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gq7QJ2hJVhgkiSeEDDpcwdYPGynaXOjCkmhQjEa/9yA=;
 b=WV6K/ji3aueWYcw9LzDbfc1Jz+q7Ikc5psL7Ifnc26ne9r9nSXGn7vlZPQ1kh1J2fwTRw7
 VDqDh6W3ZdPkrc7Wx6ww2k6Wl6N1h5FfKyCfoTIJDm6X8tmTcPDEiw6ZGQpyuUib02k3G9
 Po08S1X9gHiJOV12dfrqb+fF5aGZHU4=
MIME-Version: 1.0
Date: Thu, 26 Nov 2020 21:46:43 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v5 3/3] mtd: spi-nor: keep lock bits if they are
 non-volatile
In-Reply-To: <f6344b9cb5c61c3bfd075e231b708269@walle.cc>
References: <20201003153235.29762-1-michael@walle.cc>
 <20201003153235.29762-4-michael@walle.cc>
 <e9437b3e-de44-7b17-df2c-6a8502b48ca4@microchip.com>
 <f6344b9cb5c61c3bfd075e231b708269@walle.cc>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d91447d56e9f75f0eda8561c47677e44@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_154645_205181_203C5921 
X-CRM114-Status: GOOD (  25.35  )
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
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-11-25 19:52, schrieb Michael Walle:
> Am 2020-11-25 13:21, schrieb Tudor.Ambarus@microchip.com:

[..]

>>> diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
>>> index c93170008118..c2ebf29d95f2 100644
>>> --- a/drivers/mtd/spi-nor/esmt.c
>>> +++ b/drivers/mtd/spi-nor/esmt.c
>>> @@ -11,9 +11,13 @@
>>>  static const struct flash_info esmt_parts[] = {
>>>         /* ESMT */
>>>         { "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
>>> -                          SECT_4K | SPI_NOR_HAS_LOCK) },
>>> +                          SECT_4K | SPI_NOR_HAS_LOCK | 
>>> SPI_NOR_WP_IS_VOLATILE) },
>> 
>> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32PA.pdf
>> BP GENMASK(4,2), volatile, ok
>> 
>>>         { "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
>>> -                          SECT_4K | SPI_NOR_HAS_LOCK) },
>>> +                          SECT_4K | SPI_NOR_HAS_LOCK | 
>>> SPI_NOR_WP_IS_VOLATILE) },
>> 
>> https://datasheetspdf.com/pdf-file/796196/ESMT/F25L32QA/1
>> Datasheet states that "BP0~3, QE and BPL bits are non-volatile."
>> At the same time, it says: "After power-up, BP3, BP2, BP1 and BP0 bits
>> are set to 0."
> 
> Mhh I had this datasheet:
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32QA.pdf
> 
> In that one they are volatile.. but yours is a newer version. So I
> guess the flashes with the PA suffix have volatile BP and the QA ones
> have the non-volatile version.
> 
>> Maybe factory default setting for BPn is 0? Let's treat them as NV, as 
>> in
>> f25l64qa.
> 
> Yes will fix it.
> 
>> Do we need BP3?
> 
> Rather the top bottom bit. But that is outside of the scope of this 
> patch.
> And as per your rule, as I don't have this particular flash I cannot 
> test
> and thus couldn't add the TB bit (technically). But if you like I can 
> do
> another patch (outside of this series and after it is applied) which 
> will
> add the TB bit flag.

I've had a closer look at this. The top/bottom behavior is different
to that what we support in spi_nor_sr_lock(). But on the upside, the
current code is correct; it just doesn't support the TB bit. So we can
only protect addresses starting from the top. No changes needed here.

>> 
>>> +       /*
>>> +        * According to the datasheet the BPn bits are non-volatile, 
>>> whereas
>>> +        * they are volatile for the smaller f25l32qa.
>>> +        */
>>>         { "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
>>>                            SECT_4K | SPI_NOR_HAS_LOCK) },
>> 
>> https://datasheetspdf.com/pdf-file/967488/EliteSemiconductor/F25L64QA/1
>> BP GENMASK(5, 2), non-volatile.
>> 
>> BP3?
> 
> Same as F25L32QA.

[..]

>>> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
>>> index 8b169fa4102a..5e4450877d66 100644
>>> --- a/drivers/mtd/spi-nor/sst.c
>>> +++ b/drivers/mtd/spi-nor/sst.c
>>> @@ -11,26 +11,27 @@
>>>  static const struct flash_info sst_parts[] = {
>>>         /* SST -- large erase sizes are "overlays", "sectors" are 4K 
>>> */
>>>         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
>>> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) 
>>> },
>>> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK 
>>> | SPI_NOR_WP_IS_VOLATILE) },
>>>         { "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
>>> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) 
>>> },
>>> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK 
>>> | SPI_NOR_WP_IS_VOLATILE) },
>>>         { "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
>>> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) 
>>> },
>>> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK 
>>> | SPI_NOR_WP_IS_VOLATILE) },
>>>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
>>> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) 
>>> },
>>> -       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K | 
>>> SPI_NOR_HAS_LOCK) },
>>> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK 
>>> | SPI_NOR_WP_IS_VOLATILE) },
>>> +       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
>>> +                             SECT_4K | SPI_NOR_HAS_LOCK | 
>>> SPI_NOR_WP_IS_VOLATILE) },
>> 
>> Looks like BP3 is needed here.
> 
> https://ww1.microchip.com/downloads/en/DeviceDoc/20005036C.pdf
> 
> agreed. But again cannot test it. Would add it as a seperate patch
> to this series. (or leave it like it is)

I'll look at this tomorrow.

-michael

>> 
>>>         { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
>>> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) 
>>> },
>>> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK 
>>> | SPI_NOR_WP_IS_VOLATILE) },
>>>         { "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
>>> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) 
>>> },
>>> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK 
>>> | SPI_NOR_WP_IS_VOLATILE) },
>>>         { "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
>>> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) 
>>> },
>>> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK 
>>> | SPI_NOR_WP_IS_VOLATILE) },
>>>         { "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | 
>>> SPI_NOR_HAS_LOCK) },
>>>         { "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | 
>>> SPI_NOR_HAS_LOCK) },
>> 
>> These two flashes have just two BP bits located at bit 2 and 3.
>> Probably will work.
> 
> Mhh? What datasheet were you looking at? There are three BPs:
> https://ww1.microchip.com/downloads/en/DeviceDoc/SST25WF040B-4-Mbit-1.8V-SPI-Serial-Flash-Data-Sheet-DS20005193E.pdf
> 
> Ahh here are the tables which only inidicate two. But there are three.
> https://ww1.microchip.com/downloads/en/DeviceDoc/20005016C.pdf
> 
> And yes since the rework of the BP bits algorithm this should work
> as expected. Its just because the flash is too small to actually fill
> up all the BP bits.
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
