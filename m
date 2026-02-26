Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2071BFCE096
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeteEEmDOoe5m4TQfX/9iRnPDhku4b804hxy+dNif4I=; b=YDynDR0B3kpb5Y
	s8cusoMnGcjgAEEwoydrdyVU9+qP+l8pzTdo2WhQPZRekN2UCCPxvCQeko+CjYCZTX1hQFeI2ZoH4
	aL+D0lLUeNLqlRYz44rbYWMYiv4xahl78agG/yHVTrUqibxixU6FMZstJuWQXciIlKmiLQ8yzqW+t
	IBca3/Cq3IIEeNJ/Booyl7b29OxytmEmybrk6DiP6ImAUpy6k/VN0HCBWFW/M2CeXSCsCUu9ON0wJ
	i6QBOSXMNmZ6Z5Io2y0uZZqZ9Dr3BwwQD9ExeCoNvIXI8Szvp3KFGiDpUHwyvnjFE8wHtl9lsK2em
	rf9xfpZ2IopzcV5LfxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcaW-00000006Ma7-31EH;
	Thu, 26 Feb 2026 14:43:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcaT-00000006MZj-3kQp
	for linux-mtd@lists.infradead.org;
	Thu, 26 Feb 2026 14:43:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2adff872068so4027965ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 Feb 2026 06:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117013; x=1772721813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNyZAD1lUvoy0PIMpeGvYZGlF4UXnE0RK0cG+GRs+u0=;
        b=Dn5Yo32DhlREw2yg0m/9gyOXpjOkvnO9+pOhwcDoGCVuLWW1oEjXjIOjGGulkwchuX
         aBnaiLsfUyZiR0YTbpzYosNkj+wEabL2YKoxTl3lEXHBCVnG3MAbreak95EwJBVt8mxh
         cwzk8vkE92j42YZqBdfn0qsF3vQ9qPORGLF5bTGNe8rR3R+165JXvTmFdfEMDYHJAFMN
         fVMbCDbcsteLJXK812hI2ogwxw5sNRhyIKvEIXKoF5JQjk1yeVezOLk4A4wNDKfEtIM3
         M5TA4UzXPCP83So6o4Kjz54EbIHXq+QhD5DjrJa+P/GfUJ1SjLETb8plJ/MDrMQyl4JX
         99MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117013; x=1772721813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNyZAD1lUvoy0PIMpeGvYZGlF4UXnE0RK0cG+GRs+u0=;
        b=SW/lETUnz2q4ZHhJWIS008zDl862RD7AO7xA7u6lYx0VxLCJanX2W081Od3ApaOmRU
         3jANTmz1R8aml0szLILoQxylAxdwh0GQoqcV2nLEckS5fjIkwgY/f0BU9qP3LmeA8inL
         vuYvsQZvz/VGeoLaMjN7cQ+I63FSlkTboC5qDBCGr8JNN5mTa43oev2/aeBKT5f7+yKg
         1DoAM16QUwcx3EE58yZ7VVzWhndEvjzIXvwyuWq4ocFhPlpDn6nKKdZ/6xAjC8dCpYZM
         N4N5n5mVDBkMTp5R9RQODRxTmgt4XBO8Gonm9zSbSfjQhNqfwFIGYCKYUhDZyI9zY0zS
         Y1nA==
X-Forwarded-Encrypted: i=1; AJvYcCVRd9M+T6eePffa/OvYKg3zMYRK05E72Zih8rLpoP+8fFp1Dvcpfe1c37IuXc/alEJ7VXNcTfWHKQg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp3mhSwauIgeomprSKRKwn6reA5DmjUfmA1lPDm5Bgt+f4wf3e
	Ok6CSS81OT3+9wncmVRA6IfsG4eWEYZGV/QIkrPLwtYUQBchcJRnrZEQ
X-Gm-Gg: ATEYQzzpaCoV06Qp4SZEqmmHAK+W+0DP9HeRYODdWKJsh6KpOK4byQyMNYUr5wK/NEO
	ccJZ50lBEnbLeZyjKO6K1tUzpCE91IX5oeZHbDAt8MAVCTvUNIu2IK7X/foTKidHlE8Z1ekLyFt
	KRoDPBxg55w4LAZ3jwzkfnQBksPYMBeuYcQyC+JCQkEjX31q205D3SCMurRL5PVb/zz2vAGMdtN
	XqzQssrYwK+S1ZFNIY92nIahybVGP0Mfh0HPGXkHmb2w/MQZZLjeEIT9md+uvEnoqFibkF2AQBr
	s34VgrVhMDD5ifiwv9fv0NzWWHhr4znXeCvEDlZniqQ86VHfQez+k3AkM8cSmbgQgrofW1jTDgJ
	wggrhWQfVP0JmbBr2bKq1KY6GJne/SuQyLP4psKXBQCDL7gxru1TAUBnn9SnQ0a3x2BjETYeIT6
	jgdvB7v7bzDqjL8SQGiQJoU0sUAWVBK0W6JEFqaxpMxLTKigzvDuYfb7Vn5FzeKDaV/XJKbs4kS
	N94HvBNdw4=
X-Received: by 2002:a17:903:19eb:b0:2ad:99bb:3129 with SMTP id d9443c01a7336-2ade9a9fa34mr46530255ad.50.1772117012913;
        Thu, 26 Feb 2026 06:43:32 -0800 (PST)
Received: from ?IPV6:2401:4900:892e:c831:d8f3:2665:7530:4ce8? ([2401:4900:892e:c831:d8f3:2665:7530:4ce8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b53f4sm27503775ad.18.2026.02.26.06.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:43:32 -0800 (PST)
Message-ID: <f425cbb2-e9b5-41c9-9ca5-7613c547adee@gmail.com>
Date: Thu, 26 Feb 2026 20:13:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT schema
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
 <CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
 <CAL_JsqKSpsj1BQB1q_s1+j1FT+XLORgWRijMTNc4wTawKDZxQw@mail.gmail.com>
 <87fr6opz2x.fsf@bootlin.com>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <87fr6opz2x.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_064333_933530_5F709F03 
X-CRM114-Status: GOOD (  11.15  )
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

Ck9uIDI1LTAyLTIwMjYgMjE6NTgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8gUm9iLAo+
Cj4+Pj4gKyAgICBmbGFzaEBmYzAwMDAwMCB7Cj4+Pj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJz
dCxzcGVhcjYwMC1zbWkiOwo+Pj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+Pj4+
ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+Pj4+ICsgICAgICAgIHJlZyA9IDwweGZjMDAw
MDAwIDB4MTAwMD47Cj4+Pj4gKyAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmdmljMT47Cj4+
Pj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDwxMj47Cj4+Pj4gKyAgICAgICAgY2xvY2stcmF0ZSA9
IDw1MDAwMDAwMD47ICAvKiA1MCBNSHogKi8KPj4+PiArCj4+Pj4gKyAgICAgICAgZmxhc2hAZjgw
MDAwMDAgewo+Pj4gVGhpcyBpcyBub3cgYSB3YXJuaW5nIGluIGxpbnV4LW5leHQ6Cj4+IE5vdyB0
aGlzIGlzIGEgd2FybmluZyBpbiB2Ny4wLXJjMS4gTWlxdWVsLCBwbGVhc2UgcmV2ZXJ0IHRoaXMg
YXMgdGhlcmUKPj4gaGFzIGJlZW4gbm8gcmVzcG9uc2UuCj4gQWtoaWxhIHN0YXlpbmcgc2lsZW50
LCBsZXQncyB0cnkgdG8gaGVscCB3aXRoIHRoZSBZQU1MIGNvbnZlcnNpb24gZWZmb3J0Ogo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvMjAyNjAyMjUtcGVyc28tZml4
LXNwZWFyNjAwLXNtaS15YW1sLXYxLTAtOGVmM2QyMDVhYjNhQGJvb3RsaW4uY29tL1QvI205MDhi
ZjU5NTI3ODQ3Mjg1YzA0NDdkZDAzNzliM2M4OGNmZDcxODU3CgoKSGkgTWlxdWVsLCBpIGhhdmUg
c2VudCBhIHYyIHBhdGNoIHllc3RlcmRheSBqdXN0IGEgZmV3IG1pbnV0ZXMgYmVmb3JlCnlvdSBz
ZW50IGEgcGF0Y2ggc2VyaWVzLgpUaGFuayB5b3UgZm9yIHJlc29sdmluZyB0aGUgaXNzdWUuCgo+
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCi0tIApCZXN0IFJlZ2FyZHMsCkFraGlsYS4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
