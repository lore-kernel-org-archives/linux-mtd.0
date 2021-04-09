Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDE9C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 06:06:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3590610F7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 06:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3590610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EH7AxFrSixwlE58B8oTB5qb5RJy09NLjJnQFlx+G4V0=; b=M2v9OQq1zr0k2kIROih/rGSay
	pxPxxWtBjjvBH30CAjB93Pup/CVZ38L3j/uk77um0bC8W4e1qAs6hMgzIeR4Ka6qcQYsKQ8l6L1Jl
	Ao+EeQflZXnrVEuTF5Qh4i17QX7FdaXaZ28yY0ov6EaRzkV9Xy9zTkrKhKqBZx6baMCLhY6LZpSjL
	gi2fHB57/ah+QzgAZvZQOxebe1Fqk1FAwCld5nTVPCuxEbrDir989OnPVhfuir8KHR/MIlxVn8BfR
	gM6nhdGyPtBzaBJnRwmakDg5a3GD4N6sUIthbeG4uyyxN27HYFLqx/WhxhvrKenokX8GuYGP8zTiR
	WITeIjyzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUkGt-00AFc3-PP; Fri, 09 Apr 2021 06:05:36 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUkGc-00AFYq-T5
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 06:05:30 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGnc74KQJz1BG9m;
 Fri,  9 Apr 2021 14:03:03 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.196) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 14:05:07 +0800
Subject: Re: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
To: <Tudor.Ambarus@microchip.com>, <p.yadav@ti.com>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>
References: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
 <a77d9b48-e7c4-044f-3c14-25bcc817b43f@microchip.com>
 <a2133aef-eb35-838e-db76-7ea3781019c2@hisilicon.com>
 <c5d1ea37-4a38-c7b5-8cd5-88f304d68fdd@microchip.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <dd602acb-0d2a-208d-c1f6-eb1d321e9f83@hisilicon.com>
Date: Fri, 9 Apr 2021 14:05:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c5d1ea37-4a38-c7b5-8cd5-88f304d68fdd@microchip.com>
X-Originating-IP: [10.69.38.196]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_070520_603954_D32C3A51 
X-CRM114-Status: GOOD (  16.59  )
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

On 2021/4/9 12:13, Tudor.Ambarus@microchip.com wrote:
> On 4/9/21 7:03 AM, Yicong Yang wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 2021/4/9 11:21, Tudor.Ambarus@microchip.com wrote:
>>> On 4/1/21 10:34 AM, Yicong Yang wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>>>
>>>> If rmmod the driver during read or write, the driver will release the
>>>> resources which are used during read or write, so it is possible to
>>>> refer to NULL pointer.
>>>>
>>>> Use the testcase "mtd_debug read /dev/mtd0 0xc00000 0x400000 dest_file &
>>>> sleep 0.5;rmmod spi_hisi_sfc_v3xx.ko", the issue can be reproduced in
>>>> hisi_sfc_v3xx driver.
>>>>
>>>> To avoid the issue, fill the interface _get_device and _put_device of
>>>> mtd_info to grab the reference to the spi controller driver module, so
>>>> the request of rmmod the driver is rejected before read/write is finished.
>>>>
>>>
>>> Do we care for a Fixes tag and a Cc to stable? I guess this bug is present
>>> since the introduction of the driver.
>>>
>>
>> yes. I cannot find a proper fix tag. so perhaps:
> 
> Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
> should be fine.
> 

it does make sense. please add that and the Cc stable when applying. thanks.

>>
>>   Cc: stable@vger.kernel.org
>>
>>>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>
>>> Will fix the subject of the commit when applying.>
>>
>> thanks!
>>
>>> Thanks,
>>> ta
>>>> ---
>>>>  drivers/mtd/spi-nor/core.c | 33 +++++++++++++++++++++++++++++++++
>>>>  1 file changed, 33 insertions(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index 0522304..72bc134 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -3301,6 +3301,37 @@ static void spi_nor_resume(struct mtd_info *mtd)
>>>>                 dev_err(dev, "resume() failed\n");
>>>>  }
>>>>
>>>> +static int spi_nor_get_device(struct mtd_info *mtd)
>>>> +{
>>>> +       struct mtd_info *master = mtd_get_master(mtd);
>>>> +       struct spi_nor *nor = mtd_to_spi_nor(master);
>>>> +       struct device *dev;
>>>> +
>>>> +       if (nor->spimem)
>>>> +               dev = nor->spimem->spi->controller->dev.parent;
>>>> +       else
>>>> +               dev = nor->dev;
>>>> +
>>>> +       if (!try_module_get(dev->driver->owner))
>>>> +               return -ENODEV;
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static void spi_nor_put_device(struct mtd_info *mtd)
>>>> +{
>>>> +       struct mtd_info *master = mtd_get_master(mtd);
>>>> +       struct spi_nor *nor = mtd_to_spi_nor(master);
>>>> +       struct device *dev;
>>>> +
>>>> +       if (nor->spimem)
>>>> +               dev = nor->spimem->spi->controller->dev.parent;
>>>> +       else
>>>> +               dev = nor->dev;
>>>> +
>>>> +       module_put(dev->driver->owner);
>>>> +}
>>>> +
>>>>  void spi_nor_restore(struct spi_nor *nor)
>>>>  {
>>>>         /* restore the addressing mode */
>>>> @@ -3495,6 +3526,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>>         mtd->_read = spi_nor_read;
>>>>         mtd->_suspend = spi_nor_suspend;
>>>>         mtd->_resume = spi_nor_resume;
>>>> +       mtd->_get_device = spi_nor_get_device;
>>>> +       mtd->_put_device = spi_nor_put_device;
>>>>
>>>>         if (nor->params->locking_ops) {
>>>>                 mtd->_lock = spi_nor_lock;
>>>> --
>>>> 2.8.1
>>>>
>>>
>>
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
