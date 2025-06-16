Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E912C71159
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVnDyq0V5Rq1iTHh4P7jDl89cn7A9gwKa191MGMFPTE=; b=ipbiq06zESRydn
	NaKJukqj8XIlTUkgGa1ErvOgaeo9HPMqATrbEaHVNM1pUzM/PdARbAVBwT2bf2UlQl0Ml8lI5DVuZ
	8gzEYEIsEuLDI8NuWJwqnkZb5JTLuMeijeNPBcruAEfxObNwY0yo9pIdjmaHphaxJlK6gRjxGp47l
	7uxeRr+feEHmCgQS/6gWOdadSsmQwki/XhRGpQcQEsPRxfIuxVZznc6XPfSA/qI7hZ0XqVkUIoyU9
	dKNPtZo8XOzP4HNT9t/D1vkp62DUsUG2aMUJXbI7nfZ+3OrkS0oIRfXqD2K7COvtC4FBTiYJDXbOg
	//PV1Y0iOTdTd9/vcSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaY-00000005EbI-15cL;
	Mon, 16 Jun 2025 18:29:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRD1x-000000053Rj-40lO
	for linux-mtd@lists.infradead.org;
	Mon, 16 Jun 2025 16:49:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234c5b57557so44776585ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2025 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750092597; x=1750697397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uCD9CURbqz8tYupxfeyjT1CRQY7rRES833C1tnLViQk=;
        b=QQYtMjQkMdcKBGWWQUCgo3Dt2SvEQyvSqKLVjc4uVs/YAbhJsEnQYaPl1NvGpbcg65
         9anF2n3Y0fSb2pyFYAXZaYni+RKL+fnDL/IAMvW7btcQErThUTDI3iiUqLaE1ZJ2rOI3
         X+5XHtSGgQXuVgWI7hKcT15fRy/1vluhOZ/cbsc3bk135yAZGH74umM4igEWlM5TpPzl
         cKSnCoA2guwwMkzmiB2elfFpQfFuto2l3jgvI88BiXaXizK44Ky5hdVhl/+p9wHLJU0i
         OJWfSb6nBtTc8MsTiGN8M4s0QdoU5tbhOe0DjRDSnD/g/WFEA9osoNfcTCqBpL1aLHiF
         T+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092597; x=1750697397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCD9CURbqz8tYupxfeyjT1CRQY7rRES833C1tnLViQk=;
        b=gjvBIWgkMJU+HsYivZN/Web3ahsshDZaquEs/DwfYe35kTx4+xiM2kBhXAlh8LuSCK
         DLypJxuOfHyz3nW6+GVrMxcQxYgGeJp1SgZN3cEnPcOcpNOxdDu8Cb+g1xEAAQJq6F5J
         KfEik1QtpHlDt5JxVYFSbKi1ONKh8FKYPNBzbnkgm6O6HVqKAgs0GFQrBsGZDfUyE4mi
         wR1WG19F1mbcpDwYSSml8+WQ3PksmOOykN9ol9EEIvoDisb34DOi0ymQoAGM8uH9eTti
         rbqBd8HsG+6HUkYQpBAKx8We6kjSAaPcnRWL+MgrmReuBZjcKW+QJJuIDZtI6cb+u6b4
         s+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWFJTMd7fAFNYbEbWNan7sheO5i1FXBu4qhLcn3xUg5Fp76q63xyMMaOO2xgz7Nifn6/F9DoBHOsQw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSGnkIcxVmRmH3twxBzYMoylMwgubrRK+qGCbI6hTm6X6Wjsba
	63d1EWRox5FYNxV0yl8CeeMNdgm63Lb6vohnIt3bJoOuAbSKYl6Ct7lu
X-Gm-Gg: ASbGncsFuTnYczCPs4jXwI/aH0FzxwKDvI2AySjlLNsZiViii9lLHz4xM7YiXr7+qJB
	Oe+Stz6UF/7n8kT0K6tV5SGoCBE5FubF+MCc7DomQRVe5V6w2AVY7ZFji4cfRumhCrwrwUuiSav
	7dhFQO+pw0vgxzJvl7vHjkufkk2Nf0Vnw9e/2xNHPbXm5kAjXXVWVExUld2PFzur38Id35WvARw
	fFrGVSGrjPvGz8VlNeUD7N/myoY1z9DdezoKc/+M5c0XGxNL5Sn7prHIz9ySHooYaeCOxN6+cIS
	fxET2NJ3LmT/xx59G894DW4kV5ZLzRbHreJxh0UcBHzgamZkniyoLaNWzQmgh1xQyrsluxIn8H4
	+E559n7rzMzvNaoDJ6xZ114FvQ/lX1jusCynLgdZDyONC0A==
X-Google-Smtp-Source: AGHT+IFNNOE2ebdNzANh4YQCNF6OPckqRQeDm3Tmb9xcA90LJlhFqyV8nipooKPCVXH2qnwFb359fA==
X-Received: by 2002:a17:902:ce8d:b0:235:2ac3:51f2 with SMTP id d9443c01a7336-2366b3e3b48mr143791215ad.45.1750092597027;
        Mon, 16 Jun 2025 09:49:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bf61sm63490265ad.22.2025.06.16.09.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:49:56 -0700 (PDT)
Message-ID: <deb4072f-f6b3-4d7c-b19b-109570183aa9@roeck-us.net>
Date: Mon, 16 Jun 2025 09:49:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mtd: core: always create master device"
To: Richard Weinberger <richard@nod.at>, Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush <pratyush@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>
References: <20250613180722.1268159-1-miquel.raynal@bootlin.com>
 <b16dbc82976e2454afb6aa53ea97bd0f@kernel.org>
 <1923752382.134392168.1750062114160.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <1923752382.134392168.1750062114160.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_094957_994895_3BB984C4 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNi8xNi8yNSAwMToyMSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVyc3By
w7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiTWljaGFlbCBXYWxsZSIgPG13YWxsZUBrZXJu
ZWwub3JnPgo+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCAwYWE3YjM5MGZjNDBhODcxMjY3YTIzMjhi
YmJlZmNhOGIzN2FkMzA3Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+Cj4+IFNob3VsZCB0aGlzIGhhdmUgYSBGaXhlcyB0
YWc/Cj4gCj4gU2luY2Ugd2UncmUgaW4gdGhlIHNhbWUgcmVsZWFzZSBjeWNsZSBubyBiYWNrLXBv
cnRpbmcgaXMgbmVlZGVkLgo+IAoKVGhpcyBhcHBsaWVzIHRvIFN0YWJsZTogdGFncywgYnV0IG5v
dCB0byBGaXhlczouIEEgcGF0Y2ggZml4aW5nIGEKcHJldmlvdXMgcGF0Y2ggZnJvbSB0aGUgc2Ft
ZSByZWxlYXNlIGN5Y2xlIHNob3VsZCBzdGlsbCBiZSB0YWdnZWQKd2l0aCBGaXhlczouCgpHdWVu
dGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
