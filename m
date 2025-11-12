Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D9FCCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APaf4vXvDdedeAp00IdiXgm+7S0GHpud2lMDmyVNz7c=; b=yS/B0yr9ozCfCU
	7P9nJ3+vbrhe0oEe8zfPoivX7vIixLULxokuesxEHCsdWNm4C9pB7QmwtUo92JV9eSyTlbDOjpZf9
	SSDREzif07EPBxMUsUih7W++Q0kUvMa6carDwIJ1hL6xoPRZdui9sY3brgKYnIFD8EHW/dpgYGpiX
	t7hBAy90ezlrZcM0qhSUIsB5RDc8RlWnQu6E2zOxjPzcsehBzV2OFeK5SAMQFaYI4ux0n9TFwNnsU
	jas1HUmwOdpeHGg4nzg8v9bYTyMbl3SCAEg46dUiacVNarQtnxtlQr8EW7pST/HasJEkmyXwUB2sr
	tSqE3CiLa36eQSCi1kYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6mt-00000008QW2-11cb;
	Wed, 12 Nov 2025 09:05:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6mq-00000008QVd-2tq0
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:05:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4775638d819so3019515e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938307; x=1763543107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjaEv8WTllVOjp2zrTZ7c9iuJ7T6Yqki2atcrwtghNk=;
        b=Flp/KWUKTD5g78WOcRVWs1NoO22IP7+Cx224EL4VcPAelpkfkh7GcPrij99FjMwfe9
         78bOBo/q9eYYm4QkFYM0bc1Ux+pMPxqJLVndE7oqs4B5uDThWgKoWJUUea8pjQD1chIO
         LbJQXACHZAntvW6OnQaCbv6/QhDf8e/Tos9Q3OQZNY9sydaZJZ+jpLWivRQxNYxdCfzH
         FYymtd9t+8baH5YpAFU058/AmLHtdg3H4HOK1Uo9NIqv/3zRW3gvneUoLD7AWTFYu31z
         drWSAet75m3HPNZK4xX/KHZz7RwENkJBwGyrQol1uyUbTVo6Z6Q5YjTuOCDBUrw5yMQX
         tlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938307; x=1763543107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjaEv8WTllVOjp2zrTZ7c9iuJ7T6Yqki2atcrwtghNk=;
        b=Y+7qF0bMddnTgoHdVo3G2zh5rDz5lRGymn+Kxcg2FDBfP65l34lktyAA6qUdEU4C2P
         lYStGcAvaYM/QXfjPa13kUj9dxWZd6TliHmMX04ijSy7POxJDdHjUWBmD/DZx6BkC26H
         OQq0EmpnHhqrJAPlXwKJmShrTbShBGae13sl9PRnm5NH+7wTl5MmgNOXlBlDVN4ltR+v
         W5Mlt8sK8PBC0psnXdGed7L3e3VFoyZgEvl9Jvm2RAgysD2l0l9DOa3BnGnF6HWp4rxV
         OJdacf8GqEo8LWLSVK3Nai4Sz7fWKvReS82Mbu6/N2dk61wKjqYzxhswHAUgl8mBix3e
         rCbg==
X-Gm-Message-State: AOJu0YxqovUmf8VK4kksDZhJfv7SDUw2mKhxpZwON3sSvZqF6mDR8k/J
	1n1B2RFgPQL3z0DTQHypdGhhlS6zxR4VHvtw+KXtP8poxrTxIspqKsaPV9LwDqn24zc=
X-Gm-Gg: ASbGncvse8zjvm3YL5dsXlVRXBYDlcYI6JUQdlMuYtp6/n0ysbmSc9YhaXh4gRrhkeJ
	p/uKDbyjq5yVHR2unRCz+nmwNTVDFAoDCFNXTZgOH49OOjbs9lfY0G/ebUFJyZDFCIm3iEqPLAR
	5x4MX83HfWZDAembpp/Pw8WUS3KqLyGzetMPRWv1UMH+vZGfLYgxoVpLEhvyfcoyQ81z8tRXJjZ
	0AW2WZrE9tvPII1WSn/rYlkwR+XMAXLqgA8tMRlPNl51CWlh9tHOsMY+ahm/v7LKBkgXIVxxGEZ
	w0URaTpfCb6L2ahITpb4r+w9qtm0tj/uko0jLRBzpBqbqK+MBWWrY8E9aoeA1iAw8ibNTmbHwgw
	dOLfTrguzXv79ht3zzncGVuBNUxVev1XEV42RimR7PGBjGQtAIwiwrDB5e3XnEJsmlz6ICYx6pV
	MzpCP0BVAw8hudYlb2
X-Google-Smtp-Source: AGHT+IFaZAuEWTwFLR51iHXsJE+bCjGRqn5WR46Rg3eXCp8SfPQgRrpAHKL6EvATHfPuewRU3oUExw==
X-Received: by 2002:a05:600c:3590:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47787070651mr22036785e9.5.1762938306837;
        Wed, 12 Nov 2025 01:05:06 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63ba87sm33666226f8f.14.2025.11.12.01.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:05:06 -0800 (PST)
Message-ID: <7363d995-f96a-49f6-ab44-3e9581b59617@linaro.org>
Date: Wed, 12 Nov 2025 11:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mtd: spi-nor: micron-st: use SFDP of mt35xu512aba
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-3-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-3-20aaff727c7d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_010508_761916_28A009F0 
X-CRM114-Status: UNSURE (   3.63  )
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

Wonderful, thanks!

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
