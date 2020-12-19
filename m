Return-Path: <SRS0=vxLv=FX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A4EC4361B
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 23:00:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EDA123426
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 23:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EDA123426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sqa6tMMRCy0KscYvgo73rjT7qIBdW4hdlS+0cavMMnk=; b=absLr2680/em0jS5wj/pI6zme
	F/Ces4feUuYSi9p0m1WSutk9t9yCVsXlI2lxx5oyhvCJ/781q2MuE5XPioZGQKLOWMjeGi6tf3miT
	DGKd3mz3vEtVzaZeZfVwUHCO/UnZqOgPM172bQ8yO9D+jihC8xDmqnO1VLQJEwr2uO29vQaLKY8ha
	t1LYjml16GGAcXlXxR+5lZsjWBnajyXzhIDjV0nNY1r/llhx0SAzt+Fkbo43Q73aWlt5A8cSm4A8Q
	6aGEHrqy+hj5B31Oun9kdvVduvy2frpKwQAJSYjBPdro/ZSMyZROtrBsH/e1uwbUHVSnvOMbMf6XY
	nuxpD1NSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqlBg-0002zr-1b; Sat, 19 Dec 2020 22:58:56 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqlBd-0002zU-Q7
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2020 22:58:54 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1kqlBU-008jph-Vm
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2020 23:58:45 +0100
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8]
 by yawp.biot.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1kqlBU-008jpd-QG; Sat, 19 Dec 2020 23:58:44 +0100
Subject: Re: [PATCH] Add spi-nor driver for Realtek RTL838x/RTL839x switch SoCs
To: Tudor.Ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, john.garry@huawei.com,
 bbrezillon@kernel.org, gch981213@gmail.com,
 vadivel.muruganx.ramuthevar@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20201215214656.649896-1-bert@biot.com>
 <410ca5c2-96a0-ffd0-e1c0-316fe37ff4d5@microchip.com>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <faaa83e9-e702-abfc-e298-fda1fa224b69@biot.com>
Date: Sat, 19 Dec 2020 23:58:44 +0100
MIME-Version: 1.0
In-Reply-To: <410ca5c2-96a0-ffd0-e1c0-316fe37ff4d5@microchip.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_175853_869912_1B5BF7EB 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/16/20 9:30 AM, Tudor.Ambarus@microchip.com wrote:
> On 12/15/20 11:46 PM, Bert Vermeulen wrote:
>> This driver supports the spiflash core in all RTL838x/RTL839x SoCs,
>> and likely some older models as well (RTL8196C).
>> 
> Can we use SPIMEM and move this under drivers/spi/ instead?

I wasn't aware spimem was the thing to use for new drivers. I will rewrite 
the driver to that API.


-- 
Bert Vermeulen
bert@biot.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
