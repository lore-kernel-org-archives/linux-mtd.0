Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC6CC2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+seJ4nfa+CIwUFWr0DGoBK1pV2FwsPpvYJXqhSuYJ7g=; b=wCbpmBsQbEaQHw
	xYVDrX7ezP42bMEvKwytxJwJNtwPzhYMIFYuYJprGCTDAaKMUQDw7UdDzenUtqOto4bkyiV+yFad0
	531AfIU0PbTYI7y8OV9PxSpCqsi7pBmD/rigNwj/QkZLrloVoEyRB8A5G4liAjg4jdkxoqy1XPcPO
	qUJhi96Sa3SbgXNG2ck20IaYiUKWjy0SI7lYKiR39j+IOIIZS5lJiTW5Xa9RdNaHKucYCsai4fHU+
	bo63YL52DI39N2mEGVaEMzEeQbWwor70ZJiO7XsbZVQr17X4L0QWYx9HZfHRwfMVUSLfCGFv6sNoX
	ZloRGMGPN7Z8G/DvJDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeoT-00B2Y2-PR; Wed, 26 Jan 2022 09:42:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeoQ-00B2Vz-6F
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 09:41:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id a8so16850816pfa.6
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2022 01:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p5qnSOnNbuG7c/4WPBRjt2yZ/Rry3i6ExDDF/S8vbnA=;
 b=B0qRGkYvYmagpJ1I6bNtJhuuwL6ZlhCHQu4v82Qd3bT5W3++F3klOa2adOCQ4jx/ni
 88OUH7gZMXV5LiIvJOVwyJwA2g79y3m7WNLlaGjBe9Cm97naPumU/+RMtV4+iojvoVjZ
 0NhcCztj8ZEp5yeGnAb26QtKBuayEWJIDtY7ZdJWs4nTz7RuEPrfcujKV4rbpEGobKH5
 gMyQmYh16LSYM/iWN6JrpZwZLwJvJMcU8zxMwRK2cX+20l3GLII901q3RxfnI/r3FUcV
 HfZOKG+Hug4Yg6wkrmEPa8kXwE2ntmxDzHvSn5lvKsJ+PaBSueRXlezxdWDUgWCGx//h
 lVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p5qnSOnNbuG7c/4WPBRjt2yZ/Rry3i6ExDDF/S8vbnA=;
 b=uZ2/x+NR5tYSAp5FVG7i4NM+JwLj/0Pax3DZF8UkGX6Iw+iDuMYVdXU7+YQXuogA2X
 lCgCtE9mNmm0od/+UVJDXpw/wk/5gqlwL1JVXsZiN3E+TPiaMzNHHgs3hvLW3ly4jFfH
 i4H/nqTcFxseOlMi/0skxo4gLPLmQrNMWL6Fb/6qO1WfB1edMos9HZFJbOQSf2IznPED
 M2Kmxhkj4ylQLWDC9KYn9yxb33iRk/6PymzUwMHbfbOJdByEztPLo8i0MQkZUuHWnKLp
 92YMG5Igcz7vWhQe+rEmd2fze/ICSQ0FLsIGjyRsTfBcB+apF7un2rSouY4lWIPBker6
 bVDA==
X-Gm-Message-State: AOAM5338cSzKkDzyhq67X76LpUTDd0iCd3w/hfa2miJpHNuX9RMiTKxw
 oHUcYNX5WVqJ3k/m55zv+44eZRW+jDQ=
X-Google-Smtp-Source: ABdhPJzsLE7+XIPg3GhsoAbAbEBw+wrebQHWWDoloYqxUrJmTdn4TTIO/w0iXF3b4fdrEAjhtUtQWA==
X-Received: by 2002:a63:2a11:: with SMTP id q17mr18042000pgq.394.1643190116579; 
 Wed, 26 Jan 2022 01:41:56 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 g20sm1586551pfv.4.2022.01.26.01.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 01:41:56 -0800 (PST)
Message-ID: <f2312dec-ff76-8097-996c-29291090b7f4@gmail.com>
Date: Wed, 26 Jan 2022 18:41:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <d2503b2f-3190-7c0a-47dc-6ebf2f6e74ba@gmail.com>
 <ed5395d0-3e39-de69-527f-a33e6de3d278@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <ed5395d0-3e39-de69-527f-a33e6de3d278@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_014158_293977_CE75D063 
X-CRM114-Status: GOOD (  13.98  )
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

Hi Tudor,

On 11/19/2021 6:09 PM, Tudor.Ambarus@microchip.com wrote:
> On 11/17/21 11:23 AM, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hello,
>>
>> Any feedback on this series of patches?
> 
> Hi, Takahiro,
> 
> We're in the process of fixing how the flash_info flags are used.
> We already have an agreement on how things are going to look like,
> I just need a bit of time to submit a new version of
> https://lore.kernel.org/linux-mtd/20211029172633.886453-1-tudor.ambarus@microchip.com/
> 
> Until we pave the way on how to handle the flags, we don't accept
> new flash additions, otherwise the flash_info entries will soon
> become a maintenance burden. I'll soon finish the work, I won't
> stall you much longer.
> 
> Cheers,
> ta
> 
I saw the changes about flash_info were accepted and pulled.
Please let me know if it would be better to rebase this series with v5.17-rc1 in advance.

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
