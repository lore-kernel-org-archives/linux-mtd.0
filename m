Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A8BC47094
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 20:15:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 356BD610A2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 20:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 356BD610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tbOMv6BZfza63YAor0KyNQ9Z1faIzwEDS1QlnH13TP4=; b=ttCSfcljckytcg3eJkWIzCI6FL
	tqb+lzR6gAR3V8LSFkE11SrfJpqaZpvxS90AW4uYGbW722Yo6MgTb16OdrB1ouWAlL4VnRgfgTjTD
	uEmsCetveMgQJBwi/87vUiF5ipknsgJVUNyoWNdJJVdJxXAmNY0v+AMav5pWmmN/bzHneYI28Dwio
	cnhEeqKmaK/Ck8LIve6HTHk19CjTTGjK3Ix8bZnxpR3X7tnB3UFKMY6GpX/D/BGX6bfDOJIC913U9
	4/Ts5e3NNf3omtbQ8/zt4yaw/yGBhwr0us7wwcgckR0pb46e3KgV/LAb2cJT1REswC/ztrYdAvDfO
	kpYiHpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqLd9-005HzP-AQ; Mon, 07 Jun 2021 20:13:51 +0000
Received: from [2601:1c0:6280:3f0::bd57]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqLd7-005Hys-4z; Mon, 07 Jun 2021 20:13:49 +0000
Subject: Re: [PATCH v2] mtd: rawnand: marvell: Minor documentation correction
To: Souptick Joarder <jrdr.linux@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20210607193736.4654-1-jrdr.linux@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <560cdf7c-c3aa-b102-95f9-b9930dc94b08@infradead.org>
Date: Mon, 7 Jun 2021 13:13:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210607193736.4654-1-jrdr.linux@gmail.com>
Content-Language: en-US
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

On 6/7/21 12:37 PM, Souptick Joarder wrote:
> Kernel test robot throws below warning ->
> drivers/mtd/nand/raw/marvell_nand.c:454: warning: This comment starts
> with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> 
> Minor documentation correction.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>

LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> v2:
> 	Address review comment.
> 
>  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 79da6b02e209..f4efdb59467d 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -451,7 +451,7 @@ struct marvell_nfc_timings {
>  };
>  
>  /**
> - * Derives a duration in numbers of clock cycles.
> + * TO_CYCLES() - Derives a duration in numbers of clock cycles.
>   *
>   * @ps: Duration in pico-seconds
>   * @period_ns:  Clock period in nano-seconds
> 


-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
