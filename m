Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4BDC072A2
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/ORKfgcQfsiy4GBNOvbPe5LAWLGvaRKhr/sUYNZu80=; b=nljBYFs2Njzq/L
	hFeRF+hmeEiBDB08j0eQ0NGdofDHy2x0Kc2EvOPymbFIbYebYqMv1KEFeSG2hpbJA2IiA3by/0fqE
	ahR8EUUhCuYDn4JrL/AN4z2gS0uIPfduB7JGowXNhVQH09Cf2R9pRJpN7HnoIy1lEO1jCwDORTkyJ
	AV8s3XFr84OKSOX393W5OpI1wzxVyjDqFMsiKM3KPeP5ie6kZfi5m4HzwrW9FbDj53ebz8F3fqSh8
	eqqAj4t9l7FuFDMicwDHtdpJSKQ8BwTVEBiXXEv0iEAYtY05Y4e01udlqrgHW0NUoYPF1SRWhImK2
	NeP01WoNO/xUfk6REdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3v2F-0063Dp-0G;
	Fri, 17 Nov 2023 09:21:11 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3v2C-0063DF-1C
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 09:21:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9e623356d5dso245692066b.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700212866; x=1700817666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/3HvTigF2n40omiczCfERsjSp+7kyxZnjBckbEaaMU=;
        b=QgKC6JSlm50U7nbt1VKAwIdJYZMhZ2wXHBFR8R1zxvzZxV0CrnPBUrR0hYNpMUqnZh
         sMUtqeUstrGAkCiRTNA3UBW1Ip14x+JAEb6J7YAK2ttbrGgs6e9l8KqsGKw7pRtb0eqb
         yY9XodhEmz/cSrnoF914DgiWkMK4sieiiXBpXOZMri2WMZSKoDDsLzAd6r2GEcOh1LAv
         n24TDPXtkf1CSWNz9CjpGa1G8LQja8L/FOe0mY/FXNfsrrakxt8JXMluQdNTHWAS5wpo
         gkQfSwEoiCvI+oxrxrknWOYHrI01VN4W780k/JD8lQkvrup8R3q7GVwTBu6ao1Kgz8We
         CUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212866; x=1700817666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/3HvTigF2n40omiczCfERsjSp+7kyxZnjBckbEaaMU=;
        b=CtFy0aWCifKz3kuq/+V3VrasEl2wob+NiXUq4VhPUIFW26csEdDqqrYICrg9VZLuHV
         qnJQ8vhls/MdQ21lMns4J7Xozos2hEmXY13f20RBaYEXPsgewlQe25J4FQxdbGlswe9R
         WiUSOmisY6taCUT20K/W8w2CyMKAEYYHOuiYz8ft0Wj5Gx7jxbICT9dOSJgwrbxoX++C
         SQ+cX5iDpRBh2Nr6e11gqXzLNtHa/elYWZZOrd3T2R91uZwBcgK0oAtN9BEIcfdbL8vy
         EMgqqJd9o4w3m/D8Ez1GO0LKqIEctPGrlFfpcr2Ry0C/gD9+WBzsqiKO0xKNqyXWzs/Y
         Q4VQ==
X-Gm-Message-State: AOJu0YxnhcML/xvatBO2/IJFWs8EZgWBKlP3tq5B5tZI6X7PHiFTnJYb
	kerjZOjM+MjzFCtRKlRQEp3oTQ==
X-Google-Smtp-Source: AGHT+IFoStmhTwXE7rNY+KAfPKh6hPywCCRdjJNn4yAg3ALzFUKKaHLYPIyvPSt3a2WekC9oTRinig==
X-Received: by 2002:a17:906:c0d6:b0:9bf:388e:8e93 with SMTP id bn22-20020a170906c0d600b009bf388e8e93mr14965411ejb.0.1700212866070;
        Fri, 17 Nov 2023 01:21:06 -0800 (PST)
Received: from [192.168.1.111] ([37.251.220.47])
        by smtp.gmail.com with ESMTPSA id mf3-20020a170906cb8300b009f28db2b702sm565490ejb.209.2023.11.17.01.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 01:21:05 -0800 (PST)
Message-ID: <4dc92f1f-8882-4aea-bccc-9d880774d240@linaro.org>
Date: Fri, 17 Nov 2023 09:21:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] mtd: spi-nor: add support for Macronix Octal flash
 with RWW feature
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-6-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231117083853.33329-6-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_012108_486341_395D0407 
X-CRM114-Status: UNSURE (   3.73  )
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

Is RWW SFDP discoverable?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
