Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19D1C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=4l6o6aoSdhXE28BkA/e6WVJ844
	+TiNbFTaljP6bPrVMAQzp0SBidvXEc2/kDvN9KzTtcracdoWwMa4UYs4YCqFcE9BpSfaLZ5/Xe99u
	OFTK0aS7N8Q6KeSEEEFiYN5wPG1kOEyAQhVoM7so2eToGH/xp6HgzWTfJbEBKT8tJBZPR4E1EzP8N
	4f/7n7Mo4U0zAMixHDo0q0BAXz5nSETfpaDzS5uFlsXX15l9uxRmoYnmzCzaEOo+isxAgaaLOV++N
	X7gcNl5uUmrji4tVdkTpMpV10ua1f5VFHDIDQRce4WuA2dI0Fwtsbs3wtP/q8bxaVWw3O3Q8G48ZT
	QrV2zQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqvb-00Gec6-VL; Wed, 09 Nov 2022 19:40:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqvY-00GeSD-Rx
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 19:40:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id f7so28584400edc.6
        for <linux-mtd@lists.infradead.org>; Wed, 09 Nov 2022 11:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=YuV8x4ZzasQi2UHnBmZbz3VRw1bNgfsHUhLcW/wZy5gTd6uqkDqwEhYUtD3JoVIIxd
         pigW2qFUgSWgiPAoC+79NFtOJwvr46zg3OcEuRmkuFS/VWy4coZORVZzC7FzlWIoORfj
         SSjwvNISv87T0p2qCf7xeT+4C6DfceXO1TbYYc/VYmtmHZGci3K7V6i0WlvkOCXBQ1nU
         2GKm1CD+3TrebhpKcSVAExEdPRA8xdxxw9Pf2SjFNUcFfLZpY6Up2n0DTv+yP4YmyFBy
         IpS+fz+1acNqO2iwDUXfw6rX6OmanaFRnnSiTwC/qLmm/M99q00txpqoqjZ2z2owzfj+
         5Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=HqMDQprThr2MpWQAH4r9ESRDeRDFR+EwBlJWWYz5pFD8oiNWW67RvUjMGFTP//iXFG
         6WHuXHZUoQdAjmlPvY9godtJoJZ6EgweuyqnRjR1tQly0tedHmmCV3mD443QJPEVPN5L
         5Cy8e9Y/J1ks1G2wjBcejCu+xRxVnTq3HdVT2bDOGCfWSfEK5kAmwANN3OrYUB5EAYAB
         scfyRC8wtmkREKRp4p2a34mh5P35JgM07A5IYE1ZZKgWMTIjcUx/QPyr2AGMQZVmj57k
         Ods7nkp6G6jemX/32yM+TRFwVbWRnJCvrMgyZfgiHclFeL+zB1xm38V8KhPR+AhJZLam
         lKAA==
X-Gm-Message-State: ACrzQf1aT1Pq66J8eyyh9jsjMlxBDB0reaHoOoKMLFyKgPPY0BLBnd9p
	GZWeP4PGnkczfsFtYhMnQaFflNuF/k6HXA==
X-Google-Smtp-Source: AMsMyM6Jolr9n8NpiJE1BMOJU6qZSu/VG48B0aqyb89FoNUYv80KzuSnZarP94OAOxTeaY3gp7zMrQ==
X-Received: by 2002:a05:6402:2793:b0:462:39d7:3bbc with SMTP id b19-20020a056402279300b0046239d73bbcmr60953690ede.47.1668022798157;
        Wed, 09 Nov 2022 11:39:58 -0800 (PST)
Received: from ?IPV6:2a0c:9a40:8070:0:ffff:ffff:ffff:ffed? ([2a0c:9a40:8070:0:ffff:ffff:ffff:ffed])
        by smtp.gmail.com with ESMTPSA id s16-20020a170906355000b0078d4ee47c82sm6129458eja.129.2022.11.09.11.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 11:39:57 -0800 (PST)
Message-ID: <abb3107f-4d91-b7c0-4620-2bf213e99e57@sigma-star.at>
Date: Wed, 9 Nov 2022 20:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH mtd-utils 1/1] misc-utils: mtdpart: document partition of
 size 0
Content-Language: en-US
To: Brandon Maier <brandon.maier@collins.com>,
 MTD Mailing List <linux-mtd@lists.infradead.org>
References: <20221103141217.22119-1-brandon.maier@collins.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20221103141217.22119-1-brandon.maier@collins.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_114000_908270_D63B2CE3 
X-CRM114-Status: UNSURE (   5.62  )
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
