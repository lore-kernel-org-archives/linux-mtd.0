Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D99CF9C71
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 06:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fd76nyDb9x5tST65uNuWTrf/px0zXMgRSKE9dg8AuG4=; b=akkcdGCQjm1mMP
	zVWYGti1joK4hwUEeHW7meroJvOIj2UR9IeCMbBpWysQT7Nx6ExKdThC6i/rO7VTGWh3nGGcWFNHd
	1tO+9I9m1yr2fgLWhgp+4ya17DK9tiqedHDtXAEwT8LOIZG0f3IrR05C5PPIKVY4M18i5PTLZiV8t
	YgDGRD0orUOIuyqQnNzUnDlpUqFott76GYD5To1+8MekWjH9DjVi6HPI5yUasmNqusChGspwJ/J5Z
	PRH6YLPEp20UZIbK8vDILq6QufBAcl+c5frEBc1l7aGEinhqBL9vXp1S+J/zp6FwezFL9yZWcenpr
	zWLTCfAaWQP0jiJpCUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssyf8-00000001AWB-25ZI;
	Tue, 24 Sep 2024 06:04:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssyf5-00000001AVe-3y5V
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 06:04:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so49191925e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 23:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727157874; x=1727762674; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rcrW71ZP88vsJq+Rm3jrHCL2rSoJ6nT6MfAts5dF4Y=;
        b=VjaijyraoEJB1IadScdI/eQJ724u9o/ST45iV8zLiNQn+rb2JLVieLXcLGz7+rfk7f
         /qURdGkDSTYZ81SfQPBO5aI3WnqOAglc7EWvSD6aBvvwdD1tTMznwSbvK5LzOui0Ec/l
         /ZFmfkZiJ8FQ2EC+fk1lVSH0n8Ja4XROIDhuHNiQdzYySrb8CaU0t9AMTE3HArN8uRvR
         cTs0vy/cT4/y0KsVXD3lwAMc35vVSgozjCJCTfqvOMBtfC6lby0Jwn67N7PvUZdefbGH
         5m6X6J41jLWO0+AxquNYMFrq7KFfKh+oWrL9eJZQ4oQp3EWeJiMIDKiEIBA3XU94gjz5
         9bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727157874; x=1727762674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rcrW71ZP88vsJq+Rm3jrHCL2rSoJ6nT6MfAts5dF4Y=;
        b=tnmlWBJSt/pQZxWB/jcTogb8b3t/qneswhSIrzDO/pAB0MyVYSkZF/6kmIRuZMmzqo
         ze56kjQzNmpnBuTF88qsA2UAWY+ahdqfO02jhepHwzq7XNCu+kVwugwXRPmbWx/V/C7s
         jZH6MbdST8rsUcXcm3A+uoFn9j0PziE81t3NJfln167lPYzg9lauwpAktyl1tHQSg0IX
         1ImM2ScHoQUS9NtH6iu9XtY/uwWwAWPBkLIVAniKoUsgAazXrLgsblFI2YroHtSLXlZj
         77tl2dhgs+CjUJChDrQLIDpDHccg28B9vGCq0gxkBFfHNl0znOve4mwgT0+eyJCP538T
         nWmA==
X-Forwarded-Encrypted: i=1; AJvYcCWulfAyGutdkWke7KNC5xf2m/f0Aeg3upXLDOaoZKtUiPUI+fqKxAizP1+/syxLnUEGRSbfLwmaT88=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuZNd5UKEViRw9irtbWxi/5daNMqHfkRKhNRK988sxUG/CWrIf
	gn94Yuo/6PH0Fc5uiEAtdujmuPxLpOBKOyqE72AnQUC5Awgy7hBl0/HQN9XCR/w=
X-Google-Smtp-Source: AGHT+IEVDQFzeiyRgulfL9oGUpluoLBy4clrJQHLJVmYY4jTv+qxHoQ6jSCN1aN2Pe29faDnW0Sk+A==
X-Received: by 2002:a05:600c:3b8c:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-42e7add1c1cmr101358965e9.32.1727157873871;
        Mon, 23 Sep 2024 23:04:33 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2c1ef1sm665368f8f.35.2024.09.23.23.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 23:04:32 -0700 (PDT)
Message-ID: <6663a723-547b-4f91-afce-7775c86d0c0c@linaro.org>
Date: Tue, 24 Sep 2024 07:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Erez <erezgeva2@gmail.com>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
 <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <2c87568d-3caa-4162-91de-094684f1b268@linaro.org>
 <CANeKEMO4ckeJZHKEOKHVeamPzR045jpwkXWfJS9S6rBiMTayuQ@mail.gmail.com>
 <688d3e68-c339-4a44-b6b5-366dd5f12965@linaro.org>
 <CANeKEMNKF5WtVgzxbMnLFsqRHNOz=+gD-if8aBqsWwjgDvz3GA@mail.gmail.com>
 <ca2c03f7-0769-4b2a-b743-3ebda9e29755@linaro.org>
 <CANeKEMNdGvteumpvLHhDoiVoZwPJ4iOs+Ej8KDoXR9-Vz0-rvQ@mail.gmail.com>
 <CANeKEMOH=CTC9GY5LFLj0mx2OoytR-9bOsFM7edDQ6-e=CaNgw@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CANeKEMOH=CTC9GY5LFLj0mx2OoytR-9bOsFM7edDQ6-e=CaNgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_230436_024135_85639E80 
X-CRM114-Status: UNSURE (   7.14  )
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



On 9/23/24 10:41 PM, Erez wrote:
> What if we put a JEDEC ID + SFDP Macronix OTP probing code under a
> kernel configuration with a poorer warning?

No, we don't add kernel configs for such things.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
