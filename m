Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8F2D2E9D6
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LW6ZQXAZ++ONIypvbMwQn5JPicwJHtlg88ZDCbm8NAM=; b=iZjHG1PX6CQ/H5
	tE/s1nkf4+ysN2trnkN916APuUCQ7VN/1OxOfPjn27c36KrdR2qFKg6HNmar6+k0rn0yb5xyPJ30E
	RJ+nMVNJzmP5or1VyetIx4GHoNKlQUi7fRqyhNAke3v1ueKTFE6/Tx7xDJjZ0/+eTsbO8GNIYS7/s
	mq05atErXvPYQ8tfHC6uO+kZoo08btwDxA2l+3ucgsYhS28EvwQhcIadpQmJkRJJwZLt8Do8LRCs3
	rETdH25jdTA5C7RIGLj6x5TKBL4Y93zhR43huZa/5PwG7HFTklnHXSEB2wWfSPP96hsQaZD0Dwe+M
	WQA4GzhaIKyWqa5Ka4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARyx-0000000HM4K-0gRI;
	Mon, 11 Nov 2024 10:49:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARyu-0000000HM3Y-1CDF
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 10:49:17 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a99cc265e0aso691874366b.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 02:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731322154; x=1731926954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdFblD4zcwXp9mblURQJJ7/5taoThoLu2/KoJcxRfJU=;
        b=qCMeCQoP23fAsj1IEdFnRbLyv0ZqllFWAUTrGYbxYAEa1L706yGccbvTdKm1qifQUO
         QbjPMICqBsam0jnPmebCRGw/TyVSruSEDTGBZWEnN1Woh75HmaC5VyWnDe9XAZQliPIu
         I+eji1dmyFUpRK26lxLvXYGX31LTlzvl0aE3Gpw53tq57c99rZLuK+P+tmqTdzfD/Sjp
         wcUIrPkfdO3/6C/zrKMRPL6AqE0WDRbEbkjS0AHBtfdk5YSgQlIZi09H/PlAf4lZVwlz
         xfeFeDHCeU0DjPtLUaa9YtsHPgfMoUHY3+aM5Unf7KcqYkwCt8fmJmRxCC3UC5J5/Vt0
         dNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322154; x=1731926954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdFblD4zcwXp9mblURQJJ7/5taoThoLu2/KoJcxRfJU=;
        b=N0TLpLIeWYZjd2VvIysPJlqcS71RR7iHS8r1l+g09wWUzgrBABGqiOsFnGkLTdc/OL
         W7Kct0R0W2NbI0+ZAckSkeeWpvVyBmHa/Cr61cit4onwDXTr3jdwL6C+o00+5+0S66O5
         XoO0xfq2qFaFH/bgy4nszMas25M+38Yiqvh4gq7K7oyMVaUyuEdeRpBa/LQPhibUYNbG
         ePRmmiiEisksADiQVoyGd/VXDicQqW7sCCzf0QIht7LwMvLFkwHJU6sLZTZSXP+7davv
         YmCXGAFAHmAv8hOUdEA5GRS0xgzDhadn2HFMY47bjbm4f7agja38HSnEWAemX56D/Gmz
         3zLw==
X-Forwarded-Encrypted: i=1; AJvYcCUxMFvuWHy34SuOUhfRbvu1MxrI5fbeBuK1uo1QDE9Z3i9Zg5XYSVkO+4qNnpH7iSlI5tPvRt/tQME=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTgr7MC76YUQiDHNt2UF64yjsfSl4OOaFQsQawGtII2QVD+E2P
	7w42J/BTRTWzPse3inMtuCAh/mqVvZmGUz++S1BjQuPXskNxgYo1ADggumkDvdg=
X-Google-Smtp-Source: AGHT+IGdTAR4XnUV2y3iX0KvJMO8K8H04XHHottJjjNCZCgVGBwvq5CKqAzNGyXzy4bIb/BLVC3+sw==
X-Received: by 2002:a17:907:daa:b0:a9a:2afc:e4cd with SMTP id a640c23a62f3a-a9eefff1798mr1135492666b.44.1731322154409;
        Mon, 11 Nov 2024 02:49:14 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176a6sm577324666b.16.2024.11.11.02.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 02:49:13 -0800 (PST)
Message-ID: <0525af7c-f9a9-4dfc-9fed-97efc438b2b8@linaro.org>
Date: Mon, 11 Nov 2024 10:49:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: remove mx25u25635f from parts
 list to enable SFDP
To: Parth Pancholi <parth105105@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241105105844.257676-1-parth105105@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241105105844.257676-1-parth105105@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_024916_361289_E348E078 
X-CRM114-Status: UNSURE (   9.82  )
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



On 11/5/24 10:58 AM, Parth Pancholi wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
> 
> The Macronix mx25u25635f flash device supports SFDP initialization.
> This commit removes the specific mx25u25635f entry (NOR ID 0xc22539),
> along with its size and flags, from the NOR parts list. By removing
> this entry, both mx25u25635f and mx25u25645g (which share the same
> NOR ID) will utilize the generic flash driver configuration.
> 
> This change allows both devices (mx25u25635f and mx25u25645g) to
> leverage SFDP-defined parameters, enabling dual and quad read
> operations without the need for manual adjustment of no_sfdp_flags.

I'm fine with this. We may re-add an entry when BP is used or if someone
reports there's a flash with this ID that doesn't support SFDP, which
has a reasonable amount of probability for macronix flashes, but I'm ok
taking the risk and fixing it afterwards if reported.

Waiting a bit more to get Michael's and Pratyush's opinions on this too.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
