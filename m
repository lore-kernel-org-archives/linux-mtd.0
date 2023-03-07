Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271F1C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 04:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae0g/GyIdzlxh08TilluRa/YYiY4hN3RMxulf6Ow+rU=; b=cLm/C63raSuAnX
	nQgusTPPnqPO9/4uY4oXzyq/KqPrOnMCHTbzUi95rkcp3HWr0Ttn2G+ewb5ocjYHOlrvP4XjIVnqG
	ebPhmo3IROIG3YIYIAA8KN0L8scBZelejfiEPxzEvaNQtyoTK+lkZzwEl47otXYKf7VjR9NjhPSd5
	nRkm98HRb3d+M5b0z41GDbRNdNwFO6Yj2yU3G9Yv19CljBi89tbNzJgv0iMdrQb4QdJ+yPrVw+00E
	e0z1T8h+he+DjeycLFwoYq9mWts90YYV1dV94fpRuAWSb/BiGaQQjdn0KKbHzjVvcVyY89jKCvboA
	edWaQJ19YVj40baa89oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZOpD-00G9my-H6; Tue, 07 Mar 2023 04:21:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZOp9-00G9mJ-7i
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 04:21:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id j11so27897102edq.4
        for <linux-mtd@lists.infradead.org>; Mon, 06 Mar 2023 20:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678162872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6hqEkT/LNIvtq4ZHl1mUunRseH00GHLQMY6WXXGwOM=;
        b=u+d6SR1Z/9lh6/d/v7YLU5EvQpi4JWlyT7b9prNf+4U5AoEgCQQVnm8OdlYQzJZOIZ
         rrsMK7F6DKD0B0zFC/tThzB/VtSGXossihkiH6CqXNt2iaJTaHq7BFl5peXPNz4ncLjt
         ewpE90AghDEbOlkFxovEti0nIUTyq9f2FCXOmNffaxOilR+RjGmgtido6cPX4WNylNmP
         npiPJZ5asIycPfjVsKrJNI+VlUG+Dqcg2sYRkRqcP6KERqe/R3ftwDQ+wKIdAHXCojM0
         K8i1biFqUW/O4UMCpOKkLBx2lD2cjaiWq5PHKi7FFs2WfD/wR4yt0BtrvKOpjEgfbXHn
         up+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678162872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6hqEkT/LNIvtq4ZHl1mUunRseH00GHLQMY6WXXGwOM=;
        b=l47DM9WmFEKYcnXWQa1Q2fcUZb3ECQQ0Ypfm/BES4vcNElFnxAG9O+5uNCaIWeuZmL
         sJDcoBR+LqXPw0GZUmX8E7ebpq+ZhOG/WzV7B9uM65beO6uLRxx56DyNaZLAnVGO72RW
         i7/6eSiplqFjUqZaTqgu6On3L527HIP/dGPq36PqXubMBVV70R11NPP9BTNGbi09px4G
         vam5omZKLrPd9v9tYAc4eNC0FBI450oYQCAmb3Kowrai8o85eEtPp7HNayg3rKHz6+yu
         /VVNpd+63vEAWQdn5w/173ODh5MzhRfMoFgzCOM9L34P26MckK6aAx7YQGx+5qWiYggo
         ykNA==
X-Gm-Message-State: AO0yUKXv87CLb9lR0SOc/mNokkIx23uzmm7lBtCJS9+iFA2Vfhc/rM/F
	moK5PB+p/YzdjsvzuQx3qq+yNQ==
X-Google-Smtp-Source: AK7set+r0tF6JBXxJqwMfhX4rBE0rEOE9RzrvS5/X9eHIIFUmglTdwr4eZPvR7zlr6tvrFh3wGOs3A==
X-Received: by 2002:a17:906:308e:b0:878:7a0e:5730 with SMTP id 14-20020a170906308e00b008787a0e5730mr13215080ejv.56.1678162872128;
        Mon, 06 Mar 2023 20:21:12 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id n24-20020a1709062bd800b008b17aa6afc8sm5429013ejg.30.2023.03.06.20.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 20:21:11 -0800 (PST)
Message-ID: <1bbda9e6-37fb-195b-fd62-0e437847c636@linaro.org>
Date: Tue, 7 Mar 2023 04:21:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 jic23@kernel.org, pratyush@kernel.org
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
 <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_202115_375719_565FBAE1 
X-CRM114-Status: UNSURE (   7.65  )
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

There were too many recipients in To and Cc and I couldn't reply to the
email. I whipped off the Cc filed and most of the people from To and
added the lists in Cc.

On 3/6/23 17:21, Amit Kumar Mahapatra wrote:
> Multi CS support using GPIO is not tested due to unavailability of
> necessary hardware setup.

Please don't add code that is not used or tested.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
