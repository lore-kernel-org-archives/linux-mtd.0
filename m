Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9B1C7113B
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1F43R/jAbqFIzltx6D7E+zTtBsyS5f/AnAL47fQIOg=; b=z9R2LM0gRKRQcz
	8UUs2NclEXe1CzOOJ0h8nxjRgn3xT6bJZVVmbA12V+3aOAdD4AtWAOvdqTQZJA6F0tTlp8y6MT/9K
	y97t5awsnc4qz9vDw2VmGMFrpzeVRopNsXDQxDC8gAXoC/grvBuLmEzgY8yqcqc90WiyovkFVw5K7
	GQ1B8Ww5/8ZC2VwUJixqMlvdUMg0mCHd0bq/y6HcD1l7iZMhKkF28ZHhEind+wC5lM/i9lR2pa+x/
	CjXPtGy6/DdDuGvdsQ0qv4Xaq3gGZStoNDwHmlIPFQLkNEWqwI8fYS8wMIVr0edRbAhz1Db70nW5t
	1v9vk0PpjSCZ659BxYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5mk-002ZuJ-0R;
	Thu, 24 Aug 2023 08:33:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5mh-002ZtN-0p
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 08:33:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso2868460f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2023 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692866020; x=1693470820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6eCv+CJRAblo+rlKn3ngX1BL6rLbMlWZVG9SVzXXcQ=;
        b=vc6g91R8DSiVinfiLrkOMghI8qnK8+UxR5JNO8Iu4gVw93EyFyP7pJq+34oTppaV8q
         tL8pyGFWqIpX4ctyUhnJqPcxIFPzGQtUrUxanQXo5q8VUWXbeSjl+UdpoyY+3YhZ+Kne
         HsmbfN+StzUguuHlBr4/H6+qL280a9q1LFmL9gHXrakYBvcgAcu1QNqTfT9MZnyc0oKA
         s6rMHUJnh+a41BKbt7RlMmk92RHLIb0/i0Qe+J3ghh4Wq7wzJMJNJZhb4NaAwM1Ju6J+
         qGXzRn5nzlL68Q/oWdIjQuUMFqHrgG+StvXNEHtyfNRPI35q/CGzNmCZPAnb04qnU7ai
         LnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866020; x=1693470820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6eCv+CJRAblo+rlKn3ngX1BL6rLbMlWZVG9SVzXXcQ=;
        b=e8UKTgS0mU9dFJS/nXInOwlEk+jcr3FLA0+aA7cBHJwbVMwMQ6QnoaXGbPfDpWpEe3
         FcJRiugQ46ct8WugXmi2w+l9stxuoFXLOBkvghhQu4cDBu2udHkYx+xASZvClnWPi5GY
         6U3EIbDNQq70I7SUuTBYiu6nW8gghu1C4TC4wWc2mx4AxuBZBnVxhOqd1idmOXntShxs
         BlMSSSFQGWRxt03xt2TFwaoTBAL7/WsIpNwUZAXxFg7ftJvOnjq0ase3gQ/xVYEisIRF
         +6MximVpv7//h11bPzdwn6B7qE0Wx2TQm4okvrF24e50Oz+xGJIWAGSDj1G1d5EUWBZv
         bpPg==
X-Gm-Message-State: AOJu0YwOK2pTCLn0Gw2jAmNI6PGIDzffxz0pidJ3YYWMFhGH1iDAiiRF
	AOdPAZxnp9dgetIKLPxWQkkz7w==
X-Google-Smtp-Source: AGHT+IE0kJtgTKAINFdsLfUoZBXCx9cidt8kXJGBWPXQYU4ITv23+5mXDNIdaF2lT21zZZdh4N5EVA==
X-Received: by 2002:a5d:494c:0:b0:319:68ba:7c8e with SMTP id r12-20020a5d494c000000b0031968ba7c8emr10948264wrs.38.1692866019934;
        Thu, 24 Aug 2023 01:33:39 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.239])
        by smtp.gmail.com with ESMTPSA id u12-20020adff88c000000b003198a9d758dsm21622700wrp.78.2023.08.24.01.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:33:39 -0700 (PDT)
Message-ID: <179ad6a2-faaf-92df-1ae4-4e41bcbdd622@linaro.org>
Date: Thu, 24 Aug 2023 09:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 01/41] mtd: spi-nor: remove catalyst 'flashes'
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-1-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-1-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_013343_291540_44BC840F 
X-CRM114-Status: UNSURE (   6.40  )
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

you could also move CAT25_INFO into everspin.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
