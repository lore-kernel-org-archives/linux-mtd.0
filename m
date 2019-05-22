Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58552C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCA220881
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/m5GJn2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="D64Gj/jx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCA220881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=gJ8lDPkBTVHYzCv25CHYhiQ30y5PI8a5KPW1aQq8G+8=; b=F/m5GJn2vPXxsZ
	kQxgkfC8dy7bAq/yPrIhKGWbW/59QBljnoUw1pppJNgBUJderm/aTenxQrGCMd2UYouvJqbwyWHz4
	GGgfAdOhHOeswI4lf9YF6FKbl9CNmOQaPq13Dyk9Yl6PgDpVy5BlYt1UQcvVzZFOipp0WD+H5nlhB
	6ANPC+FoB6RGcy1NLADVl+TnC3oNUYpAP/NYZuc17NH6EUEVODuq85SuIi8BGFZBsGQ0V+hRbNQWM
	m0OVM0fOS21e9gENRMB/RggTsU1xPvyQdHosdIAdMt2dYP9eWLn9SMkPGsqALCIUK1yRXPhaVxJmy
	eioYyXQ4WXu/trr5GWng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTZXc-00085e-Pu; Wed, 22 May 2019 22:16:56 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTZXY-00084h-H6
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 22:16:55 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9C1298365B;
 Thu, 23 May 2019 10:16:45 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1558563405;
 bh=ZxBUBp8Foj7N0iN33J8UMixBBZWHJz1GggRM1ihzeWM=;
 h=From:To:CC:Subject:Date:References;
 b=D64Gj/jxcx8scWArXZz7xjybNDG7QMVSoMz48ZJRu70tsPjvCBNuQDs80jEJUmBXN
 GFMRmqAzydF7zJ10I+KRjNVI2I9LrUwSpsT6cac37alW1/wFD/YATSrQZRVMiAuaYh
 oQAVWBwfjGJBK47abZyb6t2Jfj1bJTSKEnkT+nBAdnHSQPkpabEZE/XxLrd7KBlLkS
 YRbKp360cOkBmHN4AkUiMUWZse3z3gw0gk9nVPN60KMfHFqOKnTB8N0I49bLYd72MJ
 8pXIFwHidWCl4pR7bqUTrqeigcsvAI+R3q8SEZOKlIOJeQdpGZkr3utIY86objZ9au
 zSm/b0AUat4Sw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ce5ca4b0000>; Thu, 23 May 2019 10:16:43 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Thu, 23 May 2019 10:16:45 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 23 May 2019 10:16:45 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 2/2] mtd: concat: implement _is_locked mtd operation
Thread-Topic: [PATCH 2/2] mtd: concat: implement _is_locked mtd operation
Thread-Index: AQHVEDJo0iBq93PH/EeJquPgUtfeew==
Date: Wed, 22 May 2019 22:16:44 +0000
Message-ID: <82de06c4122b4b958b5c840aa2166dd8@svr-chch-ex1.atlnz.lc>
References: <20190522000753.13300-1-chris.packham@alliedtelesis.co.nz>
 <20190522000753.13300-2-chris.packham@alliedtelesis.co.nz>
 <CAFLxGvy2c9KV1CyoFaD76jvThfPiotqfoeNchqjGcDp+uHie7Q@mail.gmail.com>
 <0c59bcd6c866429cb9727f787b7f61ce@svr-chch-ex1.atlnz.lc>
 <CAFLxGvwRnBtscaJDQ4qYGpQt87+amKYb4vBJvtt-3BmsOorL_g@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_151653_135349_9DA3F720 
X-CRM114-Status: GOOD (  20.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23/05/19 9:27 AM, Richard Weinberger wrote:
> On Wed, May 22, 2019 at 11:06 PM Chris Packham
> <Chris.Packham@alliedtelesis.co.nz> wrote:
>>
>> On 23/05/19 8:44 AM, Richard Weinberger wrote:
>>> On Wed, May 22, 2019 at 2:08 AM Chris Packham
>>> <chris.packham@alliedtelesis.co.nz> wrote:
>>>>
>>>> Add an implementation of the _is_locked operation for concatenated mtd
>>>> devices. As with concat_lock/concat_unlock this can simply use the
>>>> common helper and pass mtd_is_locked as the operation.
>>>>
>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>> ---
>>>>    drivers/mtd/mtdconcat.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
>>>> index 9514cd2db63c..0e919f3423af 100644
>>>> --- a/drivers/mtd/mtdconcat.c
>>>> +++ b/drivers/mtd/mtdconcat.c
>>>> @@ -496,6 +496,11 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>>>           return __concat_xxlock(mtd, ofs, len, mtd_unlock);
>>>>    }
>>>>
>>>> +static int concat_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>>> +{
>>>> +       return __concat_xxlock(mtd, ofs, len, mtd_is_locked);
>>>> +}
>>>
>>> Hmm, here you start abusing your own new API. :(
>>
>> Abusing because xxlock is a poor choice of name? I initially had a third
>> copy of the logic from lock/unlock which is what lead me to do the
>> cleanup first. mtd_lock(), mtd_unlock() and mtd_is_locked() all work the
>> same way namely given an offset and a length either lock, unlock or
>> return the status of the len/erasesz blocks at ofs.
> 
> Well, for unlock/lock it is just a loop which applies an operation to
> a given range on all submtds.
> But as soon an operation returns non-zero, the loop stops and returns
> that error.
> This makes sense for unlock/lock.
> 
> Now you abuse this as "apply a random mtd operation to a given range".
> So, giving it a proper name is the first step. Step two is figuring
> for what kind
> of mtd operations it makes sense and is correct.

Ah now I understand you concern. I guess the question is what is the 
right thing for MEMISLOCKED to return when consecutive blocks differ in 
lock status.

>>>
>>> Did you verify that the unlock/lock-functions deal correctly with all
>>> semantics from mtd_is_locked?
>>> i.e. mtd_is_locked() with len = 0 returns 1 for spi-nor.
>>>
>>
>> I believe so. I've only got access to a parallel NOR flash system that
>> uses concatenation and that seems sane  (is mtdconcat able to work with
>> spi memories?). The concat_is_locked() should just reflect what the
>> underlying mtd device driver returns.
> 
> mtdconcat *should* work with any mtd. But I never used it much, I see
> it more as legacy
> code.
> 
> What happens if one submtd is locked and another not?
> Does concat_is_locked() return something sane then?
> I'd expect it to return true if at least one submtd is locked and 0
> of no submtd is locked.
> 
> If the loop and return code handling in __concat_xxlock() can take care of that,
> awesome. Then all you need is giving it a better name. :-)

As implemented right now the loop will stop at the first locked block. 
So if the range starts in a unlocked block and spans into a locked one 
the return value will be 1.

Is that correct? Well do_ppb_xxlock and  do_getlockstatus_oneblock seem 
to only care about the first block (they both ignore len)? So they'd 
return 0 in the case of unlocked,locked.

stm_is_locked_sr does about the len and will return 0 if len falls 
outside the locked region or if ofs starts before the locked region.

So here's a quick breakdown

                  ppb_is_locked intelext_is_locked stm_is_locked concat
unlocked,unlocked            0                  0             0      0
locked,locked                1                  1             1      1
locked,unlocked              1                  1             0      1
unlocked,locked              0                  0             0      1

I'll try and make concat_is_locked consistent with the two cfi 
implementations.

Thanks for your feedback on this. I think the v2 series should look a 
lot better as a result.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
