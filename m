Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF19EC54E58
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OQZbs+FRsawDkWpDdYhipkfhgsm4GexSBlCsOIJh1E=; b=bzyfzJ+kE+dnhj
	quhu4Q9zaMyptmz9/MLnnFgmzis9D9aHlSBr4Ss2S3G2Ouem4Qg399h9fAKKBddqYAJHUN/YEyvR9
	Ae3gKJGfNx0o/0EAcSIiIuB6PyyhJFwemopUuU5X/y943bomSxsv05IaQjBdtmgkgaxhNy+SHuYl9
	Fv+uGaJ3sjUXU+unNf52qRxq2Ac43GwUt8D1Ev4BkgBAf5vJXbnwSCApLnoaJE3/1ENQfjxB2tKHC
	IgYagmL/OCkxE8VHJJDlxzK9Nn3FBQOXjuwDyh2tMoT5ZCPelukCOxgJkdZ004v+3/+l0ZrsPmtDq
	mTmuSbvTlUwuf2sxrYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl60U-000000004a0-0aUl;
	Fri, 15 Mar 2024 11:45:50 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl60R-000000004XT-1DsN
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 11:45:48 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d46c44dcc0so25236041fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2024 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710503143; x=1711107943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytxwYT73KPkuac+IALOznX/62UDC2uDlXZyOBGPDf8I=;
        b=gMlXbMkRlxIMIKGHACUWFQYh9xG3HMeGlXCUSdDASPK3ncykd5C9mGQhx6KoiFxi0t
         IcT6mzJZf5/blGV7Cx3r1KJVr8YfaroMQJOcsiyTNFFd5A9Qj+H1dAQt/L4P1ltObAWq
         sNX4QcrmJ797K8aGSj34+P4tqcx6bRB1uo9jZifpJLBamr2CyYTjscezTSJ3c/PVn10z
         a7f4F8chvU+1TGw+hq9FR3MVQoFwxRAneZ0Elg1AH55JB6W7t+Mt3OrzhwNAfjX5pLKu
         I8grVMIpvUiGVpt4IQGSz4p+thPOAjUp6xkfPLMX9tDWyPO9JGfVcaY7h9U0lMuRzPuR
         CrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710503143; x=1711107943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytxwYT73KPkuac+IALOznX/62UDC2uDlXZyOBGPDf8I=;
        b=Xm7XGHtxrriThLlI15doxODgJ+2YL/jxjPXJ7526CTB3xcV4fCmzHdZA3FIw0WBXYK
         DNX6dRZ7IAEvFrcLAOImRtx7IHLeXr8QQaXoygL1zVhGQgPB0SIj4YV8diFHIB7uCuDw
         2VMQpZJz14xn6nAbSayVSofql9ZoH6At/OzkP2tqnF5w4THKP/E/MnQeyFsVw0wkw2j2
         2wt7pQOqu48UdV3IwKUg1KehfAgJ3fN5pBH8hCVq0ovfueq/QF8IHnmEmtymdGvpkKU4
         B/JIv5j29jaqA879CMQ056Dyjk94a8WdL9k9XIvYGFi+oLjvOf6lXLPMMkJ8TP4mTSsL
         x+lw==
X-Forwarded-Encrypted: i=1; AJvYcCVduqKHPehbJ7mGDc3uQAb24Cifs6+Q32IQPi4bH07iMUQRCSYlhPKB5sYwsEkGqGT+BC623oqpADtsxvgp3GpC+1nKzSCr763hI3/dPw==
X-Gm-Message-State: AOJu0Yyhuru2M442gvvuaKMlsbcHJfZT/MgTDgT+gXTbSoIE02X/0fVI
	k3SckK9xUcBAfVDbncn+IpUeMaKI8zVQk3cPYrNBKn+4OEnZI/Yr
X-Google-Smtp-Source: AGHT+IGLbeqJChmscbnuZSlweMy9pO7O1KZ31yDNJk9aeEILZnKxh06ZqNMVVTbfRZJwXRjffmDvrw==
X-Received: by 2002:a2e:88d6:0:b0:2d4:22d1:d96c with SMTP id a22-20020a2e88d6000000b002d422d1d96cmr2956550ljk.25.1710503142885;
        Fri, 15 Mar 2024 04:45:42 -0700 (PDT)
Received: from [172.25.56.57] ([212.22.67.162])
        by smtp.gmail.com with ESMTPSA id e26-20020a2e819a000000b002d236114533sm485536ljg.75.2024.03.15.04.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 04:45:42 -0700 (PDT)
Message-ID: <529774b9-20be-485d-b218-2452ce536770@gmail.com>
Date: Fri, 15 Mar 2024 14:45:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: hynix: fixed typo
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Palacios <hector.palacios@digi.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
 <20240315122314.10c88c2e@xps-13>
Content-Language: en-US
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
In-Reply-To: <20240315122314.10c88c2e@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_044547_416393_5A15D000 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi,

On 15.03.2024 14:23, Miquel Raynal wrote:
> Isn't it done like that on purpose? Read-retry is not a mandatory
> feature.

Works it as designed? I'm not sure about it.
I wouldn't rule it out, but it's a little weird that the 
hynix_nand_rr_init() function
is used as if it can return an error but never returns.

Probably  checking  of value returned from hynix_nand_rr_init()
should be removed in hynix_nand_init()

Best regards, Max





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
