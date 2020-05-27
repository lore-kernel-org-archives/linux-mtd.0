Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE72C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1141F20DD4
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 08:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J4kHMrSx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1141F20DD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXwtR3lX3PPgsRQWsYGVHgYnR73ePndl3UhFExcCGNA=; b=J4kHMrSx0A2zOW
	6jDmNXTqml3VcKYTMdFaSx86YR6AY4PjvhFCt53O2jQ6yXwkqyMFMBE2XtANcMns7fvprNojcd4Jg
	IS+wiBz5qmUsq2xBwYcO8hoiadWrfDkr81URj0FbJTtb+yCop86dRfFiBzPb66qqYG7wymGTycPCt
	gv5jLGSTq+HoLit/iouj+16k/eUdeZqTgYIFwlTzh0eO09rIyLkYojXzIzEfGIkekh+PYA2a2ggFB
	TZoN97pe2AM8njo0HyP8z7Ux0n8B9x4gNh8cBw+RrM1Wkh7Jdgwq3tyJ5H6HMFCAAi8wvrcnpq2Dc
	gIfHRb0X4iywqXmjx58w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdrGs-0006iE-CE; Wed, 27 May 2020 08:18:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdrGp-0006hj-64
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 08:18:41 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1C065447B961DE9AD128;
 Wed, 27 May 2020 16:18:32 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 27 May 2020 16:18:22 +0800
Subject: Re: [RFC PATCH 3/3] spi: hisi-sfc-v3xx: Add prepare/unprepare methods
 to avoid race condition
To: Pratyush Yadav <me@yadavpratyush.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
 <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
 <20200525161436.c5h6d27pm3jptwbo@yadavpratyush.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <6a41fb13-e746-54f3-24ef-197384dde6ab@hisilicon.com>
Date: Wed, 27 May 2020 16:18:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200525161436.c5h6d27pm3jptwbo@yadavpratyush.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_011839_393859_1A6C1564 
X-CRM114-Status: GOOD (  31.85  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 john.garry@huawei.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

On 2020/5/26 0:14, Pratyush Yadav wrote:
> Hi Yicong,
>
> On 21/05/20 07:23PM, Yicong Yang wrote:
>> The controller can be shared with the firmware, which may cause race
>> problems. As most read/write/erase/lock/unlock of spi-nor flash are
>> composed of a set of operations, while the firmware may use the controller
>> and start its own operation in the middle of the process started by the
>> kernel driver, which may lead to the kernel driver's function broken.
>>
>> Bit[20] in HISI_SFC_V3XX_CMD_CFG register plays a role of a lock, to
>> protect the controller from firmware access, which means the firmware
>> cannot reach the controller if the driver set the bit. Add prepare/
>> unprepare methods for the controller, we'll hold the lock in prepare
>> method and release it in unprepare method, which will solve the race
>> issue.
> I'm trying to understand the need for this change. What's wrong with
> performing the lock/unlock procedure in hisi_sfc_v3xx_exec_op()? You can 
> probably do something like:
>
>   hisi_sfc_v3xx_lock();
>   ret = hisi_sfc_v3xx_generic_exec_op(host, op, chip_select);
>   hisi_sfc_v3xx_unlock();
>   return ret;

if doing like this, suppose we perform a sequential operations like below:

lock()->exec_op(cmd1)->unlock()->lock()->exec_op(cmd2)->unlock()->lock()->exec_op(cmd3)->unlock()
                       ^==========^is unlocked          ^==========^is unlocked

As shown above, we cannot lock the device continuously during the whole operations.
But if we use upper layer method then it looks like

prepare()->exec_op(cmd1)->exec_op(cmd2)->exec_op(cmd3)->unprepare()
        ^locked here                                              ^unlocked here

we can hold the lock during the all 3 operations' execution.


>
> What's the benefit of making upper layers do this? Acquiring the lock is 
> a simple register write, so it should be relatively fast. Unless there 
> is a lot of contention on the lock between the firmware and kernel, I 
> would expect the performance impact to be minimal. Maybe you can run 
> some benchmarks and see if there is a real difference.
>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/spi/spi-hisi-sfc-v3xx.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
>> index e3b5725..13c161c 100644
>> --- a/drivers/spi/spi-hisi-sfc-v3xx.c
>> +++ b/drivers/spi/spi-hisi-sfc-v3xx.c
>> @@ -18,6 +18,7 @@
>>  #define HISI_SFC_V3XX_VERSION (0x1f8)
>>  
>>  #define HISI_SFC_V3XX_CMD_CFG (0x300)
>> +#define HISI_SFC_V3XX_CMD_CFG_LOCK BIT(20)
>>  #define HISI_SFC_V3XX_CMD_CFG_DUAL_IN_DUAL_OUT (1 << 17)
>>  #define HISI_SFC_V3XX_CMD_CFG_DUAL_IO (2 << 17)
>>  #define HISI_SFC_V3XX_CMD_CFG_FULL_DIO (3 << 17)
>> @@ -41,6 +42,34 @@ struct hisi_sfc_v3xx_host {
>>  	int max_cmd_dword;
>>  };
>>  
>> +int hisi_sfc_v3xx_op_prepare(struct spi_mem *mem)
>> +{
>> +	struct spi_device *spi = mem->spi;
>> +	struct hisi_sfc_v3xx_host *host;
>> +	u32 reg = HISI_SFC_V3XX_CMD_CFG_LOCK;
>> +
>> +	host = spi_controller_get_devdata(spi->master);
>> +
>> +	writel(reg, host->regbase + HISI_SFC_V3XX_CMD_CFG);
>> +
>> +	reg = readl(host->regbase + HISI_SFC_V3XX_CMD_CFG);
>> +	if (!(reg & HISI_SFC_V3XX_CMD_CFG_LOCK))
>> +		return -EIO;
> IIUC, you are checking if you actually got the lock, and you won't get 
> the lock if the firmware is using the controller. So, is it a good idea 
> to give up so easily? Maybe we should do this in a loop at some 
> intervals, and only error out when we reach a number of failed attempts?

yes. It do give up so early here. :)


>
>> +
>> +	return 0;
>> +}
>> +
>> +void hisi_sfc_v3xx_op_unprepare(struct spi_mem *mem)
>> +{
>> +	struct spi_device *spi = mem->spi;
>> +	struct hisi_sfc_v3xx_host *host;
>> +
>> +	host = spi_controller_get_devdata(spi->master);
>> +
>> +	/* Release the lock and clear the command register. */
>> +	writel(0, host->regbase + HISI_SFC_V3XX_CMD_CFG);
>> +}
>> +
>>  #define HISI_SFC_V3XX_WAIT_TIMEOUT_US		1000000
>>  #define HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US	10
>>  
>> @@ -163,7 +192,15 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
>>  					 u8 chip_select)
>>  {
>>  	int ret, len = op->data.nbytes;
>> -	u32 config = 0;
>> +	u32 config;
>> +
>> +	/*
>> +	 * The lock bit is in the command register. Clear the command
>> +	 * field with lock bit held if it has been set in
>> +	 * .prepare().
>> +	 */
>> +	config = readl(host->regbase + HISI_SFC_V3XX_CMD_CFG);
>> +	config &= HISI_SFC_V3XX_CMD_CFG_LOCK;
> This will unlock the controller _before_ the driver issues 
> hisi_sfc_v3xx_read_databuf(). I'm not very familiar with the hardware, 
> but to me it seems like it can lead to a race. What if the firmware 
> issues a command that over-writes the databuf (I assume this is shared 
> between the two) before the driver gets a chance to copy that data to 
> the kernel buffer?

It won't unlock the controller if it has been locked in prepare(). It will clear
the other bits in the register other than the lock bit. For single operations, as 
prepare() method is not called, the bit is 0 and it won't change here.

Thanks,
Yicong


>   
>>  	if (op->addr.nbytes)
>>  		config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
>> @@ -248,6 +285,8 @@ static int hisi_sfc_v3xx_exec_op(struct spi_mem *mem,
>>  
>>  static const struct spi_controller_mem_ops hisi_sfc_v3xx_mem_ops = {
>>  	.adjust_op_size = hisi_sfc_v3xx_adjust_op_size,
>> +	.prepare	= hisi_sfc_v3xx_op_prepare,
>> +	.unprepare	= hisi_sfc_v3xx_op_unprepare,
>>  	.exec_op = hisi_sfc_v3xx_exec_op,
>>  };
>>  
> FWIW, the other two patches in the series look good to me given you can 
> justify the need for having the API.
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
