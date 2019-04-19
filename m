Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C42C282DC
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 03:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF3C205ED
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 03:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EUuxQKXl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF3C205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8//ifCcaTXeJPXTfkolgy863BwQWNEkE0AC7LwLV+EM=; b=EUuxQKXlrqV+zytGeBwELWmnx
	JjmG+mIvx3KtiAYp2kMTZ2tDqIcjBggShubVDFNWWqGSAJ18F+KJswhATnmGLB0jiUSRkNLkl96BT
	D6fFIDVr90sYS7bPiJ8VqDkwIggW5omjKNInCb21C6asVgN6tKspunaOFaZw46gx3IdsNeyBRzTgL
	Ow11L72F2YkkcHhw48cUEx97rFzLh4Z6aRF9B59NWiGy9mMXStAMc1cJto/qf3qHHFcUspSt6hY8G
	5JNkGiL0YQSbjuPruQI8QsndW1mRRIEeoucxX8RV93x21sM2fOZCUALIR1G3kJiBxsQ5zdcYt8cOT
	PcL58vjbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHKbT-0002sx-Nb; Fri, 19 Apr 2019 03:54:19 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHKbL-0002mk-NU; Fri, 19 Apr 2019 03:54:13 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 19 Apr
 2019 11:52:52 +0800
Subject: Re: [PATCH 4/4] mtd: rawnand: meson: only initialize the RB
 completion once
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
 <20190411220056.19109-5-martin.blumenstingl@googlemail.com>
 <bd1900db-7ca1-a6e5-39f9-db54e0b570dd@amlogic.com>
 <CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <8ff232c3-f325-5b91-4de1-a39e63939df2@amlogic.com>
Date: Fri, 19 Apr 2019 11:52:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_205411_766485_FFF47125 
X-CRM114-Status: GOOD (  16.63  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-amlogic@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Martin,

On 2019/4/19 3:44, Martin Blumenstingl wrote:
> Hi Liang,
> 
> On Mon, Apr 15, 2019 at 8:04 AM Liang Yang <liang.yang@amlogic.com> wrote:
>>
>>
>> On 2019/4/12 6:00, Martin Blumenstingl wrote:
>>> Documentation/scheduler/completion.txt states:
>>>     Calling init_completion() on the same completion object twice is
>>>     most likely a bug as it re-initializes the queue to an empty queue and
>>>     enqueued tasks could get "lost" - use reinit_completion() in that case,
>>>     but be aware of other races.
>>>
>>> Initialize nfc->completion in meson_nfc_probe using init_completion and
>>> change the call in meson_nfc_queue_rb to reinit_completion so the logic
>>> matches what the documentation suggests.
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> ---
>>>    drivers/mtd/nand/raw/meson_nand.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
>>> index 57cc4bd3f665..ea57ddcec41e 100644
>>> --- a/drivers/mtd/nand/raw/meson_nand.c
>>> +++ b/drivers/mtd/nand/raw/meson_nand.c
>>> @@ -400,7 +400,7 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
>>>        cfg |= NFC_RB_IRQ_EN;
>>>        writel(cfg, nfc->reg_base + NFC_REG_CFG);
>>>
>>> -     init_completion(&nfc->completion);
>>> +     reinit_completion(&nfc->completion);
>> Tested-by:Liang Yang <liang.yang@amlogic.com>
>> Acked-by: Liang Yang <liang.yang@amlogic.com>
> thank you for reviewing and testing my patches!
> 
> [...]
>> Tested-by:Liang Yang <liang.yang@amlogic.com>
>> Acked-by: Liang Yang <liang.yang@amlogic.com>
> please consider the following note for future code-reviews:
> most maintainers take the patch from patchwork and apply it to their git tree.
> however, patchwork is not smart enough to detect when the same
> Tested-by/Acked-by is sent multiple times.
> this results in the same Tested-by/Acked-by being listed multiple
> times in the final commit: [0]
> 
> what I do instead is to reply with one set of Tested-by/Acked-by
> (below the author's Signed-off-by) which is then valid for the whole
> patch.
> There's no problem to have Tested-by and Acked-by at the same time,
> the issue only shows up if you send Acked-by (or any other tag) for
> the same patch multiple times.
> 
Thanks. Well, I known about it now.

> 
> Have a great day!
> Regards,
> Martin
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=nand/next&id=39e01956e2f70ff9f0e97db1a69c9847aa1d5d8b
> 
> .
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
