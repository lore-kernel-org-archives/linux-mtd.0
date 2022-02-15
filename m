Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ED1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2TBVLNoCNcGOug8s4d5jD0IV8ypf2Ze245734m/ebo=; b=U8i7KeKR8VkDiKcpIJXzJxiHcU
	y0WVZAPfybmdYu7BU9ugaPPxuew2MTqlKVQ2jxFGAVtImXmXwU3m7j8j69qKyGZySn7SOrmiOwXY2
	Y+hfSKNTUT2MqlezBZtsmUsSYUDaBrcWuNiv1v1i/ic9E/cYpN2xicFraJGFlpjsCx4UWYKUopwJP
	EzCMHM0fP8LG9pw1UYq4szFwuO27S1/F1mzQZ6EtAwa/61d9eIWuAytiJpizF9chOMO2s0y5S553A
	CcD2TmeMX8LDEdjSx1VPxMc8oMo30b4r6sJokPX8+9xWn2eDdzq3nAWPiFpQ4ere2IEpty/rm6BW7
	kBcCy/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJubZ-002AGM-4h; Tue, 15 Feb 2022 09:58:41 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJubW-002AFJ-7K
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 09:58:39 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9B6EE2223A;
 Tue, 15 Feb 2022 10:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644919115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYhcTk1FGajj2Roa6thArdlpXuwJlYKd+o+75K745gU=;
 b=r7lzzpMzVvbuEs0XGxUVX0Dt4ltPEvygeevfRZyvBcNniB62pFbBVXoF87WGZiKMUhiH2H
 b2CGJnWw/ZisGAFfWxau8tabBgCf7YgAbg1cE/aQMiHEd3Au+UkRWk4XB7rXWIW3x8G8X4
 iw4+j7H1RzhWy/xRfif7CG1xe1UJ4iI=
MIME-Version: 1.0
Date: Tue, 15 Feb 2022 10:58:35 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.yadav@ti.com, richard@nod.at,
 vigneshr@ti.com
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
In-Reply-To: <7d8b7581-4610-6c04-9033-dac9ba27038b@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-6-michael@walle.cc>
 <68aa414b-7a9d-1330-531c-37b2db2ab09d@microchip.com>
 <73d3d8ed2cb4ca1b06902b767fe529c3@walle.cc>
 <d76f21dd-4038-57de-f2f6-6afa947b62cb@microchip.com>
 <c3a58de8ee39dd473483dfd0ed8a0058@walle.cc>
 <7d8b7581-4610-6c04-9033-dac9ba27038b@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <3d5bb9c9480092c64c5574b6551e64f1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_015838_454917_18421510 
X-CRM114-Status: GOOD (  17.53  )
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

Am 2022-02-15 09:52, schrieb Tudor.Ambarus@microchip.com:
> Miquel in To:
> 
> On 2/15/22 10:25, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2022-02-10 09:06, schrieb Tudor.Ambarus@microchip.com:
>>> On 2/10/22 10:04, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>>> know
>>>> the content is safe
>>>> 
>>>> Am 2022-02-10 04:08, schrieb Tudor.Ambarus@microchip.com:
>>>>> On 2/2/22 16:58, Michael Walle wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>>> know
>>>>>> the content is safe
>>>>>> 
>>>>>> Drop the generic spi_nor prefix for all the xilinx functions.
>>>>> 
>>>>> mm, no, I would keep the spi_nor prefix because xilinx_sr_ready is
>>>>> too
>>>>> generic and can conflict with methods from other subsystems.
>>>> 
>>>> But all the other functions in this file start with xilinx_ ;)
>>>> 
>>>> I don't have a strong opinion here, other than it shouldn't
>>>> be called spi_nor_read_blaba() because that looks like a
>>>> standard spi nor function belonging in core.c
>>>> 
>>> 
>>> then let's prepend all with spi_nor_xilinx_*()?
>> 
>> I'm still not sure what to do here. Have a look at all the other
>> vendor modules in spi-nor. they are all prefixed with the vendor
>> name? E.g. there is a sst_write() which is far more likely to
>> cause a conflict. So should we rename all these functions? Or
>> do we just take our chance that it might have a conflict in
>> the future (with an easy fix to rename the function then). TBH
>> I doubt there will be a global symbol "xilinx_read_sr()".
> 
> I doubt it will not be a conflict.
> 
>> 
>> But I care for consistency, so having some named xilinx_, sst_,
>> st_micron_ and some spi_nor_read_xsr sounds and looks awful.
> 
> yes, I agree. Take a look on what's happening in NAND. They prepend
> the name with vendor_nand_*(). Or in SPI NAND they use flash family
> names which should be unique. So how about aligning with NAND and
> use vendor_nor_*()?

Sounds good. Regarding the flash family.. take a look at Winbond W25M
which can either be NAND or NOR depending on the size ;)

But the main question was rather whether we rename all the function
names at once or bit by bit. To proceed here with this series, I'd
use the vendor_nor_ prefix for the moved functions (but still keep
the micron_st_ st_micron_ rename patch).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
