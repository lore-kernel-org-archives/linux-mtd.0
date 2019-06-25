Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB840C48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 12:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E574204EC
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 12:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JmvySQp0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E574204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3Ebi5WMRAWoEtybDPhIgNGAOfIn1uOO89GJUi6asRk=; b=JmvySQp0bkGyNy
	vIyDaAxv/AfppeLywSruIdiM06Yj/zOacNKkV27axQssqIliR5dGhiTIcBb/+4q5m1mO1MdALkAS4
	gk2V8NjO7MNZGPerFXgUs5yYmr7xZ1qOoSagDE3FrtO5m3P9ViQkLckDZ/QDrg9Du+DmnZair0SKV
	VOMU4SuHIqAngojtkLygCvkho9QORaCjcg8ff2MJIPSSdDIlrWPNjra2D7eVmCUYTeFynffFNRc5b
	P/j9W4MxBjm1vqaxbhWNnNXsWIfy5ba83yLbvLeH+hCVeNlYsb1C/giMDUhzjrNlUtLQ63+jeMvJp
	CAxNZQFctP8FYNVs3lQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfkJW-0007ev-Tq; Tue, 25 Jun 2019 12:12:42 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfkC5-0000Ci-Tp
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 12:05:06 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id CA6CD67A062;
 Tue, 25 Jun 2019 14:04:58 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 25 Jun
 2019 14:04:58 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 25 Jun 2019 14:04:58 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [RESEND PATCH v2] mtd: spinand: read return badly if the last
 page has bitflips
Thread-Topic: [RESEND PATCH v2] mtd: spinand: read return badly if the last
 page has bitflips
Thread-Index: AQHVKvG5vIRdXk03g0+SrXGJtaID9aarjwGAgABB7wCAAFGaAIAAAnWA
Date: Tue, 25 Jun 2019 12:04:58 +0000
Message-ID: <3c019394-04a1-ff85-867f-29928a996931@kontron.de>
References: <1561424549-784-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190625030807.GA11074@kroah.com>
 <97adf58f-4771-90f1-bdaf-5a9d00eef768@kontron.de>
 <814a343e-e4c4-3ef2-29e2-d6c56f3d5bbb@allwinnertech.com>
In-Reply-To: <814a343e-e4c4-3ef2-29e2-d6c56f3d5bbb@allwinnertech.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <9EC415AB919DFC40958CBB43C7495004@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: CA6CD67A062.A1039
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, gch981213@gmail.com, gregkh@linuxfoundation.org,
 liaoweixiong@allwinnertech.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, stable@vger.kernel.org,
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_050502_370582_455167B3 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Marek
 Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 25.06.19 13:56, liaoweixiong wrote:
> Oh, i am sorry that i had misunderstanded your letter.

No problem ;)

> Thank you for your document and guidance.

You're welcome!

> On 2019/6/25 PM 3:04, Schrempf Frieder wrote:
>> Hi liaoweixiong,
>>
>> On 25.06.19 05:08, Greg KH wrote:
>>> On Tue, Jun 25, 2019 at 09:02:29AM +0800, liaoweixiong wrote:
>>>> In case of the last page containing bitflips (ret > 0),
>>>> spinand_mtd_read() will return that number of bitflips for the last
>>>> page. But to me it looks like it should instead return max_bitflips like
>>>> it does when the last page read returns with 0.
>>>>
>>>> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
>>>> ---
>>>>    drivers/mtd/nand/spi/core.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> <formletter>
>>>
>>> This is not the correct way to submit patches for inclusion in the
>>> stable kernel tree.  Please read:
>>>       https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>>> for how to do this properly.
>>>
>>> </formletter>
>>
>> FYI, you should not send the patch to stable@vger.kernel.org, but
>> instead, as I said in my other reply, add the tag "Cc:
>> stable@vger.kernel.org". See "Option 1" in the document Greg referred to.
>>
>> Thanks,
>> Frieder
>>
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
