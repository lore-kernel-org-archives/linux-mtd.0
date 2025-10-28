Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324D4CCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+dJ3aSH6N90zn1JaYysdyyOElJz1NM/eKOPEyGKD0g=; b=jRB7zmIBsqntzn
	8Mf7VU8XhPl1sugGbkbbBMewv3pwAt7j/Gp3ztow3/i1PNvQbrwAVEgkwkpi9aRiDuccUKMQB++eM
	NZgtUXSQ5qtb80+cyh69P5xrN3H2k0QSVqbiqQSDwcP816TmEj2/Q6tH/jDPzfYg7+UkcA6vBWeOE
	4YcXCzdvjaKWER/17CzozB3vokJucSmoqcNU+txuYs3W11FDb1csq64c86oImvoanr2O3CYRgmLj9
	yCf9OQmvih4U7DvABqBNkqbOVo1PygHDV3AdSFe6umsGiRnlm4Iz4/7i5MI0Bnnj43kQ3qP9VDy4k
	E+iX//ioRLrs7VToXA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlpb-0000000GCYy-3Wqr;
	Tue, 28 Oct 2025 15:41:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlpY-0000000GCY7-3S9J
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:41:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47112a73785so39398965e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666111; x=1762270911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rER/cj499mXACNSk+6J53aPnWJLF10EoyWFEaSt4oo=;
        b=ZeFURdne/Bf7kxezQ4r4LY20JRI7OzoEYTRFDp+Un2HgW98b2Ijq/4KDpxUwweCybU
         AWT4rRKyZQXFf4LiAMeUyXVEUcJ0VtVfEBgJc3koddVF5/ZbhYmmKpjFxlubL1Tc2cle
         5uOmVvHAUy6wZrc3pPexuHsDIk7BQ0I031WEFJFRnpYSb2Ds6uiL/rAvyNpxgJ87PHrl
         6R0hoA+VThZqk/OhubWvcf8Ji50j59U6H0tdrCJlzni6f8W5r7nYzIq19yOkzQp0hgh6
         +6ny5AlLr7RJN+cgwU5vEqiRx2LrUvdBVk19CcPWUSk1aCYQLDErRvh//A3JnvwmBlsC
         4nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666111; x=1762270911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rER/cj499mXACNSk+6J53aPnWJLF10EoyWFEaSt4oo=;
        b=UOYasoPbrF7B1QJrwLD8u03WUF4TMfqB2KhSOW3D1hU7IYJsdruKDDBtwZ7xGTa5WX
         n/Z5qo5P5ez7wsiibixvahcQM1iKkINPQNOxoBcOOya44bNimmc2iwmdT+vKfT97CMIG
         D9MeOTXD5yx1di5waTWZPwYJk6pGmbrcfFedDYEjHc0RUTblICq1qtDL2y5rK/r6popW
         yde/XbxOln0RhNSlcKKoeEDmw8+m0VMgJNsYPtiVm75UMbTgMwrR4CueCtr3qDOSRcFd
         b85JPsXLHa1rX94wYPp7q0dGw9hhMH0wnkdggMrk1Bh6SnElYIr4xbqDL/GgbhP72wfx
         guww==
X-Forwarded-Encrypted: i=1; AJvYcCU3q1nA0fW4FvWUV+iu3hAfScROaVZq1u45F9Pdsp/5djAM2ykI/53Ox2kIxi2IcOJ7tQ4S1BTsIrM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw53yPZBsDnjC2Z7+a3jjGt5Ezx/u0e34u1bMzGIixrlytrhF0t
	A3RaYPJ07PdNYh9jm+jjSNsRk2w6mND1v4YgEATDDOc//tXpDL2VLZRQ
X-Gm-Gg: ASbGncsum5lme88P0Pkg4L11RjIZhhU/NbHeRI+Uj0j8jvXnJIAYy4MTmyM/ko9iBAt
	ZfhWU4zl0fQ9jLpJu/3Lm1dFo9+ZbZRDiRvbJri16rLSLe21bHb/reOCmjr8rrBFlY/MyT/reJH
	Gsc8bAIWgXyBA9q3NInPQQUX5CyFFvxbuCrYgESzA0jLt95DuxRMagUBFTvdgFH6jWXB3plhCaP
	BjXZEdDzZqTkma00+e2yZapp1goiAVjERUPspG/pOdWVoZd1FtLmy5eCyMB9xWnVV30OMZqLfEP
	29lM23JCi2iDNqkRHqI57unmuJpwL2UOm8Il7ZmIRoMNwiNxpHicnXuS+f57yyQWV42SYGN7iio
	+F8X6bTM+A7FRGb4TESFPBfk2hCfXg+mb18pvuk+K9MIkYIaawdms3RUpbM1V1XCs21/XmN18t8
	Lq8+WcQEfkHsyyu3uP1mZ8lKff/ufA2FGGgue/9vdiWOuqB+i3pIQyBR/QTA==
X-Google-Smtp-Source: AGHT+IHebAO0DlmEIORl7j8QOrOeKPGgCfKBhqbrcWGKnJH7ybidW69hal8hNOSPewAyQmQdvtJXuA==
X-Received: by 2002:a05:600c:1d1e:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-47717def7b5mr42201915e9.2.1761666110720;
        Tue, 28 Oct 2025 08:41:50 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771843eabfsm23130265e9.2.2025.10.28.08.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:41:50 -0700 (PDT)
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
Subject: Re: [PATCH v4 07/16] mtd: rawnand: sunxi: rework pattern found registers
Date: Tue, 28 Oct 2025 16:41:48 +0100
Message-ID: <6097267.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20251028073534.526992-8-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-8-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084152_905831_A70C6823 
X-CRM114-Status: GOOD (  23.77  )
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM1OjAwIFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBPbiBINi9INjE2
LCB0aGUgcmVnaXN0ZXIgRUNDX1BBVF9GT1VORCBpcyBhdCBpdHMgb3duIGFkZHJlc3MsIGFuZCBu
b3QKPiBwYXJ0IG9mIEVDQyBzdGF0dXMgcmVnaXN0ZXIuCj4gU28sIGludHJvZHVjZSB0aGUgcGF0
dGVybiBmb3VuZCByZWdpc3RlciBvZmZzZXQgaW4gc3VueGlfbmZjX2NhcHMsIGFsb25nCj4gd2l0
aCBpdHMgbWFzay4KPiAKPiBBbHNvLCBpbnRyb2R1Y2UgYSBub24gY29tcGlsZS10aW1lIGZpZWxk
X2dldCgpIGJlY2F1c2UgRklFTERfR0VUKCkgYW5kCj4gdTMyX2dldF9iaXRzKCkgZG9uJ3Qgd29y
ayB3aXRoIG5vbiBjb21waWxlLXRpbWUgY29uc3RhbnQuCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL2NvdmVyLjE3NjE1ODg0NjUuZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlCgpVcmxz
IHNob3VsZCB1c2UgTGluazogdGFnIGFuZCBiZSBwbGFjZWQgYXQgdGhlIGJvdHRvbS4KCkNvZGUg
aXRzZWxmIGxvb2tzIGZpbmUuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAKPiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5n
ZW5vdWRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25h
bmQuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1
bnhpX25hbmQuYwo+IGluZGV4IDg5NDk1ZDc4NjI5My4uMDIxMDM0YTc2MWI3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3N1bnhpX25hbmQuYwo+IEBAIC0yOSw2ICsyOSw5IEBACj4gICNpbmNsdWRlIDxs
aW51eC9pb3BvbGwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4gIAo+ICsvKiBub24g
Y29tcGlsZS10aW1lIGZpZWxkIGdldCAqLwo+ICsjZGVmaW5lIGZpZWxkX2dldChfbWFzaywgX3Jl
ZykgKCgoX3JlZykgJiAoX21hc2spKSA+PiAoZmZzKF9tYXNrKSAtIDEpKQo+ICsKPiAgI2RlZmlu
ZSBORkNfUkVHX0NUTAkJMHgwMDAwCj4gICNkZWZpbmUgTkZDX1JFR19TVAkJMHgwMDA0Cj4gICNk
ZWZpbmUgTkZDX1JFR19JTlQJCTB4MDAwOAo+IEBAIC0xNTAsNyArMTUzLDEzIEBACj4gIC8qIGRl
ZmluZSBiaXQgdXNlIGluIE5GQ19FQ0NfU1QgKi8KPiAgI2RlZmluZSBORkNfRUNDX0VSUih4KQkJ
QklUKHgpCj4gICNkZWZpbmUgTkZDX0VDQ19FUlJfTVNLCQlHRU5NQVNLKDE1LCAwKQo+IC0jZGVm
aW5lIE5GQ19FQ0NfUEFUX0ZPVU5EKHgpCUJJVCh4ICsgMTYpCj4gKwo+ICsvKgo+ICsgKiBkZWZp
bmUgYml0IHVzZSBpbiBORkNfUkVHX1BBVF9GT1VORAo+ICsgKiBGb3IgQTEwL0EyMywgTkZDX1JF
R19QQVRfRk9VTkQgPT0gTkZDX0VDQ19TVCByZWdpc3Rlcgo+ICsgKi8KPiArI2RlZmluZSBORkNf
RUNDX1BBVF9GT1VORF9NU0sobmZjKSAobmZjLT5jYXBzLT5wYXRfZm91bmRfbWFzaykKPiArCj4g
ICNkZWZpbmUgTkZDX0VDQ19FUlJfQ05UKGIsIHgpCSgoKHgpID4+ICgoKGIpICUgNCkgKiA4KSkg
JiAweGZmKQo+ICAKPiAgI2RlZmluZSBORkNfREVGQVVMVF9USU1FT1VUX01TCTEwMDAKPiBAQCAt
MjI3LDYgKzIzNiw4IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHN1bnhpX25hbmRfY2hpcCAqdG9f
c3VueGlfbmFuZChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ICAgKiBAcmVnX2lvX2RhdGE6CUkv
TyBkYXRhIHJlZ2lzdGVyCj4gICAqIEByZWdfZWNjX2Vycl9jbnQ6CUVDQyBlcnJvciBjb3VudGVy
IHJlZ2lzdGVyCj4gICAqIEByZWdfdXNlcl9kYXRhOglVc2VyIGRhdGEgcmVnaXN0ZXIKPiArICog
QHJlZ19wYXRfZm91bmQ6CURhdGEgUGF0dGVybiBTdGF0dXMgUmVnaXN0ZXIKPiArICogQHBhdF9m
b3VuZF9tYXNrOglFQ0NfUEFUX0ZPVU5EIG1hc2sgaW4gTkZDX1JFR19QQVRfRk9VTkQgcmVnaXN0
ZXIKPiAgICogQGRtYV9tYXhidXJzdDoJRE1BIG1heGJ1cnN0Cj4gICAqIEBlY2Nfc3RyZW5ndGhz
OglBdmFpbGFibGUgRUNDIHN0cmVuZ3RocyBhcnJheQo+ICAgKiBAbnN0cmVuZ3RoczoJCVNpemUg
b2YgQGVjY19zdHJlbmd0aHMKPiBAQCAtMjM2LDYgKzI0Nyw4IEBAIHN0cnVjdCBzdW54aV9uZmNf
Y2FwcyB7Cj4gIAl1bnNpZ25lZCBpbnQgcmVnX2lvX2RhdGE7Cj4gIAl1bnNpZ25lZCBpbnQgcmVn
X2VjY19lcnJfY250Owo+ICAJdW5zaWduZWQgaW50IHJlZ191c2VyX2RhdGE7Cj4gKwl1bnNpZ25l
ZCBpbnQgcmVnX3BhdF9mb3VuZDsKPiArCXVuc2lnbmVkIGludCBwYXRfZm91bmRfbWFzazsKPiAg
CXVuc2lnbmVkIGludCBkbWFfbWF4YnVyc3Q7Cj4gIAljb25zdCB1OCAqZWNjX3N0cmVuZ3RoczsK
PiAgCXVuc2lnbmVkIGludCBuc3RyZW5ndGhzOwo+IEBAIC03NzYsNyArNzg5LDggQEAgc3RhdGlj
IHZvaWQgc3VueGlfbmZjX2h3X2VjY191cGRhdGVfc3RhdHMoc3RydWN0IG5hbmRfY2hpcCAqbmFu
ZCwKPiAgfQo+ICAKPiAgc3RhdGljIGludCBzdW54aV9uZmNfaHdfZWNjX2NvcnJlY3Qoc3RydWN0
IG5hbmRfY2hpcCAqbmFuZCwgdTggKmRhdGEsIHU4ICpvb2IsCj4gLQkJCQkgICAgaW50IHN0ZXAs
IHUzMiBzdGF0dXMsIGJvb2wgKmVyYXNlZCkKPiArCQkJCSAgICBpbnQgc3RlcCwgdTMyIHN0YXR1
cywgdTMyIHBhdHRlcm5fZm91bmQsCj4gKwkJCQkgICAgYm9vbCAqZXJhc2VkKQo+ICB7Cj4gIAlz
dHJ1Y3Qgc3VueGlfbmZjICpuZmMgPSB0b19zdW54aV9uZmMobmFuZC0+Y29udHJvbGxlcik7Cj4g
IAlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJm5hbmQtPmVjYzsKPiBAQCAtNzg3LDcgKzgw
MSw3IEBAIHN0YXRpYyBpbnQgc3VueGlfbmZjX2h3X2VjY19jb3JyZWN0KHN0cnVjdCBuYW5kX2No
aXAgKm5hbmQsIHU4ICpkYXRhLCB1OCAqb29iLAo+ICAJaWYgKHN0YXR1cyAmIE5GQ19FQ0NfRVJS
KHN0ZXApKQo+ICAJCXJldHVybiAtRUJBRE1TRzsKPiAgCj4gLQlpZiAoc3RhdHVzICYgTkZDX0VD
Q19QQVRfRk9VTkQoc3RlcCkpIHsKPiArCWlmIChwYXR0ZXJuX2ZvdW5kICYgQklUKHN0ZXApKSB7
Cj4gIAkJdTggcGF0dGVybjsKPiAgCj4gIAkJaWYgKHVubGlrZWx5KCEocmVhZGwobmZjLT5yZWdz
ICsgTkZDX1JFR19QQVRfSUQpICYgMHgxKSkpIHsKPiBAQCAtODIxLDYgKzgzNSw3IEBAIHN0YXRp
YyBpbnQgc3VueGlfbmZjX2h3X2VjY19yZWFkX2NodW5rKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQs
Cj4gIAlzdHJ1Y3Qgc3VueGlfbmZjICpuZmMgPSB0b19zdW54aV9uZmMobmFuZC0+Y29udHJvbGxl
cik7Cj4gIAlzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjID0gJm5hbmQtPmVjYzsKPiAgCWludCBy
YXdfbW9kZSA9IDA7Cj4gKwl1MzIgcGF0dGVybl9mb3VuZDsKPiAgCWJvb2wgZXJhc2VkOwo+ICAJ
aW50IHJldDsKPiAgCj4gQEAgLTg0OCw4ICs4NjMsMTIgQEAgc3RhdGljIGludCBzdW54aV9uZmNf
aHdfZWNjX3JlYWRfY2h1bmsoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiAgCj4gIAkqY3VyX29m
ZiA9IG9vYl9vZmYgKyBlY2MtPmJ5dGVzICsgVVNFUl9EQVRBX1NaOwo+ICAKPiArCXBhdHRlcm5f
Zm91bmQgPSByZWFkbChuZmMtPnJlZ3MgKyBuZmMtPmNhcHMtPnJlZ19wYXRfZm91bmQpOwo+ICsJ
cGF0dGVybl9mb3VuZCA9IGZpZWxkX2dldChORkNfRUNDX1BBVF9GT1VORF9NU0sobmZjKSwgcGF0
dGVybl9mb3VuZCk7Cj4gKwo+ICAJcmV0ID0gc3VueGlfbmZjX2h3X2VjY19jb3JyZWN0KG5hbmQs
IGRhdGEsIG9vYl9yZXF1aXJlZCA/IG9vYiA6IE5VTEwsIDAsCj4gIAkJCQkgICAgICAgcmVhZGwo
bmZjLT5yZWdzICsgTkZDX1JFR19FQ0NfU1QpLAo+ICsJCQkJICAgICAgIHBhdHRlcm5fZm91bmQs
Cj4gIAkJCQkgICAgICAgJmVyYXNlZCk7Cj4gIAlpZiAoZXJhc2VkKQo+ICAJCXJldHVybiAxOwo+
IEBAIC05MzAsNyArOTQ5LDcgQEAgc3RhdGljIGludCBzdW54aV9uZmNfaHdfZWNjX3JlYWRfY2h1
bmtzX2RtYShzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1aW50OF90ICpidWYKPiAgCXVuc2lnbmVk
IGludCBtYXhfYml0ZmxpcHMgPSAwOwo+ICAJaW50IHJldCwgaSwgcmF3X21vZGUgPSAwOwo+ICAJ
c3RydWN0IHNjYXR0ZXJsaXN0IHNnOwo+IC0JdTMyIHN0YXR1cywgd2FpdDsKPiArCXUzMiBzdGF0
dXMsIHBhdHRlcm5fZm91bmQsIHdhaXQ7Cj4gIAo+ICAJcmV0ID0gc3VueGlfbmZjX3dhaXRfY21k
X2ZpZm9fZW1wdHkobmZjKTsKPiAgCWlmIChyZXQpCj4gQEAgLTk3MSw2ICs5OTAsOCBAQCBzdGF0
aWMgaW50IHN1bnhpX25mY19od19lY2NfcmVhZF9jaHVua3NfZG1hKHN0cnVjdCBuYW5kX2NoaXAg
Km5hbmQsIHVpbnQ4X3QgKmJ1Zgo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICAJc3RhdHVzID0gcmVh
ZGwobmZjLT5yZWdzICsgTkZDX1JFR19FQ0NfU1QpOwo+ICsJcGF0dGVybl9mb3VuZCA9IHJlYWRs
KG5mYy0+cmVncyArIG5mYy0+Y2Fwcy0+cmVnX3BhdF9mb3VuZCk7Cj4gKwlwYXR0ZXJuX2ZvdW5k
ID0gZmllbGRfZ2V0KE5GQ19FQ0NfUEFUX0ZPVU5EX01TSyhuZmMpLCBwYXR0ZXJuX2ZvdW5kKTsK
PiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgbmNodW5rczsgaSsrKSB7Cj4gIAkJaW50IGRhdGFfb2Zm
ID0gaSAqIGVjYy0+c2l6ZTsKPiBAQCAtOTgxLDcgKzEwMDIsOCBAQCBzdGF0aWMgaW50IHN1bnhp
X25mY19od19lY2NfcmVhZF9jaHVua3NfZG1hKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHVpbnQ4
X3QgKmJ1Zgo+ICAKPiAgCQlyZXQgPSBzdW54aV9uZmNfaHdfZWNjX2NvcnJlY3QobmFuZCwgcmFu
ZG9taXplZCA/IGRhdGEgOiBOVUxMLAo+ICAJCQkJCSAgICAgICBvb2JfcmVxdWlyZWQgPyBvb2Ig
OiBOVUxMLAo+IC0JCQkJCSAgICAgICBpLCBzdGF0dXMsICZlcmFzZWQpOwo+ICsJCQkJCSAgICAg
ICBpLCBzdGF0dXMsIHBhdHRlcm5fZm91bmQsCj4gKwkJCQkJICAgICAgICZlcmFzZWQpOwo+ICAK
PiAgCQkvKiBFQ0MgZXJyb3JzIGFyZSBoYW5kbGVkIGluIHRoZSBzZWNvbmQgbG9vcC4gKi8KPiAg
CQlpZiAocmV0IDwgMCkKPiBAQCAtMjE5NSw2ICsyMjE3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzdW54aV9uZmNfY2FwcyBzdW54aV9uZmNfYTEwX2NhcHMgPSB7Cj4gIAkucmVnX2lvX2RhdGEg
PSBORkNfUkVHX0ExMF9JT19EQVRBLAo+ICAJLnJlZ19lY2NfZXJyX2NudCA9IE5GQ19SRUdfQTEw
X0VDQ19FUlJfQ05ULAo+ICAJLnJlZ191c2VyX2RhdGEgPSBORkNfUkVHX0ExMF9VU0VSX0RBVEEs
Cj4gKwkucmVnX3BhdF9mb3VuZCA9IE5GQ19SRUdfRUNDX1NULAo+ICsJLnBhdF9mb3VuZF9tYXNr
ID0gR0VOTUFTSygzMSwgMTYpLAo+ICAJLmRtYV9tYXhidXJzdCA9IDQsCj4gIAkuZWNjX3N0cmVu
Z3RocyA9IHN1bnhpX2VjY19zdHJlbmd0aHNfYTEwLAo+ICAJLm5zdHJlbmd0aHMgPSBBUlJBWV9T
SVpFKHN1bnhpX2VjY19zdHJlbmd0aHNfYTEwKSwKPiBAQCAtMjIwNSw2ICsyMjI5LDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfY2FwcyBzdW54aV9uZmNfYTIzX2NhcHMgPSB7Cj4g
IAkucmVnX2lvX2RhdGEgPSBORkNfUkVHX0EyM19JT19EQVRBLAo+ICAJLnJlZ19lY2NfZXJyX2Nu
dCA9IE5GQ19SRUdfQTEwX0VDQ19FUlJfQ05ULAo+ICAJLnJlZ191c2VyX2RhdGEgPSBORkNfUkVH
X0ExMF9VU0VSX0RBVEEsCj4gKwkucmVnX3BhdF9mb3VuZCA9IE5GQ19SRUdfRUNDX1NULAo+ICsJ
LnBhdF9mb3VuZF9tYXNrID0gR0VOTUFTSygzMSwgMTYpLAo+ICAJLmRtYV9tYXhidXJzdCA9IDgs
Cj4gIAkuZWNjX3N0cmVuZ3RocyA9IHN1bnhpX2VjY19zdHJlbmd0aHNfYTEwLAo+ICAJLm5zdHJl
bmd0aHMgPSBBUlJBWV9TSVpFKHN1bnhpX2VjY19zdHJlbmd0aHNfYTEwKSwKPiAKCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
