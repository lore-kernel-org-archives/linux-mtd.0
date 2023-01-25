Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64811C54E94
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGVl7J4VbkmJOdCdqTiR93QSSPBBzATQNHFO4pC+JSc=; b=gdiZ8JAxOGwvpNrvKVT5geAd7f
	CywPWKm/mgAn4hO9En3ktqdqfSJXtGSpAxYC7LbvrxfXa8Gp7a9rIGQXs9vwDK3An95abcTteZgZh
	9Fptx6BoxWn4+9K+q1p/NdgOUaR/z1LARvKJ4zi508Hr91tDLkszH8+uspyIwRF7sTi8xNImK9722
	iHgOEhJU+gqhhwJNur6wOiLPjw1mjJ4/xhz2L9P4/oiSu1qZF3j5FPJzcFJlYqJDCBu4RLFHJZg31
	EMV54yTnAeUy5RXTyUswbzbJWVnEMGl86bt8BYDQPVmRd+Ib8o5v8j+Mf6eWMLwkoeQPcnjijGAtH
	62w62Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhJq-007hZf-Ed; Wed, 25 Jan 2023 15:04:10 +0000
Received: from www.zeus06.de ([194.117.254.36] helo=mail.zeus06.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhJl-007hVE-EE
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2023 15:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references
	:message-id:content-type:content-transfer-encoding; s=k1; bh=WCS
	inRnKWjbKyPczyE/dB35Hnxx0tb1UyQ5n1E38FiU=; b=FpsYiiinoe68O/UI8iH
	Nc0T8fALl3rqnfkr7wfegsflfOU0Gm25JtP+oJ6DM9SSnlECM9LqMsBeoxR8WKGU
	sKH96iu7aCLhE2ED6dU33GonfgJcF88WCiIG3dUWBXgWPJN2hCIhVhGVoOGFF52P
	7c7ogrMDFSdva2jrXMjr50Fo=
Received: (qmail 4193726 invoked from network); 25 Jan 2023 16:03:58 +0100
Received: by mail.zeus06.de with ESMTPA; 25 Jan 2023 16:03:58 +0100
X-UD-Smtp-Session: l3s6476p2@l4gi8RfzqJvCdf4e
MIME-Version: 1.0
Date: Wed, 25 Jan 2023 16:03:58 +0100
From: Mario Kicherer <dev@kicherer.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, Dhruva
 Gole <d-gole@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for AllianceMemory
 AS5F34G04SND
In-Reply-To: <20230125152733.3b6bf0bd@xps-13>
References: <20230117165441.1368447-1-dev@kicherer.org>
 <20230123113337.78f5e3db@xps-13>
 <fae6950f62ebde63b3be0cde384fbde9@kicherer.org>
 <20230125152733.3b6bf0bd@xps-13>
Message-ID: <c452cc08efa87359294d7042ea68ffee@kicherer.org>
X-Sender: dev@kicherer.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_070406_564569_82D7E73F 
X-CRM114-Status: GOOD (  17.13  )
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

On 2023-01-25 15:27, Miquel Raynal wrote:
>> >> +static int am_ecc_get_status(struct spinand_device *spinand, u8 >> status)
>> >> +{
>> >> +	switch (status & AM_STATUS_ECC_BITMASK) {
>> >> +	case AM_STATUS_ECC_NONE_DETECTED:
>> >> +		return 0;
>> >> +
>> >> +	case AM_STATUS_ECC_1_CORRECTED:
>> >> +		return 1;
>> >> +
>> >> +	case AM_STATUS_ECC_MAX_CORRECTED:
>> >> +		return 8;
>> >> +
>> >> +	case AM_STATUS_ECC_1_DETECTED:
>> >
>> > What does this mean "1 detected"?
>> 
>> According to the manual, the chip can report that a bit error was 
>> detected
>> but could not be corrected.
> 
> That does not make a lot of sense. Either you use a Hamming algorithm,
> you will be able to correct 1 bit error and to detect 2 bit errors, or
> you use another algorithm (BCH, usually) with a strength of X (X > 1)
> and you'll be able to correct up to X errors and detect X+1 errors.
> 
> But only being able to detect a single bit flip without being able to
> correct it is strange (even useless?). So I don't understand how it
> should be used.

Unfortunately, I do not have much experience with NAND flashes. The
manual does not say much more - page 41 in [1] in case you want to
see for yourself. I thought returning -EBADMSG in this case would be
the right thing to do as an uncorrectable error happened.

I have not used the flash much yet, so I cannot say that I have much
confidence into the chip's error reporting. So far the flash worked
without issues.

Should I change something in the patch?

Best regards,
Mario

[1] 
https://www.alliancememory.com/wp-content/uploads/pdf/flash/AllianceMemory_SPI_NAND_Flash_July2020_Rev1.0.pdf

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
