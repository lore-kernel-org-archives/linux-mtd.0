Return-Path: <SRS0=OWKh=JW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BBBC433ED
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Apr 2021 16:23:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D919461220
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Apr 2021 16:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D919461220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R63rWannl57vCQGVM+HAylSQID0fjUnTQzGBpLJufJ8=; b=qSV6TVZATzOpn2t7r/QWML31o
	Ggs4sCZazmbxRqabPa5ZhfihfC1zcu3kLQlYBL6zxTk2PTNBB8xJ33IzslvpHmzE0N1FJFgDFOxn+
	4/Y7cVnpfEUDcFA9jBVfYH2J/PZeqsRBdngo88pvQQMYzLbUovj11D8kdgeEwaCjAfPPuVC+iKCFi
	Dh1AQjMSEksEqYadvT3+WO/u/r7I4Iwjtemp1zaWk/uU59Oc8H4LqF2L4Z0vDoGVLyTt3okRzvJuj
	CI2hsGpSboZI83z2xFGgngezFXMlo46DScPdYxiAM628h3Mr8RKb3rBDIhGyX2czkLsjnOv2cUdFg
	appVVFpfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lahWe-005tdj-JD; Sun, 25 Apr 2021 16:22:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lahWX-005tdR-7N
 for linux-mtd@desiato.infradead.org; Sun, 25 Apr 2021 16:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ZrcYJ0XMzf0bzyes6VZnmvGV1EA+NWdX4Z8T13Kb4ws=; b=cLiHBs1vHIV9pysene5qF2c9aH
 MQSIkrvmR7Ft0EVv8+W0RyqbFE6kvKKIHCBqBeUwuIWYnyxD8Rw0qjfrGh02ZUzXW4OKjNL0rG4ew
 IxUUebbFi70wCuCVQh5gYaTCpsa8NL99mLW2d1HeGbXrtl8WyBHnlfXrZGcaYdLN2fgm9Z9vebq5O
 ZkCBP89Sndkdbl3siWJcGZ6GcTZ/ZHyDehfKi8s4Afxi3JV5Ko0T5o2dYMrKoJc4qExKT6JtmPwH7
 mRUfQwLgWMab+QNViUq5q9ckEVwiAkSgzAxnZJsQA42GcA27+hBqxgXUPtQNZpKiUjtiNtIb2aHwK
 G2WDcUSQ==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lahVz-004TI5-Lh; Sun, 25 Apr 2021 16:22:00 +0000
Subject: Re: [PATCH] mtd: rawnand: marvell: Minor documentation correction
To: Souptick Joarder <jrdr.linux@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1619341721-5580-1-git-send-email-jrdr.linux@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <24534cc6-e6dc-feda-1e2f-b9b3501845d9@infradead.org>
Date: Sun, 25 Apr 2021 09:21:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1619341721-5580-1-git-send-email-jrdr.linux@gmail.com>
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

On 4/25/21 2:08 AM, Souptick Joarder wrote:
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
> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 79da6b0..e7b48d4 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -451,7 +451,7 @@ struct marvell_nfc_timings {
>  };
>  
>  /**
> - * Derives a duration in numbers of clock cycles.
> + * TO_CYCLES*() - Derives a duration in numbers of clock cycles.

Hi--

Did you test that?  I would be surprised if kernel-doc stays quiet
with that change.

[testing]

Yep, kernel-doc doesn't like to see that '*' there.
That doesn't work.

>   *
>   * @ps: Duration in pico-seconds
>   * @period_ns:  Clock period in nano-seconds
> 


-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
