Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097F8E9410B
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSVGe0Gh6QD3+9nuYsAbroSR/I6unoXOtqrenBA4bfA=; b=zWmwBZihYk3Ojz
	ouEhjLxrxkLlhkLuJLUahRq8ATJoUCXx+2i1tCqiCVUSp+5XZNYJEkj4qQ/zPNHKbGzosKhGvqR3A
	d/CR9Kh0j1lYUR1R+oDO/asb0rNDWkrHwoNI+rTgTNRdKKfIADrMM8aAJhtsuo6Zxw6XoaKxTxRPK
	9Irqa7vUvwPb6EiPJlTPVqVrpkjcwvyIFXPSukq4DbCk6Rs4sgXqyqTsk+IzSCybCSiYBWfLjRZ4Y
	aB2j0UTeQ2465v06u+pN0GK/kKPlnj55G+NyhpROiIbc8+bnaBMjbX7jjyYk+/Bzo/W9CON3yjPFH
	wS88ikwSBD/B0Cl30yRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbc5c-000000083SB-3OJr;
	Fri, 02 Jan 2026 10:09:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbc5Z-000000083RN-2D6v
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 10:08:58 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so13556641b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767348537; x=1767953337; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fe815HykdJZXA/fdLXFlCD8aMFUo2cB4//CLLF3EANo=;
        b=ceaT81FFGOuAoLPyKurxgitz+NbILr8mGXSuYKkAzfAhI/kT0f1cMES0qKTDYUQeLa
         tJ22wjzQG2VcDOUciRP9+5ZLL384b6FF/SIYsr4qwvAT4sqN3zhMHI+dhUFslj7vxAVj
         qrGckYAqMAM3YbFmcMSh1jpjzIRcWOJDrBu+/uIY6SvJFnnHdmHL0dV9rz9GanVKPg8W
         xJtWt24g0M/nJyzDoDkS4h+48cKiRRiL+x9iwq/0jab8w0/RqCfmv+JFtom/YmjsgUh9
         AJeumQDBjlX6kZ/sxL1f8FVEUQbjQVohrez+4+ftMVyRrY6ePplYxPdZkHdRRmV4TE9i
         aIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767348537; x=1767953337;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe815HykdJZXA/fdLXFlCD8aMFUo2cB4//CLLF3EANo=;
        b=Rpvaiy6UC2gDokYBRNTgid3ikks8TKRHKDdr38SABXBYFBMM48ZU2Z3h0XXq0/Vyoe
         R4Eqoku3b3Unb9b/OsBqndSQ6KU/K2BXY9oil5XTizbgrFW+czhHMiJbuZqyGSAJS/o1
         g+gdWcym7BKoHU3L7qpNPNrwuzpqJLDp8KTJZooIgxwIoU2kmQ1r/77pV74ep5+7We/b
         tn/2nuENzorXkx1S39PE/luDatflAAuIXQlOWUf8SS9l4W1mE75L6RvV7WnFwymcIg22
         hzV0SOV+BdRlAiNWA63Hd3p4xS0PKltgr6BczI5Wb4PlLLzVE53sC4bZpsdmi6cpmdwY
         KsiA==
X-Forwarded-Encrypted: i=1; AJvYcCUSD7quGtGz6QrH/9K2dcXdW87OEFJ46jbg80oXJiJEPzDoTkQylhMHIi3FAc2RYpVFpqiWs8+J68Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy0qp0YUTDQZpC/Sa+3MjU/xQCfk7MJu9+9L0aQXeQc3oc5iah
	sEqD6LQhxWRkiz91tlZa5MbgBXuzqd1UyM3cJES6Wu10O0BCPOWJh2Z8448so7+E
X-Gm-Gg: AY/fxX6ohb8f0uILaJ9GRQ0IaD9oig9aKtepLQUsf8hd06DY96WD1Rj9WR4GweoLdke
	INe0xG4/FOEWhalFpyNTzLqpoaa8obqubufAkQk8j1R+8DYhmN5Q7zH4tjY7YPm7CmRMc6sgoD4
	bX+K0mzaXFC3fwJ8EvK04iUKwPkK7mM0dmi12DcYRbHN8PVKo6uXQpDd5LQ3weSTRZpuuHXoyUk
	PVWtV6/ZVCIE/dw9hOqq0VPyELe1pS9kdRga3t/G1ATd82RdwP8x70CmLDHQUb1rxvsTqnP1Ybu
	29oNrkITvnIbvlYsvi2YbW6iLVdP2ay+CGv6+6M8xzEZ8IhlRNPrtDhq0on66GPfHGwAxrsiV5Z
	frpjECgrmibQ7AWG+tWxmngyaCvMFujel4YxBRPPO/d7doHLchRGMmYPJXwJxf2D4YLcsL1lZck
	cs9wgwogLaA8qVhd/BEgP3WQ9M7IprH2tN9ie1Ik+7Tm+i65CxVj9SKmeHZvHhdD+q3IaZSXk=
X-Google-Smtp-Source: AGHT+IEC3e8kZw0Xj2yo5CTUSmbZNoTyCva9yA0VvjTLMoX4LlaMc1sV53Z/kNwFsdK4byE3LWwxlw==
X-Received: by 2002:a05:6a00:418a:b0:7e8:450c:61b7 with SMTP id d2e1a72fcca58-7ff6607b8dbmr36213357b3a.39.1767348536655;
        Fri, 02 Jan 2026 02:08:56 -0800 (PST)
Received: from ?IPV6:2401:4900:883b:60a8:c545:bc1e:eac1:a2b4? ([2401:4900:883b:60a8:c545:bc1e:eac1:a2b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cd07sm40045029b3a.46.2026.01.02.02.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 02:08:56 -0800 (PST)
Message-ID: <cfe2550d-52d4-400e-903e-f32031ebd5ee@gmail.com>
Date: Fri, 2 Jan 2026 15:38:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
From: Akhila YS <akhilayalmati@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229-nxp-v1-1-a415fe0080a8@gmail.com>
 <20251230-kagu-of-scientific-enrichment-6fcd4c@quoll>
 <0363ac61-0872-42da-91b8-78966a2537ce@gmail.com>
Content-Language: en-US
In-Reply-To: <0363ac61-0872-42da-91b8-78966a2537ce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_020857_612993_60674DF0 
X-CRM114-Status: GOOD (  21.74  )
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

Ck9uIDAyLTAxLTIwMjYgMTM6NDcsIEFraGlsYSBZUyB3cm90ZToKPgo+Cj4gT24gMzAtMTItMjAy
NSAxODowMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gTW9uLCBEZWMgMjksIDIw
MjUgYXQgMTI6NDk6MDBQTSArMDAwMCwgQWtoaWxhIFlTIHdyb3RlOgo+Pj4gKy0tLQo+Pj4gKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL21pY3JvY2hpcCxtY2hwMjNrMjU2
LnlhbWwjCj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCj4+PiArCj4+PiArdGl0bGU6IE1pY3JvY2hpcCAyM0syNTYgKGFuZCBzaW1pbGFy
KSBTUEkgU1JBTSBNVEQgZHJpdmVyCj4+IGRyaXZlcj8gQmluZGluZ3MgYXJlIGZvciBoYXJkd2Fy
ZS4KPgo+Cj4gU3VyZSwgSSB3aWxsIGZpeCBpdC4KPgo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+
Pj4gKyAgLSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+Pj4gKwo+Pj4gK2Rl
c2NyaXB0aW9uOiB8Cj4+IERvIG5vdCBuZWVkICd8JyB1bmxlc3MgeW91IG5lZWQgdG8gcHJlc2Vy
dmUgZm9ybWF0dGluZy4KPiBPay4KPj4+ICsgIERyaXZlciBmb3IgTWljcm9jaGlwIDIzSzI1NiBh
bmQgY29tcGF0aWJsZSAoZS5nLiAyM0xDVjEwMjQpIHNlcmlhbCBTUkFNIGRldmljZXMKPj4gRG9u
J3QgZGVzY3JpYmUgZHJpdmVycy4uLgo+Pgo+Pj4gKyAgYWNjZXNzZWQgdmlhIFNQSS4gVGhlIGRl
dmljZSBleHBvc2VzIHRoZSBTUkFNIGFzIGFuIE1URCBkZXZpY2UgYW5kIHN1cHBvcnRzCj4+PiAr
ICBvcHRpb25hbCBwYXJ0aXRpb25pbmcgdmlhIGNoaWxkIG5vZGVzLgo+PiBub3IgRFRTLCBidXQg
dGhlIGhhcmR3YXJlLgo+Cj4KPiBPSywgSSB3aWxsIGNoYW5nZSBpdC4KPgo+Pj4gKwo+Pj4gK2Fs
bE9mOgo+Pj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFt
bCMKPj4+ICsKPj4gSWYgdGhpcyBpcyBTUkFNLCB0aGVuIGl0IHNob3VsZCBnbyB0byBzcmFtIGRp
cmVjdG9yeS4gQnV0IG1heWJlIGl0IGlzCj4+IE1URCwgc28gTk9SIG9yIE5BTkQ/IElmIHNvIHlv
dSB3b3VsZCBiZSBtaXNzaW5nIGhlcmUgcmVmcyB0byBOQU5ECj4+IGNoaXBzLgo+Pgo+PiBBbHRo
b3VnaCBkb2NzIGFyZSBzYXlpbmcgaXQgaXMgU1JBTSwgc28ganVzdCBwbGFjZSBpdCB0aGVyZS4K
Pgo+IFRoaXMgU1JBTSBpcyBub3QgZ2VuZXJpYyBNTUlPIFNSQU0sIGl0J3MgYW4gU1BJIHBlcmlw
aGVyYWwgZXhwb3NpbmcKPiBtZW1vcnkgdmlhIHRoZSBNVEQgc3Vic3lzdGVtLiBBbHNvIGkgdHJp
ZWQgWWFtbCBmcm9tIHNyYW0gZGlyZWN0b3J5IGl0Cj4gZG9lc24ndCB3b3JrIHdpdGggaXQuCj4K
Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4gKyAgY29tcGF0aWJsZToKPj4+ICsgICAgZW51bToKPj4+ICsg
ICAgICAtIG1pY3JvY2hpcCxtY2hwMjNrMjU2Cj4+PiArICAgICAgLSBtaWNyb2NoaXAsbWNocDIz
bGN2MTAyNAo+Pj4gKwo+Pj4gKyAgcmVnOgo+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4gKwo+Pj4g
KyAgIiNhZGRyZXNzLWNlbGxzIjoKPj4+ICsgICAgY29uc3Q6IDEKPj4+ICsKPj4+ICsgICIjc2l6
ZS1jZWxscyI6Cj4+PiArICAgIGNvbnN0OiAxCj4+IFByZXR0eSBpbmNvbXBsZXRlLiBPbGQgYmlu
ZGluZyBhbmQgYWJvdmUgY2VsbHMgY2xhaW0gdGhlcmUgY2FuIGJlIGNoaWxkCj4+IG5vZGVzLCBz
byBwbGVhc2UgYWRkIHRoZW0gYW5kIHRlc3QuIFdvcmtzPyBOby4gU2hhbGwgd29yaz8gWWVzLi4u
IHNvCj4+IGVpdGhlciBvbGQgYmluZGluZyB3YXMgaW5jb3JyZWN0IG9yIG5ldyBiaW5kaW5nIGlz
IGluY29tcGxldGUuIEkgZGlkIG5vdAo+PiBjaGVjayB0aGUgZHJpdmVyLCB0aG91Z2guCj4KPgo+
IFNpemUgY2VsbHMgYW5kIEFkZHJlc3MgY2VsbHMgYXJlIG5vdCByZXF1aXJlZCBhcyB0aGVyZSBp
cyBubyBjaGlsZAo+IG5vZGUgYW5kIEkgdHJpZWQgdG8gZGVmaW5lIGNoaWxkIG5vZGUgLCBJbmNs
dWRlZCBTUkFNLllhbWwgYXMgYQo+IHJlZmVyZW5jZSBmaWxlIGFuZCB0ZXN0ZWQgaXQuIEl0IGRv
ZXNuJ3Qgd29yay4KPgo+Pj4gKwo+Pj4gK3JlcXVpcmVkOgo+Pj4gKyAgLSByZWcKPj4+ICsgIC0g
Y29tcGF0aWJsZQo+Pj4gKyAgLSAiI2FkZHJlc3MtY2VsbHMiCj4+PiArICAtICIjc2l6ZS1jZWxs
cyIKPj4+ICsgIC0gc3BpLW1heC1mcmVxdWVuY3kKPj4+ICsKPj4+ICt1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlCj4+PiArCj4+PiArZXhhbXBsZXM6Cj4+PiArICAtIHwKPj4+ICsgICAgc3Bp
IHsKPj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+Pj4gKyAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47Cj4+PiArCj4+PiArICAgICAgICBzcmFtQDAgewo+Pj4gKyAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+Pj4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+
Owo+PiBUaGV5IGFyZSByZWR1bmRhbnQuIFdoZXJlIGFyZSBjaGlsZHJlbj8KPgo+Cj4gVGhleSBh
cmUgcmVkdW5kYW50LCBUaGVyZSBpcyBubyBjaGlsZCBub2RlwqAgYW5kIGkgd2lsbCByZW1vdmUg
aXQuCj4KPj4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtY2hwMjNrMjU2
IjsKPj4+ICsgICAgICAgICAgICByZWcgPSA8MD47Cj4+PiArICAgICAgICAgICAgc3BpLW1heC1m
cmVxdWVuY3kgPSA8MjAwMDAwMDA+Owo+Pj4gKyAgICAgICAgfTsKPj4+ICsgICAgfTsKPj4+ICsu
Li4KPj4+Cj4+PiAtLS0KPj4+IGJhc2UtY29tbWl0OiBjYzNhYTQzYjQ0YmRiNDNkZmJhYzBmY2I1
MWM1NjU5NGExMTMzOGE4Cj4+PiBjaGFuZ2UtaWQ6IDIwMjUxMjI5LW54cC01MjZlMjlkYTlmMjkK
Pj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+PiAtLSAKPj4+IEFraGlsYSBZUyA8YWtoaWxheWFsbWF0
aUBnbWFpbC5jb20+Cj4+PgotLSAKQmVzdCBSZWdhcmRzLApBa2hpbGEuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
