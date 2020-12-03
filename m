Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B68C64E7C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 03:02:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FED21D91
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 03:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FED21D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c5QK1XLfxd9PSZeXXkAvkT+fRULxzEtDiNOo1w23E88=; b=ydI/jhoWBoZnzLO5m4WLAcLVw
	qMVCEIV7nuFlcof0Q6L4oZt8fIESQhG6+kEqlySRumnXzAUfYMLhDBn6dBgD4oV6L4t322gbOpY7b
	KrCnjwrpTl1pYOqUpTo7Z66hEuCKIy4a8RX/rZaYVJAbINSZMzbkGFVdfy++lfMVDLQYTwlgqw/ak
	lm1R2uPVYll8x1JB9Efj+OBYz3C5vCcdvCdfat/i/dQlUG1c5NHe/evIY4YvU5Sc+4wKJmfjG1ny4
	qM0MMGJJbHio1+t25JmVChaqK4gQLnDB5pFkLE7phDjh2VhbV4E80cz8Cco8WeGOdataPqzygv0N6
	PZfZsI1Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkesZ-0004Ll-Fz; Thu, 03 Dec 2020 03:01:59 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkesV-0004L7-VY
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 03:01:57 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cmgb40Ydbzhlqp;
 Thu,  3 Dec 2020 11:01:20 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 3 Dec 2020 11:01:37 +0800
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add post bfpt fixup for
 mx25u51245g
To: <Tudor.Ambarus@microchip.com>, <masonccyang@mxic.com.tw>,
 <linux-mtd@lists.infradead.org>
References: <1606881552-41659-1-git-send-email-yangyicong@hisilicon.com>
 <303d9546-5a74-dc75-18bb-a00e38143b2d@microchip.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <0757e303-0961-2a69-ad9d-742df8f72214@hisilicon.com>
Date: Thu, 3 Dec 2020 11:01:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <303d9546-5a74-dc75-18bb-a00e38143b2d@microchip.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_220156_305031_13B7B49D 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, linuxarm@huawei.com, vigneshr@ti.com, prime.zeng@huawei.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/12/2 19:14, Tudor.Ambarus@microchip.com wrote:
> On 12/2/20 5:59 AM, Yicong Yang wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The 64MB MX66U51235F's BFPT_WORD(1) declares
>> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 and it doesn't provide
>> a 4BAIT table, so the address width will be set to
>> 3-byte by default after parsing BFPT, which will make
>> the upper memory region unusable.
>>
>> As the MX66U51235F shares the same JEDEC ID with
>> MX25U51245G and is identified to MX25U51245G, add a
>> post bfpt fix hook to correct the address width in
>> MX25U51245G's entry will solve this issue. It won't
>> affect MX25U51245G which also use 4-byte address
>> width and the address width will be valided when
>> parsing its 4BAIT table.
>>
> isn't this fixed by the following commit?
>
> 324f78dfb442 ("mtd: spi-nor: Fix address width on flash chips > 16MB")

yes. I fall behind. Sorry to bother and thanks for the hint.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
