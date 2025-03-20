Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0835CC36000
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=0hoRu/pd9MDhUX
	WO/q2RKcmT505ou3bG0cf18tIrJu1FlvhBJ2ijIoCQq7v/s8IVeArOTMlbNu0Bv0Mo69GzgFD8eMG
	dKGGftZQTJaR9tpQ8e3S5TOKZfeSKJ6QDwXgPikZHBpwme1jjXz36bjaLtBV/nB7gsRbS277QZh2J
	7NVOId8G9qXY9IPAP7RoMmGUKT7WjMTFBlbroPyTz+okAgpVT1+jWm0osk4ux+je6orTG3tVNaYq6
	7ud/vA44EdK2OAAjXOOCXWamUjPrMkczRVyx10XxBJzw+0B0GKHUYCm3idiE7n/0qS7i+jKeia1Zd
	88jilh2DTmeFYNh3QXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEvQ-0000000C6Cg-0936;
	Thu, 20 Mar 2025 12:23:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEjH-0000000C4JA-0ySe
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 12:10:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf848528aso5852805e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742472629; x=1743077429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=ZkKS4Xk6OSu71Lks15XmdVBgfODCdiZKeBlFvONIPwEdi5EyPajfHnb3ifpOPJRw+G
         n71RPMjFVbYEdzh6DA1h6m43lXREjczjFbKnTWBJYKfbZCy7H82O7SUVJgPytJAXpe+T
         oaJsGiCFabPnm9n2OvA6eLa/Tgn/6mxJ8O/YjHPk48lqm0SH3fj/subs9wPgZnCtMoNH
         u9MxDNGw2SM4wUDuN4/c4DGD60ne1i7G4cZP/TD2Odha49v118MxrTnrkia+V15zBRxk
         jdnF9DabQ82b9EwK+pKMiIJnUNdi3R5R8KnhXkUqFYwt+pkEkoiH3aVn950b/GVekwh+
         U7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742472629; x=1743077429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=YNw0gQKEvrh0GvaW0ZoQInru/ZcFSymC4NDVPZc1iUCZjuLXpVec0RA0eRZLlcXCpZ
         O8Uy1FzjkI88T0DqKs2/g4m1hBEf4Jgnimbkdo2ALG0XjOUnlaUeoDisbFpC1ZnNLLfJ
         XqyrVY9Iqg9pRr/YMhoQUN7zHbaU9EXW3eORVhHpHPBlUHBO/p73dDjkH7KTtepNELNr
         ErDt7jorx/MAttGFilOhGjZxj1s8k5B6TH3AdvHPFtjFlf3rS7/X9m3IO7deFme82w6N
         cJLZrsUIuQgtf/iedcxqoIOp26cvMNnaiW7ISQZ9BfpIGX+2wo3KD9pXpyF9FLHXs//W
         Cigw==
X-Forwarded-Encrypted: i=1; AJvYcCXsWotJ30604Y8s54pqN3leUDlOBzDwzH4uSP0pQ1V5nG8raQ0ppckNrAe4vJRphG3MIEDlCS0KS2s=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq5IPA5TtQjAEspJutxc56wsX+XLnGqTamgMHKYDAH5AD5uVmZ
	o7pRFcrqjLyTZM6DYW2xjB0v3eC0jVjojR4VMPCzfeyx6v0eM+8G6ahyA8yUTDBKXBMQ+YwJ4xr
	V
X-Gm-Gg: ASbGncuHhDPnaDJtrbgATBodVFb2YpX42gWU9d6HmR+OjgwVK6BL86OBaxzufRTzSyT
	Dmp+JHBFFVk6U3S9FPf7U3qli2rb2xLqVOaScSAP1KymYfl5g+3+d+xMXcQwoAPlUdOXP+/rU7A
	2SR5eOYBTOZkm+tKLUNpP+p/TmJTNJGL+KDQRU2X8uMz8aCBxIHhFbB5kN4vvXO6YY/ADwIUQGD
	IvXxO4XOBaSgJcJ0RrpGhzDabJ8PianPJK0FH8areo5SOpFjqVsaf4kXFe+SnnyLjdTSlIOMh4Q
	tzO3jkYt0wccM9lShF+FnNBvbagbzIQ4SByPEQPVcggttvOhdVQjNg==
X-Google-Smtp-Source: AGHT+IHSHEnAtCV472PdfnFW98IAihH7mJvzaZ29n1/yTOK9+JEss+YYOZt3hAmGvjq3O6DpMDzK8A==
X-Received: by 2002:a5d:5f89:0:b0:391:4231:414 with SMTP id ffacd0b85a97d-39973af92a0mr7530290f8f.40.1742472629340;
        Thu, 20 Mar 2025 05:10:29 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3bb2b2ffsm58289185e9.1.2025.03.20.05.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:10:28 -0700 (PDT)
Message-ID: <d93de101-42e7-4433-8c77-a8bcb5a9ae6f@linaro.org>
Date: Thu, 20 Mar 2025 12:10:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: spi-mem: Introduce a default ->exec_op() debug
 log
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250320115644.2231240-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250320115644.2231240-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_051031_268349_910176E0 
X-CRM114-Status: UNSURE (   5.13  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
