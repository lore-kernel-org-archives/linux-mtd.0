Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9C2C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 20:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1200E21019
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 20:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NwXOa568";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="tKXqnvKm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1200E21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=kCPA1nxGHwPKMMRu6+A6KFE/8pFisCoYSzbBGjOPgjg=; b=NwXOa568Eb4qm+
	rR7vawcrQLYYbW3K64wKToOrUTfF3DUCGOYFN7RlpPYBSBL/FGEQMPcNWKWAxzFGJYdwllgwJ+7Qh
	vCbt+ohHojUDIrv0h95HKF44WqCPM1IbvGkVlc/cbRRRrXt+R/FOZURvVNhnbR2ujEZe7XpVN4hJ9
	R4QKtcn6uItyPZEbU5l8nnMX8AReLmTlSnFj5efzOfyPxlgdOjyFVGYfFdZWvJSa/L3VQazjkZlTx
	oTJ0vtOZEpTjp6VvSWAfJWFo17/uRJtY1sd3BMO3F0PTv+EcMLr23qqUOJFM7ibY37fWWMD0vxEF8
	D3tPOcCAGWYH7wjxM4lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTYFA-0004Qq-GK; Wed, 22 May 2019 20:53:48 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTYF7-0004Ps-R9
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 20:53:47 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 69FD98365B;
 Thu, 23 May 2019 08:53:38 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1558558418;
 bh=DOEO3y2soOvXq8t/1GH0lADqJ6A3XwpUwCBU/Y2+CsU=;
 h=From:To:CC:Subject:Date:References;
 b=tKXqnvKm1e2jPtxiUAa9wBkNp5sPy3IrM8N13NfWSr/ObgLN3VIh7ZmkH4qjwe+01
 i3gi8mbXgliFjD3Ceq5pSXJb9q8v0jQh1B4Y94ryyTMauKVP8wNxOrHVD2z9o0wQqv
 lGgB4nIONrovafdDAmf5WXQhyKQ8Ze+xrnMG0/fIPWkt+0Naj2Ws9aDXlCyCdq7Gda
 2ZE2yveMBtHBtZgXanpd6MaJvdEHbq2mRUA86Kdl5+AQdzcGnY++v+GQlIAL6qyTOd
 9sBIzwC2sNiVKluVS7qt6sYBgMGPcBGWokc+/6/RbX5u0etwgtXbNsqVNuyzP9V6VR
 Xe2cIy+F6eWXw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ce5b6d00000>; Thu, 23 May 2019 08:53:36 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Thu, 23 May 2019 08:53:37 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 23 May 2019 08:53:37 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 1/2] mtd: concat: refactor concat_lock/concat_unlock
Thread-Topic: [PATCH 1/2] mtd: concat: refactor concat_lock/concat_unlock
Thread-Index: AQHVEDJo4rpNy/YxbUOF1g0LZpyjfw==
Date: Wed, 22 May 2019 20:53:36 +0000
Message-ID: <86adfe1f5a18492fbdf4bbe26ca05a93@svr-chch-ex1.atlnz.lc>
References: <20190522000753.13300-1-chris.packham@alliedtelesis.co.nz>
 <CAFLxGvzvAdhmNOaNmPCRXUR9GGgaQ1n2HuRLLCb4Nj-tUrm5yQ@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_135346_259621_73843B63 
X-CRM114-Status: GOOD (  13.97  )
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

On 23/05/19 8:30 AM, Richard Weinberger wrote:
> On Wed, May 22, 2019 at 2:08 AM Chris Packham
> <chris.packham@alliedtelesis.co.nz> wrote:
>>
>> concat_lock() and concat_unlock() only differed in terms of the mtd_xx
>> operation they called. Refactor them to use a common helper function and
>> pass mtd_lock or mtd_unlock as an argument.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>   drivers/mtd/mtdconcat.c | 41 +++++++++--------------------------------
>>   1 file changed, 9 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
>> index cbc5925e6440..9514cd2db63c 100644
>> --- a/drivers/mtd/mtdconcat.c
>> +++ b/drivers/mtd/mtdconcat.c
>> @@ -451,7 +451,8 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
>>          return err;
>>   }
>>
>> -static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +static int __concat_xxlock(struct mtd_info *mtd, loff_t ofs, uint64_t len,
>> +                          int (*mtd_op)(struct mtd_info *mtd, loff_t ofs, uint64_t len))
>>   {
>>          struct mtd_concat *concat = CONCAT(mtd);
>>          int i, err = -EINVAL;
>> @@ -470,7 +471,7 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>                  else
>>                          size = len;
>>
>> -               err = mtd_lock(subdev, ofs, size);
>> +               err = mtd_op(subdev, ofs, size);
>>                  if (err)
>>                          break;
>>
>> @@ -485,38 +486,14 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>          return err;
>>   }
>>
>> -static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>   {
>> -       struct mtd_concat *concat = CONCAT(mtd);
>> -       int i, err = 0;
>> -
>> -       for (i = 0; i < concat->num_subdev; i++) {
>> -               struct mtd_info *subdev = concat->subdev[i];
>> -               uint64_t size;
>> -
>> -               if (ofs >= subdev->size) {
>> -                       size = 0;
>> -                       ofs -= subdev->size;
>> -                       continue;
>> -               }
>> -               if (ofs + len > subdev->size)
>> -                       size = subdev->size - ofs;
>> -               else
>> -                       size = len;
>> -
>> -               err = mtd_unlock(subdev, ofs, size);
>> -               if (err)
>> -                       break;
>> -
>> -               len -= size;
>> -               if (len == 0)
>> -                       break;
>> -
>> -               err = -EINVAL;
>> -               ofs = 0;
>> -       }
>> +       return __concat_xxlock(mtd, ofs, len, mtd_lock);
>> +}
>>
>> -       return err;
>> +static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>> +{
>> +       return __concat_xxlock(mtd, ofs, len, mtd_unlock);
>>   }
>>
>>   static void concat_sync(struct mtd_info *mtd)
> 
> Not sure if it passing a function pointer is worth it. bool is_lock would
> also do it. But this is a matter of taste, I guess. :)

I briefly considered that. But since mtd_lock(), mtd_unlock() and 
mtd_is_locked() all take the same arguments I figured it'd benefit from 
some type checking. A bool wouldn't work (assuming I can convince you 
about 2/2) but an enum mtd_op or int flags would do the trick if you 
want me to change it.

> 
> Reviewed-by: Richard Weinberger <richard@nod.at>
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
