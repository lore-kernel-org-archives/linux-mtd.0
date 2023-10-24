Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE1C07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTdSOqRbEALm/Z1D0jl4Bb8+xZ2btT8jUAT8hGPoOeU=; b=dDLYnLgvaPsoyb
	V1mC5FGeMm3fufRZNbWDdmHK6/QtvEnsKXNy2ykv56ucUKcofJy8mtRwo69YTUvD9Fk0M5H0hBRFe
	xaaMvSbrYEeiEDIwPeZFonzOEgSeDs/G+1l2oYI1uu2rMKvidGu4qW6Gb+HUDCMGAublf+2obvdg5
	FbDDxIJsxZ1sXAOwWthhcxCY6g1zPZKn6lmr0r3kmwp1IxbxumcqiagujCoO/aVQH6PaC75Qy7td4
	hvHNHSfrwU/4XfGxcAHpZ/5yCW24q/QBL+2i0RfxuJTXZK82eQZbOSeUhi12fBEBoZFJjdWHV/y/J
	2wUceueLaJX2a1VGjF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIKM-00A7OE-0a;
	Tue, 24 Oct 2023 14:24:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIKG-00A7MJ-2I
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 14:24:12 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9c603e235d1so693493966b.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698157412; x=1698762212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdmHt/ja+mIXKglJbIAMs6C4cvNiuMa3FwG1etYC1Fo=;
        b=Jq766r/8Qk83aF+ix2QlBle/zqYeEklutanCHaHjXuvrvtNcdPU9iDi3ljX17mTQsz
         He6mffCKsQaI+xBpfOzKP8U0JxlEtxhUO8nb/tNruC2R/iVoeRSg4Smow8nyTHp3ryIX
         iWgC/xpoGV04js4rDa7YNL5MXnLgC+Kxbhuv6TML8j3tqwtuXH+XyYEj2gAjNTey+l6/
         dJecin2ImnqUMuLFXe5dy3iEpMCpMWjmt9HRX6Y9OtwZtPvvx0/kxKc1FVsM2Ltng/CK
         s0NzjOjRCG747UnCpzg7f71cPzb2E2/WQq5SF73FSvWI0kIS6+PATYJzxrKesvHrBx4A
         Q2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157412; x=1698762212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdmHt/ja+mIXKglJbIAMs6C4cvNiuMa3FwG1etYC1Fo=;
        b=o0zQFSg+yZQN3nhe+5s4tZZ6Bw7fz7f677f4vA2Gu7N4IhV/F3GWbKZ2sDWJPBFRKW
         dGj7V6Y4eo52deit8uxPxjKIkbz28ptAFnzHwnyidths4cFTKYltmsu5ADFg+BMSoDOL
         lfJf6jLiuzQ+ATJ2NVL/xWjv0YiifvWKJAzeLutP+5vVmdkM1OOoQNGiJoXJOA0bVzaO
         sdf/pHdJy4aCsM0BcsQ2PY9PCbA9nv7L3oiEv4S+oUHJWPMndBLLXNdBA6EId8LCxnW3
         YaFrXN/S19FJIaU6jGf199rPGF3/OIOHmw213yINmWty8LHN6zFpgS8WDmjUWJGpKI5X
         ZWYw==
X-Gm-Message-State: AOJu0YzTj2iHyHcSau7lQf4EGww93RuyrLXnFs6DULc3ZNHX1i7jPimi
	MzQlsycztubyjqvZwZGhNuPS3FAzfok7kg9Cxig=
X-Google-Smtp-Source: AGHT+IE6kEQ+mzWAWDEwQr7zN68XAET71MMFBioNpdtP+eTlDTC869NqgBcW1ksNbVZOWRS+7YDBBw==
X-Received: by 2002:a17:907:60d4:b0:9ba:1d08:ad43 with SMTP id hv20-20020a17090760d400b009ba1d08ad43mr12519730ejc.70.1698157412599;
        Tue, 24 Oct 2023 07:23:32 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id j12-20020a170906050c00b009c764341f74sm8359012eja.71.2023.10.24.07.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 07:23:32 -0700 (PDT)
Message-ID: <f97fe22b-5a95-4f8f-93c4-37ef9ad01a4c@linaro.org>
Date: Tue, 24 Oct 2023 15:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Fabio Estevam <festevam@gmail.com>
Cc: michael@walle.cc, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@denx.de>
References: <20231023213800.2599704-1-festevam@gmail.com>
 <eb48c493-f585-4acf-83cd-e2466e1a4d40@linaro.org>
 <CAOMZO5Cy2BGoMVpPzeAAJ8j-QN-fEDmShZE+bbsSqon1Xf6DvA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAOMZO5Cy2BGoMVpPzeAAJ8j-QN-fEDmShZE+bbsSqon1Xf6DvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_072408_772154_0E5E112B 
X-CRM114-Status: GOOD (  11.64  )
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

CgpPbiAxMC8yNC8yMyAxNDo1NywgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBUdWRvciwKPiAK
SGkhCgo+IE9uIFR1ZSwgT2N0IDI0LCAyMDIzIGF0IDM6MDHigK9BTSBUdWRvciBBbWJhcnVzIDx0
dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgo+IAo+PiBJIHNlZSB0aGlzIGlzIGEgZHVh
bCBkaWUgZGV2aWNlLiBEbyBib3RoIGRpZXMgd29yayBjb3JyZWN0bHkgd2l0aCB0aGUKPj4gY3Vy
cmVudCBzb2Z0d2FyZT8KPiAKPiBJIGFtIHJ1bm5pbmcgbGludXgtbmV4dCAgMjAyMzEwMjMuIElz
IHRoZXJlIGEgd2F5IHRvIGV4ZXJjaXNlIGJvdGgKPiBkaWVzIHRvIGNvbmZpcm0/Cj4gCgp5ZXMs
IGp1c3QgZG8gc29tZSB3cml0ZS1lcmFzZS12ZXJpZnktZXJhc2UgdGhlbiBhCndyaXRlLXJlYWQt
YmFjay1jb21wYXJlIHRlc3RzIGF0IG9mZnNldHMgZnJvbSBib3RoIGRpZXMuIFlvdSBtYXkgZG8g
YQpjcm9zcyBkaWUgdGVzdCBpZiB5b3Ugd2FudCB0b28uIFlvdSBjYW4gdXNlIG10ZF91dGlscyBm
b3IgdGhhdCwgc2VlIGFuCmV4YW1wbGUgYXQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW10ZC8yMDIzMDkyNjEzMTY1NS41MTIyNC0xLW5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNvbS8K
CmNoZWVycywKdGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
