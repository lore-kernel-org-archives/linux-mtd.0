Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D884C282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+s+WNgYDnAWQ7XOCiDF146q1bkRP9qhTPlNH8+2cuAg=; b=LvRxX64yuN6dOs
	J0BJvFrwOPRPYye3s/lNaPMfudIZ0JfX2ep+9oBvAecHUBP4sRGXsFiJO2yzS/1LD2e4Z2e9iXkhw
	HrR3u5XAAzpjT5nAx/8g7nTJDzDvhhtGEF/Js4P0F7lhhc7G5ovyPErJWND1BZO71ApPsu+pjRJ5P
	Us8/2sJjJ26GbKP9ZrNVGswwRxxzD/IKTf/Hgs3GASS5xIRP7yhngPtTrCLmV7LwH1r5AVlf8eRWp
	cD1H2Y9lHbJ42AT3S/j0dVNMtXCRLARCDTsAxl0QJwotbM+fmNgT5FE39aV4Xa+gedTUKFYXpz9ok
	cPbsJvDQwI08+MoRabCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAQH-0000000AvmS-3oAo;
	Thu, 06 Mar 2025 12:33:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8z1-0000000Aijp-2GuT
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 11:01:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaec111762bso99225466b.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 03:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258902; x=1741863702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUmhA52lOTzcBIdzLko57ah+XkpjqclccDf+VaS1kCw=;
        b=oeWi+KTJ0ZlWaYgns0+wc4yH0P0raTVXScWxHVff6u/NBjP9YGBMCH7Zllt3nd2cAA
         AhpFP4DQvF4UAddinuf58jeSRTzu6SWMc3IO1dh5bXg9IsBXMkP+WlYmIvzbwdVeBziR
         ySpABf0oT83qtkmdLq2HeGMo118y8a2kFCbnz9pA4kbqpHjXZ+tKSGsuY1eoz4XZgam4
         5UrRcZzK5mzqI0DfE03lOo8tljosi9e8GO9HVwe5BSQv7KvyLq6fxlrcwC/6A/CIA/oJ
         IN/vauZGqIGRI/8ypCjcgWUzFpPdyts216RV6zq3/viUH4SoJ6O8bE0vJgZAYxscO+GH
         5Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258902; x=1741863702;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUmhA52lOTzcBIdzLko57ah+XkpjqclccDf+VaS1kCw=;
        b=vmDG342HkUABAu+rHjo9IBqW8lJ8JTS0fuZDlD9oHSenSOVeOImbf2Ku+P25uYLqka
         JkyrCJfD81fsMvBoAQHYQTtkA4+kJazFKednvtVDxm1BcK3wJlGnR985pfLLORH9mANu
         o0bnF7Hs4MN8C9Xgz/GIYkcFcI1/yAY8C8tsX0PAqK/7U/58mm44bPsmFqZqrlVE/bhe
         gyMyL1+3k5cJ721Ywto8rEGEABPLmfgff9ckMSTB8faOa3V0jmnQs6nsVtpEAoA4KN54
         LSC908OZfXKDE0S936u4qwq0JwbOBh9Ehgt9SMPfPEZIur0X0PGfGRriqmzYMwJchyJt
         lVGg==
X-Forwarded-Encrypted: i=1; AJvYcCVLx8BZA5o5lgME7owHBD8AX2h5/gZdpAT9DL4Zj1uPLZwsN20opCRmxILdvXk2yMZUw5sw8Urqt2E=@lists.infradead.org
X-Gm-Message-State: AOJu0YybGUG3Vxn+RBwFLCDiBspG3Ub1LYdE1OIht0VUzubsQKpDosPZ
	/z7FyvICb4yQuIWDyqZaveHvmaonx8R2nQW8PBLdPpoqQD7ADB9AihlZDAKR4N4=
X-Gm-Gg: ASbGncuZwtcHQ6pSsJH8sVm1jmzK57nZ28NrMynls+j6lZegPh/9xauPY3LMJAw7p9e
	n/4zmTrV0y/js2X4O7hSnOp8zDTdHgQCskApCUlyc/1gdEC6frXRV31kiJAXUBrT0hXiUf5rEwv
	qHyfL1+kE5lbnt3aLbE2T/kGgtAKlDZvf+5yd6pbUSlXEUn3U6r2uHxT70JuWKhB/WPRKko1vb3
	YkCpkDStG4t4pAwLSoDAuGNg2akRedpk3WD+QxINkz6J8key8wj/2iqCedpD7/5UG11UeSTgjIU
	goi3d4UX/yMO7ZrZTTRQVQleIl6RhfjTW5jQ5FLLU3N1uPwleDkWlQ==
X-Google-Smtp-Source: AGHT+IF2zUnqQR0kmEKiLO0NiKX6jtbed3ednzGKFCGUxppoit2dZ2h9Q+wyUIlwRJrZDv5W8apVbw==
X-Received: by 2002:a17:907:9494:b0:ac1:f002:d840 with SMTP id a640c23a62f3a-ac20da862d9mr798884166b.45.1741258901804;
        Thu, 06 Mar 2025 03:01:41 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239483628sm77607166b.53.2025.03.06.03.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 03:01:41 -0800 (PST)
Message-ID: <bb9f8a80-4662-4ab1-b9ad-6899977c3827@linaro.org>
Date: Thu, 6 Mar 2025 11:01:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250211063028.382169-1-linchengming884@gmail.com>
 <20250211063028.382169-2-linchengming884@gmail.com>
 <e5458a0e-528f-44ec-a0f0-543472ad3b85@linaro.org>
Content-Language: en-US
In-Reply-To: <e5458a0e-528f-44ec-a0f0-543472ad3b85@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030143_586057_562C7177 
X-CRM114-Status: UNSURE (   6.88  )
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



On 2/11/25 7:20 AM, Tudor Ambarus wrote:
> On 2/11/25 6:30 AM, Cheng Ming Lin wrote:
>>  		.fixup_flags = SPI_NOR_4B_OPCODES,
>> +		.fixups = &macronix_qpp4b_fixups,
> For your next patch that'll drop the redundant flash info fields, you
> can drop SPI_NOR_4B_OPCODES as well if these flashes define the 4bait
> sfdp table.

Any plan in doing this, please?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
