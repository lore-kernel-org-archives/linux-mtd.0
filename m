Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91192C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 05:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nS+rMZALbSmylqFRwJFl4SjgLeV7hGU9o8lmZ0BfN1c=; b=4R8YCdzLo0vnkH
	8C0f/eaHyB5U0RKw35/2F/dxSSqNO66VKn0o78AnqqMzoE5/3E8DAmddlQWdEVrMWrBNzQ3SfuMjZ
	KWUhBXS2Qi4+mHpMjL6ZHkL4IAH5Mio6iFDOk+XQxs0neUdKuZ6OIMbUxdm0jA2CPOjQbW/JGQsB1
	+S9v/1y53oY74XhVlFrCGXbueYQilLARRvOA4MsSYAyvtjIRFf7QSKfsiWsw8Nk+EEy9h4Hr5hAk9
	n8dDp1/SAy1kTjLTPT+QdLPKHT5sNIUe/A37tut42p/sCxSlBy2L7AWaF74l0jlXQz96D90SdbIQ9
	xGigxzhw07005io1UC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7A44-00EofC-9v; Tue, 11 Jan 2022 05:51:24 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7A3z-00Eods-Os
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 05:51:21 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20B5pBaX063299;
 Mon, 10 Jan 2022 23:51:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641880271;
 bh=0fW3jwGVa1LJO5zm4tAXz+1RoUDB7y7Tbg485ljzd0o=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GO9UWxkhjJ6wmPJymjJpVUcqStfcgmEEzMKLxPkVyXPBliACbLT6eoAt9ZX+qIcDo
 /4HbkNHhN+VZrPfB8rqhKWbXzix+mvemVgU0ezcQf8LuAqcuyIADz9zPmal3v7z18i
 xYSydtfeg/lZr+9cbG3oU+3JAmwroXqvWk7ySPpw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20B5pB57042791
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jan 2022 23:51:11 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 10
 Jan 2022 23:51:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 10 Jan 2022 23:51:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20B5pApM023051;
 Mon, 10 Jan 2022 23:51:11 -0600
Date: Tue, 11 Jan 2022 11:21:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
CC: Michael Walle <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25q512jvm
Message-ID: <20220111055107.tevqpnt32mzjodok@ti.com>
References: <20220109044418.4657-1-dphadke@linux.microsoft.com>
 <262a03e185c29583450180e3dc8c4e6c@walle.cc>
 <57513f5f-1e66-3758-a56b-1eced486a4df@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57513f5f-1e66-3758-a56b-1eced486a4df@linux.microsoft.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_215120_002877_86D7C1FD 
X-CRM114-Status: GOOD (  18.84  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/01/22 03:12PM, Dhananjay Phadke wrote:
> On 1/10/2022 7:10 AM, Michael Walle wrote:
> > =

> > > +=A0=A0=A0 { "w25q512jvm", INFO(0xef7020, 0, 64 * 1024, 1024),
> > =

> > OTP_INFO(256, 3, 0x1000, 0x1000)
> > =

> > should enable OTP support, could you please test this using the
> > flash_otp_{dump,info,erase,write} tools and add that line?
> =

> The board I've has HW filter between controller and NOR and doesn't seem =
to
> allow security reg access opcodes (read to be specific).
> =

> So long as adding this doesn't affect probe, I can add it. Otherwise, will
> have to leave it for later when that's fixed.

Please don't it if you can't test it. In that case let's just leave it =

for someone else to add later.

> =

> =

> On 1/9/2022 9:07 PM, Pratyush Yadav wrote:
> > =

> > You need to show the dumps of the SFDP and other flash parameters. See
> > [0] for an example.
> > =

> > The patch looks fine to me otherwise.
> > =

> =

> Lemme collect SFDP dump and include it in v2.
> I ended up sending stale patch that has extra comma between INFO()
> PARSE_SFDP macros, so need to re-spin anyway.
> =

> Thanks,
> Dhananjay

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
