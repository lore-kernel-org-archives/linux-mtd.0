Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A4DC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kwD2a2GhwiBPUPm5+LXFj/5a2hlbSErz+cFO2TnIt0=; b=xvfXTmvH3P8Qf+
	qcHwii2NirTQMGbTw/S2UDEGS1s8MdXYi+BnT/B8nxb0tkZt7C/BKoNj3GGLWZ/8Qhu3QLaUeoi1m
	R2JhmcreXxn71pj4UAhd0ST3xCA/Y6pV8wWWweJUU/VAUpPU/jYPUPf8Lp0i2ZXpRFZYllITMdV0w
	4odV/W1QvxG4sArWSCsdzES4gEOxbPYNe5pAlCWpA9Yoet1LlV2zmxoUqlNu2/GgYMSdUd2B0bC7Q
	xujyVWzgRcofF7TD2w61oxN63vWKHhQm2z68EmPC939kCVaJ6ohyjZpVJ/2RYTEZEiosGFVBnNvWy
	dAsIyfGeihDSVkGFSM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9aS-00000001kJQ-1how;
	Mon, 01 Jul 2024 05:28:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9aP-00000001kId-1KCp
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 05:28:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42564316479so16264475e9.2
        for <linux-mtd@lists.infradead.org>; Sun, 30 Jun 2024 22:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719811700; x=1720416500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkdA8KN8A8I2bA11uvZt9695FtnthrYQMH+V0MW6YEE=;
        b=eJvK6EOjd8GidmY2+34hVxQ9m+YUw6ZdUEfnBdu3yp3x6E38Cq9SR1tOo2WHCI0Udj
         f7/gFtwFOuC0X9iaT/4z1fkdPf8Le+mcR94fUxje2mrHT1WmOy3VD0h8Q8l3c5Csagel
         TEqtglUkVu1i98TEFlS+Qxom+Ij7fjHoYNjP9dqIO/COyt8ZEUlGRz8lXTWe9K0ZWIjn
         drbrrBzHlfttRGILLGZijEUIrboehFJhTKn5pwgjjGHn7Uf+PPxV9J+82ZYMGjer6uUa
         /k7hJpymNyJ2Ls1P+EC/QMFO4voVaTuIUR6nTxgVxGQjnotOnLjBjvyQz7SpeOnT7goK
         IMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719811700; x=1720416500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkdA8KN8A8I2bA11uvZt9695FtnthrYQMH+V0MW6YEE=;
        b=FXA+h7XDSQ8Dgc1Zl6gMrK+qjVrntgPaDEh0Om74EPtzE+BHoshT7abssKFYKnbr5q
         f3lrB7SrkXdQcBXByWB5HCl4n3P3zyKsyQjAGkxFHSWEg0XXWMsDpQxdwA4KRbPEkU9Y
         NwxoioQapxlGjjrjn97XDUa+SU2m/5io10NMhHJC9y8sKP+kPpR48O7/W4RIVg8s146N
         OtExl1/2JCj1uwFaCCDITVeG+/Fv0WRoj46MwlByarkHY/gvaYfHkYOw305US/cqOG9h
         dq7t5J7/zE7PJYQOceygh2g51gREHCwo2TkRS15/do+HcerBOI9bOud1zZglyPFgBHka
         lr0A==
X-Forwarded-Encrypted: i=1; AJvYcCU5rg/uw8r2rYqZ93Al+p6Vc48IyMBQI2X6u5sqV1+XfWcMW11ihPMWMzumJx2nf3i9OiRkGdy3oHHsrwTUkNTmmG71FlSMp2AkgQ4ktA==
X-Gm-Message-State: AOJu0YxYD8fIPFxOtZPIvnrQHZghQYBz+3pCM9jniqsGWOwsslWXTw/6
	XUU/bq6Gb/Lna4QZbrOPSJ5Fr4UTvghjxHFt/Mt2kfj1l60wON3XxO8hsH0FUacGylwFGViRJXD
	O
X-Google-Smtp-Source: AGHT+IGz4rqWrl3DoLsQ45HTpFY0wCleTeXmKARmX6Tlg1QN5PVLZXxtG1F706x/BHg79dLe19Q0Zw==
X-Received: by 2002:a05:600c:4ed3:b0:424:7992:c21f with SMTP id 5b1f17b1804b1-4257a021800mr32315315e9.3.1719811699661;
        Sun, 30 Jun 2024 22:28:19 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e16a8sm8962338f8f.64.2024.06.30.22.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jun 2024 22:28:19 -0700 (PDT)
Message-ID: <93a088d6-8092-43d7-953a-5374a22ac6eb@linaro.org>
Date: Mon, 1 Jul 2024 06:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] Add generic functions for accessing the SPI-NOR
 chip.
To: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Erez Geva <ErezGeva2@gmail.com>
References: <20240629103914.161530-1-erezgeva@nwtime.org>
 <20240629103914.161530-2-erezgeva@nwtime.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240629103914.161530-2-erezgeva@nwtime.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_222821_547370_01D772BD 
X-CRM114-Status: GOOD (  10.15  )
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



On 6/29/24 11:39 AM, Erez Geva wrote:
> From: Erez Geva <ErezGeva2@gmail.com>
> 
> Functions:
> 
>  - Send an opcode
> 
>  - Read a register
> 
>  - Write a register


Don't use the commit message as a continuation of the subject. Describe
your changes. Convince the reviewer why you need to change core methods
and that it makes sense for them to read past the first paragraph.

You ignored the feedback from v1, I'm marking this as changes requested
and ignore the rest.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
