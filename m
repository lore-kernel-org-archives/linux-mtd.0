Return-Path: <SRS0=6jNp=Q5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF03C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 05:58:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54F2220823
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 05:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ln9UseAH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EonOr0sj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54F2220823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqNF60zOKTvFIMlU+SR0/yb5w8ttr5KqO615AZpPwnc=; b=Ln9UseAHPJleaL
	FTl6oHCxIpqEG7hwhhm/5JH0qUASw92oCHz1xCugr+NXmma8VGSPLU4j3n2Cd/7Oc+iqwjuYfntz6
	tVv/EnaXS5Bs0fQbBXNJnyZ/sfPkP3bq5Un4jz0jYOuuHmVZptOuYV7wOOcV0VAA7JLmyVhjSFP1I
	2qH/VdtROvDJzfpB8BX1DHO/5lMeLJKdRQxLeU7ZGmoBTk3q8KD81XsoTkevC3Bnyzec/mb9zEGlR
	aE0x19iFcb+TcuYGbkAgAnMHGWlYRl0fm3SeNKFiq3As+LSQyZqGu6TA00e4R3nakFAXB+Opk904h
	6mv9Av5Nm0jM+76HxNMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gx3qq-0001oM-4b; Fri, 22 Feb 2019 05:58:24 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gx3qn-0001o1-0c
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2019 05:58:22 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1M5vo3m111502;
 Thu, 21 Feb 2019 23:57:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1550815070;
 bh=NoppK0cXQU2yGt/UWUVX9GymC+SOG6254eUSduksSxs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=EonOr0sjdtil7a4hR2AsUEyHlnTs5zhDXoOCqBp/dwzFL21GVBcsprNIT/LJs8PwB
 sufWpDyOwPyjdVaWyvccRF5WJB8Yz4EYm+80LxDMZuoS4Ol/Dc0g2nORQbUgrdzFvR
 1rf1O76WJCAm+SDuJ7dTcvCA2exHH20hROKxk0xM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1M5voVh053593
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Feb 2019 23:57:50 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Thu, 21
 Feb 2019 23:57:49 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Thu, 21 Feb 2019 23:57:49 -0600
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1M5vjBe032262;
 Thu, 21 Feb 2019 23:57:46 -0600
Subject: Re: [PATCH v2] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
To: Liu Jian <liujian56@huawei.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>,
 <marek.vasut@gmail.com>, <richard@nod.at>,
 <joakim.tjernlund@infinera.com>, <ikegami@allied-telesis.co.jp>,
 <keescook@chromium.org>
References: <1550609234-40861-1-git-send-email-liujian56@huawei.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <e9923a1f-aefc-fdd9-97d8-5c0012f09726@ti.com>
Date: Fri, 22 Feb 2019 11:28:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1550609234-40861-1-git-send-email-liujian56@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_215821_152125_3518C9D0 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 20/02/19 2:17 AM, Liu Jian wrote:
> In function do_write_buffer(), in the for loop, there is a case
> chip_ready() returns 1 while chip_good() returns 0, so it never
> break the loop.
> To fix this, chip_good() is enough and it should timeout if it stay
> bad for a while.
> 
> Fixes: dfeae1073583 ("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Yi Huaijie <yihuaijie@huawei.com>
> Signed-off-by: Liu Jian <liujian56@huawei.com>
> Reviewed-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> ---
> v1->v2:
> change git log, put the Fixes tag on a single line
> 
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

It is quite possible that this thread might be pre-empted just after
chip_good() check but before before time_after(). If the thread, then
resumes execution after timeo has elasped then, this code will wrongly
indicate write failure.

To avoid this case, you should add one more check for check_good() even
when time_after() returns true. Something like:

	if (time_after(jiffies, timeo)) {
		if (chip_good(map, adr, datum)) {
			xip_enable(map, chip, adr);
			goto op_done;
		}
		break;
	}



>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
>  	}
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
