Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEDFC54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mk+j72O+mU9VMQwRR04LgWWE5sGx/EUn2GeMoQ0Q/Sw=; b=rh5k62+ot/QV9z
	1/qpsX5rrT3BL2A7KBRUE8NXjFEWLX/HCp+HRiDgMHxQa9vmo219IyvZcdIsL6xnoQpse3EFLqjEo
	CdFQwvJA5rh2Sf4YSjZiktOxe5L6+SCjXPueAw4sCHp5QRPRFQCe1hvse6qZxhEzgZjH8H7lUB/l2
	a97YhJOMdMnh+sszEWKfJ8c1fHLBQK8QHHHD/Tyk3Q95qHRzLOaQP1JuSHxKzXcrQPgMxeD8/8RHG
	WjRD0/zmhhnuhIRrfI72XdgoXhn57EwJ01CdtUfTZpx8BJCZcHOU9Re7VjO7F2GnBfWSJbC7XV71y
	POhD9QqG/3BEY1z0xFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXHh-0000000HLCk-1paB;
	Mon, 26 Feb 2024 09:28:29 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXHY-0000000HL8O-0tQo
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 09:28:27 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5129cdae3c6so3639639e87.1
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708939698; x=1709544498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3uOX17cwp7c4O0x6gt/bDUlr46mcvH9sFHr67mzjeQ=;
        b=dXA7qC57lwuFkBGuvxENqR+Fmf1sB2uPAzdldK5nqKmtqXt0LNoEk91mDjNfcIsrtt
         48JifgslkAzUUVofcBJqwBMk8YUVlRaXT5MAiFtfZ3GGitYS76YfAtGbaKcWCXkhi/GE
         3gYjt9dllC0/oZEbGBLDK1qW199zHBSDObVvqvDqHEQbXdljCzo5CAcdpiHPQGKz+Hbh
         SHdjiOzRkbPHIR1PJJx6Nr2dXrFfFo8nUBW394r5SdndoRHZVAcu95Y5uvfgGa8VmCqr
         hMxV8maTJeNinRXgJDi7kK44n3xS69S6fLBfhERKLfzBERxkab1+YneR87N3/MkbkhLT
         3o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708939698; x=1709544498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3uOX17cwp7c4O0x6gt/bDUlr46mcvH9sFHr67mzjeQ=;
        b=SviVbs45sXzVu78YYQ//SzGGcTfn17qO6OZCImmw7UsF4W9ha/JNuFA5mY9gZ8mkUj
         y3B/B2F499jB9Oxv2/SxJYkPBJ8i9BSJPEnChVxJNVVX47W5DOAQhayJ1EW6QLANaOBH
         t5I9KjUh40SRfspvmmJXAoPVJA+OhsGGdzhtCzhEzmBQF/8mDiPr+kOmrCfMTnHgag0g
         9WViH92V1emXd7X/LBGMX822FpK2qNntkH+9x4Wn4+BCMSOE+UXvk9Ozlxb0c3FX9O/9
         1vbRlXJ/aiVHkqMy40za7UZ0VinGWYRQOTA9L30v3w8cLexbpnnJ1RhuNf5UBr/QbOCZ
         3LTg==
X-Forwarded-Encrypted: i=1; AJvYcCVmA13ZncsTndZkOgNgRZvNZG8qT7g9io/ZaCXVnvpesg5M2fpcTC1WPNTSc0vzbqCrENUSnTC5iLOuEV596Ew7FPdKzjP6ZTR2Hqet1Q==
X-Gm-Message-State: AOJu0YwZuD5RQmZOF5Jhjm+w1OqOXTigUnBsVpsJgd5/7K0y9edaFCP0
	uO9ykaqRxbhyh2VLi9KUCHcA9hWDmvYtl55LtpUsiyHX802SVOuSu2C6lMziXts=
X-Google-Smtp-Source: AGHT+IGGAcrLEFkafFapXBxHMLia5T9CmpMFYOPF8JXFQ7kc94mcRRPQwftwXrZu5bPpRnfVO80QVQ==
X-Received: by 2002:a05:6512:31c6:b0:513:c3:1d95 with SMTP id j6-20020a05651231c600b0051300c31d95mr610450lfe.6.1708939698040;
        Mon, 26 Feb 2024 01:28:18 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id w8-20020a056402070800b00565d42006b8sm1246945edx.62.2024.02.26.01.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 01:28:17 -0800 (PST)
Message-ID: <9ebf9cdf-eeba-417a-8410-3f87a0973136@linaro.org>
Date: Mon, 26 Feb 2024 11:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Add Puya Semiconductor chips driver
Content-Language: en-US
To: Dmitry Dunaev <dunaev@tecon.ru>
Cc: dunaich@mail.ru, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240226092312.1834584-1-dunaev@tecon.ru>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240226092312.1834584-1-dunaev@tecon.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_012820_549453_AE9D6D71 
X-CRM114-Status: UNSURE (   5.52  )
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

Hi,

Please read the review feedback from
https://lore.kernel.org/linux-mtd/4d117770-6e0c-412f-ac1a-d9ba84b5b4ba@linaro.org/T/#mbcfaac90f123410a35db7dbeb0464dcb0816e7c7,
it applies to this patch as well.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
