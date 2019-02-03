Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8ABC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 08:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC3992177B
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 08:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKGGoGyj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO18rxKk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC3992177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpHrLxX87/mJ41iO9hSLFxArwFraQrNw6sFqeAmAIzU=; b=RKGGoGyjb1/hl5
	QBw7+pUKd2auK03DNQd3kPOdW+HMe51aoqZQwusZsUy4dFnwp53g8Q5xPbkwFB4YnmTU1HrXAd5YG
	IKY+I3GwEjJ24AoJcvvJmOAwYfQNg3cFcPPrMI6RVb/JN6dt+kcwykzK/Y6kfNrMwuuB4XrHqNKFr
	CH/l7ExsOOw9VDDeO7a4l42ulTFos/jzrTBWIe7ZxGsuhrCiYr7rvO9wy7KQlJ8ofa4RvzDSd4QKQ
	t6r9gPYjST0PjzFizcvSVQnN9AAIj8Iwir6n4hqFGuxg7n50761a3EcyiKzOENoJrkaucCDrV7AsP
	lrj4UXY/9cBDzY+GoU9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqD7G-000457-FM; Sun, 03 Feb 2019 08:27:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqD7D-00044m-6l
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 08:27:00 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39E872082F;
 Sun,  3 Feb 2019 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549182416;
 bh=sPnfI1HNhCXOHLUc8pSc16PhXZwrm6oKPdZf9ZEUWbM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RO18rxKkk+tXgeBB3Qmx0XUEp/h2wGbITtZ4Vkm1Dkl2EQij+Fh65Agjv9AQr9ZqP
 IrgXD/N6Va0vME2yEJ2/iytGgdhUmCHD7kmmH1Nr5lSB3kNM/IJKyBOHZK6yVGtRyz
 wfGd5PGfh2LArdn1N0OI+8++gHK2GvzQa6qWOEEA=
Date: Sun, 3 Feb 2019 09:26:45 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Liu Jian <liujian56@huawei.com>
Subject: Re: [PATCH] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Message-ID: <20190203092645.18d1495b@bbrezillon>
In-Reply-To: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
References: <1548977439-318904-1-git-send-email-liujian56@huawei.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_002659_272259_2481A805 
X-CRM114-Status: GOOD (  15.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: keescook@chromium.org, Przemyslaw Sobon <psobon@amazon.com>,
 joakim.tjernlund@infinera.com, ikegami@allied-telesis.co.jp, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Przemyslaw

On Fri, 1 Feb 2019 07:30:39 +0800
Liu Jian <liujian56@huawei.com> wrote:

> In function do_write_buffer(), in the for loop, there is a case
> chip_ready() returns 1 while chip_good() returns 0, so it never
> break the loop.
> To fix this, chip_good() is enough and it should timeout if it stay
> bad for a while.

Looks like Przemyslaw reported and fixed the same problem.

> 
> Fixes: dfeae1073583(mtd: cfi_cmdset_0002: Change write buffer to check
> correct value)

Can you put the Fixes tag on a single, and the format is

Fixes: <hash> ("message")

> Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> Signed-off-by: Liu Jian <liujian56@huawei.com>

[1]http://patchwork.ozlabs.org/patch/1025566/

> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6..818e94b 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1876,14 +1876,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  			continue;
>  		}
>  
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> -			break;
> -
>  		if (chip_good(map, adr, datum)) {
>  			xip_enable(map, chip, adr);
>  			goto op_done;
>  		}
>  
> +		if (time_after(jiffies, timeo))
> +			break;
> +
>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
>  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
