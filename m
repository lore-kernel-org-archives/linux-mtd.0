Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BF5C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 15:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFE82083B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 15:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CC2M8ssl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xUf+oeyd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFE82083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QI8R0nEVNKev4EPqF0ajSOVnW98qbVtOf2DH7TEilz8=; b=CC2M8sslAywQzEpiAYIe6H+FR
	an1QOmskrT7+/Ps6vsMVEElnkgjaZyzSaBI4ez5QKGF/WSwIulG0cPZVce7xR5Ud39aKkseH7ZZEB
	ub/4HXU2Y4OdnQRGgeJkYfZOTuNBVxRJPWZ6NV+eevFlVgZs9oVPLoahXcfjzOVncg934EVNw0QNS
	6r5vlLaIA6LMeFw9zYTtBz/ou/rtSy2eKNQhXtrkL/5raKvzQx19b96GtKc0Y8BFpH26IMaEvWOuA
	pn+9R4LYfzhQCX9M93Iq8Ky1Ed9CXtPnocLfSMhg/609GCez1rwwyz7jtvoCaxVrboGb7mWXBHgyS
	9A1/QHB3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8gR-0000aH-Up; Mon, 09 Nov 2020 15:02:15 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8gO-0000Yk-No
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 15:02:13 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9F1ket058199;
 Mon, 9 Nov 2020 09:01:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604934106;
 bh=R/MyJRO0FsAP6ABvU4Z5CteFalwpfUz81HkhvOHleB8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xUf+oeydismZTHHqoZI1UQALQQxI4trtqqiRemZxzc3UZbjtxRhWiMtERgAP3qIm4
 7UB276OCEFipwq5emDeW9emCsAzg7eFT6IW73R6zHeaQZ2dz+cLciHXf9MiymR5I/g
 M3C5K7SnBxF6l0ouFg7OT3NP0frWJMIPedJcYCCE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9F1kmX124739
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 09:01:46 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 09:01:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 09:01:46 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9F1hew056077;
 Mon, 9 Nov 2020 09:01:44 -0600
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for Cypress cy15x104q
To: Tim Harvey <tharvey@gateworks.com>, <Tudor.Ambarus@microchip.com>
References: <20200424065626.8196-1-s.hauer@pengutronix.de>
 <13199742.Uhtxi0mpr9@192.168.0.120>
 <CAJ+vNU2SmCkUuq6K6MQ06G0tHi5ZxnM4G+yVRADMjLC3yQ2N4A@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <eee149e2-385a-271b-0ebb-39f1e10e2b8d@ti.com>
Date: Mon, 9 Nov 2020 20:31:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU2SmCkUuq6K6MQ06G0tHi5ZxnM4G+yVRADMjLC3yQ2N4A@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_100212_896722_625D908A 
X-CRM114-Status: GOOD (  26.32  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 11/6/20 12:24 AM, Tim Harvey wrote:
> On Thu, May 28, 2020 at 1:13 AM <Tudor.Ambarus@microchip.com> wrote:
>>
>> On Friday, April 24, 2020 9:56:26 AM EEST Sascha Hauer wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>>> content is safe
>>>
>>> The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
>>> Add support for them to the spi-nor driver.
>>>
>>> The actual Device ID of this chip is 7f 7f 7f 7f 7f 7f c2 2c 04. That is
>>> six times the continuation code 7f followed by c2 for Ramtron.
>>> Unfortunately the chip sends the Device ID in reversed order, so the
>>> continuation code is not at the beginning, but instead at the end. Even
>>> more unfortunate is that when reading further the chip sends more 7f
>>> codes which means we are not even able to count the continuation codes.
>>> We can only hope that this reversed Device ID will never match any other
>>> devices ID.
>>>
>>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>>
>> Collisions are improbable as of now, the solution from above is good
>> enough. In case of future collisions one can introduce an INFO9 macro,
>> with the downsize that struct flash_info would grow and we have lots of
>> flashes. A more elegant solution would be to introduce dedicated
>> flash ID tables for each bank in JESP106BA.
>>
>> Amended commit description with the above text and applied. Thanks.
>>
> 
> Greetings,
> 
> I've got a board with a  CY15B104Q-LHXI on it and I found that it's id
> reads as  7f 7f 7f 7f 7f 7f c2 26 08 so it fails the match added above
> in a2644d5f36: mtd: spi-nor: Add support for Cypress cy15x104q
> 
> I also found a reference in
> https://community.cypress.com/docs/DOC-14647 that states "that newer
> 1.8 V devices have the 9 device ID bytes coming out in the other order
> which requires a minor change in the ID entry" which would explain the
> situation you encountered.
> 

So, Cypress seems to have fixed ID table to follow JEP106BA standard.

> Adding '{ "cy15x104q",  INFO(0x7f7f7f, 0, 512 * 1024, 1,
> SPI_NOR_NO_ERASE) },' works for the part I have.
> 

NACK, 0x7F is continuation code and not actual flash ID code. See JEDEC
standard JEP106BA for more details. In short, driver should just keep
looking at next byte in the sequence for manf ID when it reads a value
of 0x7F.

You will have to extend spi_nor_read_id() function to
take care of continuation code and read more bytes in order to get the
actual Manuf/device ID. And then walk through
spi_nor_manufacturer->parts table looking for the corresponding entry.

Would need to store bank number (implied by number of continuation
codes) as part of flash_info struct for cross reference during lookup


> Would it be wrong to add additional parts with the same name and
> different id's? It seems to me duplicate names would break
> spi_nor_scan when passed a name but work fine for scanning by id. 


Ideally yes, but in case of cy15x104q there are two revisions of flash,
one with correct ID code and other with ID code reversed and
unfortunately, would need to make an exception here.

> I also think that '{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024,
> 1, SPI_NOR_NO_ERASE) },' is way too specific for 'cy15x104q' because
> it is won't match any of the other identified parts:
> 
> CY15B104Q-PZXI     7F7F7F7F7F7FC22C03 51-85075 8-pin PDIP Industrial
> CY15B104QN-50SXA   7F7F7F7F7F7FC22C40 001-85261 8-pin SOIC (EIAJ) Automotive
> CY15V104QN-50SXI   7F7F7F7F7F7FC22C04 002-18131 8-pin GQFN Industrial
> CY15B104QN-20LPXC  7F7F7F7F7F7FC22CA1 002-18131 8-pin GQFN Commercial
> CY15B104QN-20LPXI  7F7F7F7F7F7FC22C01 002-18131 8-pin GQFN Industrial
> CY15V104QN-20LPXC  7F7F7F7F7F7FC22CA5 002-18131 8-pin GQFN Commercial
> CY15V104QN-20LPXI  7F7F7F7F7F7FC22C05 002-18131 8-pin GQFN Industrial
> CY15B104QN-50LPXI  7F7F7F7F7F7FC22C00 002-18131 8-pin GQFN Industrial
> 

Indeed.. A patch fixing the same would be very much appreciated. Thanks!

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
