Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E88C2BA19
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 08:23:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028B720784
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 08:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h89zgS6V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028B720784
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lB3hZlCEwUv69v3EE8pwdOs/2/ejo/W4Dgz+A+496lE=; b=h89zgS6VsTl41V
	YMCdk1eM9zyx/WVianWSv8iEFXYDWN57XOAEHv54s+BBAMqpY89BIrkvOELHg+9eP03I+b79JhkrV
	nKgN0I1aDr1wO9Axd6WFY0eePxXJCzLiRpCCvaNEGW3xNf5QKQVoZIXdLPaXCuNvevET1l/b4pI8S
	TOJF0w8FLvrxMcyviWYW7jTU3I7WCtWR2gG+QpRnLQzoE3bkhSY+ynThC9iKD81A/ZtmlT8lk252t
	eVaSZ/sqapnFcoglEMvZ5sdDowNYOUcQQO3V9JjDVb1E+XR5FByzepVOYAufoIByN5cFhG4lJlEKs
	Q3yLbBbiJRcF37MU1B0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOdK1-00055F-6S; Wed, 15 Apr 2020 08:23:01 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOdJy-0004qN-D2
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 08:22:59 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9115E84851A886B992B1;
 Wed, 15 Apr 2020 16:22:47 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 15 Apr 2020 16:22:42 +0800
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for cy15x104q
To: Sascha Hauer <s.hauer@pengutronix.de>, <Tudor.Ambarus@microchip.com>
References: <20200305120242.1391-1-s.hauer@pengutronix.de>
 <20200309084033.8752-1-s.hauer@pengutronix.de>
 <20200414120945.GN27288@pengutronix.de> <11398746.sNIsW2IRu5@192.168.0.120>
 <20200415053527.GQ27288@pengutronix.de>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <bb25136d-145a-65de-9c63-cac5184ceac9@hisilicon.com>
Date: Wed, 15 Apr 2020 16:22:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200415053527.GQ27288@pengutronix.de>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_012258_607616_2AC78898 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/4/15 13:35, Sascha Hauer wrote:
> Hi Tudor,
>
> On Tue, Apr 14, 2020 at 04:41:42PM +0000, Tudor.Ambarus@microchip.com wrote:
>> On Tuesday, April 14, 2020 3:09:45 PM EEST Sascha Hauer wrote:
>>> Any feedback to this one?
>> Hi, Sascha,
>>
>> I'm a bit busy but I'll try to allocate time to review patches sometime this 
>> week. BTW, we moved the manufacturer specific code out of the core, we now 
>> have a dedicated file for each manufacturer (this includes flash_info 
>> entries), check the spi-nor/next branch.
> I see. It's in master now btw.
>
>> I know that it's not your fault that
>> your patch was left behind, so I volunteer to respin your patch if you don't
>> feel like doing it.
> Don't worry, I can respin it. You want to have a cypress.c file, even
> though it has only a single entry, right?

Hi Sascha,

Maybe it's okay to put in spansion.c, as Spansion/Cypress may use same
manufacturer id on some flash. Otherwise, we should spilt the Cypress ones from
list in spansion.c to new cypress.c.

Regards,
Yicong


>
> Sascha
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
