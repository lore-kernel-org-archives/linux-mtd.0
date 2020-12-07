Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806BFC4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 10:50:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF1E23339
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF1E23339
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OLOLaIcArhw+jOlAIR57RW0Dhg6+9elZ+MVL1fCMNdA=; b=tDKXpCNPdTPcypDgT2Z6463Q8
	eJOqDUrjh8S/x+mzQC9+uNDml0z/D7Plb4/Iv7poaC0ncmHT5bc5mRyWG7VlevSy9ctP3K4cws+ap
	ke5/RKQAwx2Ynt7ybwPoHsPTZ1q/TXJokQmd5TXDHfB2MY0hw7FCS9boOaxpx+joZTUOk2IbZmYFr
	gP8+Trrrs9j29DXaXyV1Pp8V0k/zscspy6InoQGSSOfEU/9db9daiATF0xa8lY+/mq5v5dxVozveX
	uZ1YRi0U7yKwwn1nb9+DhVLA15yevmnHdX2fh+RBQxBEfnvLPKkHVvT7IgmA1WJiYbSP3G6N84Qq0
	B8AqGVktQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmE4k-0008IQ-Kr; Mon, 07 Dec 2020 10:49:02 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmE4h-0008HN-VX
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 10:49:01 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqKln337PzkmXD;
 Mon,  7 Dec 2020 18:48:05 +0800 (CST)
Received: from [10.67.102.197] (10.67.102.197) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 18:48:33 +0800
Subject: ping // [PATCH] mtd:cfi_cmdset_0002: fix atomic sleep bug when
 CONFIG_MTD_XIP=y
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@microchip.com>, <tpoynor@mvista.com>, <tglx@linutronix.de>,
 <vwool@ru.mvista.com>
References: <20201127130731.99270-1-nixiaoming@huawei.com>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <a02e1364-3b82-039a-4b65-e2a216663dd4@huawei.com>
Date: Mon, 7 Dec 2020 18:48:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <20201127130731.99270-1-nixiaoming@huawei.com>
X-Originating-IP: [10.67.102.197]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_054900_500346_194B385E 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: gregkh@linuxfoundation.org, wangle6@huawei.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping

On 2020/11/27 21:07, Xiaoming Ni wrote:
> When CONFIG_MTD_XIP=y, local_irq_disable() is called in xip_disable().
> To avoid sleep in interrupt context, we need to call local_irq_enable()
> before schedule().
> 
> The problem call stack is as follows:
> bug1:
> 	do_write_oneword_retry()
> 		xip_disable()
> 			local_irq_disable()
> 		do_write_oneword_once()
> 			schedule()
> bug2:
> 	do_write_buffer()
> 		xip_disable()
> 			local_irq_disable()
> 		do_write_buffer_wait()
> 			schedule()
> bug3:
> 	do_erase_chip()
> 		xip_disable()
> 			local_irq_disable()
> 		schedule()
> bug4:
> 	do_erase_oneblock()
> 		xip_disable()
> 			local_irq_disable()
> 		schedule()
> 
> Fixes: 02b15e343aee ("[MTD] XIP for AMD CFI flash.")
> Cc: stable@vger.kernel.org # v2.6.13
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> ---
>   drivers/mtd/chips/cfi_cmdset_0002.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index a1f3e1031c3d..12c3776f093a 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1682,7 +1682,11 @@ static int __xipram do_write_oneword_once(struct map_info *map,
>   			set_current_state(TASK_UNINTERRUPTIBLE);
>   			add_wait_queue(&chip->wq, &wait);
>   			mutex_unlock(&chip->mutex);
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_enable();
>   			schedule();
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_disable();
>   			remove_wait_queue(&chip->wq, &wait);
>   			timeo = jiffies + (HZ / 2); /* FIXME */
>   			mutex_lock(&chip->mutex);
> @@ -1962,7 +1966,11 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
>   			set_current_state(TASK_UNINTERRUPTIBLE);
>   			add_wait_queue(&chip->wq, &wait);
>   			mutex_unlock(&chip->mutex);
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_enable();
>   			schedule();
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_disable();
>   			remove_wait_queue(&chip->wq, &wait);
>   			timeo = jiffies + (HZ / 2); /* FIXME */
>   			mutex_lock(&chip->mutex);
> @@ -2461,7 +2469,11 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>   			set_current_state(TASK_UNINTERRUPTIBLE);
>   			add_wait_queue(&chip->wq, &wait);
>   			mutex_unlock(&chip->mutex);
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_enable();
>   			schedule();
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_disable();
>   			remove_wait_queue(&chip->wq, &wait);
>   			mutex_lock(&chip->mutex);
>   			continue;
> @@ -2560,7 +2572,11 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>   			set_current_state(TASK_UNINTERRUPTIBLE);
>   			add_wait_queue(&chip->wq, &wait);
>   			mutex_unlock(&chip->mutex);
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_enable();
>   			schedule();
> +			if (IS_ENABLED(CONFIG_MTD_XIP))
> +				local_irq_disable();
>   			remove_wait_queue(&chip->wq, &wait);
>   			mutex_lock(&chip->mutex);
>   			continue;
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
