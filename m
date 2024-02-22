Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8D8C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 00:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzFKK2hSU1wXsOhVEVeogJD2ZCyt5fT+Tw7f0dpKrpk=; b=vKQoeH2Xq8Qz15
	44WbgZK9C/X99pPKxkWmCvfeUIioNN1E/XAK6bodHvK1oyhtArBYDWnKEloF8Aj4sf7GuZ1sr8HxK
	dLaj81T/0k0B6T9ZI2p3l6lxKgXxF5nWdRkQx7G09ekvkXDpxnNvVNQ8XD5sRd7iQiCjo/ws3PUxI
	Br7qccBvV6z6VxBglW6nnPEupUlOaO7vNMtxmmDsZ1xDXXfE7ZVsEJiB+D+sUcIYmt6iulwT0+UYG
	nUhQfIET+LMI9BI6U9JNrkiLplHpEgyNZGh0iZdSawMQc3ed0HmPOlpa9HHQhDG7p2KFqwOU6jNnT
	80Ov31ZMQErZhxg3hbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx7M-000000034M9-0SzI;
	Thu, 22 Feb 2024 00:39:16 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx7J-000000034Lj-3wQa;
	Thu, 22 Feb 2024 00:39:15 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-78717221b97so491301385a.0;
        Wed, 21 Feb 2024 16:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708562351; x=1709167151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJDEO7vyFXsjZSDLvvopvcbjb0QZuTT+aq/m4OvzmuE=;
        b=a/i3j6SDbt7Evjjgr0iEe4IMsmAZcts3iBQBBRNHsdI0nCKf8UFMpmkfRiShSVilmy
         s4aeUJDy/fC3biAjRZL0+K1TgQkzlFL8+cUkoczdHZYuKOBTcnHjfT3NjJ3QZnQB0is5
         N5tCs/GiFVPbU+C9wsPpb/5mUrr+/uyUic7Lb6Bep84dbrF4vDp2cdCE74H1EbRQmgxA
         q3s4r95zi3AxC9eEqtHgOwjZ+dq3NUXhfQ7y77hXeeNp6e2ceIlW6oGJT51xhQeoODZ4
         IK3r6DrqEym2sV7WlHq8f4Ksq34Nzt2cU2KB6qnvibR0hjF9gTdyb7u3/7cN0eVAdlUj
         I75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562351; x=1709167151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJDEO7vyFXsjZSDLvvopvcbjb0QZuTT+aq/m4OvzmuE=;
        b=cz0Re3rF+4qqdobUbJmmf91+xToT+tjvQl8yks6QwxsqfGX3LR4NpOqqs8mg/CwcnN
         ZZz9kCtsdXh5KlaJ9muzgq+jw6zhKnmNaugxvSrxmK6SdQF/iDTUu5ZYGW94PLw2v0mB
         MOV2u3rX3BS+j1KEiEhErxxSLGH+OALMVKIm+yqc0x7vS6lT0NNaKvRSVAejB+Tla7DJ
         mDwUjK5i4aTyj81800A44EQPua86ygjMy6Sf63TRhDn9LWAG4sGFJJtmS3d3ibn5IfB5
         +YaeCnOrLwh+znj/zsWw4n/pISNXkX+Koey/VBTS+r8yyxvjZT8aeB31DxWK4VX+jWV5
         QX6g==
X-Forwarded-Encrypted: i=1; AJvYcCVf0zQGek3gNN/8aIGzFy4XJm+Kr1F/JcfsgQnh+ANxxiyv5c01YXGZpd73yi46rL6iVD5KG+pfT5M0yh2tbizzcSaLDljcmdsEabnH3W+pV60UT2M9y4kyyYl+QrAm9/UMTrsx4oWK2/c7c3dW0JKbReck
X-Gm-Message-State: AOJu0YzIUnmyl66UV6/S0bCGdnQ6/rFTPAhMru5le05pqzxhp9ufVzyV
	GE4dT/+izuOboF0kvkOe2z3GD8z7xvMoRtSS9N49VQe4YIVmLkEN
X-Google-Smtp-Source: AGHT+IHNa+pjqucXOsTybFzT9bvCneHMvXA+ivC4T9RMD3L/R4kszup14jb3j2D2IMaJI9x1yCNBUQ==
X-Received: by 2002:a05:620a:146c:b0:787:73c8:c77 with SMTP id j12-20020a05620a146c00b0078773c80c77mr8007138qkl.17.1708562351556;
        Wed, 21 Feb 2024 16:39:11 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id b15-20020a05620a0f8f00b0078401adad7fsm4811165qkn.133.2024.02.21.16.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 16:39:10 -0800 (PST)
Message-ID: <c145b90c-e9f0-4d82-94cc-baf7bfda5954@gmail.com>
Date: Wed, 21 Feb 2024 16:39:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] ARM: dts: broadcom: bcmbca: Add NAND controller
 node
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 David Regan <dregan@broadcom.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Shawn Guo <shawnguo@kernel.org>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-5-william.zhang@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240207202257.271784-5-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_163914_016340_738DE6EB 
X-CRM114-Status: UNSURE (   9.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/7/24 12:22, William Zhang wrote:
> Add support for Broadcom STB NAND controller in BCMBCA ARMv7 chip dts
> files.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>

I would like to apply this and the next one, but the use of the 
brcm,nand-ecc-use-strap property which is still being discussed would 
require me to wait a bit, unless you want to split things up and add the 
NAND controller node(s), and then issue a subsequent patch which adds 
"brcm,nand-ecc-use-strap" where relevant.

You have a few days to decide before I send the pull request for 6.9.

Thanks!
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
