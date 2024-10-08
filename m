Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B5CED273
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=fuw/Ntr3z0BbYAN7qErMHhclXP
	Hk0smpyF9Jl+v2b7AcuE+kbIBDKnjCekN9F0M5iV3GTUPkGPhMcIMnvezQphZha+6jeQM4IYb79tB
	wSNKmgokuoBLs3mW2v0ci2m87o8T+z/CcNxjBfX4TS7926WANRgqKwMkeOWDcoaweU5NLBe/aGrvV
	BRlt5ijbA18qyq+NDIJ2PN9zeqYpIgo4+fSXm6okYyZx7lPtSUgiw8jNzxOd6Iz0R6DpzgBSL6Z2E
	Tr9LYYZmGoW7ecyyIaMRYwlwfTeENxUKK5T4VAObqQJVpde1uiXIiisx0gap986Fj9LOBKiuppPts
	07O9B1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4H6-00000004k3Z-275z;
	Tue, 08 Oct 2024 07:04:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4F6-00000004ji3-3Ono
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 07:02:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42e5e758093so45990805e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2024 00:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1728370967; x=1728975767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=THOGwNCpmJqMMHICP0pqgjTmHKID1W55+qJwKyrd8HZDpodpWOXR6UIsUVUovl4dxZ
         RAUyXjr9v39dEmBvgmfzqyioG6m5CL0bQnV1A0ZdqVc8iM227c59YKsd7T/0ZBEGeVsw
         RTYgRMp2qhUFRq8NeCMa/XyjjIPYKg5zS3RU6rCuhSz/1iemvv6y+UZH1pxDO50ao/BT
         NrHZRdQXXFvfj2izP74BgcwMXGkkmwpYRMR6EZUjBjUz22uq7/JzTqJU1kl8ZnBx4ZXs
         6yPq/YKGS3BfaFHXdpfUEWfTpHPPOMoEYlBWq+S0riF5tIL41bVYfMGINKCYEAZ0AN7y
         N8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370967; x=1728975767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=gmjBY6xeruTCkcz1JxO73pH6VYtPvz8RKvr6iiiErlFB1tKj6QmdhhlIFvVG+lhznz
         0JW0dEGyywf6JOlDlBI1z2SeVTH1ukhdV0zncjKqHVP8FQAYc2LzdzL1vxV7YvByJSBZ
         OJkngN/4tUtTKsUq7iFxmX+X95tT5dO37+ZNT/qFFhtCzEtQIP2HBvlxk57OevliGUYr
         7C7DZ3OjwGTBh3rzSyNh9VQv1bEJDHApyy05BMr0W3qaP+kwp/xyti7gmvPVNHZTU/MK
         otPBB8vtdefs2UBahQNJrEpPmmWzwmvm8Ypf8ub+mEah5eTEtaTntsrh6jVunlpzSmBQ
         gPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXetxcrHLC4r6QIbo2vrJ3j6Tg4Tu21mYnw3D3R3FM1w5VhScQB9NjVK4u8d72AWKxlm4TKyAuldcU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyS/Ik6dQ4c/MsY8GNcIjnKCRmGudVbEy+l4sIBm8RJvhScwOZr
	497IfQz9MMqVRg+/pZZa4k/yrY4mjRL3IvefOU3om0H73RAz8qlpaWD7eNIEung=
X-Google-Smtp-Source: AGHT+IGhCAe8/f9es3KBXcaWCI4EE35Dgr/mQkbhlCLAiCMs6wOizX3o43YVw653fKsQyGlEsIUzYw==
X-Received: by 2002:a05:600c:b8d:b0:42f:7639:d88d with SMTP id 5b1f17b1804b1-42f85af56f9mr80776205e9.35.1728370966488;
        Tue, 08 Oct 2024 00:02:46 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b1d5fesm116237065e9.24.2024.10.08.00.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:02:46 -0700 (PDT)
Message-ID: <32e79da5-3595-4be7-b370-542cae512a2f@sigma-star.at>
Date: Tue, 8 Oct 2024 09:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] mkfs.jffs2: fix segfault when parsing dev table
To: Zhihao Cheng <chengzhihao1@huawei.com>, Rosen Penev <rosenp@gmail.com>,
 linux-mtd@lists.infradead.org
References: <20241003021941.1954913-1-rosenp@gmail.com>
 <e4a26eff-92f8-9ce2-f9bc-4ce4b0355f26@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <e4a26eff-92f8-9ce2-f9bc-4ce4b0355f26@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_000248_854950_7C3FB9AE 
X-CRM114-Status: UNSURE (   4.01  )
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
