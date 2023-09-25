Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0ACCD548D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIH3LiTwE+iQEMrOtkNHcvabDfLEh/sjIoddCLYQQG8=; b=w6eKEguk8ETqiF
	ZxlwX+T5y/t9hd1X4wO4v5pWKH1qeQjpjforEqMg9FavMaKHKiArZJLQ5BAz+dotwihAWFdAz+A/6
	ppYA4e/DzDk3PlRU6kG8MPPQ/zX7/glet0CxVE9Z7MXizhviFYHcS+hy7FXb6Wvigy90zw+CYeIhp
	qyzpehgLEjQx0E7O629hwIOzUBJJFEatDrT/ssLUzcyB1MwV0Yfc7H24bQjxaQ0bL2lMq/GgOu86w
	reNKdd4TUpGom5aHJ2yjpsu7DAjPq8wOU8F6Kkf5RUYgdNWdcucdkqV3yRk/D9g+jWBtbyw5h1qEi
	jMvqxX9iDuRLICBYlpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkqeV-00ErtA-2V;
	Mon, 25 Sep 2023 18:49:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkqeU-00Ert2-1g
	for linux-mtd@bombadil.infradead.org;
	Mon, 25 Sep 2023 18:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+rcy4oYAhba9wCyLwGbxX2HdccPNPodqOPJo6IEv+Zs=; b=gIrCviLVuhsAAs/s1BhiTy0owN
	OlLkMooVjA0Dx8mmmv4BwqsvdPwyoY/fA8GjaZtbOkf8XPriMeyn0YrvyIU66UyuKnGh5rUzBSFMw
	4sdfIzKom3cqzkj8f1NzOhpRBi6Gyth0F6taURo/U0swfWXdrU3S8/wWEBJ9KuMn4o5igPXuIy8iL
	5kN5hKLTm4USWUPPgGMNqIyf5LJV8Rl47V1EIQIryBHJGQzTOodkFbTUEHu2Vt5GyNUTJNeSttj9r
	oHIDRnEOZ0zRjqtyW/H24YCoCXPabuHS085W8IboWoUWx3SUpmIqlGizX7m28OzqF81o3rJbR1MBH
	0RNJVAgA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkqeP-001qVt-1a
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 18:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D5B761200
	for <linux-mtd@lists.infradead.org>; Mon, 25 Sep 2023 18:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D7EC43395
	for <linux-mtd@lists.infradead.org>; Mon, 25 Sep 2023 18:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695667772;
	bh=+rcy4oYAhba9wCyLwGbxX2HdccPNPodqOPJo6IEv+Zs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h8HpK/K+JNku8lmwmMNxoufWJOItCjPCi/g42NpWdooJcaidgyNGKIyEraqlT0b3B
	 KkemmWKJLU+NVACs0fBZL2AxSWBntKOybYk+3ljPvdwkaj2KH9fFwSeFsE+gcI4Fgx
	 TPvIfgMPJCh3AL2cqLbcEaKK0NXtoWjawqQAdacQE84+Trqyo1DLdTBiCMWoWiden0
	 pS3BZAbkXTFe2kL4ShpESGqZrGvS7XX/T2mDFiKl2Ntf1BkDuuEtdKfPtrXCdUUC+R
	 4s5+peO5db482uGrgAUQbwcwqzSjAbefuvnVvCJ0Ja4B0xR8c2uvBI0eAw+KIJd4C9
	 Q/kOQXKuQovTg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c01d22f332so99709721fa.0
        for <linux-mtd@lists.infradead.org>; Mon, 25 Sep 2023 11:49:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YyV3QM8Fmf9xuDKM0DIgl6sLMlIe/ZJV9Ff0PPgIsSFMx7nqd9B
	EBwF1p8WRx6u1hotbP9+rfnkcJ7YT9aouHRBdg==
X-Google-Smtp-Source: AGHT+IGcHkOdCdPfbzp5VC5myRrLOdVgIvfsU2VlMZvLU+MhLgLmRzzSK/ci9n3/LNSjtTK1Mz2yOzkxqKrQowyQlHw=
X-Received: by 2002:a05:6512:1598:b0:503:a1b:d0c5 with SMTP id
 bp24-20020a056512159800b005030a1bd0c5mr215163lfb.14.1695667770401; Mon, 25
 Sep 2023 11:49:30 -0700 (PDT)
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
In-Reply-To: <CAPnjgZ20c9FsYVjSrQ9qbFy9Y67BqDP2zxMyATx===PFhO69Ew@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 25 Sep 2023 13:49:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJfjHqtTB2qfLmNxmQtn1rZewNyNe+Knu_Z4UCdPoPhSQ@mail.gmail.com>
Message-ID: <CAL_JsqJfjHqtTB2qfLmNxmQtn1rZewNyNe+Knu_Z4UCdPoPhSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Simon Glass <sjg@chromium.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, 
	Tom Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_194947_323409_24FC6D41 
X-CRM114-Status: GOOD (  56.44  )
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

T24gTW9uLCBTZXAgMjUsIDIwMjMgYXQgMTE6MjXigK9BTSBTaW1vbiBHbGFzcyA8c2pnQGNocm9t
aXVtLm9yZz4gd3JvdGU6Cj4KPiBIaSBNaXF1ZWwsCj4KPiBPbiBNb24sIDI1IFNlcHQgMjAyMyBh
dCAwOToyNCwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGkgU2ltb24sCj4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gSSB3YXMgYXNzdW1p
bmcgdGhhdCBJIHNob3VsZCBjcmVhdGUgYSB0b3AtbGV2ZWwgY29tcGF0aWJsZSA9ICJiaW5tYW4i
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBub2RlLCB3aXRoIHN1Ym5vZGVzIGxpa2UgY29tcGF0aWJs
ZSA9ICJiaW5tYW4sYmwzMS1hdGYiLCBmb3IgZXhhbXBsZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IEkgc2hvdWxkIHVzZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcgdG8gaW5kaWNhdGUgdGhlIGNvbnRl
bnRzLCByaWdodD8KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IFllcyBm
b3Igc3Vibm9kZXMsIGFuZCB3ZSBhbHJlYWR5IGhhdmUgc29tZSBzb21ld2hhdCBzdGFuZGFyZCBv
bmVzIGZvcgo+ID4gPiA+ID4gPiA+ID4gPiA+ICJ1LWJvb3QiIGFuZCAidS1ib290LWVudiIuIFRo
b3VnaCBoaXN0b3JpY2FsbHksICJsYWJlbCIgd2FzIHVzZWQuCj4gPiA+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gPiA+IEJpbm1hbiBoYXMgY29tbW9uIHByb3BlcnRpZXMgZm9yIGFsbCBlbnRy
aWVzLCBpbmNsdWRpbmcgImNvbXByZXNzIgo+ID4gPiA+ID4gPiA+ID4gPiB3aGljaCBzZXRzIHRo
ZSBjb21wcmVzc2lvbiBhbGdvcml0aG0uCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
SSBzZWUgbm8gaXNzdWUgd2l0aCBhZGRpbmcgdGhhdC4gSXQgc2VlbXMgdXNlZnVsIGFuZCBzb21l
dGhpbmcgbWlzc2luZwo+ID4gPiA+ID4gPiA+ID4gaW4gdGhlIGV4aXN0aW5nIHBhcnRpdGlvbiBz
Y2hlbWFzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT0sgSSBzZW50IGEgcGF0Y2ggd2l0
aCB0aGF0Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBT
byBwZXJoYXBzIEkgc2hvdWxkIHN0YXJ0IGJ5IGRlZmluaW5nIGEgbmV3IGJpbm1hbixibDMxLWF0
ZiB3aGljaCBoYXMKPiA+ID4gPiA+ID4gPiA+ID4gY29tbW9uIHByb3BlcnRpZXMgZnJvbSBhbiAi
YmlubWFuLGVudHJ5IiBkZWZpbml0aW9uPwo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgYmlubWFuIHByZWZpeC4gVGhlIGNvbnRlbnRzIGFyZSBB
VEYgKG9yIFRGLUEKPiA+ID4gPiA+ID4gPiA+IG5vdykuIFdobyB3cm90ZSBpdCB0byB0aGUgZmxh
c2ggaW1hZ2UgaXMgbm90IHJlbGV2YW50Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQXJl
IHlvdSBzdWdnZXN0aW5nIGp1c3QgImF0Zi1ibDMxIiwgb3IgImFybSxhdGYtYmwzMSIgPyBPciBz
aG91bGQgd2UKPiA+ID4gPiA+ID4gPiBjaGFuZ2UgaXQgdG8gInRmYS1ibDMxIj8KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gSSBkb24ndCByZWFsbHkgdW5kZXJzdGFuZCB0aGUgcmVsYXRpb25zaGlw
IHdpdGggVEYtQSBoZXJlLiBDYW4ndCB3ZQo+ID4gPiA+ID4gPiBqdXN0IGhhdmUgYSBraW5kIG9m
IGZpeGVkLXBhcnRpdGlvbnMgd2l0aCBhZGRpdGlvbmFsIHByb3BlcnRpZXMgbGlrZQo+ID4gPiA+
ID4gPiB0aGUgY29tcHJlc3Npb24/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQmlubWFuIG5lZWRzIHRv
IGtub3cgd2hhdCB0byBwdXQgaW4gdGhlcmUsIHdoaWNoIGlzIHRoZSBwdXJwb3NlIG9mIHRoZQo+
ID4gPiA+ID4gY29tcGF0aWJsZSBzdHJpbmcuCj4gPiA+ID4KPiA+ID4gPiBCdXQgIndoYXQiIHNo
b3VsZCBiZSBwdXQgaW5zaWRlIHRoZSBwYXJ0aXRpb24gaXMgcGFydCBvZiB0aGUgaW5wdXQKPiA+
ID4gPiBhcmd1bWVudCwgbm90IHRoZSBvdXRwdXQuIFlvdSBzYWlkIChtYXliZSBJIGdvdCB0aGlz
IHdyb25nKSB0aGF0IHRoZQo+ID4gPiA+IHNjaGVtYSB3b3VsZCBhcHBseSB0byB0aGUgb3V0cHV0
IG9mIGJpbm1hbi4gSWYgeW91IHdhbnQgdG8gbGV0IHVzZXIKPiA+ID4gPiBrbm93IHdoYXQncyBp
bnNpZGUsIG1heWJlIGl0IGlzIHdvcnRoIGFkZGluZyBhIGxhYmVsLCBidXQgb3RoZXJ3aXNlIEkK
PiA+ID4gPiBkb24ndCBsaWtlIHRoZSBpZGVhIG9mIGEgY29tcGF0aWJsZSBmb3IgdGhhdCwgd2hp
Y2ggZm9yIG1lIHdvdWxkIG1lYW46Cj4gPiA+ID4gImhlcmUgaXMgaG93IHRvIGhhbmRsZSB0aGF0
IHNwZWNpZmljIHBvcnRpb24gb2YgdGhlIGZsYXNoL2hlcmUgaXMgaG93Cj4gPiA+ID4gdGhlIGZs
YXNoIGlzIG9yZ2FuaXplZCIuCj4gPiA+Cj4gPiA+IEJ1dCBJIHRob3VnaHQgdGhhdCB0aGUgY29t
cGF0aWJsZSBzdHJpbmcgd2FzIGZvciB0aGF0IHB1cnBvc2U/IFNlZSBmb3IKPiA+ID4gZXhhbXBs
ZSAiYnJjbSxiY200OTA4LWZpcm13YXJlIiBhbmQgImJyY20sYmNtOTYzeHgtaW1hZ2V0YWciIGFu
ZAo+ID4gPiAibGlua3N5cyxucy1maXJtd2FyZSIuCj4gPgo+ID4gVGhlc2UgdGhyZWUgZXhhbXBs
ZXMgYXBwYXJlbnRseSBuZWVkIHNwZWNpZmljIGhhbmRsaW5nLCB0aGUgcGFydGl0aW9ucwo+ID4g
Y29udGFpbiBtZXRhLWRhdGEgdGhhdCBhIHBhcnNlciBuZWVkcyB0byBjaGVjayBvciBzb21ldGhp
bmcgbGlrZSB0aGF0Lgo+ID4gQW5kIGZpbmFsbHkgaXQgbG9va3MgbGlrZSBwYXJ0aXRpb24gbmFt
ZXMgYXJlIHNldCBkZXBlbmRpbmcgb24gdGhlCj4gPiBjb250ZW50IHRoYXQgd2FzIGRpc2NvdmVy
ZWQsIHNvIHllcywgdGhlIHBhcnRpdGlvbiBuYW1lIGlzIGxpa2VseSB0aGUKPiA+IGdvb2QgbG9j
YXRpb24gdG8gdGVsbCB1c2Vycy9PU2VzIHdoYXQncyBpbnNpZGUuCj4gPgo+ID4gPiA+ID4gPiBB
bHNvLCBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2YgdGhpcyBzY2hlbWEu
IFNvIGJpbm1hbgo+ID4gPiA+ID4gPiBnZW5lcmF0ZXMgYW4gaW1hZ2UsIHlvdSB3YW50IHRvIGZs
YXNoIHRoaXMgaW1hZ2UgYW5kIHlvdSB3b3VsZCBsaWtlIHRoZQo+ID4gPiA+ID4gPiB0b29sIHRv
IGdlbmVyYXRlIHRoZSBjb3JyZXNwb25kaW5nIChwYXJ0aXRpb24pIERUIHNuaXBwZXQgYXV0b21h
dGljYWxseS4KPiA+ID4gPiA+ID4gRG8gSSBnZXQgdGhpcyByaWdodD8gSSBkb24ndCBnZXQgd2h5
IHlvdSB3b3VsZCBuZWVkIG5ldyBjb21wYXRpYmxlcyBmb3IKPiA+ID4gPiA+ID4gdGhhdC4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBJdCBpcyBhY3R1YWxseSB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gVGhl
IHNjaGVtYSB0ZWxscyBCaW5tYW4gaG93IHRvCj4gPiA+ID4gPiBidWlsZCB0aGUgaW1hZ2UgKHdo
YXQgZ29lcyBpbiB0aGVyZSBhbmQgd2hlcmUpLiBUaGVuIG91dHB1dHMgYW4KPiA+ID4gPiA+IHVw
ZGF0ZWQgRFQgd2hpY2ggZGVzY3JpYmVzIHdoZXJlIGV2ZXJ5dGhpbmcgZW5kZWQgdXAsIGZvciB1
c2UgYnkgb3RoZXIKPiA+ID4gPiA+IHRvb2xzLCBlLmcuIGZpcm13YXJlIHVwZGF0ZS4gSXQgaXMg
YSBjbG9zZWQgbG9vcCBpbiB0aGF0IHNlbnNlLiBTZWUKPiA+ID4gPiA+IHRoZSByZWZlcmVuY2Vz
IGZvciBtb3JlIGluZm9ybWF0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gTWF5YmUgSSBmYWlsIHRvIHNl
ZSB3aHkgeW91IHdvdWxkIHdhbnQgdGhlc2UgZGVzY3JpcHRpb24gdG8gYmUKPiA+ID4gPiBpbnRy
b2R1Y2VkIGhlcmUsIGlmIHRoZXkgYXJlIG5vdCB1c2VmdWwgdG8gdGhlIE9TLgo+ID4gPgo+ID4g
PiBXZWxsIEkgd2FzIGFza2VkIHRvIHNlbmQgdGhlbSB0byBMaW51eCBzaW5jZSB0aGV5IGFwcGFy
ZW50bHkgZG9uJ3QKPiA+ID4gYmVsb25nIGluIGR0LXNjaGVtYS4KClRoYXQgaXMgbm90IHdoYXQg
SSBzYWlkLiBJIHNhaWQgZml4ZWQtcGFydGl0aW9ucyBzaG91bGQgYmUgZXh0ZW5kZWQuIEkKcHJl
ZmVyIHRoZXkgYXJlIGV4dGVuZGVkIGluLXBsYWNlIGJlZm9yZSBtb3ZpbmcgdGhlbSByYXRoZXIg
dGhhbiB0aGUKb3RoZXIgd2F5IGFyb3VuZC4KCj4gPiA+IFRoZXNlIGFyZSBmaXJtd2FyZSBiaW5k
aW5ncywgYXMgaW5kaWNhdGVkLCBidXQgSQo+ID4gPiB0b29rIHRoZW0gb3V0IG9mIHRoZSAvZmly
bXdhcmUgbm9kZSBzaW5jZSB0aGF0IGlzIGZvciBhIGRpZmZlcmVudAo+ID4gPiBwdXJwb3NlLiBS
b2Igc3VnZ2VzdGVkIHRoYXQgcGFydGl0aW9ucyB3YXMgYSBnb29kIHBsYWNlLiBXZSBoYXZlIGZ3
dXBkCj4gPiA+IHVzaW5nIERUIHRvIGhvbGQgdGhlIGZpcm13YXJlLXVwZGF0ZSBpbmZvcm1hdGlv
biwgc28gSSBleHBlY3QgaXQgd2lsbAo+ID4gPiBtb3ZlIHRvIHVzZSB0aGVzZSBiaW5kaW5ncyB0
b28uCj4gPgo+ID4gSSB3b3VsZCBkZWZpbml0ZWx5IHVzZSBmaXhlZCBwYXJ0aXRpb25zIGFzIHRo
YXQncyB3aGF0IHlvdSBuZWVkIHRoZW46Cj4gPiByZWdpc3RlcmluZyB3aGVyZSBldmVyeXRoaW5n
IHN0YXJ0cyBhbmQgZW5kcy4gSWYgeW91IGhhdmUgImluLWJhbmQiCj4gPiBtZXRhIGRhdGEgeW91
IG1pZ2h0IHJlcXVpcmUgYSBjb21wYXRpYmxlLCBidXQgSSBkb24ndCB0aGluayB5b3UKPiA+IGRv
LCBpbiB0aGlzIGNhc2UgeW91IHNob3VsZCBwcm9iYWJseSBjYXJyeSB0aGUgY29udGVudCB0aHJv
dWdoIGEgbGFiZWwKPiA+ICh3aGljaCB3aWxsIGJlY29tZSB0aGUgcGFydGl0aW9uIG5hbWUpIGFu
ZCB3ZSBjYW4gZGlzY3VzcyBhZGRpdGlvbmFsCj4gPiBwcm9wZXJ0aWVzIGlmIG5lZWRlZC4KPgo+
IEkgYmVsaWV2ZSBJIGFtIGdvaW5nIHRvIG5lZWQgYSBjb21wYXRpYmxlIHN0cmluZyBhdCB0aGUg
J3BhcnRpdGlvbnMnCj4gbGV2ZWwgdG8gaW5kaWNhdGUgdGhhdCB0aGlzIGlzIHRoZSBiaW5tYW4g
c2NoZW1lLiBCdXQgd2UgY2FuIGxlYXZlCj4gdGhhdCB1bnRpbCBsYXRlci4KClBlcmhhcHM6Cgpj
b21wYXRpYmxlID0gImJpbm1hbiIsICJmaXhlZC1wYXJ0aXRpb25zIjsKClRob3VnaCBJIGRvbid0
IHVuZGVyc3RhbmQgd2h5IGJpbm1hbiBjb3VsZG4ndCBqdXN0IHVuZGVyc3RhbmQgd2hhdAoiZml4
ZWQtcGFydGl0aW9ucyIgbWVhbnMgcmF0aGVyIHRoYW4gImJpbm1hbiIuCgoKPiBTbyB5b3UgYXJl
IHN1Z2dlc3RpbmcgJ2xhYmVsJyBmb3IgdGhlIGNvbnRlbnRzLiBSb2Igc3VnZ2VzdGVkCj4gJ2Nv
bXBhdGlibGUnIFsxXSwgc28gd2hhdCBzaG91bGQgSSBkbz8KCiJsYWJlbCIgaXMgZm9yIGNvbnN1
bXB0aW9uIGJ5IGh1bWFucywgbm90IHRvb2xzL3NvZnR3YXJlLiBDb21wYXRpYmxlCnZhbHVlcyBh
cmUgZG9jdW1lbnRlZCwgbGFiZWwgdmFsdWVzIGFyZSBub3QuIFRob3VnaCB0aGUgcGFydGl0aW9u
CnN0dWZmIHN0YXJ0ZWQgb3V0IHVzaW5nIGxhYmVsIGxvbmcgYWdvIGFuZCBpdCdzIGV2b2x2ZWQg
dG8gcHJlZmVycmluZwpjb21wYXRpYmxlLgoKPiBXaXRoIHRoaXMgc2NoZW1hLCB3b3VsZCBldmVy
eSBub2RlIGJlIGNhbGxlZCAncGFydGl0aW9uQC4uLicgb3IgaXMKPiB0aGVyZSBmbGV4aWJpbGl0
eSB0byB1c2Ugb3RoZXIgbmFtZXM/CgpUaGUgcHJlZmVyZW5jZSBpcyB0byB1c2UgZ2VuZXJpYyBu
YW1lcy4gRG8geW91IG1lYW4gd2l0aG91dCBhCnVuaXQtYWRkcmVzcyBvciBkaWZmZXJlbnQgZnJv
bSAicGFydGl0aW9uIj8gVGhlIG5lZWQgZm9yIHRoZSBpbnB1dApzaWRlIG9mIGJpbm1hbiB0byBo
YXZlIGR5bmFtaWMgYWRkcmVzc2VzIHNlZW1zIGxpa2UgdGhlIGJpZ2dlc3QgaXNzdWUuClRoYXQn
cyBhbGxvd2VkIGluIG90aGVyIGNhc2VzIHdpdGggInBhcnRpdGlvbi1OIiBvciAicGFydGl0aW9u
LWZvbyIKSUlSQy4gSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGFsbG93IHRoYXQgZm9yICJmaXhl
ZC1wYXJ0aXRpb25zIiBhdApsZWFzdCBpbiB0aGUgRFRCIChpLmUuIHRoZSBvdXRwdXQgc2lkZSBv
ZiBiaW5tYW4pLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
