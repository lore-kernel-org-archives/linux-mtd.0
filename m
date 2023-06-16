Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2B8EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVi9NZghW+EiBXHSna8mNYKDbr0OKmWbIn8/molXHlg=; b=DNzCJP97/P8hI6
	9WkDnAVsNVMRreG7Ak2x5FWU+O5VpObMVJHm6yzIcIk+mJPPbF6bsrDqIuVjG3+/e0wOot++v7hWH
	NujCbxiNQZMqlokHmGxbyIiacjW6l81kncsnsmHhbU+Yikmxd/x5gEmL7cdh3CGZLNI4xG742krrp
	prWShAxonUWw5DKkxCD8KsdeWRc5UW5YVEjO9aw4kDp5qHMH1H0Xdnt2YM/fJ0V4iuFfdLJNg3aDH
	ui7RwXRruSsLNtKzqvWbzqyS7lf8ACSmoYuAm2XP8nj1sE3AWi6rWN0GbxzH9GUHXoVwqs3HyQ4YP
	NjeSZ+bGrQkTg2ZeKGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4cM-00HFOA-25;
	Fri, 16 Jun 2023 08:15:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4cJ-00HFN8-1g
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 08:15:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-982a1b92d55so61556766b.0
        for <linux-mtd@lists.infradead.org>; Fri, 16 Jun 2023 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686903334; x=1689495334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MReGSBx2uByIi2fo/tJwMA37xAAYbHkch5+QA0BSAc=;
        b=w1+P6WxDkkOtvrHR+bpoYcNqd69PX0LLN5AS/xARvhLia9RhcR+sNpsl8jkJBNCzJ8
         n8CdR55HJ5B/bv/43K1+gpAoSxG+4C+pNQLAxRmkikQvsinyqD2Y5LggdTiSgyhvuUKc
         umWhq3YKvgzMfRG8ptLvPOn2AnRqx84s+6L3HOW2GXZDWhPjIQlUTvbizrXXgC6NYNAS
         q5FGE5AqJQzMsOfnDu8N7nFdiXSbZg1/oR6bza1jW7I2W+Zji5LCGFYqlD3vxnRW8kEh
         igB/6Xctzszxt675mjtm62JPafLCE/qtI9D3B32bR5BCDhhAVynMzE5snZh0RUDlsQpo
         ACww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686903334; x=1689495334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MReGSBx2uByIi2fo/tJwMA37xAAYbHkch5+QA0BSAc=;
        b=CQap9WfGMtFlFC2poZdNG2yIMrCdWFtoGeQcKnFMz8mKwFh2u0Pue4lcuyWlGt4Ty6
         kYgwsxnzzAZk+eQf2hNsAXwiNDWGb6GRqov4PhrQHHJMVjqIZDqGPY1Sia4/28TOZwOo
         8R83xgXWulQZbGHq8vqM/7lE+bKr4VDzKMTLsYYNor8daQtPzk49MhN7Ax9bsYJeVi8M
         83Tqoz/PlVl8LvHun7XrbCddDk0UWWDY1bfYZRB18BSG39Q9F6PTMN+pUAK1N9KTs1CG
         CXmoIdLXSUFJysvHbv5TdkXKulqlyLsISjhVKc+ckPqw6tIxVFUwiT2P/UjH7sUP+Kf9
         bp/w==
X-Gm-Message-State: AC+VfDzU02SU1bpGw/fLAbEZ7NfISfGA5LnVtuhDMBS1xYrVWRFwRBoj
	QZaW+ByQcrPTtcrhbuG14esmcg==
X-Google-Smtp-Source: ACHHUZ7K3IUgFGVoNdenbD2CwL3R5l4B/kpNp36xbvmraCQBKM4RYo6seANHgU1Ju9wQH1QYDQbeTw==
X-Received: by 2002:a17:907:7245:b0:982:a454:6d24 with SMTP id ds5-20020a170907724500b00982a4546d24mr1224781ejc.74.1686903333855;
        Fri, 16 Jun 2023 01:15:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r4-20020a170906a20400b00982c0ac984asm1418708ejy.176.2023.06.16.01.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 01:15:33 -0700 (PDT)
Message-ID: <781c1db2-ecca-901a-4e11-7f7c68cf744d@linaro.org>
Date: Fri, 16 Jun 2023 10:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Vadym Kochan <vadym.kochan@plvision.eu>
References: <20230615040447.3484564-1-chris.packham@alliedtelesis.co.nz>
 <20230615040447.3484564-4-chris.packham@alliedtelesis.co.nz>
 <f16e742f-e6f2-9761-e70d-e0e7cadcba4a@linaro.org>
 <1863cd53-9846-def2-ee5f-f4a51160ed8d@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1863cd53-9846-def2-ee5f-f4a51160ed8d@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_011535_567806_FDC688CB 
X-CRM114-Status: GOOD (  13.32  )
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

T24gMTUvMDYvMjAyMyAyMzowNiwgQ2hyaXMgUGFja2hhbSB3cm90ZToKPj4KPj4+ICsKPj4+ICtw
cm9wZXJ0aWVzOgo+Pj4gKyAgY29tcGF0aWJsZToKPj4+ICsgICAgb25lT2Y6Cj4+PiArICAgICAg
LSBpdGVtczoKPj4+ICsgICAgICAgICAgLSBjb25zdDogbWFydmVsbCxhcm1hZGEtOGstbmFuZC1j
b250cm9sbGVyCj4+PiArICAgICAgICAgIC0gY29uc3Q6IG1hcnZlbGwsYXJtYWRhMzcwLW5hbmQt
Y29udHJvbGxlcgo+Pj4gKyAgICAgIC0gZW51bToKPj4+ICsgICAgICAgICAgLSBtYXJ2ZWxsLGFy
bWFkYS04ay1uYW5kLWNvbnRyb2xsZXIKPj4gVGhpcyBpcyB3cm9uZy4gOGsgY2Fubm90IGJlIGJv
dGg6IGNvbXBhdGlibGUgYW5kIG5vdCBjb21wYXRpYmxlIHdpdGgKPj4gMzcwLiBJdCdzIG5vdCBz
b21lb25lJ3MgY2F0IHRvIGJlIGluIGJvdGggc3RhdGVzIGF0IHRoZSBzYW1lIHRpbWUuLi4KPiAK
PiBUaGUgY29ycmVjdCBzdGF0ZSAoSU1ITywgTWlxdWVsIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25n
KSBpcyBgY29tcGF0aWJsZSAKPiA9ICJtYXJ2ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRyb2xsZXIi
O2DCoCBhcyB0aGVyZSBhcmUgc29tZSA4SyBzcGVjaWZpYyAKPiByZXF1aXJlbWVudHMgdGhhdCBh
cmVuJ3QgcHJlc2VudCBvbiB0aGUgMzcwIChzcGVjaWZpY2FsbHkgdGhlIAo+IHN5c3RlbS1jb250
cm9sbGVyIGFuZCB0aGUgMm5kIGNsb2NrKS4gCgpQcmVzZW5jZSBvZiBzcGVjaWZpYyByZXF1aXJl
bWVudHMgZG9lcyBub3QgaW52YWxpZGF0ZSBjb21wYXRpYmlsaXR5LiBUd28KZGV2aWNlcyBhcmUg
Y29tcGF0aWJsZSBpZiB0aGUgOGsgY2FuIGJpbmQgYW5kIHdvcmsgd2l0aCAzNzAgY29tcGF0aWJs
ZQpzdHJpbmcsIGV2ZW4gaWYgdGhpcyBtZWFucyBzb21lIGxvd2VyIHBlcmZvcm1hbmNlIG9yIGxl
c3MgZmVhdHVyZXMgKGUuZy4Kc3Vic2V0IG9mIGZlYXR1cmVzKS4KCk5vdyB3aGV0aGVyIHRoZXkg
YXJlIHJlYWxseSBjb21wYXRpYmxlIG9yIG5vdCAtIEkgZG9uJ3Qga25vdy4gSSBleHBlY3QKdGhl
IGFuc3dlciBmcm9tIHlvdSAoYXMgcGx1cmFsIHlvdSkuCgo+IFRoZSBvbmx5IHJlYXNvbiBgY29t
cGF0aWJsZSA9IAo+ICJtYXJ2ZWxsLGFybWFkYS04ay1uYW5kLWNvbnRyb2xsZXIiLCAKPiAibWFy
dmVsbCxhcm1hZGEzNzAtbmFuZC1jb250cm9sbGVyIjtgIGlzIHN1cHBvcnRlZCBpcyBiZWNhdXNl
IHRoYXQgaXMgCj4gd2hhdCBpcyBpbiB1c2UgaW4gdGhlIGV4aXN0aW5nIGR0c2VzLgoKRml4IHRo
ZSBEVFMsIHVzZSBoZXJlIHRoZSBjb3JyZWN0IGNvbWJpbmF0aW9uIGFuZCwgaWYgaXQgaXMgYSBk
ZXZpYXRpb24KZnJvbSBvbGQgYmluZGluZywgbWVudGlvbiB0aGlzIGluIGNvbW1pdCBtc2cuCgpC
ZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
