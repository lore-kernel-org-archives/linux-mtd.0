Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFEBC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sdgpx3+iMI4HcMUNQ8iXDbbRNBD9a/e3Th6vYCzuRYI=; b=ay2Ioe4GO4woQ3
	U1VXJbdJg+OpON6RMPKyZknkVmtzsiobfGD9U+luX7RIFFLRcoUtXc/nsMnL+NFspR/V/M4mIbJIX
	fEJshAzULiEk/spZSQxSA5MrFlw3h9mSUXTwukSwaAH37E/HlLL28rWuFPzl7AMDw1DXBt38EyHl3
	5pyF8pYv8Yu5Hcqy9lio69BKK/nOC9QvOaBjJanICew16PcWSZOJXbEWw1RRYAM8HvN7gh+iF8QCF
	ZPaqIDaUJXMgjAg2zhAbcSf3qQTMMoVtLlLN9/FtByD0BMBSzjAfO+75APl8D5PZlNePXrEQRwYvy
	hpeThiOkMlOnOSij1aVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niZne-006P5C-Tz; Sun, 24 Apr 2022 10:49:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niZnc-006P4i-67
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2022 10:49:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id dk23so1100830ejb.8
 for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2022 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZeFfic7NkdYVY76qjghFYEa4bj1suXvfyxykTnL7iSU=;
 b=EQzrSr7IPIJEN2vBGd4rtciOiq7x+HzcyycDjE3DJxCACvRuhViJsJVxgtyGYh77h+
 bXh+U/bRcLGD5btOet6OMQS0+DcPPBQmkNKLpwqpCNUE/M7CWf6vmecux8Sx+g/Klret
 /jZs65AzmSB0w7b60opHRrvd9dKn0TWDKz9/rdlzpp8VB5QzmrzrgXjvwfABEwq5bQJj
 AhI1w3mx3C5pJbod0RjZibSlzG5KtixYP6rvxDcqTwDfIP0MbzPY2aeAjuSzGRv0oyyC
 /DNrWd4lGo8dVjhCQY4vrNz1RNpRBanlq35mLozoeTIB8R3cGuG4LZqglrzTfz7qzx7d
 skMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZeFfic7NkdYVY76qjghFYEa4bj1suXvfyxykTnL7iSU=;
 b=Cci5vMdLdLLODqnSQlTEl2CG5roeDf21u23unfg9iS7E7In5LpcmP8mIuK7kumlvVW
 adTV7GQUDsNhxDI26Sf27iVigIZmXmG96k/nqovW3oVKvyJ8CAto1YPE9NPP7LiBQUsw
 PsMJNUdoXxHmS6aJUkDDNmYhXXkzyze2gQNzi8Bgw7s3oHbtRML/LclVVZoHYkz+vt1L
 1uWbEKr0XTPt05ff8cQ51E5unn3GMIPVKj25vc7+pDX7nX+N1OfB0tDPmwgMkZPeRox5
 iaiXNL+HveamoM09INss/HCHbPJ8lxAXzToVN9iirhDVV5lCf5VBrrWV4B8IRFFAhvhA
 H+QA==
X-Gm-Message-State: AOAM530bXGJH2PmKzL30SK/Kvxg9/Q5z37lRGQdMYSFglWHpuwfN2xW9
 7yFHBwtFFpAJEhiGi+VRRrrLIA==
X-Google-Smtp-Source: ABdhPJxu1SgZxDPFJ4hqAIpFqD034Z/96Fhc0oCnQnk01+fVNPLw3U0KEHFw/qjT9d5lLeTmJz/g7Q==
X-Received: by 2002:a17:907:7f0d:b0:6f3:85c0:7c6e with SMTP id
 qf13-20020a1709077f0d00b006f385c07c6emr3054591ejc.693.1650797341532; 
 Sun, 24 Apr 2022 03:49:01 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056402281600b004206bd9d0c6sm3244860ede.8.2022.04.24.03.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 03:49:01 -0700 (PDT)
Message-ID: <5b41d217-a5d6-91f0-bae8-4086173bb5db@linaro.org>
Date: Sun, 24 Apr 2022 12:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/5] mtd: onenand: samsung: Add support for device tree
Content-Language: en-US
To: Jonathan Bakker <xc-racer2@live.ca>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <CY4PR04MB0567451F82EEBED23A7559EFCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB0567451F82EEBED23A7559EFCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_034904_274480_FA50AD00 
X-CRM114-Status: UNSURE (   8.72  )
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

On 23/04/2022 05:43, Jonathan Bakker wrote:
> This builds off a patchset submitted in 2019 [1] and adds support for DT
> initialization to the Samsung OneNAND driver.

Please rebase your patchset first on recent kernel, because it seems you
missed some addresses in Cc, so your get maintainers are from older tree.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
