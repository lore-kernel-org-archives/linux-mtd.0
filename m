Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFD6CCD183
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 15:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUUd1rXiwWyxy1WQbtxmZ+zW7uM/bP3bZZ1Bdy6UQTQ=; b=CdU6tVd62sjTiG
	PCv9oPqcDjhVHwY4V9Th6TlvHCtn1q+BD5Wx+y0ThaT7lDX+sbBXGxLpHXi2Ny+puPG6/50HVBrSy
	QvldWn2jAO/vQN4UcAOc+eXSVHWJk5T+gkrICO417tV3nseIYZe97AX3+rudkc4OYravT4PYTDPI/
	HtnIn9U+HVYgLq7TsOfgtyp9saLpVHxZVvlrVjaBLsRKvAdzJ5qTBfZXMhVbJ+pC+IdJ2r2CikclX
	juq0pyhGGdD2cPZxqsqfdtYNsr5/8MBHtXhwj9YxcKnv4FrZ0YUHcYfzW6NRW8FnvUANb1GUGRWKe
	H13TXUQFTGAW4hghvlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KiB-0000000Dk5N-0R2J;
	Mon, 13 Oct 2025 15:43:47 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ki8-0000000Dk4c-3UUN
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:43:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso8173816a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 13 Oct 2025 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370223; x=1760975023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ71KTvKAMUC1AACHaaj8OA3SEI5NusmyGpJc9+nnWQ=;
        b=WLo38Wex7lEYgNoy5Nz90Gm6Jq8FQgrgX823hI5Wiu95yX1qgWAtKpL0bEaWyTvJrt
         DcaZoH40jQDxGqqi/LsiptyScHyz1HPbZAoRv1x8fScCNpwO+eOFf+F6xa9NUTXaH5PA
         Av4Hk/0gkg8R7IOZfJXUGDJSMckjq6nR0GPjetviuXOPN20EyE5CTE0XcoAjB0cQWWOl
         B5+I0w9OrWQCZjAxhp+t31GUf3g48uiokYPdaqssm9VEgXXM8acAJSUOjnmBh2Mhwp0h
         53NWkOYw+UiSy11w7IvHY/GI/CKqD/uulpwKvy9LE/9+yD4lyW7zjPkMCOSfl17UCVpZ
         jWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370223; x=1760975023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ71KTvKAMUC1AACHaaj8OA3SEI5NusmyGpJc9+nnWQ=;
        b=FyTF0OWo97k/Z4dQbtbXSwP+Og8We9lmX8NHZGMN0JsdxrIoY+tpJJ1+GJIL43R3yz
         j+Qt12pFMtWFqNl7ZyGgeP6el0o5iHGGDL18xriXL6/Ue/99LBLX3kjpMwNjQZKCmwT4
         qgSp+Dk36AWWUhXEOkkGDrKK1JBpFaHxkA5gWTEptKMRdBx+tl7Y2NN+l6P1nPR6xwg6
         U9FRS9xMVRGLXadFQx4h4er6vqXiMXMmg89FIp6elxqnkBhNhwjOpC8H9fFPuI/+/8cr
         lhSTBvrT/t0azI2wchyG9vvTRgJ46nFtVLo5n1XX9GICtJjM4zNh0LxYyy1LoEN/7KGU
         Cm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbs1Eo5M+MxWeL9rTXLf9OkT3dPYfIqtkhBWbwkoYxw8MJC1379zmPAuDo2hZlzn5L4iY3GuwIs1U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxB2l07yupSjw+aRRCmvj2E0BFqhKFDRLOp+rpeCBKwam/wf7cO
	SE02xH6zDnj3plJdhlhdYZIRng/3gs9P0Qhc14g6RDcFZeyeZv33HGHn
X-Gm-Gg: ASbGncvPc/+ArM0mhzlct0uyiMig8eI2vN9eO89/cPPlQTdd12JppkBaJEdxUmNtWr1
	P5OaieSSjC0kit9O7ki6+5T9m5so5v15srIxbBUVb6Dum4w9uf2Wz8sa5gEbaD+SgMFTF3ZCDTk
	G0S/NW/0vN2vulvQ+YKR5lB+fT+x1elQG70tuhZiNnm53JM9FySlYv6G0YraEHCHjUxnRQ2/dZd
	7uSBggxdp7OA++fOj0MO9SIHbYRN8pwuPJgc1LOXpe44PFQ/p6hoETS+VYlHpjvUSIga2MipA7M
	slh6NDe39BBAa1F/GPW7vaeG8YdbdQqz8pLJ3m/jaOUmrv558xt1oif8T1hhYksW6N3UlIPvGkT
	6YIAe/Kq64TvQtxB1tcxLsjQ8D3hohh40jsa1+mwfmtJw28C+w+qOHIE7nsuUZBaOgGfOHqcd22
	vROb+NdGoOBPGNKevXOWFYcSA=
X-Google-Smtp-Source: AGHT+IG3FRsw4wCBnmi9CngEI7WoVxEvQAt2WNJU3I/XEDcpUDTwP0J77KuXRMbbHoTA+pSwJQSXNw==
X-Received: by 2002:a05:6402:b28:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-639d5c74a9fmr13775050a12.35.1760370222659;
        Mon, 13 Oct 2025 08:43:42 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133f58sm9091983a12.30.2025.10.13.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:43:42 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: h616: add NAND controller
Date: Mon, 13 Oct 2025 17:43:39 +0200
Message-ID: <2800174.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251013152645.1119308-16-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-16-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_084344_883657_66484683 
X-CRM114-Status: GOOD (  14.70  )
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

RG5lIHBvbmVkZWxqZWssIDEzLiBva3RvYmVyIDIwMjUgb2IgMTc6MjY6NDUgU3JlZG5qZWV2cm9w
c2tpIHBvbGV0bmkgxI1hcyBqZSBSaWNoYXJkIEdlbm91ZCBuYXBpc2FsKGEpOgo+IFRoZSBINjE2
IGhhcyBhIE5BTkQgY29udHJvbGxlciBxdWl0ZSBzaW1pbGFyIHRvIHRoZSBBMTAvQTIzIG9uZXMs
IGJ1dAo+IHdpdGggc29tZSByZWdpc3RlciBkaWZmZXJlbmNlcywgbW9yZSBjbG9ja3MgKGZvciBF
Q0MgYW5kIE1CVVMpLCBtb3JlIEVDQwo+IHN0cmVuZ3Rocywgc28gdGhpcyByZXF1aXJlcyBhIG5l
dyBjb21wYXRpYmxlIHN0cmluZy4KPiAKPiBBZGQgdGhlIE5BTkQgY29udHJvbGxlciBub2RlIGFu
ZCBwaW5zIGluIHRoZSBkZXZpY2UgdHJlZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdl
bm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIC4uLi9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRzaSB8IDUxICsrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2MTYuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNjE2LmR0c2kKPiBpbmRleCBjZWVkYWU5ZTM5OWIu
LmJiNTNjNmM2MzgzNiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW41MGktaDYxNi5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIv
c3VuNTBpLWg2MTYuZHRzaQo+IEBAIC0zMDQsNiArMzA0LDQyIEBAIG1tYzJfcGluczogbW1jMi1w
aW5zIHsKPiAgCQkJCWJpYXMtcHVsbC11cDsKPiAgCQkJfTsKPiAgCj4gKwkJCS9vbWl0LWlmLW5v
LXJlZi8KPiArCQkJbmFuZF9waW5zOiBuYW5kLXBpbnMgewo+ICsJCQkJcGlucyA9ICJQQzAiLCAi
UEMxIiwgIlBDMiIsICJQQzUiLCAiUEM4IiwgIlBDOSIsCj4gKwkJCQkgICAgICAgIlBDMTAiLCAi
UEMxMSIsICJQQzEyIiwgIlBDMTMiLCAiUEMxNCIsCj4gKwkJCQkgICAgICAgIlBDMTUiLCAiUEMx
NiI7Cj4gKwkJCQlmdW5jdGlvbiA9ICJuYW5kMCI7Cj4gKwkJCX07Cj4gKwo+ICsJCQkvb21pdC1p
Zi1uby1yZWYvCj4gKwkJCW5hbmRfY3MwX3BpbjogbmFuZC1jczAtcGluIHsKPiArCQkJCXBpbnMg
PSAiUEM0IjsKPiArCQkJCWZ1bmN0aW9uID0gIm5hbmQwIjsKPiArCQkJCWJpYXMtcHVsbC11cDsK
PiArCQkJfTsKPiArCj4gKwkJCS9vbWl0LWlmLW5vLXJlZi8KPiArCQkJbmFuZF9jczFfcGluOiBu
YW5kLWNzMS1waW4gewo+ICsJCQkJcGlucyA9ICJQQzMiOwo+ICsJCQkJZnVuY3Rpb24gPSAibmFu
ZDAiOwo+ICsJCQkJYmlhcy1wdWxsLXVwOwo+ICsJCQl9Owo+ICsKPiArCQkJL29taXQtaWYtbm8t
cmVmLwo+ICsJCQluYW5kX3JiMF9waW46IG5hbmQtcmIwLXBpbiB7Cj4gKwkJCQlwaW5zID0gIlBD
NiI7Cj4gKwkJCQlmdW5jdGlvbiA9ICJuYW5kMCI7Cj4gKwkJCQliaWFzLXB1bGwtdXA7Cj4gKwkJ
CX07Cj4gKwo+ICsJCQkvb21pdC1pZi1uby1yZWYvCj4gKwkJCW5hbmRfcmIxX3BpbjogbmFuZC1y
YjEtcGluIHsKPiArCQkJCXBpbnMgPSAiUEM3IjsKPiArCQkJCWZ1bmN0aW9uID0gIm5hbmQwIjsK
PiArCQkJCWJpYXMtcHVsbC11cDsKPiArCQkJfTsKPiArCj4gIAkJCS9vbWl0LWlmLW5vLXJlZi8K
PiAgCQkJc3BpMF9waW5zOiBzcGkwLXBpbnMgewo+ICAJCQkJcGlucyA9ICJQQzAiLCAiUEMyIiwg
IlBDNCI7Cj4gQEAgLTM3Nyw2ICs0MTMsMjEgQEAgaW9tbXU6IGlvbW11QDMwZjAwMDAgewo+ICAJ
CQkjaW9tbXUtY2VsbHMgPSA8MT47Cj4gIAkJfTsKPiAgCj4gKwkJbmZjOiBuYW5kLWNvbnRyb2xs
ZXJANDAxMTAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1oNjE2LW5h
bmQtY29udHJvbGxlciI7Cj4gKwkJCXJlZyA9IDwweDA0MDExMDAwIDB4MTAwMD47Cj4gKwkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQkJY2xvY2tz
ID0gPCZjY3UgQ0xLX0JVU19OQU5EPiwgPCZjY3UgQ0xLX05BTkQwPiwKPiArCQkJCTwmY2N1IENM
S19OQU5EMT4sIDwmY2N1IENMS19NQlVTX05BTkQ+Owo+ICsJCQljbG9jay1uYW1lcyA9ICJhaGIi
LCAibW9kIiwgImVjYyIsICJtYnVzIjsKPiArCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19OQU5E
PjsKPiArCQkJcmVzZXQtbmFtZXMgPSAiYWhiIjsKPiArCQkJZG1hcyA9IDwmZG1hIDEwPjsKPiAr
CQkJZG1hLW5hbWVzID0gInJ4dHgiOwo+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkJ
I3NpemUtY2VsbHMgPSA8MD47Cj4gKwkJfTsKClNvcnJ5LCBmb3Jnb3QgdG8gbWVudGlvbi4gVGhp
cyBzaG91bGQgYmUgbWFya2VkIGFzIGRpc2FibGVkLCBhcyBtb3N0IG9mCnRoZSBib2FyZHMgZG9u
J3QgaGF2ZSBOQU5EIGNvbm5lY3RlZC4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+ICsKPiAgCQlt
bWMwOiBtbWNANDAyMDAwMCB7Cj4gIAkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1o
NjE2LW1tYyIsCj4gIAkJCQkgICAgICJhbGx3aW5uZXIsc3VuNTBpLWExMDAtbW1jIjsKPiAKCgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
