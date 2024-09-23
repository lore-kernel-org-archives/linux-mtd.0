Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2FFCF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nipL17O0odVbJjCsSxkW44Noeef1WJu9uJ1yysluPJU=; b=HfSs/mmlFx8tEY
	TpU/vYtmMVM6ElmZm4YzWFExVjxyWtbc1Cn1OfyxFcAv/v/RaBSHYDKLL8aEzoQAsG2cny9cad1jr
	05nNVWI/8CzozBIRXYbfNQdtd9DUFLTrFpieX4oIJbUsE1qc2CzHX0X2xkfaUnhux4DrG0hRpuXjr
	BBp2eRzFfC3UN0bi/jxkt2jZjR1Tyy3EknZ7SVV//az7nTwmOU6RIbgCcOzkP8be6Am/r6B8gCL08
	ISODayIZlTBGLLS3bgIeYeypJkuHR4Dd/NbN789vnTFh6l0+JTFpFcG2U0Xq93PRBGNm0th5gnrjm
	hvPwEAiScMaWfS+75TlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssngW-00000000FTX-2555;
	Mon, 23 Sep 2024 18:21:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssngT-00000000FQg-1xAO
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 18:21:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so42668105e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 11:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727115675; x=1727720475; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqUXgYuqU0kIexUNzZ/9X/LQo5DdxjKVQvVx/S+OXaw=;
        b=BQdpBPCn6zvqaYZu4trx9Xykko3MMAKs1ZMxA4cBhYXpOhYczcQNm7fRrOjOuZIiOf
         UHE2EmqU6hw/tyNAitKZfqcC5o1lpYxnlEHN7LcSkkFUghmrqaSUsYEB2pnLpHtccDp3
         5DqymZsawd/xXKKqXUj4HOfZw2Zpso4/6W+qoAudAZ6trCMOFEshgpjoKpCNSDuPKg02
         O1MJNUpxTLt3cBAiw1b8bYrSyNKILFuoJ0Wuz+J3WAiAoNx+wGoRnXBI6QYwLm/MO4Dm
         zzI2uocAtyVUmu4wKmKL2KqaPDTR6VGj1EOLFvJgMnZl6H+i2niPpYjp6iWo3ZreHnRI
         HXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115675; x=1727720475;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqUXgYuqU0kIexUNzZ/9X/LQo5DdxjKVQvVx/S+OXaw=;
        b=bPImDRY+TjT18OIU1/88+zAzPdrZJQLdDFrJkqY1ckfMuaWG/rj/NXHmE4odwh6nxN
         lOJ9EXFcuMXOvFH7wN8MXGucW10n6MjaBo6O8Yumg17uCV7e9bDSBJBa0IrKssfWW2Dw
         ABYzdl1cKfZK7s0gw4MQ/kqKFFJ1uyMSuh1//2yNpPkOgfpBjPlb6ECXyyZQYj2qZq/x
         oOrtazdbm1Tolw8j+gF6Rm0qZvloSSxWccSbXZmqCptJh9wqBQVIKGNt8hornFDb85O5
         pNYJvHBbl+XVDL3Z2Lk/T6og84ikslu0m5QzOI7oJJuevDUECF+bFlBE4GAvuv1Ol0ag
         Xqsw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Jzr+sRHOsK7U9XPZZQ5rSjLCut44o5V6ik7fkSj4D8ZU9RfBBM6jZVs8Er4PIa/4fuPJCj5K4zA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnCNYCt7ui2cUVg9ncyygu1t2e3SbFuTt9Nw/DWHzAnZFyt7XV
	Wtse9dyT8099dluCSxcAGoAIMzJ5JOA8sGzCoEvu1dY0JcxZZBvlR1635/wTXWY=
X-Google-Smtp-Source: AGHT+IEyW5r2mR9KpKQXU3vq9s6UmBL0KAMEAFIWLjveUAe8Jbyp8SjbxG2qsaBNBpw2RKlYUrjsag==
X-Received: by 2002:adf:f183:0:b0:374:c4e2:3cad with SMTP id ffacd0b85a97d-37a42379f47mr7987215f8f.52.1727115674731;
        Mon, 23 Sep 2024 11:21:14 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e6c71c72fsm145269025e9.1.2024.09.23.11.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 11:21:14 -0700 (PDT)
Message-ID: <502f1855-09df-4167-a7ab-8cbae0da9348@linaro.org>
Date: Mon, 23 Sep 2024 19:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Erez <erezgeva2@gmail.com>, Michael Walle <mwalle@kernel.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
 <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
 <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
 <D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org>
 <CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
 <906df2b1-2827-444f-9de2-9b59f4d49b5c@linaro.org>
Content-Language: en-US
In-Reply-To: <906df2b1-2827-444f-9de2-9b59f4d49b5c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_112117_629742_87414C47 
X-CRM114-Status: UNSURE (   9.37  )
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



On 9/23/24 7:04 PM, Tudor Ambarus wrote:
>> * Always read Macronix chips SFDP, as Macronix replaced all old chips
>> in the Manufacture table.
> I'll NACK it unless you prove that the old flavors of flashes are not
> used anymore in the kernel.

Even if you can prove that the older flashes are not used in the kernel
anymore, we can't just switch to parsing SFDP, because we have seen in
the past flashes with wrong SFDP data that made the flashes misbehave.
The recommended way is to update just the flashes that you can test.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
