Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E35FD41C07
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 06:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVr9OJ2rt5EQ5v+0th+NCbBcs9DnPjO4zehShq9Qi64=; b=iIqkbNu8cdaPC6
	Oh96cCxbKDXdHQt6Jw3SGRM47poRM4fPexRQAGDMPQV6OAlB9cQZUiMlsqpsX3UuClpPrgoT2cqU0
	HkmG982W47gdcBNnqW25+2Gf8K4bk1ZYPv4pVTevg3+LVwc8nywcNyR3U3+kWZTyyavONH/50EAGZ
	xwzU25vfIzfWTBq9BdFv7ey2fpovkCMxJUnWCoja+8o5sVs5VJUHguFk8PUelSSa9PnD/lBpjROft
	2WUCzrfbbjwhbvskuLUQDUH7NuYaWHHnRjMev1WnNg1+D6EnB+K7M8CkgnItlhWQwsMuOl/qQ/r1p
	77nAMDo1MNVkKDbZwpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6it-00000005szO-3MM2;
	Wed, 13 Nov 2024 06:19:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6gR-00000005sfb-2a1m;
	Wed, 13 Nov 2024 06:16:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e31af47681so5263841a91.2;
        Tue, 12 Nov 2024 22:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731478614; x=1732083414; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dWsx5nJGnXXSk2Ufj1TPsNBwAQF6kKooyg82zNLy88=;
        b=M+JK/yWTbBkMLcuzP1FRj73QcbUmLVsa98YY8hchfWFXzxSwIoCxeGLB/zwUj2VJkD
         XBwxQ+cyYBjNQ600h+evAwFZ1OLt65HUJGcUJpmVA85D7HQkZ+K30H3bPpFKF9I2Yw1q
         z0KoKfpkSySF4rYTZCfJVJhtKVzlD111gc3H1WKa8Q/MD1Jv9p/BnLJF7HmLPakalqjn
         o3L+1I37SaFaIeT5/xnuEPSgPtYTdhnauN/HwtazrkDXF4bMc6VV/ZcIlK4Yujmuwk1C
         DHpBpJaqR5zi8edf04myFs3QbYUd7plO41nm4Yp8s4FTqpW065/T1vc+FfbG7kLDH/Ve
         Giqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731478614; x=1732083414;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dWsx5nJGnXXSk2Ufj1TPsNBwAQF6kKooyg82zNLy88=;
        b=gMID74y4Avhc93R+i8Ob8KnY/vBDwZ9zcXUILpsQRDdAaxLBFprCys4RttuDBy80Vw
         oBsP6bcZIEoD3Ahwul8tRvRb9W25Eh4ZLXSDUenoyVcCC4g2f8ExD/7g6qLiX1Yi7Ue1
         8E+fScpxgqaw72LBzKxd5M2wB1LkS5dim0vGfdhESzlrZ3xtpSAdxBqQDzqJqf2iT/hg
         gcMNsMlltp09cp7nAHK4bWvR5jLqc83oYVi4beO89NibBRpDEpAOdOTXbq1T8oJ8M98L
         xlBRigtyzfub9fE0Da6lEsZS2Q0QCu28HfCVi3fjCqLio1SADGUaXe2G4rKWIcoU5vK1
         VHmw==
X-Forwarded-Encrypted: i=1; AJvYcCUoH7BxShGe/kwLnrtg+VYdARKTEW4A1I4H+HflTKnSszXwlSkMRdJXPiR8l7nnPIEy/FfSfM010URO@lists.infradead.org, AJvYcCX+XQxQfA/DUfax5ZKk6Fea9BVdLPf9TW5TLZhrieCvUeFeGiTc2s3xFJT72l9xlQywAK/bO/MB+xSmX/xaHzMh@lists.infradead.org
X-Gm-Message-State: AOJu0YwcVKcoSCmhJhyRHQEiCLsDICmQ44PhzpmCXoMhkciR3sJkFQAx
	rbb1fYiBcV11qPWpuI9IItBJGeRWNN3eancHW3tqVGvnHlBTSbPokoKHXg==
X-Google-Smtp-Source: AGHT+IEDrczFgFYUt0SpNxIqMdH27qTt4lLwgzyYo/TRfEHiJZ3LxPGin4/itPwqN0UbsgxzaBid1Q==
X-Received: by 2002:a17:90b:524e:b0:2e2:d859:1603 with SMTP id 98e67ed59e1d1-2e9f2d5c5a7mr1978413a91.25.1731478614156;
        Tue, 12 Nov 2024 22:16:54 -0800 (PST)
Received: from [172.19.1.53] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3ec86d2sm642280a91.21.2024.11.12.22.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 22:16:53 -0800 (PST)
Message-ID: <245b6c20-d7c1-438a-8b8f-d80a2e5d2807@gmail.com>
Date: Wed, 13 Nov 2024 14:16:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: Re: [PATCH v8 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241023092617.108021-1-hpchen0nvt@gmail.com>
 <20241023092617.108021-3-hpchen0nvt@gmail.com> <87y11p1vhx.fsf@bootlin.com>
Content-Language: en-US
In-Reply-To: <87y11p1vhx.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_221655_679975_B1788EC7 
X-CRM114-Status: GOOD (  22.25  )
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

RGVhciBNaXF1ZWwsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKT24gMjAyNC8xMS8xMiDk
uIrljYggMDI6MjIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8sCj4KPj4gK3N0YXRpYyBp
bnQgbWEzNV9uYW5kX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4+ICt7Cj4+
ICsJc3RydWN0IG1hMzVfbmFuZF9pbmZvICpuYW5kID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRh
KGNoaXApOwo+PiArCXN0cnVjdCBtYTM1X25hbmRfY2hpcCAqbnZ0bmFuZCA9IHRvX21hMzVfbmFu
ZChjaGlwKTsKPj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+
PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IG10ZC0+ZGV2LnBhcmVudDsKPj4gKwl1MzIgcmVnOwo+
PiArCj4+ICsJaWYgKGNoaXAtPm9wdGlvbnMgJiBOQU5EX0JVU1dJRFRIXzE2KSB7Cj4+ICsJCWRl
dl9lcnIoZGV2LCAiMTYgYml0cyBidXMgd2lkdGggbm90IHN1cHBvcnRlZCIpOwo+PiArCQlyZXR1
cm4gLUVJTlZBTDsKPj4gKwl9Cj4+ICsKPj4gKwludnRuYW5kLT5uY2h1bmtzID0gbXRkLT53cml0
ZXNpemUgLyBjaGlwLT5lY2Muc3RlcHM7Cj4+ICsJbnZ0bmFuZC0+bmNodW5rcyA9IChudnRuYW5k
LT5uY2h1bmtzIDwgNCkgPyAxIDogbnZ0bmFuZC0+bmNodW5rcyAvIDQ7Cj4gVGhpcyBzZWNvbmQg
ZGl2aXNpb24gbG9va3MgYnJva2VuLiBBbHNvLCB5b3UgcHJvYmFibHkgZG9uJ3Qgd2FudCB0byBk
bwo+IHRoYXQgb3V0c2lkZSBvZiB0aGUgT05fSE9TVCBzaXR1YXRpb24uIEZpbmFsbHksIHlvdSBz
aG91bGQgcHJvYmFibHkKPiB1cGRhdGUgY2hpcC0+ZWNjLnN0ZXBzIGFuZCBjaGlwLT5lY2Muc2l6
ZSB0byB5b3VyIGZpbmFsIGNob2ljZS4KClJlZ2FyZGluZyB0aGVzZSB0d28gbGluZXMsIEkgd2ls
bCByZW1vdmUgdGhlbSBhbmQgaW5zdGVhZCBzZXQgdGhlbSBpbiAKbWEzNV9uYW5kX2h3ZWNjX2lu
aXQoKS4KCkhvd2V2ZXIsIHNpbmNlIHRoZSBuY2h1bmtzIGlzIGFjdHVhbGx5IHVzZWQgdG8gZ2V0
IHRoZSBFQ0Mgc3RhdHVzIApyZWdpc3RlciBjb3VudCwKCkkgd2lsbCByZW5hbWUgbmNodW5rcyB0
byBlY2NzdGF0dXMgYW5kIHBlcmZvcm0gdGhlIGNhbGN1bGF0aW9uIHVzaW5nIAplY2Muc3RlcHMu
CgoKPj4gKwo+PiArCXJlZyA9IHJlYWRsKG5hbmQtPnJlZ3MgKyBNQTM1X05GSV9SRUdfTkFORENU
TCkgJiAoflBTSVpFX01BU0spOwo+PiArCWlmIChtdGQtPndyaXRlc2l6ZSA9PSAyMDQ4KQo+PiAr
CQl3cml0ZWwocmVnIHwgUFNJWkVfMkssIG5hbmQtPnJlZ3MgKyBNQTM1X05GSV9SRUdfTkFORENU
TCk7Cj4+ICsJZWxzZSBpZiAobXRkLT53cml0ZXNpemUgPT0gNDA5NikKPj4gKwkJd3JpdGVsKHJl
ZyB8IFBTSVpFXzRLLCBuYW5kLT5yZWdzICsgTUEzNV9ORklfUkVHX05BTkRDVEwpOwo+PiArCWVs
c2UgaWYgKG10ZC0+d3JpdGVzaXplID09IDgxOTIpCj4+ICsJCXdyaXRlbChyZWcgfCBQU0laRV84
SywgbmFuZC0+cmVncyArIE1BMzVfTkZJX1JFR19OQU5EQ1RMKTsKPj4gKwo+PiArCXN3aXRjaCAo
Y2hpcC0+ZWNjLmVuZ2luZV90eXBlKSB7Cj4+ICsJY2FzZSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9P
Tl9IT1NUOgo+PiArCQljaGlwLT5vcHRpb25zIHw9IE5BTkRfTk9fU1VCUEFHRV9XUklURSB8IE5B
TkRfVVNFU19ETUE7Cj4gV2hhdCBpcyB0aGUgcmVhc29uIGZvciByZWZ1c2luZyBzdWJwYWdlIHdy
aXRlcz8gVGhpcyBpcyBub3Qgc29tZXRoaW5nCj4geW91IGNhbiBkbyBsYXRlciwgc28gdW5sZXNz
IHRoZXJlIGlzIGEgZ29vZCByZWFzb24sIHBsZWFzZSBkbyBub3Qgc2V0Cj4gdGhpcyBmbGFnLgoK
SSB3aWxsIHJlbW92ZSB0aGUgTkFORF9OT19TVUJQQUdFX1dSSVRFIGZsYWcuCgoKPj4gKwkJY2hp
cC0+ZWNjLndyaXRlX3BhZ2UgPSBtYTM1X25hbmRfd3JpdGVfcGFnZV9od2VjYzsKPj4gKwkJY2hp
cC0+ZWNjLnJlYWRfcGFnZSAgPSBtYTM1X25hbmRfcmVhZF9wYWdlX2h3ZWNjOwo+PiArCQljaGlw
LT5lY2MucmVhZF9vb2IgICA9IG1hMzVfbmFuZF9yZWFkX29vYl9od2VjYzsKPj4gKwkJcmV0dXJu
IG1hMzVfbmFuZF9od2VjY19pbml0KGNoaXAsIG5hbmQpOwo+PiArCWNhc2UgTkFORF9FQ0NfRU5H
SU5FX1RZUEVfTk9ORToKPj4gKwljYXNlIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ6Cj4+ICsJ
Y2FzZSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9ESUU6Cj4+ICsJCWJyZWFrOwo+PiArCWRlZmF1
bHQ6Cj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCX0KPj4gKwo+PiArCXJldHVybiAwOwo+PiAr
fQo+PiArCj4gLi4uCj4KPj4gK3N0YXRpYyBpbnQgbWEzNV9uYW5kX2NoaXBfaW5pdChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBtYTM1X25hbmRfaW5mbyAqbmFuZCwKPj4gKwkJCQkgc3RydWN0
IGRldmljZV9ub2RlICpucCkKPj4gK3sKPj4gKwlzdHJ1Y3QgbWEzNV9uYW5kX2NoaXAgKm52dG5h
bmQ7Cj4+ICsJc3RydWN0IG5hbmRfY2hpcCAqY2hpcDsKPj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10
ZDsKPj4gKwlpbnQgbnNlbHM7Cj4+ICsJdTMyIHRtcDsKPj4gKwlpbnQgcmV0Owo+PiArCWludCBp
Owo+PiArCj4+ICsJaWYgKCFvZl9nZXRfcHJvcGVydHkobnAsICJyZWciLCAmbnNlbHMpKQo+IFBs
ZWFzZSBjb252ZXJ0IHRvIGRldmljZV9wcm9wZXJ0eV8gaGVscGVycy4gQW5kIHJlbW92ZSB0aGUg
b2YgaW5jbHVkZQo+IG9uY2UgeW91IG5vIGxvbmdlciBuZWVkIGl0LgoKSSB3aWxsIHVzZSBkZXZp
Y2VfcHJvcGVydHlfcmVhZF91MzIgaW5zdGVhZC4KCgo+PiArCQlyZXR1cm4gLUVOT0RFVjsKPj4g
Kwo+PiArCW5zZWxzIC89IHNpemVvZih1MzIpOwo+PiArCWlmICghbnNlbHMgfHwgbnNlbHMgPiBN
QTM1X01BWF9OU0VMUykgewo+PiArCQlkZXZfZXJyKGRldiwgImludmFsaWQgcmVnIHByb3BlcnR5
IHNpemUgJWRcbiIsIG5zZWxzKTsKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsJfQo+PiArCj4+
ICsJbnZ0bmFuZCA9IGRldm1fa3phbGxvYyhkZXYsIHN0cnVjdF9zaXplKG52dG5hbmQsIHNlbHMs
IG5zZWxzKSwKPj4gKwkJCSAgICAgIEdGUF9LRVJORUwpOwo+PiArCWlmICghbnZ0bmFuZCkKPj4g
KwkJcmV0dXJuIC1FTk9NRU07Cj4+ICsKPj4gKwludnRuYW5kLT5uc2VscyA9IG5zZWxzOwo+PiAr
CWZvciAoaSA9IDA7IGkgPCBuc2VsczsgaSsrKSB7Cj4+ICsJCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyX2luZGV4KG5wLCAicmVnIiwgaSwgJnRtcCk7Cj4+ICsJCWlmIChyZXQpIHsKPj4gKwkJ
CWRldl9lcnIoZGV2LCAicmVnIHByb3BlcnR5IGZhaWx1cmUgOiAlZFxuIiwgcmV0KTsKPj4gKwkJ
CXJldHVybiByZXQ7Cj4+ICsJCX0KPj4gKwo+PiArCQlpZiAodG1wID49IE1BMzVfTUFYX05TRUxT
KSB7Cj4+ICsJCQlkZXZfZXJyKGRldiwgImludmFsaWQgQ1M6ICV1XG4iLCB0bXApOwo+PiArCQkJ
cmV0dXJuIC1FSU5WQUw7Cj4+ICsJCX0KPj4gKwo+PiArCQlpZiAodGVzdF9hbmRfc2V0X2JpdCh0
bXAsICZuYW5kLT5hc3NpZ25lZF9jcykpIHsKPj4gKwkJCWRldl9lcnIoZGV2LCAiQ1MgJXUgYWxy
ZWFkeSBhc3NpZ25lZFxuIiwgdG1wKTsKPj4gKwkJCXJldHVybiAtRUlOVkFMOwo+PiArCQl9Cj4+
ICsKPj4gKwkJbnZ0bmFuZC0+c2Vsc1tpXSA9IHRtcDsKPj4gKwl9Cj4+ICsKPiAuLi4KPgo+PiAr
Cj4+ICsJcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOwo+PiArCWlmIChy
ZXQpIHsKPj4gKwkJZGV2X2VycihkZXYsICJNVEQgcGFyc2UgcGFydGl0aW9uIGVycm9yXG4iKTsK
PiBwcm9iYWJseSB1c2VsZXNzIGVycm9yIG1lc3NhZ2U/CgpJIHdpbGwgcmVtb3ZlIHRoaXMgZXJy
b3IgbWVzc2FnZS4KCgo+PiArCQluYW5kX2NsZWFudXAoY2hpcCk7Cj4+ICsJCXJldHVybiByZXQ7
Cj4+ICsJfQo+PiArCj4+ICsJbGlzdF9hZGRfdGFpbCgmbnZ0bmFuZC0+bm9kZSwgJm5hbmQtPmNo
aXBzKTsKPj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+IEkgYmVsaWV2ZSBuZXh0IGl0ZXJhdGlv
biBzaG91bGQgYmUgdGhlIG9uZSwgSSdtIHJhdGhlciBoYXBweSB3aXRoIHRoZQo+IG92ZXJhbGwg
bG9vay4KCkhvcGUgc28sIHRoYW5rIHlvdSEKCgo+IFRoYW5rcywKPiBNaXF1w6hsCgpCZXN0IHJl
Z2FyZHMsCgpIdWktUGluZyBDaGVuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
