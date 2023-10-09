Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5FCE95A8D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iux1GHB54hVfuFCKSGSoykATCYK4HOo0c7TKySygZUg=; b=cmhlimrIGsNzSh
	G/58M3uj4TEZ3UIktl5W55TYHMiieEMsnusSgxSKcMp5DGl/p+xJq0W1wdOrO3fi6qwXNWvyquxi7
	QjR2pxGWof9mxnEqAaUBa3Wwr9oVWG1vAdSYciV8yOYkP7h77aJNFcNEayeGgdzqPMYrmKEzQquBR
	q0cw798fO5jukDcKdlbkvMNl2qdISMt+Hwfs+unuCZNm26GG651XpsQbCr7f8GnvgNfio3qhuBj85
	SroDdOtGSfVYvnHu7Yol3wWWKGLi2b+tROlEzaKZ8HrdiZRoBOa5ZEQLDsie2CFH+uTiC87BSJS5n
	HH3q26Y49O4uUk7TVmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpjQX-009ofi-0K;
	Mon, 09 Oct 2023 06:07:37 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpjQT-009odw-1d
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 06:07:35 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50435a9f800so5329707e87.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Oct 2023 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696831648; x=1697436448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jQSsnNPGoLekEfxryi1OyAWP3eYL96XguQhMUQ9k7M=;
        b=JYA4TcXqotlJd27MFr4oQ60Me/bzRKFVD0ALnMVFdwdp38NGmbXJLWsytw/Gsj3t0p
         h57OJtzc+d/TSU5jNntSs6/wEKEM8Mwz8/FDb3GBA0xgjWJwM0e5+b/2vtEH/WpMrHb4
         yfxnDqSdE5IUTqYd6ypiBKaw3XAJMmiMUs2eu9YxqRKqxnL4wM+JotqTqOB6nDCshAwQ
         af/wOt7hkaC4d/6++y+iWoKA/DfomFGJwSQJBL8RaLxgDywEa7wD9JfcO2GSxOLj/Ma9
         BKEJSNnaftj9myI7oZB5bN/AIscSShSvMsocqf3V+6Jy+tUt9QZo2FYNwe6c5fxErffs
         HFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831648; x=1697436448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jQSsnNPGoLekEfxryi1OyAWP3eYL96XguQhMUQ9k7M=;
        b=RbclT41H9nKmFtUNB+uvLVt1m16OYEdY4oxSVur6aDphTYVoa0g91vb0pAupQU4FTh
         Maza66Lj4LqwhM588lmLuauv9mwNkEfKcg9kGHdVzkvKBmbVHttBccfLlFD6EvfLWSP3
         NQD16RhcQIKlkNY0Qch9lh4m8mYVFlLaij5mljE2LzhWme14r+fSTsm2wP1zWMNRiluN
         VBNlcBW/c88GTfjIxEKgai8I64PTPhr0bvjH5G65ZKb0oJ+1dC/ne9hJ2LpiZ7BSK31e
         p1r+3DdLtksZqi6QRu5njqp0aNNbnkTY0W8OhnpGzZgng3dtg7n/vMrsh07Na4I2alRE
         c/DA==
X-Gm-Message-State: AOJu0Yw/dkOszXpHax7pxLGw/1nJehM9wWLcVvbJguaAN1fJGnCYoxPb
	0OqZ1B8dLHgRlhVZGGXlhdzx7g==
X-Google-Smtp-Source: AGHT+IEulPl8s4i0M+Zi/sk4AKTnELItj8JoKzhnPWHm3t1wWVYt1qRXTgDtyk/ECIXgf4klmNEzyw==
X-Received: by 2002:a19:5050:0:b0:503:31dc:7d64 with SMTP id z16-20020a195050000000b0050331dc7d64mr12856772lfj.21.1696831645881;
        Sun, 08 Oct 2023 23:07:25 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b00405d9a950a2sm12438473wmh.28.2023.10.08.23.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 23:07:25 -0700 (PDT)
Message-ID: <19a98e1d-583b-4057-bdbe-895402ab4143@linaro.org>
Date: Mon, 9 Oct 2023 07:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] mtd: Convert to platform remove callback returning
 void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-kbuild@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, Joern Engel
 <joern@lazybastard.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Yangtao Li <frank.li@vivo.com>,
 Rob Herring <robh@kernel.org>, Li Zetao <lizetao1@huawei.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Hui Tang <tanghui20@huawei.com>, Zheng Yongjun <zhengyongjun3@huawei.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-arm-kernel@lists.infradead.org
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_230733_566996_827AB560 
X-CRM114-Status: GOOD (  13.22  )
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

CgpPbiAxMC84LzIzIDIxOjAxLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiB0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJz
L210ZCB0byB1c2UgdGhlCj4gLnJlbW92ZV9uZXcoKSBjYWxsYmFjay4gQ29tcGFyZWQgdG8gdGhl
IHRyYWRpdGlvbmFsIC5yZW1vdmUoKSBjYWxsYmFjawo+IC5yZW1vdmVfbmV3KCkgcmV0dXJucyBu
byB2YWx1ZS4gVGhpcyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZSB0aGUgZHJpdmVyCj4gY29yZSBk
b2Vzbid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJlbW92ZS4gVGhlIG9u
bHkgZWZmZWN0Cj4gb2YgYSBub24temVybyByZXR1cm4gdmFsdWUgaW4gLnJlbW92ZSgpIGlzIHRo
YXQgdGhlIGRyaXZlciBjb3JlIGVtaXRzIGEKPiB3YXJuaW5nLiBUaGUgZGV2aWNlIGlzIHJlbW92
ZWQgYW55aG93IGFuZCBhbiBlYXJseSByZXR1cm4gZnJvbSAucmVtb3ZlKCkKPiB1c3VhbGx5IHlp
ZWxkcyByZXNvdXJjZSBsZWFrcyBhbmQvb3IgdXNlLWFmdGVyLWZyZWUgYnVncy4KPiAKPiBBbGwg
ZHJpdmVycyB0b3VjaGVkIGhlcmUgcmV0dXJuZWQgemVybyB1bmNvbmRpdGlvbmFsbHkgaW4gdGhl
aXIgcmVtb3ZlCj4gY2FsbGJhY2ssIHNvIHRoZXkgY291bGQgYWxsIGJlIGNvbnZlcnRlZCB0cml2
aWFsbHkgdG8gLnJlbW92ZV9uZXcoKS4KPiAKPiBTZWUgY29tbWl0IDVjNWE3NjgwZTY3YiAoInBs
YXRmb3JtOiBQcm92aWRlIGEgcmVtb3ZlIGNhbGxiYWNrIHRoYXQKPiByZXR1cm5zIG5vIHZhbHVl
IikgZm9yIGFuIGV4dGVuZGVkIGV4cGxhbmF0aW9uIGFuZCB0aGUgZXZlbnR1YWwgZ29hbC4KPiAK
CkFja2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
