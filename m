Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A23C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 12:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+zPADKKjyi44lhrKQYtg02zraYwNngHVuDCls/F+Aw=; b=E7Gnqz4lD/vwXA
	v5cAzxIjHP1jkP+sqqxB+7pnfHcawtNrdBTVJlZ76KiNFhKs5/Isgft7pwJI+aacsamlxeBGtZODA
	D5z0nD//G4po918f9vPUfJ6RYLOCJH8UtKAUHGdG8W0nkBTvMNYyoEixleOAE6k2IjeZJw4kdWfGc
	/6if0l3KJEU6EZOiOdT1U00vjD4e+r5mS03z7TWjboMtTpPhOU0JcJcCUXfjIHQSiYsXxIQ7gnic9
	gXb6g26/nK8u8gnVncZLx515GQ61HjAYYpSsbyehGwOCXOH8/hEn2XmLFs1l0lcVB+lPiI4Wp/eAa
	tReU0mV1uyCnO9rCbH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwoy-000000060vk-24M8;
	Wed, 02 Apr 2025 12:03:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwov-000000060uX-3Q5x
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 12:03:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so72141825e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595427; x=1744200227; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=v12OMrakcu0mI+VEzb6eXiixXw3aNNdxHc8fryqHIHb0JxG+VwhSNxNVwNgdK8RqNN
         CUg99rc4FvU7w/Qxf0W5RusiuUyWNa8gc/BW6qYDZel3sonLjeIfyptAcVLRkqft9zL/
         mCUpTVRidkh4uoeVU2zMHbg9k2Fy6g+l/aGaShc8IDfQ5ZJY1r+3w6ze2OgaIrcM+ZPq
         8UWpT/dpIeiWUSwfwQvt4yvdjyMA566vIFfGq4jLudLFEDPr6TgwzS3bzbFPk8ICdGJ0
         aRNkRlmf2c3WQ/I94XrcQkONzJBffufWih15ds89+YpgCmA6hMhNThYIAbBe1umFfqFJ
         DyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595427; x=1744200227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=IgmO/MJdW9fg8aIcPKRE4nq1vvfaImhJ/fvtVfBDqxekxFhmXUEbmYFA1tyB4hHajL
         3cRsk0SUEnYnAAQUR1GOS5yMZ1jr4w1jups/SUb4tXzpttkF9VsR2VUBz6eIDY08ilw9
         fwduUQRZsP6c7cqS9p1uN4SnzlnBzUZoCcyufivCkuQTAfQntLgTk/A0kojBxIQjTqAU
         GuQLyCxDaNriIPWM+d5c9MM9cobK+2cjIBM4/DGhf/HSZsvnWVA7B3Fc1BPHl+EeQXb7
         PRlyuz8uycO7NEvfnot9zd9vDcZKMo+h05x1kpeep9PTstA6cv9mOkJteu5Be66piljl
         UJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPtaLDoqh4KrgjCGdE0VzyaJgiyYtJtLmfy21TG7M/Ye7cKxKwg0ujyrCpxnQkdV903F3lNfGDrSE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyF89BuWu1feBa7xcqe5CwnMlvk7P65Tic3zAeLmvnABiF+2RKH
	gyheU/X3GfOBwVKXWMxlxdAu3qh8ZZweRKNYnrI7gMSdETNqvmYh9JmZ1pAWtJE=
X-Gm-Gg: ASbGncubCVbphLf/hjtwK6VAVFVrTSgKd/fJeHVy13GDrBQTlnLCDR+jNJoIa4oMFgm
	t3Na1er050FieBNhMAJRhFVFKWYiVphsV7wDojHlmQxp5QoWJokC1cPvbDMoY7HoJX0kpYw2ydQ
	k2wEYHnqzUPlF4gvOJzZ+fgt7XcV5vTAb0z/OXULno/PFntQxm4X6AVwiArSbBFYcdDp9upIli8
	BcR0vNj1Uefnu3i6Gqq9QGYxU0kTTPnVSNpL1oa8HykJKIf41J9C5awiiQb/qxmyeF/w0HVZz4F
	I3zErEiNE0wgpiJzq1t5R/eZ4OdvTeNeZv5dprThJhYSGax/yRD+YxDQyYp4eZxq
X-Google-Smtp-Source: AGHT+IGm1YD+wgI4pF1F32H502jsHX4cQgi2yLR0AxNkSjmuUsJo9ZdA4N0/MGN7F4zpw3w+56Q0lg==
X-Received: by 2002:a05:600c:a49:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43e8e3d008dmr142321915e9.11.1743595427547;
        Wed, 02 Apr 2025 05:03:47 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60d1472sm18478575e9.22.2025.04.02.05.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 05:03:47 -0700 (PDT)
Message-ID: <4f7f8067-cb08-4c42-8460-39370c158896@linaro.org>
Date: Wed, 2 Apr 2025 13:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mtd: spi-nor: macronix: Drop the redundant flash info
 fields
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-2-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250402085129.1027670-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_050349_912553_8875281B 
X-CRM114-Status: UNSURE (   5.04  )
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


Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
