Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B96C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 00:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/hYxmK2mLp+DBApiIqDH/g9o4EEqqGP+QZ5gpOM0po=; b=0ebXlmu2xevxlh
	lYrjGmJPplxlbO1abeWtOtdEunClBS4ZTOgCLeAtyfx7vAFq6CGT0CP3f4V419JmeH7x3Yu6c1Pn1
	gGdwBNKzakonSe6a/2u/FycSbL51iyYnU2hc1o//SyrcNUJyPa59uVq8FCVH13ILNJWNbBsAMK0gq
	8j6uBo3jzVQQYatQSCngF9CJZgA6mTXe7LWwYc0nmxDLBvy7VdJPIDytqwC2dzafLXZzNd/iR1kdt
	Do1IIAxJMERemv6XSxGH/EwzJGZ8BxS8xl0unaYf0asr2acArmKTegxTXS2TjqWcDQCWLxPk4UbDt
	l6d5VewWq/dte3WrGCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx3K-000000033K9-1p2U;
	Thu, 22 Feb 2024 00:35:06 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx3H-000000033IJ-27Hy;
	Thu, 22 Feb 2024 00:35:04 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7874a96a0c9so155298485a.3;
        Wed, 21 Feb 2024 16:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708562102; x=1709166902; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2JrJ5jovyaupsBQpWC5oSStAdx+X43YfCSVImiiIZg=;
        b=Dl08Qs0qmfkqlphpLnjNY+ACpmi6MjO3R7x7XtgHHyZZqGnfCyqkh8bGPRhOiP1MLg
         IcOiaSbAhvnIV89qq9EN7kqDV8L3hIbpA/Ppbgdpwet6zDgdhIixjizcoBdveeSzfgjy
         QP2hGVl1t8x5nAKyusTUwpW7dkkCMvkM2EzkZi74brGxXIPPqWI7iWhTrfYIGfAMTw5z
         Nl+Fzn1dQPQA9kvrK6UL5rcvSSuluivzP6PpvlUaj1pDiRSqLHzcIlnOujkINHkeE7aQ
         NdQX3XskjC8zHz9IA5QHs+kWMjgonZk35LJv67bka75UQLzzaWvjQejAQ7gnFNC8qeuO
         60Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562102; x=1709166902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2JrJ5jovyaupsBQpWC5oSStAdx+X43YfCSVImiiIZg=;
        b=gCGCeUcGANWXoR7wd1J1KaHgVjjor3FLb2fRQEcdd6/J36ScGITgYs3nr2kckOu1VI
         Z90dKuv5M6jqYU+lfKRLQFTdSng8SirIA99gTgkRd2rnXrbv7A4WPSSd4XSSXpaiYf0L
         H1lmapv7Ad7oT/5DUqU9o+mcWbLXrNbTjJ/DdJPnZwxxkDjAeJDYQIuk7nNcHheXEP5g
         QKuJ/4oVw55EhH6pi9Ci3CiPKmV3oA9MDm9QeodfRExGRz3ERjjgJbXtyZk5wc1BNV6D
         5quWOlXondwtNLSjfrQvg+9T/4sjtvXdqZXWMIR5Fv42978FCNn3KUFC7322j0TOaT85
         TL6A==
X-Forwarded-Encrypted: i=1; AJvYcCVDpNWFeQtxKmVmVqXGgpvQu425a4/jeDHfKvUp9jpX7HvcWU637ikjH51CQgWxxpwlZl3YnhUQI9i/sOG3prJ3xfmnTLqZKitJQ3Hpfz6GREZ7TYZmNAlFO5sDUyiunlmuglnemZO9va90UWD+wpgZyoAu
X-Gm-Message-State: AOJu0Yx2lGNypsf4GggP/OHRpXccKC5cAMF57GbnLfQsfOfDwYEThp4M
	aVp4YMR/dsRJ05WsGNqlbIDZjTRa0Cn+vEySsXdOtgR35XSLh07C
X-Google-Smtp-Source: AGHT+IEYXoCUv9uwVxBvPd4ZWMdMVNZBGtJ42BWDPA9KK+T3cDyPZx84QXdMTyGTLF4uhMbQI4kZEA==
X-Received: by 2002:a05:620a:34a:b0:785:ab77:fe6c with SMTP id t10-20020a05620a034a00b00785ab77fe6cmr18929305qkm.6.1708562102426;
        Wed, 21 Feb 2024 16:35:02 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w5-20020a05620a148500b0078723db4da9sm4804921qkj.98.2024.02.21.16.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 16:35:01 -0800 (PST)
Message-ID: <e978801c-8bf6-4117-b44d-1c485e3d8769@gmail.com>
Date: Wed, 21 Feb 2024 16:34:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 David Regan <dregan@broadcom.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-2-william.zhang@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240207202257.271784-2-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_163503_585818_2031204D 
X-CRM114-Status: GOOD (  10.16  )
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

On 2/7/24 12:22, William Zhang wrote:
> Update the descriptions to reflect different families of broadband SoC and
> use the general name bcmbca for ARM based SoC.
> 
> Remove the requirement of interrupts property to reflect the driver
> code and only require interrupt-names when interrupts property present.
> 
> Also add myself to the list of maintainers.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
