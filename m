Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA7FC3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 13:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1DBB23438
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 13:39:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Waikglrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1DBB23438
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lUNbpFSRohR3h/2lue8GI78UQRj9vy/vXCYiUS+2nXA=; b=WaikglrslHiqFcD6Q0gxt55Tg
	8W1CKAlU8QA0j0srrw+Tnw9H+5JFhoui6Q0wOXxjy/wP6l+4bhl/xwpvqESEanRsVgC2Agwpidru6
	GRtmfcRgFymkR+jMoWRFetV/V/CB2BNzj2iy3YjT9BuRbsm2s4SHkVPcw3zd81+O7w8TH2tXYdu27
	0OHYWwncuf9hsjwmlkY80EAgjmQwwLawAbvSZK76QKPhtxBnjw/5vNc+5MdWVu2p7ZTchzwi7azyo
	jSmOWphXD5wZ41IPOgpfROqmkn0QJtzkqYlmcFS8VKktpd8fyi96c6dXYJP00s9LBrJ1vcE05xSpn
	V3Qusg39Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Qpl-0005Vx-3W; Wed, 21 Aug 2019 13:39:29 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Qph-0005Ux-NR
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 13:39:27 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 654F640D1167F25D5595;
 Wed, 21 Aug 2019 21:39:19 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 21 Aug 2019 21:39:09 +0800
From: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
To: Mark Brown <broonie@kernel.org>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
 <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
 <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
 <ab2d3c29-982f-cb13-e2a2-e6d8da8f1438@huawei.com>
 <b2a475eb-58e6-e7c7-7b8f-b1be04cf27c0@ti.com>
 <c5e063e8-5025-8206-f819-6ce5228ef0fb@huawei.com>
 <20190820165826.GF4738@sirena.co.uk>
Message-ID: <bd9109c6-8f25-f674-4a7b-c659c4c368df@huawei.com>
Date: Wed, 21 Aug 2019 14:39:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20190820165826.GF4738@sirena.co.uk>
X-Originating-IP: [10.202.227.238]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_063925_953717_A4D2398C 
X-CRM114-Status: GOOD (  11.03  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "richard@nod.at" <richard@nod.at>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
 wanghuiqiang <wanghuiqiang@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 20/08/2019 17:58, Mark Brown wrote:
> On Tue, Aug 20, 2019 at 03:09:15PM +0100, John Garry wrote:
>> On 19/08/2019 05:39, Vignesh Raghavendra wrote:
>>> On 16/08/19 3:50 PM, John Garry wrote:
>
>>>> About the child spi flash devices, is the recommendation to just use
>>>> PRP0001 HID and "jedec,spi-nor" compatible?
>
>>> I am not quite familiar with ACPI systems, but child flash device should
>>> use "jedec,spi-nor" as compatible.
>
>> Right, so to use SPI MEM framework, it looks like I will have to use PRP0001
>> and "jedec,spi-nor" as compatible.
>
>> My reluctance in using PRP0001 and compatible "jedec,spi-nor" is how other
>> OS can understand this.
>

Hi Mark,

> Last I heard Windows wasn't doing anything with PRP0001 but on the other
> hand the idiomatic way to handle this for ACPI is as far as I can tell
> to have what is essentially a board file loaded based on DMI information
> without any real enumerability so there's no real conflict between the
> two methods.

Fine, I'll consider this alt method further.

Thanks,
John

>




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
