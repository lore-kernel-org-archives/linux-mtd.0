Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA143C5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 07:39:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE0DD2173E
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 07:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDIR/LOq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fx6NFhty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0DD2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cW32lL2cOqpV25//epGZPtKa8j0rfNSniLn/WujCEg=; b=pDIR/LOqzTPoQi
	jd7QzaDuWFJ0DDcgNTrsVcXgmTQMUmVRwpkuhu4H9Xl8qEhqA5MyClhogh2TTJ5ufAMaGPIXMtpLu
	u+aLVlBR/2zKrHUS9Um+hCkJlDozDN1ROj/Vr/ankm5Kq6ZogisLLW0QzAcXBMQjo1Upl2T3S3Jzf
	dUdQXf82S+QWTRxZV7hczre9HVHUBaefYU/sNDozQbTAPH1OqdRZ7RCBy64b7bxSiu9+kBt5a2S1i
	mq4hunTE5gCGn9nQiKpcFD4axrX4lN4QZihxbQsmbi4TRW8Rm3tMIHC6tX9i4L+VfCnZilFjXfFGL
	DMhNUF6seL9I7TALGVHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSFu3-0003n4-S2; Wed, 06 Nov 2019 07:38:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSFu0-0003mH-KZ
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 07:38:54 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA67clM9004697;
 Wed, 6 Nov 2019 01:38:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573025927;
 bh=Ct1yAMrZn1WGva5J/pseiPkfqGTYIlCrhJlXHcNEXiQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fx6NFhtyPKHH5owLe3mapQpV9sFsqd2wRTyxB8cISVEYnwmDN1durhYL4qLSoiYM/
 dtXqI6lF1ynlQGE6ZzvT0IP6OsbJ1KzaR4vo8fIy3tzxzbDgz+K5FxZwrMJH03LrDy
 BwX1E2bXCk2H+hBu6PlZfd9z9u/O08uJ1UiqAUXo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA67clVD075518
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Nov 2019 01:38:47 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 01:38:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 01:38:32 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA67cink009701;
 Wed, 6 Nov 2019 01:38:45 -0600
Subject: Re: [PATCH v4 12/20] mtd: spi-nor: Print debug message when the read
 back test fails
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-13-tudor.ambarus@microchip.com>
 <9474c875-94a1-3d19-ddab-b90d352967a9@ti.com>
 <5abf94c6-f2bb-b317-4796-3f9ea1fbf55e@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ae91a133-590b-17a4-4a68-be1b8baccce9@ti.com>
Date: Wed, 6 Nov 2019 13:09:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5abf94c6-f2bb-b317-4796-3f9ea1fbf55e@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_233852_757578_8934E188 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 06/11/19 12:54 PM, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 11/05/2019 02:37 PM, Vignesh Raghavendra wrote:
>> On 02/11/19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
>>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>
>>> Demystify where the EIO error occurs.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>> I think this is a small enough change that can be squashed into previous
>> patch itself
>>
> 
> I made separate patches because this is a separate logical change. The previous
> patch extends the check on all bits of the Status Register, while this one
> prints a debug message in case of EIO. Thus I tried to have a single logical
> change contained in a single patch. I'm clearly no expert in this (Boris asked
> me in v3 to split patches because I did too many things in one patch :) ), so I
> would keep this as is, but if you still feel that it should be squashed, then
> I'll do it. Please let me know.
> 

I am fine either way. I don't have a strong preference...

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
