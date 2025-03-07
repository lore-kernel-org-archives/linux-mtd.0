Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA188C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1n240yF6KPAzrV9em9dWvWZNuHyCUbXC9rLshWxbIg=; b=UYuovRRU9FHoFy
	4Ldx3of2vuJy9RSLgHqPcujwv9hmI50f0WF/vpibSVdhpJC4s2TV/54LBi9AI2tFVfBXYZr08+SH4
	IVd45bDIC9jY+qxDHbPQKQHJHq8zkIs6gvWXUNoVj9KbyFBqMLWlPW95pYEEXRhCe42emLm56CJK+
	l1Y4V9z8J+md3cCaeefU3PymjFGiJ/kU2JHFEc1vutof5GQBposI1hd/U7sFS/qQNH8XeowYoBDpD
	aHZ0/0DLP8fVPBOHVJtNDeWoXdUJWUMuSrkSZMS9UH61vL6HUDacB0FaboelSX+yGoRSPhbdq5LIx
	qid/v1JxsYmRJ1P20hMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZyz-0000000ElaS-3bhR;
	Fri, 07 Mar 2025 15:51:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZsp-0000000EkKF-0C41
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:45:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so3087902a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 07:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741362305; x=1741967105; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hp4/XGgKZswfxI/E1Yn63TPUSKhNdGFmWc8P6pHuvt0=;
        b=IcKZHiuPgXfQPBaPy4UG0dLRxII5b/tI9lDGW8Y05tmCeYkbhANO8uDD0pe/Qr6uVs
         RkhCQdgDkThynnLfPTWcDKUQBOFr2uQivb5LCGnlQfO4feZ6S9DjNr1ihBx69BkvOnWd
         3xVblYgm3/3wrW6TJEzWzK+Jhe7ytDxF8OUrrwrJzGiuqxIe0ZkqpBWFCPm9FB3bB1a8
         HtYdMY9uRaeybI6HxYx5CU7xrbuG7M+B8MpYe8/3pcpSB1iMCEuwGrDKsGCTAAB1OUbn
         1H+2AItYyNQeanLCkHIYPNlPsilfYxS6XoAJASUf55irSwiH/eKOG8vARuyyum5+I8S6
         U19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362305; x=1741967105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hp4/XGgKZswfxI/E1Yn63TPUSKhNdGFmWc8P6pHuvt0=;
        b=R6tKxBMhB7nzvIeRWjxSL1DvSTo5Jws88cFzemaRZ2x8z6O3STAcYpluhJ01Ekum8+
         J/6FRlebJBBCJM1HKLxXKWdOCVz1QL0dtX4wzF1zq5/KRHBaobUVj4a/23Zdn9YkBFV9
         smgzxwPZBEzdxFB4Oo7r9LfL4T3VMF3L4UXVtqFmvCAeRF4brFnVKz4GNc0juML54/h0
         H+MYg9X2BReU3plyngVxTOd0Za/0X7PbZ2bZyyj9+rhhWlXJ+av9+k/aIPPAuHnQK1Rr
         146Wu0u+y3ag1M8HQgsK40qVpX2MjGQ0kFgQqjEatRberIX9oJJgi5FTcsLYgUrddUET
         8gIA==
X-Forwarded-Encrypted: i=1; AJvYcCW43meG2w5WQEBMEM1GRqT2oHlPhWMXqvLWI+Fjdx/B3z+AZqv7lFS6L0F6RLCs6JM6oGEeNCLFGSg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYv9WEyCZXcazLbcDjJ5OXKTTZ2vWM4hTv5ev0uVyeYJ838bOQ
	5uKxddX2fdroXqvPLj9Z7NGv+Vu9AzJaM3hI8mjlZ4pvJ5tbRHvFIaZhpiIfRXQ=
X-Gm-Gg: ASbGncvrHZiYqTQU8lONdp9Yp79915C5xZprwYPV5rPzJpQzbbXTbrFiZUxiQLcvcpC
	GbjlwYzphb44vijve9KyEJvToMYnyQ4IluPfdM6r0oV2ye9YbyK50Hqua/Ycu8tq/bdk4LY65Zh
	tN9GlmcbwGQk8rkeRi2JvmmG1phYuwhkjQuguJPepPTOBqkHL8+6Wydhd0k/mh2JCW7KDG50SkZ
	tS3zurup7k3PAeUbiuC2z5MaenX57VF0WYSWSYKkm5eHOMa7PotSSFZfkUESKcjZfctPj1Vvzbt
	UBQjEBsGSo2s9NUYZXlRKrGbhE4TuxPPue5pUw0o3jMkkBCLAfKZ7Q==
X-Google-Smtp-Source: AGHT+IFhcx40CPO1Woyn59Kqm0r2csraaIahBrV7s8VQeWauV/MiFRVCSNDB3Hhg8+uOA1i1mGPpqw==
X-Received: by 2002:a17:906:e4a:b0:ac2:64e1:c75a with SMTP id a640c23a62f3a-ac264e1d275mr166691966b.45.1741362305221;
        Fri, 07 Mar 2025 07:45:05 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438955sm296532966b.19.2025.03.07.07.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 07:45:04 -0800 (PST)
Message-ID: <48453010-560b-4985-a6e5-31401da24d62@linaro.org>
Date: Fri, 7 Mar 2025 15:45:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] mtd: spinand: Use more specific naming for the
 erase op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-5-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-5-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074507_106686_94D30AEB 
X-CRM114-Status: UNSURE (   5.10  )
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


If there's no chip erase for SPI NANDs, then keeping the name as it was
makes more sense to me.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
