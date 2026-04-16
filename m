Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C8F8A145
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRYSelO/CxHtkUpvoLL8aKsjsBa+qWvEbRqpzjTJYgc=; b=AKNVDzhWQTd/DM
	F2YjoBjGmTlFWMUn0am3ZHhh8wV2KQtZdny2h4FKnwjCnLuwUDyxCJeOib9CZcvSl/na4Rj+9y7LZ
	RwKcl2DykZXFKTpjI0IAxWSYVunP+WgCrcMFUjm2u7SlIso1ZKvMUs/C7yVxnOWFOLLBwnpNjBE/S
	Whl5e7Q+Led6F11CKikULLA6F4zLQBmIJcWcKp3UH8QlQGg6lbplmuSSGzflCLPfyQelHtCrhkhH/
	6M76IemSmi8JToQgcIF4KFdcOwZqB2NIjGHfbWwUIvFl00foqoFHKqiFiuMMKF0d/QuYDoEtze2b7
	qfi/jZZyMUAwoVJC8/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIoh-00000002ECl-2JYh;
	Thu, 16 Apr 2026 09:15:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIoe-00000002ECO-2pbW
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 09:15:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso75701595e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2026 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776330914; x=1776935714; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Te6uieS3Vjys+0ynzmreLWwN8SK8TNwe5pCS8Deov3c=;
        b=oB1QKSjmfGyRH8PQkctJOFsQmMjb35jX95XiZkhM4TNFbAO1QaQyyRdHdzakmH0L4s
         mNLdFIinHcC+bwDrIiJCQ0hXrZf9ztA0a0aHkBPQvqKLuEF09RCZtyM5/DsqXCjoknwE
         N8XldIp6+o6evUPX4ORN6cBheeCxElXA8Zune9mHALDlCnFQtcOTevi7IXqmWQsbbiTX
         U2a937cSBmmt+rdsQV0i8oRD+pms12zr0a+bYFVyGPpoPs8aKNuWrmcYU85pB/v/k+yL
         RGEucnsqTXqfjfiIS0vTkgh7ehdL7hVmmSru8Ygcj28/xR8FLbKUlTzpjhk7k+mSAK9V
         sfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776330914; x=1776935714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te6uieS3Vjys+0ynzmreLWwN8SK8TNwe5pCS8Deov3c=;
        b=NwGMGpXuccs+V7M+aR3dHA3gDWAWaVAQg10+tFGVtU23yK0s8vHCeruUUXTdt/9Q6l
         4K9olVj4GmrBL5Aqeg6HEOOZ/KHF7bk/SreIUa8SrAAu86jF1P1CooQRMaOenbzE/sZw
         OIbaxY0Cb9/49o/QF49DRHscVPoZEVQTLMgAoiASOEMfzdPMEsdBDEJWDk83V0x1tJRF
         hi8GWx9z4vFJ47IRUJYsu5YoLvvln3J/nXHHRtmjcV1UCMCn8/S/ETjK21q/wkf/LYbX
         glY5kGEvKlFPKcZiSP6HQiWIX1HQuonWhlhzjGcP+pj7NtCjV64+npiidfJ0RW9an2kG
         zSng==
X-Forwarded-Encrypted: i=1; AFNElJ+jiVnlu/MaR6E4GCyFo/dmeCWlileWXAxHlxla6QrPGgop1jyUzL+9Sx/tZc7qXpHQDtxagj7B9DY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTGjVSBH/zVQ4tbOrNvG2HPUSMybs08SC2F8p1IEDzDeEYTQZ5
	4y+6cUMPVmmMxS7BHPUw5P6GFFxGg0Iw8omfdRBxSr7FIjuKEXvSoLC9Ri6uCKJ09lg=
X-Gm-Gg: AeBDieuEkXi5D3gPu4aUx0NxBalbtDj6I499GydcG6/rAVLbn44j4XxnicTLK1FDq6h
	CLb65++FMTAMHeIHN4GtuAxr1CuxAPPqb/b4mtvBf5He0QF9O4gVdhU69rHvL5tU40H9wAvq2sa
	dFZhurWPxkDfgnDDOxUDrNbMx9Clgc5BksfLPYfwosynQy9IMaqJznENvIHkThAEQMKmn4GZmtU
	b08+++TPC/HrNMjPPnrTk5wl5U8xSY93GJEyNSZdKpd6tIAeQq/g+QJeHwEW2qhTrlbzUCv1HhL
	30MNDJSfAflVCVc43JD20wkkhAblrKrMLdJIY6GjnleUmkNO6A/sM4BxLGe7ZvxIWbFo3RGrTu8
	BTW3bCacIE9HVBfGBI9WTBoiruC8qE0lIAFzDybI9cYbLiv64jVCA+SyqtseosI7XGo9nwd/vAo
	U75RJ6ADO7gtJh20g5u+HeVCyfLVA014rRNxX7pY57Vw==
X-Received: by 2002:a05:600c:4f56:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-488d68765fcmr373668125e9.14.1776330913999;
        Thu, 16 Apr 2026 02:15:13 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f581d836sm35932315e9.7.2026.04.16.02.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:15:13 -0700 (PDT)
Message-ID: <7094e4da-1fdd-4713-9418-6c1537d9af0b@linaro.org>
Date: Thu, 16 Apr 2026 12:15:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_021516_737335_CA544C02 
X-CRM114-Status: UNSURE (   4.40  )
X-CRM114-Notice: Please train this message.
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


looks good. Please resubmit, this time including linux-kernel@vger.kernel.org
list as well, so that we benefit of the https://sashiko.dev/ 's review.

You use b4 to add the to/cc list automatically.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
