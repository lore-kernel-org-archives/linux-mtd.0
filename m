Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BFBC27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13q6qNZP8mjHm1T6bxo2b6a9fF6qqER/2oWMZBe7zq4=; b=pHZQwkW5ghsmlZiq2G6jDFR3rk
	JJz5T6hVSzvdg4b2oTMYv1BYNF8QkMoX4prhI0Mksb3EHrnTo4k4Y87ZPZA6ivO43DLuqe5stYOHU
	qUOhuZW9PTISyPm2lEklQQPp/2cztMO6cZ1NR9HHJ07LqPkO6XGzHYKYdS15SenWzd+HvrKePHqLU
	14BliEWogtMhFn3VxF0h1r4PYCmj0BYhR+D6nNvvXfY9K5kr0AE4IAATRNhK1b/6KB8g5agd4hpaU
	JZz3g1IWLOeDRdkSCei73vwkYwEyNZiu2rmxEeZN0iy3j7fXiwu0rEjlXcUmoyaETX9CO41pEQgnv
	vmXQ7VIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKeea-007Fv8-H1; Wed, 25 Jan 2023 12:13:24 +0000
Received: from www.zeus06.de ([194.117.254.36] helo=mail.zeus06.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKeeW-007FtW-0f
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 12:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references
	:message-id:content-type:content-transfer-encoding; s=k1; bh=Ake
	ArHbjx1Blmu48LeqerplWgJtyvHEKaqMc3DDwCB0=; b=ir2AjmgYEEWN/970tcx
	TetKpGIian5qVO/QkSEsE5dnLl2bj4RrAzvY7r5K41ubR5WVnlhOCQ0oeZPHN42w
	4cLC1hh6dzcckCrAtzmNkFBw8dcMmSUNMAWhq/vvX+UTtXkpKCNd5wC6+lWp5aR9
	PjqNWmdkhT6xeL46m7l6BV9o=
Received: (qmail 4148751 invoked from network); 25 Jan 2023 13:13:13 +0100
Received: by mail.zeus06.de with ESMTPA; 25 Jan 2023 13:13:13 +0100
X-UD-Smtp-Session: l3s6476p2@yTt1jhXzIJ/Cdf4e
MIME-Version: 1.0
Date: Wed, 25 Jan 2023 13:13:13 +0100
From: Mario Kicherer <dev@kicherer.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, Dhruva
 Gole <d-gole@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for AllianceMemory
 AS5F34G04SND
In-Reply-To: <20230123113337.78f5e3db@xps-13>
References: <20230117165441.1368447-1-dev@kicherer.org>
 <20230123113337.78f5e3db@xps-13>
Message-ID: <fae6950f62ebde63b3be0cde384fbde9@kicherer.org>
X-Sender: dev@kicherer.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_041321_138503_9C145DEF 
X-CRM114-Status: GOOD (  14.61  )
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

Hello Miquel,

On 2023-01-23 11:33, Miquel Raynal wrote:
>> +static int as5f34g04snd_ooblayout_ecc(struct mtd_info *mtd, int 
>> section,
>> +				      struct mtd_oob_region *region)
>> +{
>> +	if (section > 3)
>> +		return -ERANGE;
>> +
>> +	region->offset = 0x48;
>> +	region->length = 0x38;
> 
> Why would you have three sections if you have static offsets and
> length? That does not look correct.

Hm, I do not remember. I guess this is a leftover I forgot to remove.

>> +	/*
>> +	 * It is unclear how many bytes are used for the bad block marker. 
>> We
>> +	 * reserve one byte here.
> 
> So far we reserved two bytes in Linux to mimic the raw NAND BBM.

Ok, changed.

>> +static int am_ecc_get_status(struct spinand_device *spinand, u8 
>> status)
>> +{
>> +	switch (status & AM_STATUS_ECC_BITMASK) {
>> +	case AM_STATUS_ECC_NONE_DETECTED:
>> +		return 0;
>> +
>> +	case AM_STATUS_ECC_1_CORRECTED:
>> +		return 1;
>> +
>> +	case AM_STATUS_ECC_MAX_CORRECTED:
>> +		return 8;
>> +
>> +	case AM_STATUS_ECC_1_DETECTED:
> 
> What does this mean "1 detected"?

According to the manual, the chip can report that a bit error was 
detected
but could not be corrected.

>> +static const struct spinand_manufacturer_ops 
>> alliancememory_spinand_manuf_ops = {
>> +	.init = alliancememory_spinand_init,
> 
> I don't think .init is mandatory, so if you do nothing in it, you
> can just drop it.

Done.

Thanks for the review!
Mario

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
