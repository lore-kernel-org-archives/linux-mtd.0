Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83596C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 07:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2ruqpc9DqJ+/PaEe96NcIOH9ymwYjQNIJoByoj6Cjo=; b=Gj43JgGJdzggx1
	H4jBl5IjQ7XToRCVg8/DuAaFGQWOCZ9zzCIrxm6T10BI2C7Tr5ey6TaSljBkATjv/5FOhdkXS9MTE
	198+xEEKiSWBxyjM9f2Qn67B6acSVa5owaWt4ZecWtQhO9ySBIUFRqI4x6GlWb7GhHgvd1QWZ4V6h
	53FVkLnWp061CAmGXJmDNE4Lt3HAbAibdHujFlZiN3ygJCKGuZ99tSSne5lxnjLVBbNhEKfmP/d3x
	b0yE/qrvkKI4BCB7uQLYck+gz1CTp0GxZEgnKi//tSc21LaZ26uTDrtHLvmkNjl0kk0/QcsxlXYiv
	StSkm2CQUr805y3VEcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAcZ-0000000BRcD-1EjT;
	Thu, 20 Mar 2025 07:47:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAaF-0000000BRMe-1Xbz
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 07:44:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3965c995151so208322f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742456693; x=1743061493; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1pLKp0KuUULXpNQKbhtYOlVvX9flILaYFnqix3IbtK8=;
        b=nfvXFnyLEhDAnbAWRQoi9Jx+jr4OvkC94ysmr26yhkqLE02zlDkMANKfGXj0DubPat
         ULKfv6u9b2Epwh5W2DXYp4H9vBcoKzKiT2LHhc8uTFIrAHvJvyj+BhERaAONk2mlahnn
         5uvHAAWzkIeaRt8MZYd1LWASkiSpbSB2OALJz44YnvnSUks5esTBQtyRYsHUV73So0pQ
         2DyWBTjwalgXmyo+eLXPiMNd3AcGtfc8YnXdO9dDOYFQroUjzN/TJ7HisYR0iD331KGr
         Sw/VYGLX7UgcWWnz2hn+PokyY7YI1RzxgUdRZoe6J/vqCjC8VFRR27tiSvBc+UOXAJKG
         ezrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456693; x=1743061493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pLKp0KuUULXpNQKbhtYOlVvX9flILaYFnqix3IbtK8=;
        b=ZnDxWeA2aroQU5tnTvERB4A9s3N9N0cuuohWFRy0oiDr1SMryuAkUilBLN9IaZcYkC
         /VD7DJaaA7RLZn0neTM6XPLF013iD5t9jiP0wHGNg0LUXay5HKtWwHH+6FoE6shevr88
         qhfwcunwkezMPigxwo1QLxQgb010OUyev4zmIFzCqQmfx2ylB81JXjnL4oV/f8Lm/Leq
         bMlvPvrWp/bHglwaPLRH7U+JND60mEKbgMB6pfyabQAr/eZMyOKFlE73fAaGfnMQzUe4
         pD5yzji7HWgkgAgunGNUBpnA5gJc4LxX3f16Q+Yx3377orRS8XhkF4+wkRGnKTeP5O67
         GJXg==
X-Forwarded-Encrypted: i=1; AJvYcCVxflfizfNWideeU4XVp87+Fz3pHC9cZNvA6IhkrmloqlmyTBW8FinxmkWbH9dVNNtjv880y4CVqto=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuoD4vAJJiGD8DB3TMIXdv5Ppbm9csXt7I/1chAonnNjhcjlfS
	OIL0EMHDmvw6s6I79HfPQFeOsPau1vE7Ae3Fhx0Ibh+1/fKEUY5H4mR3nAGlC10=
X-Gm-Gg: ASbGncu/JlGXM4Ty08ChjoUZbLWNrKpy+5XOW/Wrh1OQ0d86CdOgx8xez70O9n8Ydcp
	sUsKDqdxk2S34gO3erby1eIg5Cglerbr/zlbUX9g5AJJ80r46JcPh6oJEe93CVZl6krPJ5llt9D
	QOe6hchy6L7XJdmW7KOV/9mpmpYxlmMUdfmEqBv2U2zybx//uKLiWsgz/wvrHlSrwNLakLTN8zX
	DE5uJnyD9uanNyZkeMwXdLn9IruHALsbdi9W+dpDXQ+iQ8NCyaDGTK5Nl8TOp27+L8K8m8RNZUN
	Z3eWWtnkPMr8ETJyKNVmSQeCuUKK2OoqikFqeuuQdsZUChXb9XczTQ==
X-Google-Smtp-Source: AGHT+IHqeQBbdHWajuit2mZUKUaW9kFxy01VDCOZtxai2FLtHLHiDpa7uJvn5G+eANZwcsM0bpL9Eg==
X-Received: by 2002:a05:6000:400a:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-399739bc4ecmr7109168f8f.13.1742456693290;
        Thu, 20 Mar 2025 00:44:53 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6b43sm23253313f8f.35.2025.03.20.00.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:44:52 -0700 (PDT)
Message-ID: <a3818477-5a67-43ad-8961-88fa02916968@linaro.org>
Date: Thu, 20 Mar 2025 07:44:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
To: Rob Herring <robh@kernel.org>, Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bacem Daassi <Bacem.Daassi@infineon.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
 <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
 <20250319233024.GA2625856-robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250319233024.GA2625856-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_004455_421585_DF113394 
X-CRM114-Status: GOOD (  12.93  )
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

Hi, Rob,

On 3/19/25 11:30 PM, Rob Herring wrote:
> On Wed, Mar 19, 2025 at 06:47:44PM +0900, Takahiro Kuwano wrote:
>> There are infineon flashes [1] that require 8 dummy cycles for the
>> 1-1-1 Read ID command. Since the command is not covered by JESD216
>> or any other standard, get the number of dummy cycles from DT and use
>> them to correctly identify the flash.
> 
> If Read ID fails, then couldn't you just retry with dummy cycles? Or 

I think Read ID won't fail when the op requires 8 dummy cycles, it
probably just reads garbage on the first 8 cycles, so we risk to wrongly
match other flash IDs.

> would unconditionally adding dummy cycles adversely affect other chips?

Adding 8 dummy cycles to chips that don't need it, would mean ignoring
the first byte of the flash ID, thus we again risk to wrongly match
against other flash IDs.

> 
> Otherwise, add a specific compatible to imply this requirement. Adding 
> quirk properties doesn't scale.

Do you mean a flash name compatible, like "cyrs17b512,spi-nor"? The
problem that I see with that is that we no longer bind against the
generic jedec,spi-nor compatible, so people need to update their DT in
case they use/plug-in a different flash on their board.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
