Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2F3D116E2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Nov 2025 19:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=IJI0I3UXw20nKcaHBnl1XZ6ga+
	0LOxwbr8NXLhSGubKKwx7+VoJMqhVZNp7Tn5Tgqg3tTO+MRlqZZk4PPVjaSVuZ3URzFuARAiTyRyn
	cezJf6V3IfQLVAtE4MOn4IG2Y40bSmGbrhLSTG95n8+NwLqpSKoHdOFlloKNY5evwg6ES8Ge+DX/T
	7hHCo5pELi998EwOE56YgVZ3npERQTCRs07UTjcglm7OqX8fxof1WGwXF/rneduaK0zCypdZIXRbv
	/nAvDp3ZUJBW758M1jat75VHDBgtjwD8+rRdBmVNUcAmbjbd3yz4/MWBq5FdzmpodVNXdHcSJmtdv
	9zqkjPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3wh-00000000onB-2Rzy;
	Fri, 28 Nov 2025 19:15:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3wd-00000000omn-30T3
	for linux-mtd@lists.infradead.org;
	Fri, 28 Nov 2025 19:15:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b7697e8b01aso441150866b.2
        for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2025 11:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1764357350; x=1764962150; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=XyYAE4QA8obFZCa9GfCVkmtuTCAdmwyEqkT9C/CNfFKDHICrOz5VzwXqCb6zGUTfeh
         6mUpwLPTtHTM6qmub/8HLk/QnGSYMYgT6onf2mcwX9cz3XUNjhPTwsrOsn5mYOJkl3Q7
         5/sZwy/U2tvPXJRVwP/PZUVOvmpqCdzoGACbIgfpzKQ5y28Xg6WIDOyRZI3OlQOMdKVH
         fin5IXkWtNYp9Ur8gb6QnRGXRkDGMTf/bnjv/JR76YpeuTnra2AHj4SonQU0tQRXPej4
         tWvCZMhhY0S3TrehIrZUu9+Tn1Bw6b3Fp++6tXdHRQ7AnImCWXivQir8ruCI5UJGmsdX
         tT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764357350; x=1764962150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=O341LC1ucd9YID+LzaT5KqBncCV9wFjI01DtEJa+HnI6K9UpyLo9mnEdOBzc2HxNqT
         epG21nahskkcEMWK5uL6BTtf5UfMFvNij08RAy3LZ3Pga3lSz9v0Gu+eWa9ReDZa4Wjs
         FoCaK56r+Hop2MGQfffiJw365BngavHhqKRpR4MJLoSjUVrOSi76sqUwRW2Hv/NSWnzv
         +q6deLdosI35KUdyaJmtcaZZn6sqXpWSjjeL2IWJ369EFWghNK7G9bubL5dZSL1NvUlz
         FSNOgpOhVw74JlN8UMih7YFJvUzYDMQyNCbndCW8tfcvO/cSa+CAdLKHCyT59KGQu2dd
         w6bw==
X-Forwarded-Encrypted: i=1; AJvYcCX5HdjjOCP+MJj+UEPeuk2FdiAgwiVbGQ3k7aBZe5TGlalOzwCrbtQss89hrNndzMN/JPNlsEo1SYE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOQx1XfEqfFZ5gTqH9bYjHCBIztUUsWZdKJIJxG1wIGA/OLaS+
	G1TXZEo87G4Q8CPMAlXdt6Lq749opYF8EFQ5lZsFZhHsxRJj5n3cdm/9IybhSjTU1/U=
X-Gm-Gg: ASbGnctw/7dSk0YRi4+Y2dJKdHTIsljtw0O4QmPg0BSPXXpcyBhHxxeKwG+TyJi+lKI
	7rBDchzVC0N+wYSh7Aa7kRfP6zQyrLifvffksX8IIepqbu4rqqMELIzghDl9eZCKQ7pKFET4bqS
	Hp5p8FtHXhY76rj9ybLIDE4ZHU1EA42cFWNgJQjkOG3Sg/wMV0NN8abvogIp9oEL2rLp78QtKdF
	BS8paa4178fr+Iq79UMB7DbXyOccESMuw3Y6htpQ+57lVMuzdMH1o/o7N2bxKIU/PILgYE7TOnJ
	zRBvvwgMiW0NTuLYTs1Wy1zQaJy8FjRc5voCUTZCjWPbdGLeiqk85PwG/jGGn0wZDKAXCuaz5/M
	b3TbHK01MdPngiwTVj/HmPJsuf4SiUF/p5Gf0VIr4nhmcKfUPblrGeKhTrvnkFh2Y8WQNu8j75j
	iJGR0oHE0M2KvnEdABW88U4FPjPpsnoiLiecHg/VGFLB3rZafXQXQmkLk3MbLl8lzMkOQmSRnOJ
	A==
X-Google-Smtp-Source: AGHT+IFGHZiAVUazKl8C/xRHPvhaVmzk+cRtGThAzJQ0Ii/d8E5zsSzktXyC0CtMarXo067Cc+eZDg==
X-Received: by 2002:a17:907:3da8:b0:b6d:50f7:a805 with SMTP id a640c23a62f3a-b76719d0791mr3400389766b.59.1764357349839;
        Fri, 28 Nov 2025 11:15:49 -0800 (PST)
Received: from ?IPV6:2a0d:f302:e054:54:ffff:d714:229c:6eed? ([2a0d:f302:e054:54:ffff:d714:229c:6eed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e8936sm504460466b.48.2025.11.28.11.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 11:15:49 -0800 (PST)
Message-ID: <429728e5-c51a-4bc7-9b15-8238b1c50c7f@sigma-star.at>
Date: Fri, 28 Nov 2025 20:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils 0/2] mtd-tests: flash_speed: minor fixes
To: Gabor Juhos <j4g8y7@gmail.com>, linux-mtd@lists.infradead.org
References: <20250723-flash_speed-fixes-v1-0-9a7e52d26fa9@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20250723-flash_speed-fixes-v1-0-9a7e52d26fa9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_111551_780149_0ED47E11 
X-CRM114-Status: UNSURE (   3.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
