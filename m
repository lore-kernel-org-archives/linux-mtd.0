Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE0CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBh4MwjR90Qbjl62wbswZbEhp0imYUTdZPe80h+wpwE=; b=qACp5yhjnm57h7
	UE8kaL1vjlDiS8CAB+61vMR69tTvOTSxYjWg9LlkW5FFSFqRPjnzPdPTverpNU6cAcpE4OZ5OvGZc
	c5fFgNZw7uH11OUYRpXVu1qsVImcueS4FPag6IG/4+aAaMf0b2mG/XR65ivzPMsdDN5+eDb9ICrld
	1tkh8Kll3cqc6HEF3JtK4DcaELz75lm3N8Qf4IU979kLy9NrQGwcXQ/5jjx2UZIRBc0MShlThmK8u
	ygbYjvwL0QMYan1X2WeXiT8OJ4av0dwEewbAeb5q+P4S+uLXnoNDJVfJthvm1wq7jwtu+lzDoB2Si
	f/nJIqKRwzxv5ZV0ZDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJAi-007Tar-AQ; Tue, 25 Jan 2022 10:35:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJAe-007TZk-Jc
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 10:35:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so1266599wms.3
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 02:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uYdg+h4xUgFlS4VbgtGVuleOkynWItCXXdRK+L0ak6M=;
 b=GTubB8hv4bF/W8pl5G1QRyju+3fXfWPO83WqGYnDfxz6ak26wEZCcfjVnpmxnNX3W/
 H3A7PbnHfrdr/KHcapPP25NzGTUtX/g8yvTo/Ymjhi1hs0/b0BmLSFqfrE9o+Dz5rn5b
 K11DjI6yKNdBviS54JKQaHIiqEs5XumCs6PnIwStMPoLmVuMIqaX+CksR4xicdeivJuu
 893R0XyAXbei5Ap5+nv+TsJkY/0Ziu9ykV1bslhHNJgE2MvHrum0sTeANEEy9PplecCQ
 /Xjl0YKmNzPJFLLa7kyHEhD8MRvuie+dzmguYI4ITtNen3QTekXrFltTK6rBIgJUhyhU
 B3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uYdg+h4xUgFlS4VbgtGVuleOkynWItCXXdRK+L0ak6M=;
 b=bxR1zB9gv0fDfPGs7cZPHFtOneH7VWLf9Hfkv6plP2XMyfTLTFkpqwX3lhDy/iBVo6
 9l+77TeyRPjCMeDlklWvscO9a/f1p3EHTqNC+Y85iPq+WXzN40sIlSSwCW26EUv98Gmv
 JOKDxA/to4HkzII5q6C5hD8/DECITVrU9qGGvdWc0p0HtKGyX4YsrgzC8k/JN+x9W0BP
 tVcXxUYFmxlWI6cNUluT1jzYOfuJs4Ko/PySUKdje8pFY8g9v7q9jdF+maVNW9arYChw
 2EBrBHgprufCwUzzCdVG4S60lpkqee7DQElQqIUNW/YCHQyggFZObjiKLrXqSxojz88u
 Kmcg==
X-Gm-Message-State: AOAM530Bo+7TMOCJQ6aUWZ27sJcv0/TpZuFNEc8J/Hic35n16CUCE74n
 HutHOiz8qOxUxcnZfZgdlhY42VlWTg444g==
X-Google-Smtp-Source: ABdhPJx+w8z5aGYxT5A5QKy6zwet2VVfvd21nx8U+IbtSeToofaDduOXQkk2XZ3Di33nkZhxepnP/g==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr2340963wmj.168.1643106926197; 
 Tue, 25 Jan 2022 02:35:26 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id v124sm155335wme.30.2022.01.25.02.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:35:25 -0800 (PST)
Message-ID: <11caff0e-6bf3-9d66-6312-c2c2a6fc862a@linaro.org>
Date: Tue, 25 Jan 2022 10:35:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/5] nvmem: core: Remove unused devm_nvmem_unregister()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>
References: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220124180040.50660-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_023528_727779_CE5CA007 
X-CRM114-Status: GOOD (  17.07  )
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

Thanks Andy for the cleanup,

On 24/01/2022 18:00, Andy Shevchenko wrote:
> There are no users and seems no will come of the devm_nvmem_unregister().
> Remove the function and remove the unused devm_nvmem_match() along with it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Applied 1/5, 2/5 and 3/5 patches.

Others can go via there own subsystems as I do not see any dependencies.

--srini
> ---
> v2: removed unused devm_nvmem_match() (lkp)
>   drivers/nvmem/core.c           | 22 ----------------------
>   include/linux/nvmem-provider.h |  8 --------
>   2 files changed, 30 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 23a38dcf0fc4..1a70b3bdb71d 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -945,28 +945,6 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(devm_nvmem_register);
>   
> -static int devm_nvmem_match(struct device *dev, void *res, void *data)
> -{
> -	struct nvmem_device **r = res;
> -
> -	return *r == data;
> -}
> -
> -/**
> - * devm_nvmem_unregister() - Unregister previously registered managed nvmem
> - * device.
> - *
> - * @dev: Device that uses the nvmem device.
> - * @nvmem: Pointer to previously registered nvmem device.
> - *
> - * Return: Will be negative on error or zero on success.
> - */
> -int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
> -{
> -	return devres_release(dev, devm_nvmem_release, devm_nvmem_match, nvmem);
> -}
> -EXPORT_SYMBOL(devm_nvmem_unregister);
> -
>   static struct nvmem_device *__nvmem_device_get(void *data,
>   			int (*match)(struct device *dev, const void *data))
>   {
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 98efb7b5660d..99c01c43d7a8 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -133,8 +133,6 @@ void nvmem_unregister(struct nvmem_device *nvmem);
>   struct nvmem_device *devm_nvmem_register(struct device *dev,
>   					 const struct nvmem_config *cfg);
>   
> -int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem);
> -
>   void nvmem_add_cell_table(struct nvmem_cell_table *table);
>   void nvmem_del_cell_table(struct nvmem_cell_table *table);
>   
> @@ -153,12 +151,6 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
>   	return nvmem_register(c);
>   }
>   
> -static inline int
> -devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
> -{
> -	return -EOPNOTSUPP;
> -}
> -
>   static inline void nvmem_add_cell_table(struct nvmem_cell_table *table) {}
>   static inline void nvmem_del_cell_table(struct nvmem_cell_table *table) {}
>   

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
