Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05432C3F2D2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 17:17:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA54246A3
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 17:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y3DTBsca"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA54246A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V87xaHAiqN+VEyQIiHgFugfpRQ/A93NgargaJWAklmw=; b=Y3DTBsca+bAz2KOZ8I4dX+VIA
	fdvU58GLQE1jBWgdwtd2A3+T8+uZDcL1pty1c+6M8KPo1tyCzz6+gals3Jj7pgHZ+uw1jpNasDMv9
	LAVWRuseFmlBRf6S67WCYcR3KMcaGp3r7W0PZElj/jzLamVFQqydkD940YaFE0zKB7t+mDcDX3bqL
	0JIIt+B7bwSg5uYo1JnP95oZZa0pM+OJPBE0/CUAgbFp2yyuuBPRITZJyx+f8t7xp0XF/aMOhd6WH
	u7hvTDg9uDdqLfmrunrMFlFUg48k0TQtzJ6Km7sZs45WSazDeeianopCphEKxga8m5jR0JGWH/zXW
	zNfyUFQaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7jGS-0004eU-6W; Fri, 28 Feb 2020 17:17:28 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7jGP-0004dS-0F
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 17:17:27 +0000
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 3B93C3EC7F4F8817DCB1;
 Fri, 28 Feb 2020 17:17:21 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 28 Feb 2020 17:17:20 +0000
Received: from [127.0.0.1] (10.210.169.120) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Fri, 28 Feb
 2020 17:17:19 +0000
Subject: Re: [PATCH RFC 3/3] spi: HiSilicon v3xx: Use DMI quirk to set
 controller buswidth override bits
To: Mark Brown <broonie@kernel.org>
References: <1582903131-160033-1-git-send-email-john.garry@huawei.com>
 <1582903131-160033-4-git-send-email-john.garry@huawei.com>
 <20200228162057.GC4956@sirena.org.uk>
From: John Garry <john.garry@huawei.com>
Message-ID: <a3b1711b-ed70-59d0-3326-991f1531db2b@huawei.com>
Date: Fri, 28 Feb 2020 17:17:18 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200228162057.GC4956@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.210.169.120]
X-ClientProxiedBy: lhreml707-chm.china.huawei.com (10.201.108.56) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_091725_188031_FA1F0763 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: linux-spi@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28/02/2020 16:20, Mark Brown wrote:
> On Fri, Feb 28, 2020 at 11:18:51PM +0800, John Garry wrote:
>> The Huawei D06 board (and variants) can support Quad mode of operation.
>>
>> Since we have no current method in ACPI SPI bus device resource description
>> to describe this information, use DMI to detect the board, and set the
>> controller buswidth override bits.
> 
> Hopefully this is something that the ACPI people will be looking to
> address going forwards :/
> 

Yeah, well I did mention the bugzilla [0] I raised for this in the cover 
letter; but I think that the new process workflows to raise feature 
requests in this way still needs to be formalized, so this may be 
blocked for now [1].

And unfortunately I can't actively participate in relevant standards WGs 
either, so if anyone else would like to assist, then that would great...

BTW, I think that it might also be good to request a generic 
jedec-compatible SPI NOR part ACPI HID/CID here also.

Thanks,
John

[0] https://bugzilla.tianocore.org/show_bug.cgi?id=2557
[1] https://edk2.groups.io/g/devel/message/53420

> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
