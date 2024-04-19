Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C7EC04FFE
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=DyqGKIfoLocKiq65aKlFutqdN0
	bgg60YmO8UYENZ6orxIAhN6BngTLTQbBcWCv71XULL62xbRoAjjesB+U4nJBP4SYoZ9orEzRgjcYT
	mddByDo4bZuzEppatRBuJNDe2+fDr+YZGxwfbRsaKLayIIAWUmE0HO5m4sXe/QNiKzS0XFiv+YGO/
	edRM8BMOIfNONHCcl7fgvKYyB5pB6BxoOCARomNEzzsMkcXnZnRwbsf5wVO9MKs7MW7AP3qT7bFbl
	FCdPbovAuxV2Bln/HjGfEo8RRTk0iypGjXSxqGwI7nTC3VBaOWe8QvF0ghuDXlLQmGDnMfW5NpClL
	7iGL69cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkRP-000000054XY-3qFI;
	Fri, 19 Apr 2024 09:21:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkRL-000000054Wf-22s6
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 09:21:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so2655882a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 19 Apr 2024 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1713518508; x=1714123308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=BhfrYjpJlXF3UlNCbVWS5yKudEdoEHzmAPDUMbN/YpssXARMXzyepiE8kI1jdE9rzu
         sldaQzMoNcWqNFnB8Tn28QOqXqcwAojOgy9bKVyzSIYSxWul0bdmXL6tbVV4aWYU94sp
         jJeES3wtuf2s8PaynDTzv9A+nCcKU+LKudEr0EjQ/QNDAAsy+jGGRFMxRZQY0NGezIJd
         m7GOfgQw8kKcCwH4vWRSmIOEAfwHgy9y7bRbeiY4IiASo9WDxPJR/E2P9/GAnQGJknya
         Kk/SHYZ+IADCq/9Ar6tMn6b6W7WxTL2ePHpLy7Mk9lKPFQfEyD65Sc0peS7n7mj6OISg
         V3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518508; x=1714123308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=w99DLbBXqlZhEEbK/U7HkjJ4fsyuSsvte/3dfMVU7PzHA1VZ82H1q967Vn/d4Jot3/
         faiHZUiC2s01sDxeC9SQQkI+WlnHfxDsCST/fCVVEq+oL73q+5Kjnaa5pSVfYPfWq2EJ
         THvGN2YHQOmsio4r1k1yqVsqyeNI4uhtRrWUOXuds5jX89cm+ovNAXoVVB4PQZ1lT9pJ
         J1M7U2i1kp95AVVv83ssC/Jv7phRZw1ytEISMuACgvtmpzWtUzp+LhJtveyT6fTWT8tj
         uPNaFxXBQZ3GL7UasKMZjnq8sbxwr+hgtn2yaVLcLgUlvLbtIUpXW/bZOypC0JYqYr12
         q5mA==
X-Forwarded-Encrypted: i=1; AJvYcCU53jRn907mnnXxhFgGj9pz+DywuTUfZhwiBPjcz43aUVYzfddn9d7lk3X6U16qX/p+lVVpPVmHsfYOIAYzOYOxCyYN9mS/VNls/FYkFA==
X-Gm-Message-State: AOJu0YwcYxpAYa1t6/kXp/tHBWUWL7MwzOJsYuQa+yBxmqujOlrfwT4w
	n/Xm11dsoNBkf7uA9tnyY6/HoA4EWDJbpWDn/qHZXkYu8Byeatgn2lj9OTuHK8M=
X-Google-Smtp-Source: AGHT+IEhcNOc1ewVoi6JIJWiqzcWwYpucqLqxxzi+GxPqgpKb6HJJmNfNJ4L8P0uoxvZP/Z5uUyFEw==
X-Received: by 2002:a05:6402:703:b0:56d:c73f:98ab with SMTP id w3-20020a056402070300b0056dc73f98abmr907979edx.19.1713518507805;
        Fri, 19 Apr 2024 02:21:47 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id i8-20020aa7c9c8000000b00571c1df911fsm1366790edt.37.2024.04.19.02.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 02:21:47 -0700 (PDT)
Message-ID: <45008373-c3f9-4587-841c-ddc391632baa@sigma-star.at>
Date: Fri, 19 Apr 2024 11:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd-utils: fectest: Fix time formatting with
 _TIME_BITS=64 on 32-bit system
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 Ben Hutchings <ben.hutchings@mind.be>, linux-mtd@lists.infradead.org
References: <20240412205505.1283783-1-ben.hutchings@mind.be>
 <2fd9e121-133c-57b4-db16-3eb1860406e6@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <2fd9e121-133c-57b4-db16-3eb1860406e6@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_022152_038378_A059C7C7 
X-CRM114-Status: UNSURE (   3.68  )
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
