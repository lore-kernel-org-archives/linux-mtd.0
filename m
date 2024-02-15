Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271BFC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2SbfPM9ENEUoatBnswzSH3Y5QJFROcO8QSNs71YdVE=; b=hxmaOhDr3NJEBQ
	OP2podbXPZ4YbBYzd5b8wqcBSJg6R6Eiu+pi5WAaCucupJLgI/5NOiknhSIhcqQR+CQ9FlGhDmzLH
	CPmV+43BUE80yum+FwAXquau+Fu589PbqZmcUCW3SNMS9GP2rOGH9zR/iY6gq0C1Wy1vYc2mSqSUO
	QOTj+z/5djb+ki6AE9GahkuJmTV8bJIr2rAiI2dmBB74Itl3wPqu6pHhb8CiAGkh6SsyGd3nHF+N2
	7bUMYHQyn3SASTuv6nLPCZLF3ZR4qxjaByGUhPRnwoa9cKHYacKUujv4/vn7qWIwMW55EdBoO3A4R
	Hl6Y6pC1P0eMOWR8OLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rag0P-0000000HH7V-0SEF;
	Thu, 15 Feb 2024 17:58:41 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rag0M-0000000HH6X-2w96
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 17:58:39 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5620595f743so1514178a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 09:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708019917; x=1708624717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFU+FoaiQti7pQg+ivxZmwfsNKe8g3TQuPQL3hOyJhg=;
        b=fcz4d1auXdtXasiPFTXV+PIYNnvOt2WNtRF9EBu8tht/jmzuZ0DXD6Ohw3BqJfsRZQ
         9pxHfDGBAtWYbd1geKrCJ3pD0rJe3Ihll2wOa+oPXOZFRdRnGmeb+jbUeYr4MPguYwyf
         qej2LquCVhl0745gOXWFetu9/ECELZPYsUeDqCZtCW44SmPQu8oPCqHrtAzC2T+v9W8J
         FE5kLe/D79s/J+p66rBJlr9velXgjbUIf5sADy43CEfldhMt7Sn2nx93ZCYj72hC1BAC
         flvUkJERVTyVCf+lLGnD252hOd7ujN7w/jHYEALoqjyEg1batXOtY2GYquKChuRVuHBg
         0dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708019917; x=1708624717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFU+FoaiQti7pQg+ivxZmwfsNKe8g3TQuPQL3hOyJhg=;
        b=Y/OKGP/s5lQEhDPbQv/YBlR73fkJNoy6wOAhXMqyk22SkrOsESZ4DlBz22Dd0dmKIl
         v33SiopO1+0uiayLssmmb8uiqM7oZREQHpsWBbYbbZoPFmEMofWBvYLGhfalrvD1VD+I
         VPeF4cfZKas5pYLdRiBzOCJ5yjjdCxtwSNi3Z1v9XQBUO8bHTeW35GeqCUsXjrt0Yjvk
         rTjH/DEkhVanneCL68uOo5iyiZw5mkArmwaJUuga2y3+zEIApsaII2rknDng3ghr787M
         2mi65CFfOPM/+XEhja5FaSp/DMOYfQECoRQRcYFRp/JeCMekLm6WLoWEJ5jDJWvL8x+d
         1R9g==
X-Forwarded-Encrypted: i=1; AJvYcCUw+DeFt9Nee8ld24KHzscLLFgRVj9n+dWy6s1B+vHhRAxqdpxecKAz7mQTnaFQejJK7sNQr0lZ2N1ZUrM0bkvBKnQFi6z97lEMPDzhkg==
X-Gm-Message-State: AOJu0YztCXf0RvZ+Kvha/EpBW6kByTs3UwWrBbu5tus/nKiaqmf0rl13
	/1Ld7IZmrB4TL+XE2cnY7oRxsdk/KH+zz0klBk/K5xLxtwg1CcMZXLurGqpIYMw=
X-Google-Smtp-Source: AGHT+IHTjex65y4mQj3nNOE8pPpjQjNg0YEaQHCLGQL/RR19Sne4TStleiM+21YH/U851dkrGQUPMQ==
X-Received: by 2002:aa7:d812:0:b0:562:117d:2297 with SMTP id v18-20020aa7d812000000b00562117d2297mr1852030edq.36.1708019917258;
        Thu, 15 Feb 2024 09:58:37 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id h32-20020a0564020ea000b00561e675a3casm749438eda.68.2024.02.15.09.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 09:58:36 -0800 (PST)
Message-ID: <584a5308-c73d-4559-bb61-21d07cd63d6c@linaro.org>
Date: Thu, 15 Feb 2024 18:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq9574: Disable eMMC node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-6-quic_mdalam@quicinc.com>
 <CAA8EJpqV=w38TqjfTp6OurAwHjR87PpmQTs2jUo6O7vF1-T-WQ@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpqV=w38TqjfTp6OurAwHjR87PpmQTs2jUo6O7vF1-T-WQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_095838_773511_75BE3E84 
X-CRM114-Status: UNSURE (   6.58  )
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

On 15.02.2024 16:00, Dmitry Baryshkov wrote:
> On Thu, 15 Feb 2024 at 15:49, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>>
>> Disable eMMC node for rdp433, since rdp433 default boot mode
>> is norplusnand.
> 
> Are they exclusive?

Even if they're not, having access to the eMMC/sdcard would still
be nice..

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
