Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FCCC52D6F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2024 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CH1bBjDM+4OKeXasG15amSJI1DZ0JXrj2rK4uuyrbjc=; b=dVTYc7dZ92zGM8
	JkEnvFHqK8DkDpxnIjQuutrrkuZNpoHOf4Fk4Vxm+mZxLLvAFGWYQ0Gsg979pVpqfoe5conNU0KdH
	ujbrDfgRSGBV2EdpBKrEhbINwJHP83y4wVy0sua9HrYgdrqz4oHoKANHXO/hFFzLIwTjY0JAoiTjX
	3PO4fwK524Et/XxGuHeow97sCA6OEzH0qlUeZoqWtVw542rK94sqGtXHH20WHEOnR6nlYSsmkuaCP
	Y/hsPw1yBYjMSjMxdSaXWirbX8UTZGs6SxbEAYG3wVlT2M6TGLeGn4/+70IUbQMXbwpdI9TEnE09f
	vUPNzz7qnYR42dgusX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbdPC-00000004csH-3aZr;
	Wed, 07 Aug 2024 09:56:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbdOe-00000004cmn-08nv
	for linux-mtd@lists.infradead.org;
	Wed, 07 Aug 2024 09:55:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-426526d30aaso10859485e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2024 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723024554; x=1723629354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV0FQP++vqMUtGeFQZXpoV/QuW7m4m+Nk2rBOq2n+PI=;
        b=bjolaXDBPoltNy7QscnljNCvCwT9gXkUV2DmideLjYomJm1sJSVjD+cvKCaoiYaUK9
         sO7jJ1dwEAJp33Jztplrhy6ND+a9CEoEfTUbji8f59BqGJNnrtftOirDgdkMfS7wrwVM
         KFGz9fvr9RVkMcmJXqQYIhDUZGxOWUxSeffY+6dMdZnHwnvX7RBQv4xXqdXO4lOVomeP
         h7WZojFNQwMFztKFPVDDwXLbC0TNrZdz7HIzRARl7hPd8qvZLPmxMuxtNj8R4JgJulfk
         38PyKlLzRpfLS3MxYxWKII9ZbE00r8CHF7WYiTbK4beQojldPqJh0s/tsW7om+yiQtYj
         9NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723024554; x=1723629354;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV0FQP++vqMUtGeFQZXpoV/QuW7m4m+Nk2rBOq2n+PI=;
        b=ELrKikPd/o7qquBIVRCMBW+6d2nFzDhCQr5pjdcZArFE4E3spAEpxLRGD3PPaFCYQc
         pgV7Hh97c4AvgxkkCU0+xzkauGK08SCLGILBwj5pzoiZwpYkcPyDqGlaRITahuB+zWUh
         drjMbFQU0u7+R0klntBsKpiIJDZyuIQ+qUax7sdp54W7IDdibLBh9iJSmh+3lBPw+N8P
         HxyVt1vdliFnEEN+1ISePIQ12qC3ma+5rmmrkHkAb7IwknGBpWaGkAV4N2HprJw60bFI
         S2FdIdfEdrt3FtO4oItqC7FsQcCBAH35rFsr/fb6cThIGN/yPgejKGNrmquU46fsHK+t
         T9rA==
X-Forwarded-Encrypted: i=1; AJvYcCW8gNsvRTFcBZ+YfNBBU+NxsL8WTTIiXVxNUNtpBncvhefNthRzkVY8pOHzhObmpIOlDL8YHBKTLS0oI8g0X6Q0AbQhYWpVIHFfGizu5w==
X-Gm-Message-State: AOJu0YwkM3VV1uEk83urfVFdk4U8SqbEYvmgTm/ssw+U6oEAt6T5HGbH
	+izzRQc7HfZKO2pwdZgwVXUCfpbIHc190xBgeFdsh9g1+hq+0kdTBoc5lm5UFM8=
X-Google-Smtp-Source: AGHT+IE3vEUjxKYTmLbMVbVULcwDedxIFTHlJkf/M6s5xb9scxWEgx63NITV0XFFGFGGaB2KdRv75A==
X-Received: by 2002:a05:600c:190d:b0:426:6e86:f82 with SMTP id 5b1f17b1804b1-428e6b31ecdmr130357195e9.22.1723024553869;
        Wed, 07 Aug 2024 02:55:53 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429058026b0sm21194255e9.35.2024.08.07.02.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:55:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, u-boot@lists.denx.de, 
 linux-kernel@vger.kernel.org, 
 John Thomson <git@johnthomson.fastmail.com.au>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240729080733.16839-1-zajec5@gmail.com>
References: <20240729080733.16839-1-zajec5@gmail.com>
Subject: Re: [PATCH V2 1/3] nvmem: u-boot-env: error if NVMEM device is too
 small
Message-Id: <172302455213.382580.1153614262268282040.b4-ty@linaro.org>
Date: Wed, 07 Aug 2024 10:55:52 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_025556_095216_8911FA21 
X-CRM114-Status: UNSURE (   6.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIE1vbiwgMjkgSnVsIDIwMjQgMTA6MDc6MzEgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBWZXJpZnkgZGF0YSBzaXplIGJlZm9yZSB0cnlpbmcgdG8gcGFyc2UgaXQgdG8gYXZvaWQg
cmVhZGluZyBvdXQgb2YKPiBidWZmZXIuIFRoaXMgY291bGQgaGFwcGVuIGluIGNhc2Ugb2YgcHJv
YmxlbXMgYXQgTVREIGxldmVsIG9yIGludmFsaWQgRFQKPiBiaW5kaW5ncy4KPiAKPiAKCkFwcGxp
ZWQsIHRoYW5rcyEKClsxLzNdIG52bWVtOiB1LWJvb3QtZW52OiBlcnJvciBpZiBOVk1FTSBkZXZp
Y2UgaXMgdG9vIHNtYWxsCiAgICAgIGNvbW1pdDogYTgwZjJlYmU3OGQ3YTgxMzU0YjFjOWQ1OWZj
Yjc5Yjc3OTgyZGYyZApbMi8zXSBkdC1iaW5kaW5nczogbnZtZW06IGNvbnZlcnQgVS1Cb290IGVu
diB0byBhIGxheW91dAogICAgICBjb21taXQ6IDFiM2Y1Yjg4YzU0MTMxOGE5NWZjNzRkYjgwMDgz
Yjg3YzEwMjBlMDMKWzMvM10gbnZtZW06IGxheW91dHM6IGFkZCBVLUJvb3QgZW52IGxheW91dAog
ICAgICBjb21taXQ6IDY0MWQ2YWJiZTE1Zjk2YTRkMmNjZTVkYzQ4OTQwZmQyMjkxNmQxNWUKCkJl
c3QgcmVnYXJkcywKLS0gClNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFA
bGluYXJvLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
