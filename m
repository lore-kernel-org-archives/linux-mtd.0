Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D05C33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 12:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC2142082E
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 12:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+LQjlTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC2142082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F4M0YGmooqtS235tlRMw4gh8SmnaDNanooOcbcB24Y8=; b=P+LQjlTRQR2P2IwKakipfXcZB
	kE/rehCDK0L0bnuNI5pDG/vsvJfhWJZcRCbHZPF6kvfDrQ8Wwo/Xd7yEIicCod4F7fYK9TchQ5+C+
	eohDuBsxDTSu+ZdX+git9DzfZ3JLQ9dBp+An4pP3NekaV2C2jJKb91kUEAbRDdu1pq+gVosvGGGGJ
	cKkt/XlHLyX3ADPfjUKcv5zTuqsMFc33yiRchs6A+VKyBjcaEqzmNGJhKwNyRk2aAYeeB+Dy1uPzr
	HYrVNykRWfr/Lmyf8/+SAgFlR5J/kMDyxCm2GXfm5gGUtwkY7KEjHrHguBpSmbpJApClP8ba86LqT
	NfmrHiFig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipsxI-0004G0-Go; Fri, 10 Jan 2020 11:59:56 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipstg-0000iv-RQ
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 11:56:14 +0000
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 31940E814E5B3BE5243A;
 Fri, 10 Jan 2020 11:56:09 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml707-cah.china.huawei.com (10.201.108.48) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 10 Jan 2020 11:56:08 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 10 Jan
 2020 11:56:08 +0000
Subject: Re: flash_lock issue for n25q 128mb spi nor part
To: <Tudor.Ambarus@microchip.com>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <6667f429-4732-d098-843a-7a030010f192@ti.com>
 <e7d782d3-2b7a-4141-e511-a238de626688@huawei.com>
 <3245882.KdgdznRmvK@localhost.localdomain>
From: John Garry <john.garry@huawei.com>
Message-ID: <1e034044-decb-be72-9455-33f0a6f7fc12@huawei.com>
Date: Fri, 10 Jan 2020 11:56:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <3245882.KdgdznRmvK@localhost.localdomain>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_035613_112565_E0B2B75F 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: js07.lee@samsung.com, broonie@kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/01/2020 11:51, Tudor.Ambarus@microchip.com wrote:
> On Thursday, January 9, 2020 12:36:11 PM EET John Garry wrote:
>> Apart from this issue, on another topic, is there any special reason
> 
> Ups, I forgot about this. I had a patch for it, let me find it.

ok, cool

> 
>> which we don't support status register.BP3? Is it that it is not
>> adjacent to BP2 in the register, so makes handling trickier?
> 
> Jungseung worked in the past for adding BP3 support. He have just sent a new
> patch set for addressing this, feedback is welcomed:
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=152401

oh, great. I'll have a look.

Thanks,
John

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
