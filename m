Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF117C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:43:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0204207ED
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5+Iapye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0204207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fjb+x6O7V4UXLs1WL+KiDorZGg7JpYXq/b4xXRs3i8Y=; b=o5+IapyeLsQ9Q8
	XuI4DDDpOWs9dOR8HCW+xhEoGaG6I8gwuBuqY+mtpIUKzJ6v0kBMieqJloRPn+/2ghN4dcAgRR62p
	ThXYHryywQGYKVzohonvs1eoR9okkYNhZKSEfqmgb5jyvrkXLSAReVSUn2ybEREJMgKJT4cHoK527
	TxVix8X7mAdzOVvCCYh7wYhwErYuShfXkedIPT7GWEBkK7YuR1Y1McSYRYwWPet7nM2RBwBJOo1vE
	OeVtEOl5MHWnYmcP1GG3q0pPd0vYaUhu81Ewid0tRj3zeC4llFjCjbxP0tEDrz1/T5qk+yaH0UgZI
	poYZ86L5gXK50vvXySeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdW7o-0001Zz-St; Tue, 26 May 2020 09:43:56 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdW7l-0001Zf-AV
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 09:43:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC49C2A28CE;
 Tue, 26 May 2020 10:43:51 +0100 (BST)
Date: Tue, 26 May 2020 11:43:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [RFC PATCH 3/3] spi: hisi-sfc-v3xx: Add prepare/unprepare
 methods to avoid race condition
Message-ID: <20200526114348.6295df6b@collabora.com>
In-Reply-To: <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
 <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_024353_620667_3155A04A 
X-CRM114-Status: GOOD (  25.76  )
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

On Thu, 21 May 2020 19:23:51 +0800
Yicong Yang <yangyicong@hisilicon.com> wrote:

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

Okay, so it looks like what we really need is a way to pass sequences
(multiple operations) that are expected to be issued without
interruptions. I'd prefer extending the spi_mem interface to allow that:

int spi_mem_exec_sequence(struct spi_mem *spimem,
			  unsigned int num_ops,
		  	  const struct spi_mem_op *ops);

struct spi_controller_mem_ops {
	...
	int (*exec_sequence)(struct spi_mem *mem,
			     unsigned int num_ops,
			     const struct spi_mem_op *op);
	...
};

The prepare/unprepare hooks are a bit too vague. Alternatively, we
could add functions to grab/release the controller lock, but I'm not
sure that's what we want since some controllers might be able to address
several devices in parallel, and locking the whole controller at the
spi-nor level would prevent that.

BTW, I don't know all the details about this lock or what this FW is
exactly (where it's running, what's his priority, what kind of
synchronization exists between Linux and the FW, ...), but I'm worried
about potential deadlocks here.

> 
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
>  
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
