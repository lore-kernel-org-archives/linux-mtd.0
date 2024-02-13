Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07152C48260
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jTui1jLkhK9fiejYLwqlY9yfnT03TG7kuKAkCl5Zks=; b=fZyZN1STCu/K7u
	9GgbQ2p6BQu9USfRhBBaZt7Y13/u9TLQGKOoiT2SjaaJCq3GAyL/STFsdU3Yy5O8kPoYuTB0tVLzq
	oKHdjLIvWeoQgmsfQVXAD4s+NLWOPQaVMY/QtFV5Tgmdz6UNypxJ6pk0o3zNVawVJsypVDjVFkDFZ
	tbfOWrFFNUqiFWSQm3NI8SRDGf2VtWbzjS9CaWmuJKlJwWBiJLlS7kU7FYH/XHds+NsKTa/rBpaqd
	k+1G76So8DXWPN95jyPAJ7dqPUDAEBZLr4zL2Yniy9EKYaKcdP72jtvCWKEpVX2f3V51WYosYp2sO
	34LQw+gdyL8UREkOrMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnLY-00000008Hct-1OvV;
	Tue, 13 Feb 2024 07:36:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnLI-00000008HVY-051x
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 07:36:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-410c1ebf5e4so16292305e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2024 23:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707809794; x=1708414594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qKO6w6id7IchIagMH9q3ni7wU4UnSKJ2g30c/IBubE=;
        b=r4wZtLyv1afO218LhmxCguGJ2TmJRJ4w4nrUoimvaobusBDHM1LTicvYB9CTDjSTWy
         3pyjYPAgojGbiAWqLdPqwLs0tndAaKuLcrQBOGYJ/4ld+H5d09vIKHlQ8E69AhtJwq4p
         F7x1jmBDkJsggIZ4Pzrr5CWzqviAL961QAPnxxRBXtuyrZNQUAv+s5pQX1j2T3MXDhoM
         qzxfoQ0GXFYYrP67VNHsd/jirIaT/ya74BBv0SWhIFg92ipn/Xmm3qUyWM8oKoxJbSTq
         7bzEgtGOYqbS1ZYDkHJtKI/YzQDT3litaXlWk726+FAUybt3/Hde2pecbnTJGXadEDDH
         0bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809794; x=1708414594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qKO6w6id7IchIagMH9q3ni7wU4UnSKJ2g30c/IBubE=;
        b=Y8AEUpSp9OsE0Yq+MP3DOrdTq6FfY8mvbBsGGMd45GYfXF/nXDQIJLUoubogUYCU5w
         uYqBdzNWkEHICkM8Qd+MDR5Hm7ecss0j+BRs9nxJ9Y02KbK69BxqnmkfEcoVDudaqjw9
         RZ18spQ39mwAAqKpH7FBJt71DRTqC5x1j0YaARJYe07njxM9CXmD7WtlSH9sdqHba+TI
         yCxoJjQ013jHKiNYGFOHAvfXcLBhPf2jGtABQG6qGU14aldlE4vVYzCJwI92RqTXTQ2f
         ecYOerAefGv2HNOQfAGxnVk0npgmpI3PatO4e28nCs2nw+ClZpRRoUtwiqDwNGP93Ccc
         JG8w==
X-Gm-Message-State: AOJu0YwTz8ezzPNy2xICkXu28Y8mQgpdV2iEKBZdfJUFayVFppEPuBwu
	eZnz27uwkckpNY0qFM8z3Yi65wUjtaXmK2W6Up6SBqMnipKlV87in0inMSFk2Yk=
X-Google-Smtp-Source: AGHT+IF5GmEHNdHwgIu9hH7ZeYF20sFP8fOT/5Qbg7HmVeORoi87obfIJFBFeiyqu+vM0n2qpQhjzQ==
X-Received: by 2002:a05:600c:a386:b0:410:bfc1:d994 with SMTP id hn6-20020a05600ca38600b00410bfc1d994mr4916531wmb.21.1707809794039;
        Mon, 12 Feb 2024 23:36:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW74wNdLQhyMEW2twzcJU2CJ2I31uAb83QnFCX9k38I30UtMTOr6Kywtm8DY0H4S/df1ZiOSSBHqDJTi8h/mb8/lo6xx1PTAC8CelXzJyfCvSH0Mj0iqD5PBGoIuyi/a/hFwd+ZEbxEHoqd21GAHJKdfno0VGishU4y0xnp3+wc3WR/sYj0RMvXxc61/FytAWwy0uLuz3TbF5uXR9+H8d2vaN83BFiy8XKc7zKUBiXRe4HEeN9Gf1uW9lK/Qdaw/NjLkAqdcWg8Jo20jtQeCmH+QbV3ohUaYy1/VI1y+OcX1vQPCumpZPrNo7Tpu8qr9yhKc/di5DTaZ/bzLEnDUe2azATDLx3kFQ0P4+odwYiz3xzjMAlhF6QEsZo=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b00410709fa0d3sm10967698wmq.33.2024.02.12.23.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 23:36:33 -0800 (PST)
Message-ID: <afb4bd72-aa22-4d74-aeb8-d3875c6d07ca@linaro.org>
Date: Tue, 13 Feb 2024 08:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] memory: stm32-fmc2-ebi: add MP25 support
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-5-christophe.kerello@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212174822.77734-5-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_233636_346471_9BBFD45A 
X-CRM114-Status: UNSURE (   5.49  )
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

On 12/02/2024 18:48, Christophe Kerello wrote:
> Add MP25 SOC support. RNB and NWAIT signals are differentiated.

s/SOC/SoC/
everywhere

> 

The way you split patches is a bit odd. Shall we understand that this
patch is the complete MP25 SoC support?

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
