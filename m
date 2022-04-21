Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289ECC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY7eAMp/Xbsd5VC8Zp5jwy76PqVV7/9qMJwNuHb0usc=; b=T2TkLybdXdJwGpqxtT2JcSCvs3
	SDarbVQDbYpwIcEurIYiVwt/9lH+4cGt9LwxZeE0KUjq9I5t/xatCTfn0mKBTc0tEvSpl/IaO7euY
	0ovxAf+oCY79St9XgbmZBx49aoFic6UqvXwvJ6mryQwR+vsyXx+G/EEMt62ewychaX/TMdonsAU18
	ZcS+2XFlYVVVkjRpPdDgVEI7WEjeKJmW/sLO8zinSgoyu4bVfT7l5b/tuvNhgG6wUzeVSEquXd7XK
	KyOwx0O1Lm8DqhH1tXX/S3W2iACCe71vwap6/dOsY3iULYsBllwBoh90Tl3pNi6/d6kpjc/s5vZtL
	z6Drxvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhWRh-00DUEk-6Y; Thu, 21 Apr 2022 13:02:05 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhWRd-00DUBi-Eu
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 13:02:03 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9589C221D4;
 Thu, 21 Apr 2022 15:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650546110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQ0fycb3L/DJJmwvfkAuQtqpbAmKkwvqj4LH17YlPYc=;
 b=ADDWdLTtKuPhrxNxQbs0+NBkUXSQw8ioplOKPEYgWBut96NDc9zLmQCTw83ATWOUmtP97W
 kxU6/rssbAb4TgxMYLd3wSubWryPv/9unmXXR4i7oL9EiObn1eL8GDkT4QTXTMfMZu4ESQ
 A59q5IsBEGq9urkZe1kuudVHWPRudCY=
MIME-Version: 1.0
Date: Thu, 21 Apr 2022 15:01:50 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, p.yadav@ti.com,
 richard@nod.at, tkuw584924@gmail.com, vigneshr@ti.com
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
In-Reply-To: <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
 <20220421112956.292089-1-michael@walle.cc>
 <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9495fb0f56e187ade9b428fd69d84aec@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_060201_713594_A991E06E 
X-CRM114-Status: GOOD (  23.46  )
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

Am 2022-04-21 14:06, schrieb Tudor.Ambarus@microchip.com:
> On 4/21/22 14:29, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>>> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>>> know the content is safe
>>>> 
>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>> 
>>>> In 4BAIT parse, keep nor->addr_width because it may be used as
>>>> current address mode in SMPT parse later on.
>>>> 
>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/core.c | 7 ++++++-
>>>>  drivers/mtd/spi-nor/sfdp.c | 1 -
>>>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>>> 
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index 40ba45328975..87603a99938f 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -2210,7 +2210,12 @@ static int spi_nor_default_setup(struct 
>>>> spi_nor *nor,
>>>>  static int spi_nor_set_addr_width(struct spi_nor *nor)
>>>>  {
>>>>         if (nor->addr_width) {
>>>> -               /* already configured from SFDP */
>>>> +               /*
>>>> +                * Already configured from SFDP. Use an address 
>>>> width of 4 in
>>>> +                * case the device has 4byte opcodes.
>>>> +                */
>>>> +               if (nor->addr_width == 3 && nor->flags & 
>>>> SNOR_F_HAS_4BAIT)
>>>> +                       nor->addr_width = 4;
>>>>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
>>> 
>>> Can we have this instead?
>>> 
>>> commit 61d73dea7e63db4c7a3ffaa7f2b5068fb71c2d8b
>>> Author: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> Date:   Thu Apr 21 18:40:21 2022 +0900
>>> 
>>>     mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
>>> 
>>>     In 4BAIT parse, keep nor->addr_width because it may be used as
>>>     current address mode in SMPT parse later on.
>> 
>> Mh, I don't know it that is any better, there are places where
>> addr_width is set in parse_bfpt. Why can't we fix the real problem
> 
> which I find it correct. The only thing that worth attention is at
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, which we're already taken care of. We
> don't change the addr mode at parse time and use SNOR_F_HAS_4BAIT to 
> change
> the number of bytes in the aforementioned case.

It's not about the correctness but that we have a clear sync point
and code flow.

Which parameters can you change in the parse_sfdp() which can't you
change, you'll have to document that and even then it is really hard
to follow. To make thing worse, it turns out, you can sometimes
change addr_width and sometimes it doesn't matter?
If the parsing wouldn't change any runtime parameters we wouldn't
have this problem at all. no?

The parse_sfdp() should only change members of struct
spi_nor_flash_parameters, the caller will then decide if they
should be used and more imporantly *when* they should be used.

Then you can do the sane thing in spi_nor_set_addr_width():
setting the addr_width.

Right now it's:

+static int spi_nor_set_addr_width(struct spi_nor *nor)
+{
+	if (nor->flags & SNOR_F_HAS_4BAIT)
+		nor->addr_width = 4;
+
+	if (nor->addr_width) {
+		/* already configured from SFDP */
..

Sometimes it will set addr_width, sometimes it will not be set
and every once in a while 4byte mode is determined by SFDP but
it is not configured (SNOR_F_HAS_4BAIT).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
