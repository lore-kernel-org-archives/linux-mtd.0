Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1951FC00A94
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sovxkNTmP2kFz72MDpG+bpxX8LilV/kph46hO/0ip8A=; b=pyO5B2H8d83nF1
	Snsl8tBkekNt70mDc1yllLfGZ+GbUObdThbL5hqU6VZftw6EIfPzxUjR1Qn0sL+46GKNsClscd5DF
	4R6aFEIwmMWu1sbRedFR3lAT8RCyV+B+d4aPK9X7i0s8777OWpvCOujqeSSvwIp6pQj+qbfd3C7TC
	RymKP3ex/EuLf/I+XO87t5fI2jbS1Gi369H2cJg8yvfP9U9lHxOWciJ6KQqdMNQwtXgty0TPUsx20
	ox3waCAB4EezyTodvacwDagAIRxZnoRPTIHILi4OYtkN2AH7ENvkazjyHmiOmhIsWEjMQvw4SXlgN
	V24P+nJdlgjo2szHnAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHU0-0000000HSs7-2rxn;
	Fri, 12 Apr 2024 14:02:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHTu-0000000HSoa-06h5
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 14:02:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-343d1003106so593364f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712930536; x=1713535336; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFqpAUpwG2hQHfLMXGbRQ+Tlu6lvE2ntl/2PebRnDtQ=;
        b=FPDkIk8ObyR24jzi5+hfCE1uvslfma7OmbCo3h7Suuz4byYis5YCYdjyF6njO6q4ag
         1b5G7QblftjaphGB6ydblPyWeyTtzXlfc/gdBwTi+pRoRszzHhnDdSswx54AMfxx8KfL
         8Ncbi+IO/8ei+sH6nb3pGJNLjgcotzRmCUeieIrJFNmltelWUEdVpP9LcaqbGa9oB/LW
         AIN60XV12wdtXGPSN7In5vGkws5MDrcTxuRH7vzgd7M/aKtXyj8zWlKiXU3s0m803opU
         8ZFv9Ob/YbKk5WHoMHevVHJNqV2aDUgJ5mM8To9gfEP9Zcai6bH3KzUV6Dgf4Yyytwwz
         VJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712930536; x=1713535336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFqpAUpwG2hQHfLMXGbRQ+Tlu6lvE2ntl/2PebRnDtQ=;
        b=Nfb0jjY61iHFfjK/ZEhYJuc+4jMNI2lo3U/DxOGPkfNvcxS9fDbllcgvuUgHgZN0TT
         2F7xXWS6rWMrKsHb0vlBGKKJj50UXPxWgjbMeinjX6ZSRS9Rrc855M0Ofr3TXwwA5/Lm
         WZ7j+AxNyh1DO5qeF8V+ITnSMso27oi6KqUMhoCgUZ62gkeEHBTbEJ6OpXEnsHr+5SY7
         f16Boyi1/cxZEyTozp5bCdp2+ufGvqPQmPh0Silo6JyJRn1URQYQlTwvsYoHjD33MG6L
         CniWd/iNhDoo7XEZqJSj8gmMt9l264e4Fb5nQU+qlF71ZbTMq+Frfqd0CH7dqtztFMbY
         8SVw==
X-Forwarded-Encrypted: i=1; AJvYcCUVbbjvk5HLFTC/MieJbRaSJMhAT/Cvr1BiWgoxtWNYe3T+v5TngRZdEQGl6+24TCEnDz3xbSp/6EVeVcztnEORf5E2fIfqOUS6BF5GRg==
X-Gm-Message-State: AOJu0YzYGLkxRfmPDcswEZiNf1QhAGVCdzwZGfBGpEAqxaAa3sAQrdEa
	PNxOZULShIK0UlJTQ7fhM+afNYb14bklOnRSbtlOiXL4g6I8ElOwU+oUNnmJAeVIF6yrdmiySVi
	Q
X-Google-Smtp-Source: AGHT+IEXLLoh5B8UK347uf+zWqPNnsyjaSIbmHG7dITBS9HSlhge4UABfAYlZqwG5EmSFIBvUYb5/Q==
X-Received: by 2002:a05:6000:2c2:b0:33e:7f51:c2f9 with SMTP id o2-20020a05600002c200b0033e7f51c2f9mr2899188wry.49.1712930536440;
        Fri, 12 Apr 2024 07:02:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id g4-20020adfa484000000b0034330c9eccasm4393665wrb.79.2024.04.12.07.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 07:02:15 -0700 (PDT)
Message-ID: <f5518c05-d334-4b78-a2ba-eec8fbf10d8c@linaro.org>
Date: Fri, 12 Apr 2024 15:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] mtd: spi-nor: remove .setup() callback
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-5-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240412134405.381832-5-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_070218_137893_08599820 
X-CRM114-Status: UNSURE (   7.37  )
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



On 4/12/24 14:44, Michael Walle wrote:
> There is no flash driver using that hook. The original intention was to

because you just removed its single user, xilinx. Please specify this in
the commit message.

Also, you can get rid of the address conversion thingy.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
