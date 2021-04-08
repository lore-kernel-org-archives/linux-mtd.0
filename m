Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8755CC433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:12:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E83610E5
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4E83610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ypnkb1ETdDCMN/VhJvrrbaOLJjE/ayN2nrYo7/TiySE=; b=WUjHq3FObWoHuCKiFUCliPCfk
	1IVWMJcmqDGfM9czubtsSMnNb7BpZ32ySAGpi3vlckaxgdlM+p3z3Q5uR1C78f5mA1NemHnn8pyy2
	o7UZRf8G/07NU/pujMESJxa+s2te9cGHKP+Lyf1mjdziv1BFEP+vpWcxzA5IIxss8JAJOeF86ifC/
	sFtLAQwXILBqe/PpjlnXUm/vCuRYzuwRQnFjRgrh6WPNSXJVS/ZdbaK6X1c07AywbJaxaCWjXv1/7
	gL3BusHUH9M12FXF0stQh6sjuoWJwvYtg+F5GKpwuo3fENOvV2nL+lxVZi7x8djD262vMU6B5VHvR
	icsh1RBfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUSZM-007ljL-FW; Thu, 08 Apr 2021 11:11:28 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUSZ0-007ldW-EJ
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 11:11:09 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGJRs1NVZzkjXX;
 Thu,  8 Apr 2021 19:09:13 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 19:10:54 +0800
Subject: Re: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
To: Michael Walle <michael@walle.cc>
CC: <tudor.ambarus@microchip.com>, <p.yadav@ti.com>,
 <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linuxarm@huawei.com>,
 <prime.zeng@huawei.com>
References: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
 <2f4b541e47046ee55728bca1a383033c@walle.cc>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <057754d2-1438-4adb-4773-b1ae18f635ae@hisilicon.com>
Date: Thu, 8 Apr 2021 19:10:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2f4b541e47046ee55728bca1a383033c@walle.cc>
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_121106_992859_8C0A47CC 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2021/4/7 22:50, Michael Walle wrote:
> Hi,
> 
> nit: subject should be "mtd: spi-nor: Fix.."
> 

thanks. maybe Tudor can get this fixed, or i'll
send a v2 one.

> Am 2021-04-01 09:34, schrieb Yicong Yang:
>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>
>> If rmmod the driver during read or write, the driver will release the
>> resources which are used during read or write, so it is possible to
>> refer to NULL pointer.
>>
>> Use the testcase "mtd_debug read /dev/mtd0 0xc00000 0x400000 dest_file &
>> sleep 0.5;rmmod spi_hisi_sfc_v3xx.ko", the issue can be reproduced in
>> hisi_sfc_v3xx driver.
>>
>> To avoid the issue, fill the interface _get_device and _put_device of
>> mtd_info to grab the reference to the spi controller driver module, so
>> the request of rmmod the driver is rejected before read/write is finished.
>>
>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> Reviewed-by: Michael Walle <michael@walle.cc>
> Tested-by: Michael Walle <michael@walle.cc> [with spi-nxp-fspi and spi-fsl-dspi]
> 
> btw. you can also do:
> lsmod
> exec 3<> /dev/mtd0
> lsmod
> 
> and have a look at the ref count.
> 

yes, it works. the ref count are get by the open() callback. thanks for the hint.

thanks
Yicong

> -michael
> 
> .


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
