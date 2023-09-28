Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92978E732E4
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Sep 2023 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1epoWigt4fc7Zdy1Qu7y1B34++gKMDuYVFnNHTycK4=; b=faQk7URJTmtyPO
	divgFDuXEf4xsg6c55NKH92l5OU6pBLN3/n+bCz9QE5iaZBWsTJq6+/W6vhEyP9baobJTXwEYYaB3
	FaOYWPFGbkcM/A2CVoFDqqIkcgKMr4B6slWJsLBk0TnmiOBzlx1uMt9To9jPVwmYXz6HLObzYQPEL
	gpxA0kmBRqEa5516YzBRdtZPr+b34iylRboYNIReFBU0VsWI9WSWHYcpYTCFgfRTM6HmYvCAS3LKf
	Ikyr92Njbq623d1ULHIUfHqlLwaPsfMDAiYPU2Sa4w7dHukOOTSJHEBXmNwr+bYj71M8PRvU94wH+
	CXNchx3ySZ8vbZ2FTesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsoY-005Niv-1f;
	Thu, 28 Sep 2023 15:20:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsoR-005NcC-2n
	for linux-mtd@lists.infradead.org;
	Thu, 28 Sep 2023 15:20:27 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53636f98538so933284a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 28 Sep 2023 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695914416; x=1696519216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhGCCrTPz3qD815DrUTz3QFvoilWcLj84jeEgBAbn4g=;
        b=ZVTVNaaDQ/+daGhbN+WuPyHfFxf+JnPA6u7Gt/EOTkaNSUcYV4s7Rrql75hpSsT7wr
         4VMFLsL/by2UZvGc+IJ/hgoSK/G72bPuoblth2rLPIXzcabhPL80A2p40D6WQr+NzM8L
         T6tGRnepeY8nIbE3TEkHQx87JaAKBmT//LcL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914416; x=1696519216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhGCCrTPz3qD815DrUTz3QFvoilWcLj84jeEgBAbn4g=;
        b=W6v7eMRnnxEEuYeAOqeGjja/N/KQ+vJqkc9zunKvtKr0jSpZC2TzIbSalMdgcDMe/I
         ETSnGzaEeTe4UYUj+x5hqUL78h6HncCwlU6rL66C76o2yC1EdiLIIPZS5L188isheMaO
         PfXHnhGyyjX8DuVWCGzPb26LojxlwN3qu3MIdIIZhfms3XJixKNLq1gik/hQKxU7SrPd
         JasyMKQ/dfQezWSE0DcEWuSSUfdjT22CXFABJqMIevgNDas4R3LH4Oumqdwchaq0EnWW
         Fe9UkOguU9qSXSsPcqBmhsKuz4gQu6pQV/4Ab5v9hHrBUIQ1Q2qjHImB24bkt5uDW1bv
         K+Ow==
X-Gm-Message-State: AOJu0YxtDN1nn2IsgFYqA091clHQQ8d1RdHX832UeaeC9VvuAUtuiZku
	MHL7f+hOZLl4VZaELduj6M/DmvLLGzGFaUTQHLgVeQ==
X-Google-Smtp-Source: AGHT+IGCrTzWYKPGz8+625kDs0eQi51Ow82elgipH2Qu5W+6QmLi6g4eOr361Yni2q+KJAEShzSViau1oDvFTplMmIU=
X-Received: by 2002:aa7:c1ca:0:b0:533:926:da9d with SMTP id
 d10-20020aa7c1ca000000b005330926da9dmr1505968edp.18.1695914416372; Thu, 28
 Sep 2023 08:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
 <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
 <20230922174649.GA3320366-robh@kernel.org> <CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
 <CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
 <CAPnjgZ3BnD9aX3cNNPiGRKTOj+YeurHCLv6K0TRFhAtY21Qufw@mail.gmail.com>
 <20230925092122.0b615f25@xps-13> <CAPnjgZ0Z5J_33HuQF-5XgDFmZim0nHHzvZJOOZobWw_cOJd=9g@mail.gmail.com>
 <20230925164736.5efbf4c0@xps-13> <CAPnjgZ3YCQHJ-eXuX8rYx2Qb6QEL+XviFmXYTON6M-sGPWSBBg@mail.gmail.com>
 <20230925172447.43dcef88@xps-13> <CAPnjgZ20c9FsYVjSrQ9qbFy9Y67BqDP2zxMyATx===PFhO69Ew@mail.gmail.com>
 <CAL_JsqJfjHqtTB2qfLmNxmQtn1rZewNyNe+Knu_Z4UCdPoPhSQ@mail.gmail.com>
 <CAPnjgZ1npHPpwPmw2f4=E3U5=RH0m4R+W_MZ7+oXdmDF=EeUjg@mail.gmail.com>
 <20230926094815.5802e184@xps-13> <CAL_JsqL_8bhHkHOFL8a8=g1dYL4OY8hGuNDyc0Jz22rEuJzXtQ@mail.gmail.com>
 <CAPnjgZ3TJLaRzv_cXyLdpRBtc2-FBYQ=gk-_MhEDH47HvO71FQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ3TJLaRzv_cXyLdpRBtc2-FBYQ=gk-_MhEDH47HvO71FQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 28 Sep 2023 09:20:05 -0600
Message-ID: <CAPnjgZ2eUcgevpS7Ak5p=7bhm0aHW3taLO8Fq_EcpDDQidJFVA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, 
	Tom Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_082024_367000_00658DDC 
X-CRM114-Status: GOOD (  61.45  )
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

SGkgYWdhaW4gUm9iLAoKT24gV2VkLCAyNyBTZXB0IDIwMjMgYXQgMTA6NDMsIFNpbW9uIEdsYXNz
IDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIFR1ZSwgMjYgU2Vw
dCAyMDIzIGF0IDExOjI5LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBhdCAyOjQ44oCvQU0gTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhlbGxvLAo+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gVGhlc2UgYXJlIGZpcm13YXJlIGJpbmRpbmdzLCBhcyBpbmRpY2F0ZWQs
IGJ1dCBJCj4gPiA+ID4gPiA+ID4gPiB0b29rIHRoZW0gb3V0IG9mIHRoZSAvZmlybXdhcmUgbm9k
ZSBzaW5jZSB0aGF0IGlzIGZvciBhIGRpZmZlcmVudAo+ID4gPiA+ID4gPiA+ID4gcHVycG9zZS4g
Um9iIHN1Z2dlc3RlZCB0aGF0IHBhcnRpdGlvbnMgd2FzIGEgZ29vZCBwbGFjZS4gV2UgaGF2ZSBm
d3VwZAo+ID4gPiA+ID4gPiA+ID4gdXNpbmcgRFQgdG8gaG9sZCB0aGUgZmlybXdhcmUtdXBkYXRl
IGluZm9ybWF0aW9uLCBzbyBJIGV4cGVjdCBpdCB3aWxsCj4gPiA+ID4gPiA+ID4gPiBtb3ZlIHRv
IHVzZSB0aGVzZSBiaW5kaW5ncyB0b28uCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJIHdv
dWxkIGRlZmluaXRlbHkgdXNlIGZpeGVkIHBhcnRpdGlvbnMgYXMgdGhhdCdzIHdoYXQgeW91IG5l
ZWQgdGhlbjoKPiA+ID4gPiA+ID4gPiByZWdpc3RlcmluZyB3aGVyZSBldmVyeXRoaW5nIHN0YXJ0
cyBhbmQgZW5kcy4gSWYgeW91IGhhdmUgImluLWJhbmQiCj4gPiA+ID4gPiA+ID4gbWV0YSBkYXRh
IHlvdSBtaWdodCByZXF1aXJlIGEgY29tcGF0aWJsZSwgYnV0IEkgZG9uJ3QgdGhpbmsgeW91Cj4g
PiA+ID4gPiA+ID4gZG8sIGluIHRoaXMgY2FzZSB5b3Ugc2hvdWxkIHByb2JhYmx5IGNhcnJ5IHRo
ZSBjb250ZW50IHRocm91Z2ggYSBsYWJlbAo+ID4gPiA+ID4gPiA+ICh3aGljaCB3aWxsIGJlY29t
ZSB0aGUgcGFydGl0aW9uIG5hbWUpIGFuZCB3ZSBjYW4gZGlzY3VzcyBhZGRpdGlvbmFsCj4gPiA+
ID4gPiA+ID4gcHJvcGVydGllcyBpZiBuZWVkZWQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkg
YmVsaWV2ZSBJIGFtIGdvaW5nIHRvIG5lZWQgYSBjb21wYXRpYmxlIHN0cmluZyBhdCB0aGUgJ3Bh
cnRpdGlvbnMnCj4gPiA+ID4gPiA+IGxldmVsIHRvIGluZGljYXRlIHRoYXQgdGhpcyBpcyB0aGUg
YmlubWFuIHNjaGVtZS4gQnV0IHdlIGNhbiBsZWF2ZQo+ID4gPiA+ID4gPiB0aGF0IHVudGlsIGxh
dGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFBlcmhhcHM6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gY29t
cGF0aWJsZSA9ICJiaW5tYW4iLCAiZml4ZWQtcGFydGl0aW9ucyI7Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhvdWdoIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgYmlubWFuIGNvdWxkbid0IGp1c3QgdW5k
ZXJzdGFuZCB3aGF0Cj4gPiA+ID4gPiAiZml4ZWQtcGFydGl0aW9ucyIgbWVhbnMgcmF0aGVyIHRo
YW4gImJpbm1hbiIuCj4gPiA+ID4KPiA+ID4gPiBXZWxsIHNvIGxvbmcgYXMgd2UgZG9uJ3QgYWRk
IGFueSBiaW5tYW4gdGhpbmdzIGluIGhlcmUsIHlvdSBhcmUgcmlnaHQuCj4gPiA+ID4KPiA+ID4g
PiBCdXQgdGhlIGV2ZW50dWFsIGdvYWwgaXMgcGFyaXR5IHdpdGggY3VycmVudCBCaW5tYW4gZnVu
Y3Rpb25hbGl0eSwKPiA+ID4gPiB3aGljaCB3cml0ZXMgdGhlIGVudGlyZSAoYXVnbWVudGVkKSBk
ZXNjcmlwdGlvbiB0byB0aGUgRFQsIGFsbG93aW5nCj4gPiA+ID4gdG9vbHMgdG8gcmVidWlsZCAv
IHJlcGFjayAvIHJlcGxhY2UgcGllY2VzIGxhdGVyLCBtYWludGFpbmluZyB0aGUgc2FtZQo+ID4g
PiA+IGFsaWdubWVudCBjb25zdHJhaW50cywgZXRjLiBJIGFtIGFzc3VtaW5nIHRoYXQgcHJvcGVy
dGllcyBsaWtlICdhbGlnbgo+ID4gPiA+ID0gPDE2Picgd291bGQgbm90IGZpdCB3aXRoIGZpeGVk
LXBhcnRpdGlvbnMuCj4gPiA+Cj4gPiA+IEkgYW0gcGVyc29uYWxseSBub3QgYm90aGVyZWQgYnkg
dGhpcyBraW5kIG9mIHByb3BlcnRpZXMuIEJ1dCBpZiB3ZSBwbGFuCj4gPiA+IG9uIGFkZGluZyB0
b28gbXVjaCBwcm9wZXJ0aWVzLCBJIHdpbGwgYWR2aXNlIHRvIGluZGVlZCB1c2UgYW5vdGhlciBu
YW1lCj4gPiA+IHRoYW4gZml4ZWQtcGFydGl0aW9ucyAob3IgYWRkIHRoZSAiYmlubWFuIiBzZWNv
bmRhcnkgY29tcGF0aWJsZSkKPiA+ID4gb3RoZXJ3aXNlIGl0J3MgZ29ubmEgYmUgaGFyZCB0byBz
dXBwb3J0IGluIHRoZSBjb2RlIHdoaWxlIHN0aWxsCj4gPiA+IHJlc3RyYWluaW5nIGFzIG11Y2gg
YXMgd2UgY2FuIHRoZSBvdGhlciBwYXJ0aXRpb24gc2NoZW1hLgo+ID4KPiA+IEFncmVlZC4gSXQn
cyBhIHRyYWRlIG9mZi4gSSB0aGluayB3ZSBuZWVkIGVub3VnaCB0byB1bmRlcnN0YW5kIHRoZQo+
ID4gcHJvYmxlbSAobm90IGp1c3QgcHJlc2VudGVkIHdpdGggYSBzb2x1dGlvbiksIGFncmVlIG9u
IHRoZSBnZW5lcmFsCj4gPiBzb2x1dGlvbi9kaXJlY3Rpb24sIGFuZCB0aGVuIGRpc2N1c3Mgc3Bl
Y2lmaWMgYWRkaXRpb25zLgo+ID4KPiA+ID4gPiBCdXQgaWYgd2UgZG9uJ3QgcHJlc2VydmUKPiA+
ID4gPiB0aGVzZSBwcm9wZXJ0aWVzIHRoZW4gQmlubWFuIGNhbm5vdCBkbyByZXBhY2tpbmcgcmVs
aWFibHkuIFBlcmhhcHMgZm9yCj4gPiA+ID4gbm93IEkgY291bGQgcHV0IHRoZSBhdWdtZW50ZWQg
RFQgaW4gaXRzIG93biBzZWN0aW9uIHNvbWV3aGVyZSwgYnV0IEkKPiA+ID4gPiBhbSBqdXN0IG5v
dCBzdXJlIGlmIHRoYXQgd2lsbCB3b3JrIGluIGEgcmVhbCBzeXN0ZW0uIEUuZy4gd2l0aCBWQkUg
dGhlCj4gPiA+ID4gZ29hbCBpcyB0byB1c2UgdGhlIERUIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGFj
Y2VzcyB0aGUgZmlybXdhcmUsIHVwZGF0ZQo+ID4gPiA+IGl0LCBldGMuCj4gPgo+ID4gVkJFPwoK
VmVyaWZpZWQgQm9vdCBmb3IgRW1iZWRkZWQsIGFuIEVGSSBhbHRlcm5hdGl2ZSB3aXRoIG5vIGNh
bGxiYWNrcy4KCj4gPgo+ID4gPiA+IElzIGl0IG5vdCBwb3NzaWJsZSB0byBoYXZlIG15IG93biBu
b2RlIHdpdGggd2hhdGV2ZXIgdGhpbmdzIEJpbm1hbgo+ID4gPiA+IG5lZWRzIGluIGl0IChzdWJq
ZWN0IHRvIHJldmlldyBvZiBjb3Vyc2UpPyBpLmUuIGNvdWxkIHdlIGRpc2N1c3MgaG93Cj4gPiA+
ID4gdG8gZW5jb2RlIGl0LCBidXQgYXJndWUgbGVzcyBhYm91dCB3aGV0aGVyIHRoaW5ncyBhcmUg
bmVlZGVkPyBJCj4gPiA+ID4ga2luZC1vZiBmZWVsIEkga25vdyB3aGF0IGlzIG5lZWRlZCwgc2lu
Y2UgSSB3cm90ZSB0aGUgdG9vbC4KPiA+Cj4gPiBXaGF0IHdlIGRvbid0IG5lZWQgaXMgdGhlIHNh
bWUgaW5mb3JtYXRpb24gaW4gMiBwbGFjZXMgZm9yIHRoZSBEVEIKPiA+IHVzZWQgYXQgcnVudGlt
ZS4gSWYgdGhlIGJpbm1hbiBub2RlIGlzIHJlbW92ZWQsIGRvIHdoYXRldmVyIHlvdSB3YW50Lgo+
ID4gSWYgeW91IHdhbnQgdG8ga2VlcCBpdCBhdCBydW50aW1lLCB0aGVuIGl0J3MgZ290IHRvIGV4
dGVuZCB3aGF0IHdlCj4gPiBhbHJlYWR5IGhhdmUuCj4gPgo+ID4gSSBkb24ndCB0aGluayBhbnlv
bmUgaXMgZGlzYWdyZWVpbmcgYWJvdXQgd2hldGhlciBzcGVjaWZpYyBpbmZvcm1hdGlvbgo+ID4g
aXMgbmVlZGVkIG9yIG5vdC4KPiA+Cj4gPiA+ID4gPiA+IFNvIHlvdSBhcmUgc3VnZ2VzdGluZyAn
bGFiZWwnIGZvciB0aGUgY29udGVudHMuIFJvYiBzdWdnZXN0ZWQKPiA+ID4gPiA+ID4gJ2NvbXBh
dGlibGUnIFsxXSwgc28gd2hhdCBzaG91bGQgSSBkbz8KPiA+ID4gPiA+Cj4gPiA+ID4gPiAibGFi
ZWwiIGlzIGZvciBjb25zdW1wdGlvbiBieSBodW1hbnMsIG5vdCB0b29scy9zb2Z0d2FyZS4gQ29t
cGF0aWJsZQo+ID4gPiA+ID4gdmFsdWVzIGFyZSBkb2N1bWVudGVkLCBsYWJlbCB2YWx1ZXMgYXJl
IG5vdC4gVGhvdWdoIHRoZSBwYXJ0aXRpb24KPiA+ID4gPiA+IHN0dWZmIHN0YXJ0ZWQgb3V0IHVz
aW5nIGxhYmVsIGxvbmcgYWdvIGFuZCBpdCdzIGV2b2x2ZWQgdG8gcHJlZmVycmluZwo+ID4gPiA+
ID4gY29tcGF0aWJsZS4KPiA+ID4gPgo+ID4gPiA+IE9LIHNvIHdlIGFyZSBhZ3JlZWQgdGhhdCB3
ZSBhcmUgZ29pbmcgd2l0aCAnY29tcGF0aWJsZScuCj4gPiA+Cj4gPiA+IFN0aWxsIHN0cm9uZ2x5
IGRpc2FncmVlIGhlcmUuCj4gPgo+ID4gTWlxdWVsIGlzIHJpZ2h0LiBJIHdhcyBjb25mdXNlZCBo
ZXJlLiAibGFiZWwiIGlzIHN0aWxsIHByZXR0eSBtdWNoCj4gPiB1c2VkIGZvciB3aGF0IHRoZSBp
bWFnZSBpcy4gVGhvdWdoIHdlIGRvIGhhdmUgInUtYm9vdCxlbnYiIGZvciBib3RoIGl0Cj4gPiBz
ZWVtcy4KPiA+Cj4gPiBNeSBwb3NpdGlvbiBvbiAibGFiZWwiIHN0YW5kcy4gVG8gdGhlIGV4dGVu
dCB3ZSBoYXZlIGltYWdlcyBmb3IgY29tbW9uCj4gPiBjb21wb25lbnRzLCBJIHRoaW5rIHdlIHNo
b3VsZCBzdGFuZGFyZGl6ZSB0aGUgbmFtZXMuIENlcnRhaW5seSBpZgo+ID4gdG9vbHMgcmVseSBv
biB0aGUgbmFtZXMsIHRoZW4gdGhleSBzaG91bGQgYmUgZG9jdW1lbnRlZC4KPgo+IE9LIHRoYW5r
cyBmb3IgY2xlYXJpbmcgdGhhdCB1cC4KPgo+IEJ1dCBhdCBwcmVzZW50ICdsYWJlbCcgaXMgZnJl
ZS1mb3JtIHRleHQuIElmIEkgY2hhbmdlIGl0IHRvIGFuIGVudW0sCj4gd29uJ3QgdGhhdCBicmVh
ayB0aGluZ3M/IElmIG5vdCwgaG93IGRvIEkgYWN0dWFsbHkgZG8gaXQ/Cj4KPiBUaGVyZSBpcyBh
IHUtYm9vdC55YW1sIGJ1dCBpdCBkb2Vzbid0IGFjdHVhbGx5IGhhdmUgYSAidS1ib290IiBsYWJl
bAo+IGluIHRoZSBzY2hlbWEuIEluIGZhY3QgaXQgc2VlbXMgdGhhdCB0aGUgbGFiZWwgaXMgbm90
IHZhbGlkYXRlZCBhdAo+IGFsbD8KCkl0IGxvb2tzIGxpa2UgSSBjYW4ganVzdCBhZGQgaXQgdG8g
YSBzZXBhcmF0ZSBzY2hlbWEgZmlsZSwgd2hpY2ggaXMKd2hhdCBJIGRpZCBpbiB0aGUgbGF0ZXN0
IHZlcnNpb24uCgo+Cj4gPgo+ID4KPiA+ID4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGEgY29t
cGF0aWJsZSBjYXJyaWVzIGhvdyB0aGUgY29udGVudCBpcwo+ID4gPiBvcmdhbml6ZWQsIGFuZCBo
b3cgdGhpcyBtYXliZSBzcGVjaWZpYyAobGlrZSB5b3UgaGF2ZSBpbi1iYW5kIG1ldGEgZGF0YQo+
ID4gPiBkYXRhIHRoYXQgbmVlZHMgdG8gYmUgcGFyc2VkIGluIGEgc3BlY2lmaWMgd2F5IG9yIGlu
IHlvdXIgY2FzZQo+ID4gPiBhZGRpdGlvbmFsIHNwZWNpZmljIHByb3BlcnRpZXMgaW4gdGhlIERU
IHdoaWNoIGdpdmUgbW9yZSBjb250ZXh0IGFib3V0Cj4gPiA+IGhvdyB0aGUgZGF0YSBpcyBzdG9y
ZWQpLiBCdXQgdGhlIHJlYWwgY29udGVudCBvZiB0aGUgcGFydGl0aW9uLCBpZS4gaWYKPiA+ID4g
aXQgY29udGFpbnMgYSBmaXJtd2FyZSwgdGhlIGtlcm5lbCBvciBzb21lIHVzZXIgZGF0YSBkb2Vz
IG5vdCBiZWxvbmcgdG8KPiA+ID4gdGhlIGNvbXBhdGlibGUuCj4gPiA+Cj4gPiA+IEkuZToKPiA+
ID4gLSBUaGUgZmlyc3QgYnl0ZSBvZiBteSBwYXJ0aXRpb24gZ2l2ZXMgdGhlIGNvbXByZXNzaW9u
IGFsZ29yaXRobToKPiA+ID4gICAtPiBjb21wYXRpYmxlID0gImNvbXByZXNzZWQtcGFydGl0aW9u
LWZvbyI7Cj4gPiA+ICAgICAgb3IKPiA+ID4gICAtPiBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRp
dGlvbnMiICsgY29tcHJlc3Npb24tYWxnb3JpdGhtID0gImZvbyI7Cj4gPiA+IC0gVGhlIHBhcnRp
dGlvbiBjb250YWlucyBhIHBpY3R1cmUgb2YgbXkgZG9nOgo+ID4gPiAgIC0+IGxhYmVsID0gIm15
IGRvZyBpcyBiZWF1dGlmdWwiCj4gPiA+ICAgYnV0IGNlcnRhaW5seSBub3QKPiA+ID4gICAtPiBj
b21wYXRpYmxlID0gIm15LWRvZyI7Cj4gPgo+ID4gSU1PLCBjb21wYXRpYmxlIGluIHRoaXMgY2Fz
ZSBzaG91bGQgY29udmV5ICJKUEVHIGltYWdlIiBvciBzaW1pbGFyLgo+ID4KPiA+ID4gSSBkb24n
dCBzZWUgd2h5LCBmb3IgdGhlIGJpbm1hbiBzY2hlbWEsIHdlIGNvdWxkIG5vdCBjb25zdHJhaW4g
dGhlCj4gPiA+IGxhYmVscz8KPiA+Cj4gPiBZZXMsIGJ1dCB0aG9zZSBzaG91bGQgZm9sbG93IHdo
YXQgd2UgYWxyZWFkeSBoYXZlLiAidS1ib290IiBmb3IKPiA+IGV4YW1wbGUgcmF0aGVyIHRoYW4g
ImRhdGEsdS1ib290IiB3aGljaCBJIHRoaW5rIFNpbW9uIGhhZCBpbiBzb21lCj4gPiB2ZXJzaW9u
IG9mIHRoaXMuCj4KPiBZZXMsIGRvbid0IHdvcnJ5LCBJIGhhZCBzb21lIGZlZWRiYWNrIGZyb20g
QWxwZXIgYnV0IGhhdmUgZ2l2ZW4gdXAgb24KPiB0aGF0IGFwcHJvYWNoLgoKUmVnYXJkcywKU2lt
b24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
