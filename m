Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CB4C43461
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 14:51:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 852F56121E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 14:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 852F56121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yfM0UebsO2SzPUp2hTtXVUyqLCoEAIxE9Jc5Rnhfl9Q=; b=LDuvS051nJ48TqtH6NHP3dRGq
	omrg8IoLOTyXVs/qgO4Rf9BLgwPXkJDEOa/K65n4VwmHOP85uV48wtE3pW3TUL931pf/W7u1pa89U
	l88N97PQwz5JQjrGMg+e0VH/gdrYwaUieTNW1TLcFbhoTLdE0pF3iHbguuxXimU91CygXa5I/OJc1
	UU8qycJ00/jK+9e7r5kJ2lrL9pJJ0DvP/ysCfxSUbCYWne/5F8JJLMjJdZEOM4WFL6JsgNW8Rhh8Y
	OdBP7jN7p/oyFfqw4UHHzW0RVj/9dTz1fPS/gQPYJckJHS82qyULocQTnXx7pc5ogni8PUp3CD0ZR
	CNHJWwDbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9Vc-005CFT-9P; Wed, 07 Apr 2021 14:50:20 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9VS-005CDh-5S
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 14:50:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 98E7822236;
 Wed,  7 Apr 2021 16:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617807004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnU2n+KM7qnw4XzMBTllWVY/6MgIF2o1KxDsz5TCqY0=;
 b=IsQGGkI+rsKtJeR8bkhCVciCDVMWivarzQKhQQLD5IbdNjpYkNr7QyQtsJr83pIgwDLt9L
 m05O5Bn7e09Q0BbSYZDUsM0eAEtQIiiSm2Dd5PCG1X5QBNpiNmTlI1tvPOMP4JMyK8yyKJ
 vmyTM+B3ujOEnyXDYXQ3dNKSGGfzZ1s=
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 16:50:02 +0200
From: Michael Walle <michael@walle.cc>
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linuxarm@huawei.com, prime.zeng@huawei.com
Subject: Re: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
In-Reply-To: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
References: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2f4b541e47046ee55728bca1a383033c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_155015_170267_DEEA81EE 
X-CRM114-Status: GOOD (  11.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hi,

nit: subject should be "mtd: spi-nor: Fix.."

Am 2021-04-01 09:34, schrieb Yicong Yang:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> If rmmod the driver during read or write, the driver will release the
> resources which are used during read or write, so it is possible to
> refer to NULL pointer.
> 
> Use the testcase "mtd_debug read /dev/mtd0 0xc00000 0x400000 dest_file 
> &
> sleep 0.5;rmmod spi_hisi_sfc_v3xx.ko", the issue can be reproduced in
> hisi_sfc_v3xx driver.
> 
> To avoid the issue, fill the interface _get_device and _put_device of
> mtd_info to grab the reference to the spi controller driver module, so
> the request of rmmod the driver is rejected before read/write is 
> finished.
> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Reviewed-by: Michael Walle <michael@walle.cc>
Tested-by: Michael Walle <michael@walle.cc> [with spi-nxp-fspi and 
spi-fsl-dspi]

btw. you can also do:
lsmod
exec 3<> /dev/mtd0
lsmod

and have a look at the ref count.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
