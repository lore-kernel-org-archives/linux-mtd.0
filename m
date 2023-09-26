Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7A9E7E656
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Sep 2023 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+I3Fda5mjnKMPgMCwcDno6qbnzpba0SUwVRKD6MSlc=; b=QU7irzo8oo4cq6
	ONhrhIPwtaoOelRqJZHrOD/Z3AdoPow4eyoTn8aYMp03IWjPsCEhrs1BQo5d4+yezGOAn7/Al653B
	aTftSxz6/zSGT08agw2cyKVM62Ug3GqdoC4krs7m1UZMdR6JZfUeV9m/ox0HxGLPRnG92hiRTyRaw
	VEgoKPvOaVNN0laTHuxXNsN1KQyi4aWUOrpO3hR5z7DO+vhnBXjpmxQlKGulajMb4suvrKiiQd8be
	OGcm9ewl7nuXF/yqPH1v7kcPdt5/HvMKoPJ1WK8IwZMlGrCgKE7iF1n/3AeiKv2faLEExMwIBtpSr
	/GldAjTvS7/lUclwhyYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlBsE-00Gmkf-2K;
	Tue, 26 Sep 2023 17:29:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlBsA-00Gmjh-3A
	for linux-mtd@lists.infradead.org;
	Tue, 26 Sep 2023 17:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB382CE1266
	for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2023 17:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07072C433CB
	for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2023 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695749360;
	bh=qrBeQ51Dvxv01D+MaeOf5SpdgRWicIvEOSKVURSSzjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pGw9GCyYBWxdk92513dYnqiRP04Q2Fn6ZkYKyTutg1q/MOSyO2IpBx6COPCOcrHI5
	 f5LYZpKDcDXIy/BjuoUKMmkRpzEIAB29Qy21OEajq4XuVBf8Z6q2PJF1fn9Clovs7s
	 PLOuKeIVbXmRwaPpgv7Y99jr5za3EizUJsZ52h7yn0cQLy1aIeOSVPeu7brlji+wjo
	 Tv1sihBAKjE8xHYSgugAlIIhEq/DAuu9YsY/OrF2upuhnjVV9xVO0jO+0L1hldk6+Z
	 UIyJyIIuMKtHKd0Ut5ZQQZSqax8Z7Z8NfwTaiaz+r62zsR5ElA8g6xUXP8ZoBtyUou
	 4pN/j4lF2jAfQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50437f39c9dso12714431e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2023 10:29:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw4OoieaWUNkPoiLwnv+VEyXnW03N1l/EJ1xqAFwBeJJPYiiY1Z
	G7V4tpso+FCBXxLA0uQpHJayW0aw6WPW/k86qw==
X-Google-Smtp-Source: AGHT+IF4jsYIOlWRMaDBVtY1ZGg0bMgAPx9E8v3RDGUGPZuPx/gUDtti2upRNZGqjvQTlkNrF5gZRcr/muks4aGOsIc=
X-Received: by 2002:a05:6512:2520:b0:500:8022:3dc7 with SMTP id
 be32-20020a056512252000b0050080223dc7mr9331056lfb.10.1695749358093; Tue, 26
 Sep 2023 10:29:18 -0700 (PDT)
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
 <CAPnjgZ1npHPpwPmw2f4=E3U5=RH0m4R+W_MZ7+oXdmDF=EeUjg@mail.gmail.com> <20230926094815.5802e184@xps-13>
In-Reply-To: <20230926094815.5802e184@xps-13>
From: Rob Herring <robh@kernel.org>
Date: Tue, 26 Sep 2023 12:29:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_8bhHkHOFL8a8=g1dYL4OY8hGuNDyc0Jz22rEuJzXtQ@mail.gmail.com>
Message-ID: <CAL_JsqL_8bhHkHOFL8a8=g1dYL4OY8hGuNDyc0Jz22rEuJzXtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Miquel Raynal <miquel.raynal@bootlin.com>, Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_102923_385649_EC49A8E1 
X-CRM114-Status: GOOD (  48.17  )
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

T24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMjo0OOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiA+ID4gPiA+ID4gVGhlc2Ug
YXJlIGZpcm13YXJlIGJpbmRpbmdzLCBhcyBpbmRpY2F0ZWQsIGJ1dCBJCj4gPiA+ID4gPiA+IHRv
b2sgdGhlbSBvdXQgb2YgdGhlIC9maXJtd2FyZSBub2RlIHNpbmNlIHRoYXQgaXMgZm9yIGEgZGlm
ZmVyZW50Cj4gPiA+ID4gPiA+IHB1cnBvc2UuIFJvYiBzdWdnZXN0ZWQgdGhhdCBwYXJ0aXRpb25z
IHdhcyBhIGdvb2QgcGxhY2UuIFdlIGhhdmUgZnd1cGQKPiA+ID4gPiA+ID4gdXNpbmcgRFQgdG8g
aG9sZCB0aGUgZmlybXdhcmUtdXBkYXRlIGluZm9ybWF0aW9uLCBzbyBJIGV4cGVjdCBpdCB3aWxs
Cj4gPiA+ID4gPiA+IG1vdmUgdG8gdXNlIHRoZXNlIGJpbmRpbmdzIHRvby4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBJIHdvdWxkIGRlZmluaXRlbHkgdXNlIGZpeGVkIHBhcnRpdGlvbnMgYXMgdGhhdCdz
IHdoYXQgeW91IG5lZWQgdGhlbjoKPiA+ID4gPiA+IHJlZ2lzdGVyaW5nIHdoZXJlIGV2ZXJ5dGhp
bmcgc3RhcnRzIGFuZCBlbmRzLiBJZiB5b3UgaGF2ZSAiaW4tYmFuZCIKPiA+ID4gPiA+IG1ldGEg
ZGF0YSB5b3UgbWlnaHQgcmVxdWlyZSBhIGNvbXBhdGlibGUsIGJ1dCBJIGRvbid0IHRoaW5rIHlv
dQo+ID4gPiA+ID4gZG8sIGluIHRoaXMgY2FzZSB5b3Ugc2hvdWxkIHByb2JhYmx5IGNhcnJ5IHRo
ZSBjb250ZW50IHRocm91Z2ggYSBsYWJlbAo+ID4gPiA+ID4gKHdoaWNoIHdpbGwgYmVjb21lIHRo
ZSBwYXJ0aXRpb24gbmFtZSkgYW5kIHdlIGNhbiBkaXNjdXNzIGFkZGl0aW9uYWwKPiA+ID4gPiA+
IHByb3BlcnRpZXMgaWYgbmVlZGVkLgo+ID4gPiA+Cj4gPiA+ID4gSSBiZWxpZXZlIEkgYW0gZ29p
bmcgdG8gbmVlZCBhIGNvbXBhdGlibGUgc3RyaW5nIGF0IHRoZSAncGFydGl0aW9ucycKPiA+ID4g
PiBsZXZlbCB0byBpbmRpY2F0ZSB0aGF0IHRoaXMgaXMgdGhlIGJpbm1hbiBzY2hlbWUuIEJ1dCB3
ZSBjYW4gbGVhdmUKPiA+ID4gPiB0aGF0IHVudGlsIGxhdGVyLgo+ID4gPgo+ID4gPiBQZXJoYXBz
Ogo+ID4gPgo+ID4gPiBjb21wYXRpYmxlID0gImJpbm1hbiIsICJmaXhlZC1wYXJ0aXRpb25zIjsK
PiA+ID4KPiA+ID4gVGhvdWdoIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgYmlubWFuIGNvdWxkbid0
IGp1c3QgdW5kZXJzdGFuZCB3aGF0Cj4gPiA+ICJmaXhlZC1wYXJ0aXRpb25zIiBtZWFucyByYXRo
ZXIgdGhhbiAiYmlubWFuIi4KPiA+Cj4gPiBXZWxsIHNvIGxvbmcgYXMgd2UgZG9uJ3QgYWRkIGFu
eSBiaW5tYW4gdGhpbmdzIGluIGhlcmUsIHlvdSBhcmUgcmlnaHQuCj4gPgo+ID4gQnV0IHRoZSBl
dmVudHVhbCBnb2FsIGlzIHBhcml0eSB3aXRoIGN1cnJlbnQgQmlubWFuIGZ1bmN0aW9uYWxpdHks
Cj4gPiB3aGljaCB3cml0ZXMgdGhlIGVudGlyZSAoYXVnbWVudGVkKSBkZXNjcmlwdGlvbiB0byB0
aGUgRFQsIGFsbG93aW5nCj4gPiB0b29scyB0byByZWJ1aWxkIC8gcmVwYWNrIC8gcmVwbGFjZSBw
aWVjZXMgbGF0ZXIsIG1haW50YWluaW5nIHRoZSBzYW1lCj4gPiBhbGlnbm1lbnQgY29uc3RyYWlu
dHMsIGV0Yy4gSSBhbSBhc3N1bWluZyB0aGF0IHByb3BlcnRpZXMgbGlrZSAnYWxpZ24KPiA+ID0g
PDE2Picgd291bGQgbm90IGZpdCB3aXRoIGZpeGVkLXBhcnRpdGlvbnMuCj4KPiBJIGFtIHBlcnNv
bmFsbHkgbm90IGJvdGhlcmVkIGJ5IHRoaXMga2luZCBvZiBwcm9wZXJ0aWVzLiBCdXQgaWYgd2Ug
cGxhbgo+IG9uIGFkZGluZyB0b28gbXVjaCBwcm9wZXJ0aWVzLCBJIHdpbGwgYWR2aXNlIHRvIGlu
ZGVlZCB1c2UgYW5vdGhlciBuYW1lCj4gdGhhbiBmaXhlZC1wYXJ0aXRpb25zIChvciBhZGQgdGhl
ICJiaW5tYW4iIHNlY29uZGFyeSBjb21wYXRpYmxlKQo+IG90aGVyd2lzZSBpdCdzIGdvbm5hIGJl
IGhhcmQgdG8gc3VwcG9ydCBpbiB0aGUgY29kZSB3aGlsZSBzdGlsbAo+IHJlc3RyYWluaW5nIGFz
IG11Y2ggYXMgd2UgY2FuIHRoZSBvdGhlciBwYXJ0aXRpb24gc2NoZW1hLgoKQWdyZWVkLiBJdCdz
IGEgdHJhZGUgb2ZmLiBJIHRoaW5rIHdlIG5lZWQgZW5vdWdoIHRvIHVuZGVyc3RhbmQgdGhlCnBy
b2JsZW0gKG5vdCBqdXN0IHByZXNlbnRlZCB3aXRoIGEgc29sdXRpb24pLCBhZ3JlZSBvbiB0aGUg
Z2VuZXJhbApzb2x1dGlvbi9kaXJlY3Rpb24sIGFuZCB0aGVuIGRpc2N1c3Mgc3BlY2lmaWMgYWRk
aXRpb25zLgoKPiA+IEJ1dCBpZiB3ZSBkb24ndCBwcmVzZXJ2ZQo+ID4gdGhlc2UgcHJvcGVydGll
cyB0aGVuIEJpbm1hbiBjYW5ub3QgZG8gcmVwYWNraW5nIHJlbGlhYmx5LiBQZXJoYXBzIGZvcgo+
ID4gbm93IEkgY291bGQgcHV0IHRoZSBhdWdtZW50ZWQgRFQgaW4gaXRzIG93biBzZWN0aW9uIHNv
bWV3aGVyZSwgYnV0IEkKPiA+IGFtIGp1c3Qgbm90IHN1cmUgaWYgdGhhdCB3aWxsIHdvcmsgaW4g
YSByZWFsIHN5c3RlbS4gRS5nLiB3aXRoIFZCRSB0aGUKPiA+IGdvYWwgaXMgdG8gdXNlIHRoZSBE
VCB0byBmaWd1cmUgb3V0IGhvdyB0byBhY2Nlc3MgdGhlIGZpcm13YXJlLCB1cGRhdGUKPiA+IGl0
LCBldGMuCgpWQkU/Cgo+ID4gSXMgaXQgbm90IHBvc3NpYmxlIHRvIGhhdmUgbXkgb3duIG5vZGUg
d2l0aCB3aGF0ZXZlciB0aGluZ3MgQmlubWFuCj4gPiBuZWVkcyBpbiBpdCAoc3ViamVjdCB0byBy
ZXZpZXcgb2YgY291cnNlKT8gaS5lLiBjb3VsZCB3ZSBkaXNjdXNzIGhvdwo+ID4gdG8gZW5jb2Rl
IGl0LCBidXQgYXJndWUgbGVzcyBhYm91dCB3aGV0aGVyIHRoaW5ncyBhcmUgbmVlZGVkPyBJCj4g
PiBraW5kLW9mIGZlZWwgSSBrbm93IHdoYXQgaXMgbmVlZGVkLCBzaW5jZSBJIHdyb3RlIHRoZSB0
b29sLgoKV2hhdCB3ZSBkb24ndCBuZWVkIGlzIHRoZSBzYW1lIGluZm9ybWF0aW9uIGluIDIgcGxh
Y2VzIGZvciB0aGUgRFRCCnVzZWQgYXQgcnVudGltZS4gSWYgdGhlIGJpbm1hbiBub2RlIGlzIHJl
bW92ZWQsIGRvIHdoYXRldmVyIHlvdSB3YW50LgpJZiB5b3Ugd2FudCB0byBrZWVwIGl0IGF0IHJ1
bnRpbWUsIHRoZW4gaXQncyBnb3QgdG8gZXh0ZW5kIHdoYXQgd2UKYWxyZWFkeSBoYXZlLgoKSSBk
b24ndCB0aGluayBhbnlvbmUgaXMgZGlzYWdyZWVpbmcgYWJvdXQgd2hldGhlciBzcGVjaWZpYyBp
bmZvcm1hdGlvbgppcyBuZWVkZWQgb3Igbm90LgoKPiA+ID4gPiBTbyB5b3UgYXJlIHN1Z2dlc3Rp
bmcgJ2xhYmVsJyBmb3IgdGhlIGNvbnRlbnRzLiBSb2Igc3VnZ2VzdGVkCj4gPiA+ID4gJ2NvbXBh
dGlibGUnIFsxXSwgc28gd2hhdCBzaG91bGQgSSBkbz8KPiA+ID4KPiA+ID4gImxhYmVsIiBpcyBm
b3IgY29uc3VtcHRpb24gYnkgaHVtYW5zLCBub3QgdG9vbHMvc29mdHdhcmUuIENvbXBhdGlibGUK
PiA+ID4gdmFsdWVzIGFyZSBkb2N1bWVudGVkLCBsYWJlbCB2YWx1ZXMgYXJlIG5vdC4gVGhvdWdo
IHRoZSBwYXJ0aXRpb24KPiA+ID4gc3R1ZmYgc3RhcnRlZCBvdXQgdXNpbmcgbGFiZWwgbG9uZyBh
Z28gYW5kIGl0J3MgZXZvbHZlZCB0byBwcmVmZXJyaW5nCj4gPiA+IGNvbXBhdGlibGUuCj4gPgo+
ID4gT0sgc28gd2UgYXJlIGFncmVlZCB0aGF0IHdlIGFyZSBnb2luZyB3aXRoICdjb21wYXRpYmxl
Jy4KPgo+IFN0aWxsIHN0cm9uZ2x5IGRpc2FncmVlIGhlcmUuCgpNaXF1ZWwgaXMgcmlnaHQuIEkg
d2FzIGNvbmZ1c2VkIGhlcmUuICJsYWJlbCIgaXMgc3RpbGwgcHJldHR5IG11Y2gKdXNlZCBmb3Ig
d2hhdCB0aGUgaW1hZ2UgaXMuIFRob3VnaCB3ZSBkbyBoYXZlICJ1LWJvb3QsZW52IiBmb3IgYm90
aCBpdApzZWVtcy4KCk15IHBvc2l0aW9uIG9uICJsYWJlbCIgc3RhbmRzLiBUbyB0aGUgZXh0ZW50
IHdlIGhhdmUgaW1hZ2VzIGZvciBjb21tb24KY29tcG9uZW50cywgSSB0aGluayB3ZSBzaG91bGQg
c3RhbmRhcmRpemUgdGhlIG5hbWVzLiBDZXJ0YWlubHkgaWYKdG9vbHMgcmVseSBvbiB0aGUgbmFt
ZXMsIHRoZW4gdGhleSBzaG91bGQgYmUgZG9jdW1lbnRlZC4KCgo+IE15IHVuZGVyc3RhbmRpbmcg
aXMgdGhhdCBhIGNvbXBhdGlibGUgY2FycmllcyBob3cgdGhlIGNvbnRlbnQgaXMKPiBvcmdhbml6
ZWQsIGFuZCBob3cgdGhpcyBtYXliZSBzcGVjaWZpYyAobGlrZSB5b3UgaGF2ZSBpbi1iYW5kIG1l
dGEgZGF0YQo+IGRhdGEgdGhhdCBuZWVkcyB0byBiZSBwYXJzZWQgaW4gYSBzcGVjaWZpYyB3YXkg
b3IgaW4geW91ciBjYXNlCj4gYWRkaXRpb25hbCBzcGVjaWZpYyBwcm9wZXJ0aWVzIGluIHRoZSBE
VCB3aGljaCBnaXZlIG1vcmUgY29udGV4dCBhYm91dAo+IGhvdyB0aGUgZGF0YSBpcyBzdG9yZWQp
LiBCdXQgdGhlIHJlYWwgY29udGVudCBvZiB0aGUgcGFydGl0aW9uLCBpZS4gaWYKPiBpdCBjb250
YWlucyBhIGZpcm13YXJlLCB0aGUga2VybmVsIG9yIHNvbWUgdXNlciBkYXRhIGRvZXMgbm90IGJl
bG9uZyB0bwo+IHRoZSBjb21wYXRpYmxlLgo+Cj4gSS5lOgo+IC0gVGhlIGZpcnN0IGJ5dGUgb2Yg
bXkgcGFydGl0aW9uIGdpdmVzIHRoZSBjb21wcmVzc2lvbiBhbGdvcml0aG06Cj4gICAtPiBjb21w
YXRpYmxlID0gImNvbXByZXNzZWQtcGFydGl0aW9uLWZvbyI7Cj4gICAgICBvcgo+ICAgLT4gY29t
cGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIiArIGNvbXByZXNzaW9uLWFsZ29yaXRobSA9ICJm
b28iOwo+IC0gVGhlIHBhcnRpdGlvbiBjb250YWlucyBhIHBpY3R1cmUgb2YgbXkgZG9nOgo+ICAg
LT4gbGFiZWwgPSAibXkgZG9nIGlzIGJlYXV0aWZ1bCIKPiAgIGJ1dCBjZXJ0YWlubHkgbm90Cj4g
ICAtPiBjb21wYXRpYmxlID0gIm15LWRvZyI7CgpJTU8sIGNvbXBhdGlibGUgaW4gdGhpcyBjYXNl
IHNob3VsZCBjb252ZXkgIkpQRUcgaW1hZ2UiIG9yIHNpbWlsYXIuCgo+IEkgZG9uJ3Qgc2VlIHdo
eSwgZm9yIHRoZSBiaW5tYW4gc2NoZW1hLCB3ZSBjb3VsZCBub3QgY29uc3RyYWluIHRoZQo+IGxh
YmVscz8KClllcywgYnV0IHRob3NlIHNob3VsZCBmb2xsb3cgd2hhdCB3ZSBhbHJlYWR5IGhhdmUu
ICJ1LWJvb3QiIGZvcgpleGFtcGxlIHJhdGhlciB0aGFuICJkYXRhLHUtYm9vdCIgd2hpY2ggSSB0
aGluayBTaW1vbiBoYWQgaW4gc29tZQp2ZXJzaW9uIG9mIHRoaXMuCgpSb2IKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
