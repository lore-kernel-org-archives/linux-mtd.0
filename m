Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC4CC369C7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=nTNDd18feXuzHG28mws+XCHZql
	YmayS1Y6xHD4JdpeN89wJcfSGP8VmiBD0agdeVP6CTgZ3VSXoq0U/P6Do8EfMXROkwsGWjvmna3YA
	hjZX0aH5dWZyL56dj8nEZFQFlU0J7CXsq5kn+XgOAQhA8RONIiLQ1bWsvKk4f4YBZewgtZMVPohz4
	G3to2Ftow/aF7MitvkLKcHqqw1dtOg5AQIcc9VYfs0NiKYIV9yipH5ALbWmL7hTb6m8dqIWfkok4d
	qiQBksvfiqJrnVtHA05zV2NCd0TRtBlq0y++LjNOXevDu1ctmkFcvxX9eY7ubGI68+KsG7jCY0sZH
	dMKpgDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPfj-00000004nRH-0Cwj;
	Wed, 25 Sep 2024 10:55:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPff-00000004nQL-3z0x
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 10:55:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cafda818aso64568045e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 03:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1727261698; x=1727866498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=F8pBim1i/wg5O7HyGgN29+2+KVDdxt7OkaF3PyZRGtz5fMSrHmfnOwPCekiXNFYl9J
         JtISaZ6W8CJy04AmiPe9g66mVdNpAQrfx+1RwIexpiCSos/ZHuIvggP8F2QU8hlaZen3
         zJyf+TbB3+EhJKmkv4H71iWEYf3eOV98NodSKw5+zF/9Y5pRCqSa7Q9f7Dv/n8qwisuj
         ZDQMVvZYb4zBg6XxW7lAgg0heSDxtTMRfdB4DzH6kbXjlLR/yucXCr0mwXHzJ9lw0UrT
         EpB9SSVg1OI10T65h9ehQLPmOm3pKPUzRgWuY7cW4fz8xx381SgCPHaRTZr6SGObZPre
         gcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727261698; x=1727866498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=sepC52+u4+BlSCySZB6eZO/lGj7lKWXJhkwZDhH6VAFi1UHd3zv8YRvCSUdHJ4gadk
         ta6cQej3q6OftD+xYfquNmrqJoq0S0wRap2f0QYcmoR18cEuyyRxcRA0kAoKU8qa8Kfs
         v5GjHS7hyo2r5WItv5dOVT0M9XRXiviDRehLAjqLeif4HsL3+Up06qfaAmT8E57VKk0m
         wbg02YpDuzAhIpD9B8vIjoj4pRSqbzrJaovnqA2YCp9pX7/WMBf4GVs7c8IpWi33xjp5
         f2MRLVrHWHYZm8oGPN22Q+dACErIuRsEsMfuDr2otFG5xx5leZfzeRvIC0EWgDhGAJL5
         AHtA==
X-Forwarded-Encrypted: i=1; AJvYcCWWmEEJl9Pkw055Giv58nEndTi2RRLsNvQemQErNTWzgD4+N8bIgpAWjbuXMNvd8dzUf/Nv+PTOoLM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwV5vKyD4p5pXDPoxhRBVuCBW2pUzGhDKu1WMFyalboyagFbkL6
	CptST3K2zaT1hB1NIqH8ArcZPn5og9ZGbSMVsUJzLIaQjee6s6b25oQXvZWQTZeOv0crdc4S/xu
	e
X-Google-Smtp-Source: AGHT+IE6XDlnf79LGIbbyGT3MOV3JTA1T7RNLds85WPLWOjvZ/o9gc+siMgXQZYlAlBhlOH3GfwKNA==
X-Received: by 2002:a05:600c:198c:b0:42c:ba1f:5482 with SMTP id 5b1f17b1804b1-42e96245715mr14660005e9.35.1727261697870;
        Wed, 25 Sep 2024 03:54:57 -0700 (PDT)
Received: from [192.168.40.74] (046075014122.atmpu0009.highway.a1.net. [46.75.14.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a08967sm14442675e9.22.2024.09.25.03.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 03:54:57 -0700 (PDT)
Message-ID: <e1658bdb-dc50-4848-ac68-56bd00e0a2f9@sigma-star.at>
Date: Wed, 25 Sep 2024 12:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd-utils: also check for static libuuid
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org
References: <20240923204502.823673-1-rosenp@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20240923204502.823673-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_035500_287444_D6608A37 
X-CRM114-Status: UNSURE (   4.56  )
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
