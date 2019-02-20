Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77B5C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864E02089F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 20:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ofo0CBPj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="K3KRIlZT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 864E02089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2CNc8z3c09LBj4WDroVQ486HNRENcv94PaIy4a0P4k=; b=ofo0CBPjgFFg7R
	9+cGukbXk5VQirvBZts5FOb7q2n06D/5Ka6YojDBYuektzeyrO0rvt1rae2wOsXy6MqaJCBXR+QSP
	MK9T8NA6X1ge1c1Mu71N6ano3zNwH/DOTWb17hlRCYuCW0Q60K+zunVd5ka2Bc8Oecczb4ka3dP/v
	t+EzAm2yTLwcElL//b/7VVeF17/3I5E7BnP+OG3jQdpiUt2Ndz7QTJieFz1NDsT8osTJLtCgFz4ct
	9SBfiBLW99LX4TaFawOHvEwg+wTAwlREFSzTIXJzEU8GoKTMhJqmAiqZcUnDaYdFMnZm1XfXZhy56
	Q19q3QmHw9Tb8EAZKNPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwYpV-0007l3-Bl; Wed, 20 Feb 2019 20:50:57 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwYpR-0007U1-Qv
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 20:50:56 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E2B978025D;
 Thu, 21 Feb 2019 09:50:28 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1550695828;
 bh=6jJllQ9sXHC1BBySvp2cAtBtHrQfuJZbpw+deENvBTM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=K3KRIlZTCUTo2nWYvxI/Qwp2PxpCGpHUv4TckqYteFfsvHHR+hDEN9kdspBLv/BrK
 yPTLaYKwmaTZGKN6QVoWJKWSYFtyKGZz2R0BJR3x3PPrFMufLV5q925aaPHPxHCDUL
 lltYDz3V1Tnph7+TXqOXPr2tTWmJOPSUtM6wJjhEILYv9vlDxdPFPZT4V5zx9hAquG
 AUqDhSvsyWBWFpks7hV0T+W7LiMwg2nbTGswPi4LyFO85lp2R9DBnnFlfhPnCsXfRR
 hdeg5SS+8Ei7fPACw96/LVbxFYOXmtP0sk1N+7z+wmK0LE75yW3zyOeBIhqIMZD5gJ
 H2nCCnr/D9mrw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5c6dbd930000>; Thu, 21 Feb 2019 09:50:27 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Thu, 21 Feb 2019 09:50:28 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 21 Feb 2019 09:50:28 +1300
From: Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Thread-Topic: mtd: cfi: Fixed endless loop problem in CFI when value was
 written but corrupted.
Thread-Index: AQHUw/2yaFopaTJblkCsDO0mtD692qXl8FGAgADJ5ICAAMleAIAA1k+A
Date: Wed, 20 Feb 2019 20:50:28 +0000
Message-ID: <fbb725b9-230a-aadf-9950-d5cf45696cba@alliedtelesis.co.nz>
References: <20190207235806.GA39580@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
 <e945b943b2204d4d927391ffd068491d@svr-chch-ex1.atlnz.lc>
 <20190219085946.64a1bd39@kernel.org>
 <f5d597dd-d09d-b8f8-a800-756a23954164@alliedtelesis.co.nz>
 <20190220090320.01aa2357@collabora.com>
In-Reply-To: <20190220090320.01aa2357@collabora.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.16.78]
Content-ID: <0642BF17E95809488AA245216C388835@atlnz.lc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_125054_645280_AF81821D 
X-CRM114-Status: GOOD (  12.99  )
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
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "liujian56@huawei.com" <liujian56@huawei.com>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 20/02/19 9:03 PM, Boris Brezillon wrote:
> On Tue, 19 Feb 2019 20:02:37 +0000
> Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz> wrote:
>
>> On 19/02/19 9:00 PM, Boris Brezillon wrote:
>>> I'm a bit lost. Ikegami told us that checking for chip_ready() was not
>>> enough and chip_good() could return true after a few tests even though
>>> it initially returned false.
>>>
>>> I'd really like to get that fixed, but it looks like you haven't reached
>>> a consensus on what the appropriate fix is :-/.
>> I have done some further testing and this patch doesn't work 100%. It
>> appears at least some flash chips do not start toggling immediately, and
>> therefore chip_ready() can return true early. A timeout is reported,
>> even though that isn't what happened.
>>
>> chip_good() makes an additional check over chip_ready() and is the call
>> I believe we should be using. I will submit a new patch which should fix
>> the infinite loop as well as not mis-reporting errors.
> No, please, don't do that. We already have 3 versions of the same fix
> floating around (one from Ikegami, one from Liu Jian and another one
> from Przemyslaw). Can you please sync and submit a single patch that
> all of you agree on?
>
Ikegami-san has pointed out Liu Jian's patch to me. That patch works fine
for me, so I won't be creating another one afterall. Hope that reduces the
number of possible patches.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
