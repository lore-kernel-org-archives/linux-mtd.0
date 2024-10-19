Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABBBD3C92C
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2024 20:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW61Kz8pVe7qoVDoxJXm8/UFJOJTmLQjVR/vr+A/uuc=; b=Q9+rwKf8G+7Blb
	e6OHJ9cGeKQ9c2NwnfcUWU4cHTiTPWm7Ef962+BfpywpdZ3oTBhfAr8a/sC8nBM4a5HGVlhXfC7WE
	uzRPzTFgsT4AY+P79zGi7+gwDIVCj61P7PR4aH13Kp3xEYZsIdDv/bTv+aum6KBj6kYQFwqceXltV
	DUzBmMZWb/KRpNcL9ShGNxLkUsYcG1LVL9Xyv5DRxP8FDDc8ISIiWoILu1py9bOLy/nd/K6iZ/nsm
	xYJioxwaTprX55j1HNFMse5uuA3tNwAH14fa56wylYLSkfjz9vht6pPt0ZFyCnqxbON9D1xCIzd5Q
	PW4lxgOOlmHY8CeJtTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2G88-00000003tHk-0Mzq;
	Sat, 19 Oct 2024 20:32:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2G84-00000003tHO-48kh
	for linux-mtd@lists.infradead.org;
	Sat, 19 Oct 2024 20:32:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d3ecad390so3077837f8f.1
        for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2024 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729369971; x=1729974771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNSAF2YVt9nPu+f3L6phvZG/HyRYZLA36hwo/VBg3Vk=;
        b=L7SLnyoUkGZl6NKss2szNNb9jiUpH/fX/KidQvQZ/LPS02i3HNvUoeL9DKH9dZLsXp
         TwaNWuyx5PkXFbi/dAWNP9NS+V/M/ANq08q+waUOjIusA2M/DSJUGsklZkH/NXoHQEUt
         JcoRTqnNX1CYSAL+l+ebhlWvghmkhdMJb149lx4fC6QQaqiQUkqV+ax4VfICLbRBcf3x
         u0NFrgIrSDXICpQeWaeYa2zkXXJgbJpQA0RzGjP+8zIfswCnQyFFVJ7GoE6qGOwKrwG5
         l6NZdzcceXTW/0+1269l4ZjyhZujTqznlv5yqgIebMlBfwrg70Cftgr8Iqv0lzGR6HfN
         4Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729369971; x=1729974771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNSAF2YVt9nPu+f3L6phvZG/HyRYZLA36hwo/VBg3Vk=;
        b=fPvRckrdYuw5YCCTUJfVmF905Hbvkj3Hx+izI/U/9IlyKpiBR9JEmCcAGVe0EDlR6D
         DhlS0rTaXdOpmcQfGS77oz94kc9BixS+9Dk/204h2+S+GUcqqC6xV3z8JJ1ApNwc5QbV
         K6Knidw5urdqJXAbNAlCjV8becVmAR5vqSgj71Rg5CqS2fRfuisCfjHblwgFTszpo8BN
         McZ05uufSy7WhJnMAj3VDS4J5yDd0uQLBDErF25eqXgpBoHkmW/7PFgLbBUmFCAnmeAt
         H+7e9caDWzpEYOHOKBMNn+Uo/qHYlhDPet9QJ1LiAO2koNn84TdqYtYX4XTIpiW8P32x
         GNSg==
X-Gm-Message-State: AOJu0YxK83umpnaRdYNCIX2MXmU0e1ipZ830CJJMerGYtOxazLQ6BNus
	qhWGc3ffF79OUyIN5cXexKcQwlBQrghQeDPa3sueeMpo/9omv5A4
X-Google-Smtp-Source: AGHT+IEWyzayYGMJQLpshYPer1gVqLQR3xttK+cV+I+7abmQHdU4CTQ7JGRRYzfkRl+43W8uZZB6AA==
X-Received: by 2002:a5d:568d:0:b0:374:c7cd:8818 with SMTP id ffacd0b85a97d-37d93e24af8mr6583554f8f.22.1729369971093;
        Sat, 19 Oct 2024 13:32:51 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:f8f1:d6d3:1513:aa34? (2a02-8389-41cf-e200-f8f1-d6d3-1513-aa34.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:f8f1:d6d3:1513:aa34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a58f29sm284695f8f.56.2024.10.19.13.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Oct 2024 13:32:50 -0700 (PDT)
Message-ID: <40e3ba82-6697-4ed5-a593-c54c6dcd2421@gmail.com>
Date: Sat, 19 Oct 2024 22:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: ubi: fix unreleased fwnode_handle in
 find_volume_fwnode()
To: Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241019-mtd-uvi-fwnode_handle_put-v1-1-f5ef0d0cf9c8@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241019-mtd-uvi-fwnode_handle_put-v1-1-f5ef0d0cf9c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_133253_062902_F1B2A1BA 
X-CRM114-Status: GOOD (  16.34  )
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

On 19/10/2024 22:27, Javier Carrasco wrote:
> The 'fw_vols' fwnode_handle initialized via
> device_get_named_child_node() requires explicit calls to
> fwnode_handle_put() when the variable is no longer required.
> 
> Add the missing calls to fwnode_handle_put() before the function
> returns.
> 
> Fixes: 51932f9fc487 ("mtd: ubi: populate ubi volume fwnode")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/mtd/ubi/vmt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 5a3558bbb903..e5cf3bdca3b0 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -143,8 +143,10 @@ static struct fwnode_handle *find_volume_fwnode(struct ubi_volume *vol)
>  		    vol->vol_id != volid)
>  			continue;
>  
> +		fwnode_handle_put(fw_vols);
>  		return fw_vol;
>  	}
> +	fwnode_handle_put(fw_vols);
>  
>  	return NULL;
>  }
> 
> ---
> base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
> change-id: 20241019-mtd-uvi-fwnode_handle_put-7b220d2778b5
> 
> Best regards,

I just saw that the bug was introduced in late Dec. 2023, so maybe a

Cc: stable@vger.kernel.org

will be necessary in this case, right?

Best regards,
Javier Carrasco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
