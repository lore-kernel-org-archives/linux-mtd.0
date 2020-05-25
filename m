Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E466C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 16:15:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C872071A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 16:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWfgr5qQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16C872071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTOEea2jC1JE69nrs+1ZRvx+iW4lW/xQ2BjW/8hiyoo=; b=RWfgr5qQvkF0JC
	lIFFaPx/8Wliizg542MMKrnWyCL4dWco1ImIcS/ntRbUI2jFMM7h4ZHfzYc0ozmBXW92e5w5BWaML
	nsuGiWe7jZzRFmGg3UsgtKKTKDzJPgn+ruTuj2QoEQCCYfOKlLjdCviTNFmjF4cx1zTbAgPPzoF6N
	DuxFcrRUww6TvRklcHXoaxmX+idHHuMwQ4eFDrlz4Y8QuK2AQjNJTF0w7dhVCqkIf3/AcPzulAySr
	kXh4+6tw+s/XemPlweZ7kwSEKSBtm6+MiAB+58LXL4eWGGnyyvKMaL7owG3FWd91QxryLdmV6+UsY
	WApcHbwyfju3ufp0iY1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdFka-0000N9-Vu; Mon, 25 May 2020 16:14:52 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdFkV-0000MZ-TM
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 16:14:49 +0000
X-Originating-IP: 157.36.22.112
Received: from localhost (unknown [157.36.22.112])
 (Authenticated sender: me@yadavpratyush.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 08342E0005;
 Mon, 25 May 2020 16:14:39 +0000 (UTC)
Date: Mon, 25 May 2020 21:44:36 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [RFC PATCH 3/3] spi: hisi-sfc-v3xx: Add prepare/unprepare
 methods to avoid race condition
Message-ID: <20200525161436.c5h6d27pm3jptwbo@yadavpratyush.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
 <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_091448_216362_6D9C78CD 
X-CRM114-Status: GOOD (  28.68  )
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

Hi Yicong,

On 21/05/20 07:23PM, Yicong Yang wrote:
> The controller can be shared with the firmware, which may cause race
> problems. As most read/write/erase/lock/unlock of spi-nor flash are
> composed of a set of operations, while the firmware may use the controller
> and start its own operation in the middle of the process started by the
> kernel driver, which may lead to the kernel driver's function broken.
> 
> Bit[20] in HISI_SFC_V3XX_CMD_CFG register plays a role of a lock, to
> protect the controller from firmware access, which means the firmware
> cannot reach the controller if the driver set the bit. Add prepare/
> unprepare methods for the controller, we'll hold the lock in prepare
> method and release it in unprepare method, which will solve the race
> issue.

I'm trying to understand the need for this change. What's wrong with
performing the lock/unlock procedure in hisi_sfc_v3xx_exec_op()? You can 
probably do something like:

  hisi_sfc_v3xx_lock();
  ret = hisi_sfc_v3xx_generic_exec_op(host, op, chip_select);
  hisi_sfc_v3xx_unlock();
  return ret;

What's the benefit of making upper layers do this? Acquiring the lock is 
a simple register write, so it should be relatively fast. Unless there 
is a lot of contention on the lock between the firmware and kernel, I 
would expect the performance impact to be minimal. Maybe you can run 
some benchmarks and see if there is a real difference.

> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/spi/spi-hisi-sfc-v3xx.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
> index e3b5725..13c161c 100644
> --- a/drivers/spi/spi-hisi-sfc-v3xx.c
> +++ b/drivers/spi/spi-hisi-sfc-v3xx.c
> @@ -18,6 +18,7 @@
>  #define HISI_SFC_V3XX_VERSION (0x1f8)
>  
>  #define HISI_SFC_V3XX_CMD_CFG (0x300)
> +#define HISI_SFC_V3XX_CMD_CFG_LOCK BIT(20)
>  #define HISI_SFC_V3XX_CMD_CFG_DUAL_IN_DUAL_OUT (1 << 17)
>  #define HISI_SFC_V3XX_CMD_CFG_DUAL_IO (2 << 17)
>  #define HISI_SFC_V3XX_CMD_CFG_FULL_DIO (3 << 17)
> @@ -41,6 +42,34 @@ struct hisi_sfc_v3xx_host {
>  	int max_cmd_dword;
>  };
>  
> +int hisi_sfc_v3xx_op_prepare(struct spi_mem *mem)
> +{
> +	struct spi_device *spi = mem->spi;
> +	struct hisi_sfc_v3xx_host *host;
> +	u32 reg = HISI_SFC_V3XX_CMD_CFG_LOCK;
> +
> +	host = spi_controller_get_devdata(spi->master);
> +
> +	writel(reg, host->regbase + HISI_SFC_V3XX_CMD_CFG);
> +
> +	reg = readl(host->regbase + HISI_SFC_V3XX_CMD_CFG);
> +	if (!(reg & HISI_SFC_V3XX_CMD_CFG_LOCK))
> +		return -EIO;

IIUC, you are checking if you actually got the lock, and you won't get 
the lock if the firmware is using the controller. So, is it a good idea 
to give up so easily? Maybe we should do this in a loop at some 
intervals, and only error out when we reach a number of failed attempts?

> +
> +	return 0;
> +}
> +
> +void hisi_sfc_v3xx_op_unprepare(struct spi_mem *mem)
> +{
> +	struct spi_device *spi = mem->spi;
> +	struct hisi_sfc_v3xx_host *host;
> +
> +	host = spi_controller_get_devdata(spi->master);
> +
> +	/* Release the lock and clear the command register. */
> +	writel(0, host->regbase + HISI_SFC_V3XX_CMD_CFG);
> +}
> +
>  #define HISI_SFC_V3XX_WAIT_TIMEOUT_US		1000000
>  #define HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US	10
>  
> @@ -163,7 +192,15 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
>  					 u8 chip_select)
>  {
>  	int ret, len = op->data.nbytes;
> -	u32 config = 0;
> +	u32 config;
> +
> +	/*
> +	 * The lock bit is in the command register. Clear the command
> +	 * field with lock bit held if it has been set in
> +	 * .prepare().
> +	 */
> +	config = readl(host->regbase + HISI_SFC_V3XX_CMD_CFG);
> +	config &= HISI_SFC_V3XX_CMD_CFG_LOCK;

This will unlock the controller _before_ the driver issues 
hisi_sfc_v3xx_read_databuf(). I'm not very familiar with the hardware, 
but to me it seems like it can lead to a race. What if the firmware 
issues a command that over-writes the databuf (I assume this is shared 
between the two) before the driver gets a chance to copy that data to 
the kernel buffer?
  
>  	if (op->addr.nbytes)
>  		config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
> @@ -248,6 +285,8 @@ static int hisi_sfc_v3xx_exec_op(struct spi_mem *mem,
>  
>  static const struct spi_controller_mem_ops hisi_sfc_v3xx_mem_ops = {
>  	.adjust_op_size = hisi_sfc_v3xx_adjust_op_size,
> +	.prepare	= hisi_sfc_v3xx_op_prepare,
> +	.unprepare	= hisi_sfc_v3xx_op_unprepare,
>  	.exec_op = hisi_sfc_v3xx_exec_op,
>  };
>  

FWIW, the other two patches in the series look good to me given you can 
justify the need for having the API.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
