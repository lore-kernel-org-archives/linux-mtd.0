Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D00C3ABC3
	for <linux-mtd@archiver.kernel.org>; Tue, 13 May 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgygfT4TzdZG9XRr3Pvnl17Tlf4HsTVSxlPKct9XBJE=; b=Wt7CxRmP0DzwRTqYGJexLqa+sv
	p+E+nB0z1/6KuIya+ecSnbO2Pg8zZ+b2ELoivwb4FEh4O/fRyXFoyM1GEtzBjgnfHU0NcJRug5pj6
	G+3sqAFKsBp0A3RGWzwdbbpbc9v5NufiScsP5Pyh5Oi7me53f2SCIfPg3+2VMD1pxZn7ZDY9exbqB
	4BlBR0EYM0yjJ87Ad/qzr5L/VzzgB8jgx55kFfpMCRwMjIA3r+b7utPn0/ywxpuq1RGXR7SdvVvRZ
	Kdl/hp+3rzMh8V/yr96gGM/3j0I1VCtGbek1kXDKIV0Awr9Oyn5HTPqv8CRM/QRurvJei80ND/xl6
	vIq6Df1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElKn-0000000Bo7s-0Kct;
	Tue, 13 May 2025 08:49:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElDb-0000000BmvE-3Hyw
	for linux-mtd@lists.infradead.org;
	Tue, 13 May 2025 08:42:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so34051635e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 13 May 2025 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747125749; x=1747730549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wzHz9DECU94KJHpo2O9vOv0duOq/pnIjhQ7L/t0oY44=;
        b=CXx8ibWVG7c99TDB7ZY4pmjSZzE1L82M2BXGPzEbK9YAOYqaOkb+v/9X5dgBawH505
         Gbn6iWbLWpyI9vBRQXOJmFrM6LXZuhxp+TlhLT4GFuqcjetGHuQ00fmXnZbpoDQkMtBt
         /ekfijtC9Q6l0ThcwO2JcmPV3halcp9M/4Nv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125749; x=1747730549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzHz9DECU94KJHpo2O9vOv0duOq/pnIjhQ7L/t0oY44=;
        b=stVLvRFl9rgRANLhfJImVDxM3W0erMlFdMBzL4h2FN78qrMw0HiNis3YhceCy1L+Ko
         7+qeGJVlaX2Ro4oIvG5X0Su0qaWeVgsqxxlgqbqIoJ33ur74cfvqWKR3Aq9feAsHw1tV
         d/5SobkNwOL/DG4r4bjgRYuInx6ZYmTb2RCNcwPgh371Nm1mQceXE8wyMWTxbLn7eAX6
         r7B1EDvCGmCOiffrCGZfJSfU9lFsfT++oTWVSVnUJ84gZ5MNTTVMw/aGQ4MWmWHSIswM
         MN4CIE2qatp7QNceesQ4W7GSAtTZ+f3LC7mr11Rg59/NUCM9r1WyMRIM4DNCzC9XFcpm
         P1iw==
X-Forwarded-Encrypted: i=1; AJvYcCXHFqRVNkydfrEJFMpQA97zTyfT/tgRiW8JtnEsUdbQtswMIU9mxVFtSXwRaZD8Fy3wr5XCirunWDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAtM2n15eLAS7YWZLtQ7HB71xTl/nV6KQB0snfT9vfaVMaX1ip
	xNKPlYhM8UoaDiRG3uYOSaHYSqrfqOn99fbJXhvNNesbkpWyxGSkl9DvioyNZQ==
X-Gm-Gg: ASbGnctSgjSb+d8PRtURxKZTjecVjNFp3IykZ/Js+OZtoK3YE0m6xTGYRJV7sFrKvOz
	7lDqWmEYMLgGzfon+/Altun0Spgy68bC+/iV4E09KozHFp1CTSMTzQLWpUwQX2rZq3g12QfHup4
	YhfGw15kEBlRg+ToZ5BIUvntzcj8eUexyXFW0jRZixakdEzhSKVSdktCGxUbztLZ+vMqE6FP6LD
	KBdgObvdcQpO5IC57DbBQ29Eu76HwD42l5z9WlE6xHYIjYl0fA37v/wYyo0RI7tZUZu+vHwQgsf
	ucKqOqw0b1d74o/gfTBVBG3M3g85KnVNRrrRHmpFwqPGrg1JHS8u7WpOYCANJwhf6GI9toS17H+
	rT1mi67cSnX1tuOXs8gA=
X-Google-Smtp-Source: AGHT+IFpMHp3eJ6oVXY0sfYrcBjX6a0dUoFB7Qs8f5zRrkb+2+HmDWaW2govqel8yZBeFl5OXIGDsw==
X-Received: by 2002:a7b:c014:0:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-442ead23ffbmr16266215e9.16.1747125749308;
        Tue, 13 May 2025 01:42:29 -0700 (PDT)
Received: from [10.229.41.178] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm158253275e9.13.2025.05.13.01.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:42:25 -0700 (PDT)
Message-ID: <a563cb0b-0bc5-4dbe-b570-4d45c1b14641@broadcom.com>
Date: Tue, 13 May 2025 10:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 linux-mtd@lists.infradead.org, dregan@broadcom.com,
 miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com,
 rafal@milecki.pl, computersforpeace@gmail.com, kamal.dasu@broadcom.com,
 dan.beygelman@broadcom.com, william.zhang@broadcom.com,
 frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com,
 jaimeliao.tw@gmail.com, kilobyte@angband.pl, jonas.gorski@gmail.com,
 dgcbueu@gmail.com
References: <20250513080151.565359-1-noltari@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250513080151.565359-1-noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_014232_026158_3288366B 
X-CRM114-Status: GOOD (  23.18  )
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

CgpPbiA1LzEzLzIwMjUgMTA6MDEgQU0sIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyB3cm90ZToK
PiBDb21taXQgM2M4MjYwY2U3NjYzICgibXRkOiByYXduYW5kOiBicmNtbmFuZDogZXhlY19vcCBp
bXBsZW1lbnRhdGlvbiIpCj4gcmVtb3ZlZCBsZWdhY3kgaW50ZXJmYWNlIGZ1bmN0aW9ucywgYnJl
YWtpbmcgPCB2NS4wIGNvbnRyb2xsZXJzIHN1cHBvcnQuCj4gSW4gb3JkZXIgdG8gZml4IG9sZGVy
IGNvbnRyb2xsZXJzIHdlIG5lZWQgdG8gYWRkIGFuIGFsdGVybmF0aXZlIGV4ZWNfb3AKPiBpbXBs
ZW1lbnRhdGlvbiB3aGljaCBkb2Vzbid0IHJlbHkgb24gbG93IGxldmVsIHJlZ2lzdGVycy4KPiAK
PiBGaXhlczogM2M4MjYwY2U3NjYzICgibXRkOiByYXduYW5kOiBicmNtbmFuZDogZXhlY19vcCBp
bXBsZW1lbnRhdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFz
IDxub2x0YXJpQGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMgfCAxNjAgKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxNTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiAgIHYyOiBtdWx0
aXBsZSBpbXByb3ZlbWVudHM6Cj4gICAgLSBVc2UgcHJvcGVyIG5hdGl2ZSBjb21tYW5kcyBmb3Ig
Y2hlY2tzLgo+ICAgIC0gRml4IE5BTkRfQ01EX1BBUkFNL05BTkRfQ01EX1JORE9VVCBhZGRyIGNh
bGN1bGF0aW9uLgo+ICAgIC0gUmVtb3ZlIGhvc3QtPmxhc3RfYWRkciB1c2FnZS4KPiAgICAtIFJl
bW92ZSBzZWN0b3Jfc2l6ZV8xayBzaW5jZSBpdCBvbmx5IGFwcGxpZXMgdG8gdjUuMCsgY29udHJv
bGxlcnMuCj4gICAgLSBSZW1vdmUgYnJjbW5hbmRfd3Agc2luY2UgaXQgZG9lc24ndCBleGlzdCBm
b3IgPCB2NS4wIGNvbnRyb2xsZXJzLgo+ICAgIC0gVXNlIGogaW5zdGVhZCBvZiBpIGZvciBmbGFz
aF9jYWNoZSBsb29wLgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+IGluZGV4IDE3ZjZkOTcyM2RmOS4uMmI1MTlkZmNhYzVkIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gQEAgLTI0OTAsMTQgKzI0OTAsMTYzIEBAIHN0
YXRpYyBpbnQgYnJjbW5hbmRfb3BfaXNfcmVzZXQoY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9u
ICpvcCkKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IGJyY21uYW5kX2V4
ZWNfaW5zdHJ1Y3Rpb25zKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gKwkJCQkgICAgICBjb25z
dCBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gKm9wKQo+ICt7Cj4gKwlzdHJ1Y3QgYnJjbW5hbmRfaG9z
dCAqaG9zdCA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsKPiArCXVuc2lnbmVkIGlu
dCBpOwo+ICsJaW50IHJldCA9IDA7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG9wLT5uaW5zdHJz
OyBpKyspIHsKPiArCQlyZXQgPSBicmNtbmFuZF9leGVjX2luc3RyKGhvc3QsIGksIG9wKTsKPiAr
CQlpZiAocmV0KQo+ICsJCQlicmVhazsKPiArCX0KPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW50IGJyY21uYW5kX2V4ZWNfaW5zdHJ1Y3Rpb25zX2xlZ2FjeShzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLAo+ICsJCQkJCSAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9u
ICpvcCkKPiArewo+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsK
PiArCXN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0ID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRh
KGNoaXApOwo+ICsJc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwgPSBob3N0LT5jdHJs
Owo+ICsJY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyOwo+ICsJdW5zaWduZWQgaW50
IGksIGo7Cj4gKwlpbnQgY21kID0gQ01EX05VTEwsIGxhc3RfY21kID0gQ01EX05VTEw7Cj4gKwlp
bnQgcmV0ID0gMDsKPiArCXU2NCBsYXN0X2FkZHI7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG9w
LT5uaW5zdHJzOyBpKyspIHsKPiArCQlpbnN0ciA9ICZvcC0+aW5zdHJzW2ldOwo+ICsKPiArCQlp
ZiAoaW5zdHItPnR5cGUgPT0gTkFORF9PUF9DTURfSU5TVFIpIHsKPiArCQkJaWYgKGluc3RyLT5j
dHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9SRUFESUQpIHsKPiArCQkJCWNtZCA9IENNRF9ERVZJ
Q0VfSURfUkVBRDsKPiArCQkJfSBlbHNlIGlmIChpbnN0ci0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFO
RF9DTURfUkVBRE9PQikgewo+ICsJCQkJY21kID0gQ01EX1NQQVJFX0FSRUFfUkVBRDsKPiArCQkJ
fSBlbHNlIGlmIChpbnN0ci0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfRVJBU0UxKSB7Cj4g
KwkJCQljbWQgPSBDTURfQkxPQ0tfRVJBU0U7Cj4gKwkJCX0gZWxzZSBpZiAoaW5zdHItPmN0eC5j
bWQub3Bjb2RlID09IE5BTkRfQ01EX0VSQVNFMikgewo+ICsJCQkJY21kID0gQ01EX05VTEw7Cj4g
KwkJCX0gZWxzZSBpZiAoaW5zdHItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1BBUkFNKSB7
Cj4gKwkJCQljbWQgPSBDTURfUEFSQU1FVEVSX1JFQUQ7Cj4gKwkJCX0gZWxzZSBpZiAoaW5zdHIt
PmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1JORE9VVCkgewo+ICsJCQkJY21kID0gQ01EX1BB
UkFNRVRFUl9DSEFOR0VfQ09MOwo+ICsJCQl9IGVsc2UgaWYgKGluc3RyLT5jdHguY21kLm9wY29k
ZSA9PSBOQU5EX0NNRF9STkRPVVRTVEFSVCkgewo+ICsJCQkJY21kID0gQ01EX05VTEw7Cj4gKwkJ
CX0gZWxzZSB7Cj4gKwkJCQlkZXZfZXJyKGN0cmwtPmRldiwgInVuc3VwcG9ydGVkIGNtZD0lZFxu
IiwKPiArCQkJCQlpbnN0ci0+Y3R4LmNtZC5vcGNvZGUpOwo+ICsJCQkJcmV0ID0gLUVPUE5PVFNV
UFA7Cj4gKwkJCQlicmVhazsKPiArCQkJfQoKWW91IGNvdWxkIHByb2JhYmx5IHVzZSBhbiBhc3Nv
Y2lhdGl2ZSBhcnJheSBoZXJlIHRvIGxpbWl0IHRoZSBhbW91bnQgb2YgCmxpbmVzPwoKW3NuaXBd
Cgo+IC0JZm9yIChpID0gMDsgaSA8IG9wLT5uaW5zdHJzOyBpKyspIHsKPiAtCQlyZXQgPSBicmNt
bmFuZF9leGVjX2luc3RyKGhvc3QsIGksIG9wKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlicmVhazsK
PiAtCX0KPiArCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHg1MDApCj4gKwkJYnJjbW5hbmRf
ZXhlY19pbnN0cnVjdGlvbnMoY2hpcCwgb3ApOwo+ICsJZWxzZQo+ICsJCWJyY21uYW5kX2V4ZWNf
aW5zdHJ1Y3Rpb25zX2xlZ2FjeShjaGlwLCBvcCk7CgpJIHdvdWxkIGFkZCBhIG5ldyBmdW5jdGlv
biBwb2ludGVyIG1lbWJlciB0byBicmNtbmFuZF9jb250cm9sbGVyIGluIApvcmRlciB0byBhdm9p
ZCBkb2luZyB0aGlzIHRlc3QgZXZlcnkgdGltZSB3ZSBjYWxsIGJyY21uYW5kX2V4ZWNfb3AoKS4K
ClRoYW5rcyBmb3IgZG9pbmcgdGhpcyB3b3JrIQotLSAKRmxvcmlhbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
