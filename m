Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBEEC2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 15:24:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F088E61159
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F088E61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KttVI3frAoq6U3L4teat4IwuyvJgZm05zzEulCuQarY=; b=XgPXfO/UGmkUxqsn0VepqWvxg8
	UecQME3ys2FBzc7Gn1gGGMNdbrOOfeMeWIS/dtV1F0MdgzgnhfIis+oRNvZaN3glAg6sLsFEhBJkS
	PsN1WpTdW3QHVHSNVUMBO+fQ5mIpKx3I03N8CTiLIXQW+6s0f5srK3OJ26+08MHwNKUPPKtxxH+vE
	wOwhoMa0xpXZTMqotxq5fY7C64xWatqLJAGZbdUiYbOlKph8/nGv94Tprqu3pfK7AWwski/PLPFpr
	kzd8IDiPlGqAEelPZQvk2gc1xcYF8oz3IdMmDT2sMzq6NaA5cl/LTMXFnG0CDh0PzSAxySzWcGzha
	/0B6cw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttrw-00Aue2-Cw; Thu, 17 Jun 2021 15:23:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttrt-00Aud1-Qc
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 15:23:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id a127so5256492pfa.10
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jun 2021 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BGbeP7ZnDkY2DJidMpRViqieliUtB17GFMkW1zVFjRU=;
 b=Oa3ubTr0Q6/AN8zuP9Ab/2Kl+m1AAVUY/MDQf2YhYJMxoR2QNRnHh/uPRS4KEd8FwY
 7lYpYXWtliofo4M15KX6kB/FCkMTAvkAF5RyYzkFKpXKvFcmdbiszr2IFGVTZVh653X0
 JlXGmk/4/4qPnXOO/m3zhD3PlhS2nlPXPnbBDrYB95ZdveGJ8MePV/9NK38Q1rNXPizi
 QKad2ZO6qF2xPjJ6PWs5ki8uHBBzjnc1piJNAtBZfryD4TVocKpZsNdt08Prz2cW6xPh
 dwpLwl/ECtvKrpW71zqf6I/ocCQRj1JzvqPxhMJBmEKXb5ymNHU6ksoRABqmBJzbHy7l
 YMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BGbeP7ZnDkY2DJidMpRViqieliUtB17GFMkW1zVFjRU=;
 b=SvY1oXwqRWQKFPbM+hasVkmMUq0nrnHmhV+J4hzS6ciJf7pQsYMfKJxszU+x/63G2H
 YrxTwu4h5pNB+zMGk1Ts9JJiY0/vU5bIpV7zn9Mzsc1tGLkApD1BtzfA2HC8B9taTfdP
 HQJNpK8XxUvXSqqBixw4QWniEKwVADec1/bGtFXjg1r2ZsyrRjM8y3GoEJpl4FUYFz5o
 tMGhyFrUitlL1KcPfMFL4mVSCpFsdzP1Jy+ZuuuvUFrN/18bd8ev+Xmh0OrCDLZSyAlK
 Wp6bv367o6PAK8sDdGBsQ7IkLMgIJOKb9fBAgJZRuVE9fIdAACL8PYftJZ4OM2Op1IVP
 DrzQ==
X-Gm-Message-State: AOAM533qW1+NPJJsXyHqUr61tcUK5nEVmMUA4aDlqsTfHFUkmtptV/WQ
 3rOgRhKL7jfaO6oHJ0xeAXBM5Y76jNO24oYSUPE=
X-Google-Smtp-Source: ABdhPJx/5easlY7XHWhEyK556EoCIVPAIfLRotdyXcjQ6+Cu9D7hlZkBnahXppkI8S5hMejMrFyBwQ==
X-Received: by 2002:aa7:905a:0:b029:2f6:d759:6c2d with SMTP id
 n26-20020aa7905a0000b02902f6d7596c2dmr249155pfo.33.1623943421659; 
 Thu, 17 Jun 2021 08:23:41 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v6sm6434212pgk.33.2021.06.17.08.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 08:23:41 -0700 (PDT)
Subject: Re: [PATCH] block: break circular locks in blk_request_module
To: Christoph Hellwig <hch@infradead.org>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
References: <20210617092016.522985-1-desmondcheongzx@gmail.com>
 <YMs3O/cg4V7ywlVq@infradead.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <ce1567cf-bc94-790c-cfc0-e4e429e1a86a@gmail.com>
Date: Thu, 17 Jun 2021 23:23:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMs3O/cg4V7ywlVq@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_082345_909529_D74A8FF3 
X-CRM114-Status: GOOD (  23.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 17/6/21 7:51 pm, Christoph Hellwig wrote:
> On Thu, Jun 17, 2021 at 05:20:16PM +0800, Desmond Cheong Zhi Xi wrote:
>>   	mutex_lock(&major_names_lock);
>>   	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
>>   		if ((*n)->major == major && (*n)->probe) {
>> -			(*n)->probe(devt);
>> +			probe = (*n)->probe;
>>   			mutex_unlock(&major_names_lock);
>> +			probe(devt);
> 
> And now you can all probe after it has been freed and/or the module has
> been unloaded. The obviously correct fix is to only hold mtd_table_mutex
> for the actually required critical section:
> 

Thank you for the correction, Christoph. I hadn't thought of the 
scenario where the module is unloaded. I'll be more conscientious in the 
future.

> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index fb8e12d590a1..065d94f9b1fb 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -529,13 +529,11 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>   		register_mtd_user(&blktrans_notifier);
>   
>   
> -	mutex_lock(&mtd_table_mutex);
>   
>   	ret = register_blkdev(tr->major, tr->name);
>   	if (ret < 0) {
>   		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
>   		       tr->name, tr->major, ret);
> -		mutex_unlock(&mtd_table_mutex);
>   		return ret;
>   	}
>   
> @@ -545,12 +543,12 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>   	tr->blkshift = ffs(tr->blksize) - 1;
>   
>   	INIT_LIST_HEAD(&tr->devs);
> -	list_add(&tr->list, &blktrans_majors);
>   
> +	mutex_lock(&mtd_table_mutex);
> +	list_add(&tr->list, &blktrans_majors);
>   	mtd_for_each_device(mtd)
>   		if (mtd->type != MTD_ABSENT)
>   			tr->add_mtd(tr, mtd);
> -
>   	mutex_unlock(&mtd_table_mutex);
>   	return 0;
>   }
> 

This fix passes the Syzkaller repro test on my local machine and on 
Syzbot. I can prepare a v2 patch for this. May I include you with the 
Co-developed-by: and Signed-off-by: tags? If another tag would be more 
appropriate, or if you want to submit the patch yourself, please let me 
know.

Best wishes,
Desmond

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
