Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D43C54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5Z55m1O/KBMiJsaPTdmPraqmVyNN4DCtGQwFR7pdnY=; b=YKBeDNLiAnw0oZ
	fCdN+wW0qaQieJZ9y/3fl7QwyULqW1juxqchyNAbk/4StNZeX8Ye8MVivNTpIvQZbCXXzIv9bELZE
	NaQWz2kRS5LIDTQ7Yqtjur8NFe8A1zmaKCv5KTFuv11x6Y7OEhePdIFV0Acac5qh/g7JeeXcStEY8
	cifi7hmtvZh7P95zIf48GZLLPWy7bA1BuSJYTeNcRVcPwtJHR9APlXO2xE+7290tSrDKK4HZja5bY
	awQ8/ysdnWUfegr/EqzcrSmqeNN2iUtLH/H4H9SLwlJtg1sSCv25DxsxJl/WwVlVAUEcUXivY/kkM
	n/YoLmE2MQSitiftfyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbA-000000045cB-3xxi;
	Fri, 23 May 2025 14:42:12 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISUS-00000003xfu-3BFb;
	Fri, 23 May 2025 13:31:14 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b271f3ae786so3569696a12.3;
        Fri, 23 May 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748007072; x=1748611872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHviDmj3xu42QGU1Ib9f7zk1dVsPa60dS0RLUI16fXE=;
        b=YA+dIOn6GkQDo5V5hjhUmfezx2r/rC0NsrCf++u/3DveXHn2/FCbo9i+4T7SKFOHMx
         czTqiNPQ7jtmNikrMcwsdYnXp4zFMur57gopVAFtKZEFm5oBn+gHg58QSxNhRjBWYoM3
         bqAaY/5mgIHCPIryrjF7q9s9q0VI+b8apM9noSBXShd3lhYfG6QSAVIKuXQf21dsy1fB
         FQ6WzxAH6E8pEP7IOmq04VmumJ0JBrIhaMcPe3D1dQIsGFZtp43fZQESAdJVlr2VN1ZJ
         UIZirmdKuYlhJqR/lVaQS1uuk34fTgGdnkkL4hgXpZBCTwuvSSFGZ9jooXZIhmykw1Bh
         H9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007072; x=1748611872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHviDmj3xu42QGU1Ib9f7zk1dVsPa60dS0RLUI16fXE=;
        b=a85mQNRzkzVQdHwmKzdoYQeWgETi1qQJsx2KpQ4KH09FBBBnVGJFu9VgoaZwPY5fII
         skkASiVjhjFdq1OgJgnLu/y2S7j7TrsqErB5dQOBHT/fTCaldjaJXKYkNYK2DjeacTDb
         ZOnM4MBP/LnJgaHIIwFYI5SsHdp5lH5zjMkaWcLo9sR2f7Sabe9vEBqKg2BPrCaU1p7H
         uqrnYW2TcgQAAcu48Rv8XVOu+S9EVkaHh98zSwQqkjDaICs0RMnkArlWL6nxYlIHdvFj
         48wVeG7AMGSVFisHlewpBVzKRfHt6UZ324XNTQgRlrrabK/y3VMp9Eo2sJEV2AIS75VK
         URPA==
X-Forwarded-Encrypted: i=1; AJvYcCW9qup6VS/G6hyxJJuaSTYKYIVv+2KCGClxUmZU0pD3SrdDL67BvHbBiz3SGjVu9xoXKlNtfzRJvRcLuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOWQI0Xt8fVzUS0faXMmyYHK19mOlaI/jqoVTar4WJ96axSNpd
	XLn0AtJPXGF1jaYUP9MbOSAxqxMKUMVEWM1V4Xd4XIAj68Zr0rDW9Fe6
X-Gm-Gg: ASbGncsakURb+lCkRKjxNV7t/8zvaNzMQD9qYK9/waEuzyNagX/GIVnwSAo4I6Gfjjm
	l5FzL+tJp3K8IyXnkp/L5+VqA4iKwL61OCu0HSUJ+3kunHCtIuvwHHfJSxuOvUj12kpmhC6BHSv
	0Mx6BeWwYml+MDvvqIQKRYvqRPJL4oupf74oNgNvPQjenuM0dVAOIXqixOZq/Hwli972Iq4mgVg
	bdWYVO/M0aHbSG448JsrTKM64EMxb1fFSR8rxpjg62fslBgY8mmDKEOBRlUKDcxWfjlLUJe1Zq5
	0MvbaWYgRCsU0AX2R6Z2U2RiJbn0ISXBhMr6pOyQ
X-Google-Smtp-Source: AGHT+IGLbgtx4Af3Q4/lm93aVPuKQYWmNhIgnWUD8AgPn231XjLOFnnKcHeakMtqv3fSR76ZQS0WhQ==
X-Received: by 2002:a17:903:18d:b0:224:c47:cbd with SMTP id d9443c01a7336-231d3257fc6mr419336045ad.0.1748007071336;
        Fri, 23 May 2025 06:31:11 -0700 (PDT)
Received: from localhost ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b26ecfc85e9sm12505536a12.11.2025.05.23.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:31:10 -0700 (PDT)
Date: Fri, 23 May 2025 21:31:07 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, ziyao@disroot.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add bindings for SOPHGO SG2042
Message-ID: <aDB4m6THbV19qjwP@calculate>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
 <20250523-sfg-spifmc-v1-1-4cf16cf3fd2a@gmail.com>
 <5ce44ff6-831b-4128-9fab-7658ffae550f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ce44ff6-831b-4128-9fab-7658ffae550f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_063112_795756_6BE48431 
X-CRM114-Status: GOOD (  17.06  )
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

On Fri, May 23, 2025 at 01:33:13PM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 12:54, Zixian Zeng wrote:
> > Add bindings for the SOPHGO SG2042 SPI-NOR flash controller,
> > which is compatible with SOPHGO SG2044.
> > 
> 1. This wasn't tested.
> 2. Breaks existing boards, so you did not test DTS either. Do not
> reviewers but machine for such trivialities.
> 
Sorry, This is my bad. I admit this is a pretty stupid mistake and
I should have run a full dt_bindings check rather than the platform I
am testing currently.
Sorry for taking up your time, I'm sure this is the last time for such
kind of mistake.
> 3. A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
Thank you, I will remove the redundant "bindings" next time.
> 4. Please use subject prefixes matching the subsystem. You can get them
> for example with `git log --oneline -- DIRECTORY_OR_FILE` on the
> directory your patch is touching. For bindings, the preferred subjects
> are explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
Ok, I will do it in next revision.
> Best regards,
> Krzysztof

Thank you again for your detailed revieiws and links

Best regards,
Zixian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
