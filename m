Return-Path: <SRS0=Ei3U=Q2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2A3C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 20:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E1921738
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 20:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bZQUMWHp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Mj7O/ATI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E1921738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3tBy8W3TV3Hc+GzxxlS9UG2ONDUq90sgpUOU8jTih0=; b=bZQUMWHp9Ts+XN
	H96TkphAp0w/D3CVRli0wA/Jw87NILzbEuRW9ngksJQoZXkMn3IWyNuzYNnV9XIEeXEoWYKfFmmr2
	Au75g02Q9DobezL+2fgv70VmXRoNIQFbAHaHvNAe6XSW09SblVqP7m58rdMUsSydpRd74Tfm04Jvg
	vaXIed6cMsUrGIhTJCRD8FWp8Gi728afctfEl2s5zqJQgtZ5n3u+NaMtiz8Y/ExlsNRLSyi8XkDQX
	9lx98+Xz+hZgXuCqp/8OzgKQF3Xgq6ehgxp7NS4VyBfbM6VdGeE/9lXZCj63z9ymxCT7qQxG28JzA
	avj3hPkG4qqt04CY6jjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwBbS-0002Lz-Rc; Tue, 19 Feb 2019 20:02:54 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwBbO-0002La-CM
 for linux-mtd@lists.infradead.org; Tue, 19 Feb 2019 20:02:52 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6949D8781F;
 Wed, 20 Feb 2019 09:02:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1550606563;
 bh=f0LEh2kI76xY9GI3sHFuppkOxBSn2YPTwsd0OeGY1ZA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=Mj7O/ATI1jXK55rUIhdcvxam0DTlsdvY79yq938UWd1HHmAfQKuTONOJQ25amKTXa
 xhTk33jYhOl/tb1LO1i+3z/s/wT3OHmsy/1Nbt+aLbBHjVrY53QdsYSgyvV2hkVtD0
 Lqs3CHnonx4LGkvTwh02VwTKm3FlOo41kybVPtL+w4teyGAZ25f59X2w7aqWGvvcgQ
 FulsuBS/uCZ80zY1k2T42kIKLagFFSpHvo8SEnsOyfP8Fe0bhpIBMtR13GRQpE3ymP
 0SQ/ahvAtGvHZ+7KhgLTLp9nJOhUhz7gkUDTLDn5uNK4pklg65JQoZBL31R8pgRUL5
 C3Y6V4UQvH7vA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5c6c60dc0000>; Wed, 20 Feb 2019 09:02:41 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Wed, 20 Feb 2019 09:02:38 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Wed, 20 Feb 2019 09:02:38 +1300
From: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@collabora.com>, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Thread-Topic: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Thread-Index: AQHUw/2yaFopaTJblkCsDO0mtD692qXl8FGAgADJ5IA=
Date: Tue, 19 Feb 2019 20:02:37 +0000
Message-ID: <f5d597dd-d09d-b8f8-a800-756a23954164@alliedtelesis.co.nz>
References: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
 <e945b943b2204d4d927391ffd068491d@svr-chch-ex1.atlnz.lc>
 <20190219085946.64a1bd39@kernel.org>
In-Reply-To: <20190219085946.64a1bd39@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.16.78]
Content-ID: <B91D2CF2C360E743B09DF304DF774574@atlnz.lc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_120251_166648_380020BC 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 Przemyslaw Sobon <psobon@amazon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "liujian56@huawei.com" <liujian56@huawei.com>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 19/02/19 9:00 PM, Boris Brezillon wrote:
> On Thu, 14 Feb 2019 00:39:09 +0000
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
>
>> Hi All,
>>
>> On 8/02/19 12:58 PM, Przemyslaw Sobon wrote:
>>> Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to
>>>          check correct value)
>>>
>>> There was an endless loop in CFI Flash driver when a value was written
>>> incorrectly. In such case chip_ready returns true but chip_good returns
>>> false and we never get out of the loop.
>>>
>>> The solution was to break the loop in 2 cases, either device is ready or
>>> device is not ready and timeout elapsed. The correctness of the write is
>>> checked after the loop ended. That way we ensure the loop always ends.
>>>
>>> Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>
>> Mark (cc'd) has done some testing here, and assuming he's happy with the
>> forgery.
>>
>> Tested-by: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
> I'm a bit lost. Ikegami told us that checking for chip_ready() was not
> enough and chip_good() could return true after a few tests even though
> it initially returned false.
>
> I'd really like to get that fixed, but it looks like you haven't reached
> a consensus on what the appropriate fix is :-/.
I have done some further testing and this patch doesn't work 100%. It
appears at least some flash chips do not start toggling immediately, and
therefore chip_ready() can return true early. A timeout is reported,
even though that isn't what happened.

chip_good() makes an additional check over chip_ready() and is the call
I believe we should be using. I will submit a new patch which should fix
the infinite loop as well as not mis-reporting errors.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
