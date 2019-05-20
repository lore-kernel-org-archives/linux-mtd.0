Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB1CC04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE28214DA
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/AGMBbx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6gZFxSg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AE28214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tns1tDY25L4gUH9K5OOvacG+bF3jGoVVA4rf82jLle0=; b=X/AGMBbxPJrUA/
	CjQZl4RKumIM+Vvmm2PfihrfAL5bY71dr7U322KkUMF3LtNmX8gyKW5dMfNQQhOOunj/UvM7oasU2
	aeInCwdfqVwcI8xbglQ9fqJBcg0+f5WCMlBSK6wi+DGG7Kilg+/xj2YWIRqdcfTKgqBuKI+RXdyhb
	Jocqs5m2SFMikyh4Po90AFDVd4dJdo/G7O1+k3XvVOVc2DmbqmNZBpEfV59ZrnnbHTiKFchr/iYgJ
	M+zBmqlWgMtb6QJ9z+b40NqacUVznpJD0/+6gwOc4trkaSyNyReZmBSXQP2OkdoNenTzkQ14MH06x
	tMkUsql1JEPyTry/69aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmRi-00050a-4p; Mon, 20 May 2019 17:51:34 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmRf-0004zI-G6
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 17:51:33 +0000
Received: by mail-io1-xd43.google.com with SMTP id q21so11685947iog.13
 for <linux-mtd@lists.infradead.org>; Mon, 20 May 2019 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CzknmS3algkOP4TKdwdGkF2v7Kn89/q/nMaTVG+rIi8=;
 b=b6gZFxSgX7BPxz6wATO5y49g6szkHUt8pyyQn+7XD7mrpu3cNB6yoRVVd3CQvBlLUD
 13e0jpbks5gt4rufx6DheFuvjKy6fqoLQe5k+i4NbPXAmU7Py5WTPjzKm3Ye/gfqqtbO
 IBI1sOcKPkonTGXIdjCADvDpfHTxuG9IzltrrfuTy0D89/1OXk+OJrZL1VGuqvaTb4vX
 5rl9WKSNT+8OV+7pLttFS9HM5InfGbkOBtqtl67aozzNhRveetBT1WVIZVWEmOs/32gF
 6fURxoruuPRoibbX8YGJss+ZvWeXxGX45ycH3oJyLFWWDdknweY+owdP0ToMVDLUOI2m
 ndiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CzknmS3algkOP4TKdwdGkF2v7Kn89/q/nMaTVG+rIi8=;
 b=WDAzcRIBBMWRifhBlmnZ8lFbiM+hTkymyhH4+vN0tLQClnj6vHhSK1ZBUCFDeEWHob
 IL+P/YxA7hkcpnQDBsO+VjV5aALcmOzKkQHZWCygDKV4HwOD2IVqm8SCxgSGR+I7FJ63
 O/A4rth3Ub9GT37o2NK6HMfMcATx+oZq8Qz9/LAb+mM91w4OXct52cVBuev61pkvTUf4
 TwnKqgS8e1E1GF8CHNXBWu8LOcFvm9nnR2Hsm0pFIxtBqQL3OrcEFWLC0tor7o2AmvDG
 HwrVTC4Oo2d46F1CQcjehgVJjD43Mavbuf69ED2meQHkul2SwOOh25QU31n05zv2kvAV
 ejpQ==
X-Gm-Message-State: APjAAAVNTHM6eaDvASWXMtYdRTQX/lkCmCEu0JEQvlwoa2Zkmi5QqMQN
 cCkVHnytoTmQKkxZvVtInpa8CxiTsgAxyRLoG/0=
X-Google-Smtp-Source: APXvYqz7OWSIRs2P8CsvaRzfpmv3wagFOUsv/KaVjSLxn86WbbTrU/Nn8C3++YXXQ4BxT3Hh/t66bF6WSl6xDtqiedY=
X-Received: by 2002:a6b:3b88:: with SMTP id i130mr26971762ioa.21.1558374690717; 
 Mon, 20 May 2019 10:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
 <1558117914-35807-2-git-send-email-kdasu.kdev@gmail.com>
 <20190520144436.67e42f00@xps13>
 <CAC=U0a0bZHgM2yQzz5SupRNWcBg7rpqpGh_o9cvSQNNKsSp9Cg@mail.gmail.com>
 <20190520193432.79cf132f@xps13>
In-Reply-To: <20190520193432.79cf132f@xps13>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 20 May 2019 13:51:19 -0400
Message-ID: <CAC=U0a2NzK_BS27eGd6i2f8sBxOsEYdg1ZdQNfmf7G3Tdo7bJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: raw: brcmnand: fallback to detected
 ecc-strength, ecc-step-size
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105131_557926_D6D51E27 
X-CRM114-Status: GOOD (  28.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTozNCBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEthbWFsLAo+Cj4gS2FtYWwgRGFzdSA8a2Rh
c3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMjAgTWF5IDIwMTkgMTM6MzE6NTIKPiAt
MDQwMDoKPgo+ID4gV2lsbCBtYWtlIHRoZSBjaGFuZ2VzIGFuZCBzZW5kIGEgVjIgcGF0Y2guCj4g
Pgo+ID4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgODo0NCBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgS2FtYWwsCj4gPiA+
Cj4gPiA+IEthbWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29tPiB3cm90ZSBvbiBGcmksIDE3
IE1heSAyMDE5IDE0OjI5OjU1Cj4gPiA+IC0wNDAwOgo+ID4gPgo+ID4gPiA+IFRoaXMgY2hhbmdl
IHN1cHBvcnRzIG5hbmQtZWNjLXN0ZXAtc2l6ZSBhbmQgbmFuZC1lY2Mtc3RyZW5naHQgZmllbGRz
IGluCj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJlbmd0aAo+ID4gPgo+ID4gPiA+IGJyY21uYW5kIGR0IG5vZGUgdG8g
YmUgIG9wdGlvbmFsLgo+ID4gPgo+ID4gPiAgICAgICAgICAgIERUICAgICAgICAgICAgXiBleHRy
YSBzcGFjZQo+ID4gPgo+ID4gPiA+IHNlZTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9icmNtLGJyY21uYW5kLnR4dAo+ID4gPiA+Cj4gPiA+ID4gSWYgYm90aCBuYW5kLWVj
Yy1zdHJlbmd0aCBhbmQgbmFuZC1lY2Mtc3RlcC1zaXplIGFyZSBub3Qgc3BlY2lmaWVkIGluCj4g
PiA+ID4gZGV2aWNlIHRyZWUgbm9kZSBmb3IgTkFORCwgbmFuZF9iYXNlIGRyaXZlciBkb2VzIGRl
dGVjdCBvbmZpIGV4dCBlY2MKPiA+ID4KPiA+ID4gcy9uYW5kX2Jhc2UgZHJpdmVyL3RoZSByYXcg
TkFORCBsYXllci8KPiA+ID4gcy9vbmZpL09ORkkvCj4gPiA+IHMvZWNjL0VDQy8KPiA+ID4KPiA+
ID4gV2hhdCBpcyAiZXh0Ij8gUGxlYXNlIHVzZSBwbGFpbiBFbmdsaXNoIGhlcmUuCj4gPiA+Cj4g
PiA+ID4gaW5mbyBmcm9tIE9ORkkgZXh0ZW5kZWQgcGFyYW1ldGVyIHBhZ2UgZm9yIHBhcnRzIHVz
aW5nIE9ORkkgPj0gMi4xLiBJbgo+ID4gPgo+ID4gPiBzL2luZm8vaW5mb3JtYXRpb24vCj4gPiA+
Cj4gPiA+ID4gY2FzZSBvZiBub24tb25maSBOQU5EIHRoZXJlIGNvdWxkIGJlIGEgbmFuZF9pZCB0
YWJsZSBlbnRyeSB3aXRoIHRoZSBlY2MKPiA+ID4KPiA+ID4gcy9lY2MvRUNDLwo+ID4gPgo+ID4g
PiA+IGluZm8uIElmIHRoZXJlIGlzIGEgdmFsaWQgIGRldmljZSB0cmVlIGVudHJ5IGZvciBuYW5k
LWVjYy1zdHJlbmd0aCBhbmQKPiA+ID4gPiBuYW5kLWVjYy1zdGVwLXNpemUgZmllbGRzIGl0IHN0
aWxsIHNoYWxsIG92ZXJyaWRlIHRoZSBkZXRlY3RlZCB2YWx1ZXMuCj4gPiA+ID4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4KPiA+ID4gPiAt
LS0KPiA+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDEw
ICsrKysrKysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiA+
ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4g
PiA+IGluZGV4IGNlMGI4ZmYuLmU5NjdiMzAgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+ID4gPiBAQCAtMjE0NCw2ICsyMTQ0LDE2
IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfc2V0dXBfZGV2KHN0cnVjdCBicmNtbmFuZF9ob3N0ICpo
b3N0KQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gICAgICAg
fQo+ID4gPiA+Cj4gPiA+ID4gKyAgICAgaWYgKCEoY2hpcC0+ZWNjLnNpemUgPiAwICYmIGNoaXAt
PmVjYy5zdHJlbmd0aCA+IDApICYmCj4gPiA+Cj4gPiA+IElzIHRoZSBjYXNlIHdoZXJlIG9ubHkg
c2l6ZSBPUiBzdHJlbmd0aCBpcyB2YWxpZCBoYW5kbGVkPwo+ID4KPiA+IEJvdGggc3RyZW5ndGgg
YW5kIG5lZWQgdG8gYmUgdmFsaWQsIGVsc2UgdGhlIGRyaXZlciB3aWxsIGJlaGF2ZSBsaWtlCj4g
PiBiZWZvcmUgYW5kIHdpbGwgZmFpbCB0aGUgcHJvYmUuCj4KPiBZZXMsIGJ1dCB5b3UgZG8gbm90
IGhhbmRsZSB0aGUgY2FzZSB3aGVuIGVpdGhlciBzdHJlbmd0aCBPUiBzaXplIGlzIG5vdAo+IHZh
bGlkIGJ1dCB0aGUgb3RoZXIgb25lIGlzLiBJcyBpdCBvbmUgcHVycG9zZT8KPgoKSWYgSSB1bmRl
cnN0YW5kIHlvdSB3YW50IG1lIHRvIHVzZSB0aGUgZm9sbG93aW5nIGNoZWNrOgoKaWYgKGVjYy0+
bW9kZSAhPSBOQU5EX0VDQ19OT05FICYmICghZWNjLT5zaXplIHx8ICFlY2MtPnN0cmVuZ3RoKSkg
ewppZiAoY2hpcC0+YmFzZS5lY2NyZXEuc3RlcF9zaXplICYmIGNoaXAtPmJhc2UuZWNjcmVxLnN0
cmVuZ3RoKSB7CiAgICAgLyogdXNlIHRoZSBiYXNlIHZhbHVlcyAqLwp9Cgo+ID4KPiA+ID4KPiA+
ID4gPiArICAgICAgICAgKGNoaXAtPmJhc2UuZWNjcmVxLnN0cmVuZ3RoID4gMCAmJgo+ID4gPiA+
ICsgICAgICAgICAgY2hpcC0+YmFzZS5lY2NyZXEuc3RlcF9zaXplID4gMCkpIHsKPiA+ID4gPiAr
ICAgICAgICAgICAgIC8qIHVzZSBkZXRlY3RlZCBlY2MgcGFyYW1ldGVycyAqLwo+ID4gPgo+ID4g
PiAgICAgICAgICAgICAgICAgICAgVXNlICAgICAgICAgIEVDQwo+ID4gPgo+ID4gPiA+ICsgICAg
ICAgICAgICAgY2hpcC0+ZWNjLnNpemUgPSBjaGlwLT5iYXNlLmVjY3JlcS5zdGVwX3NpemU7Cj4g
PiA+ID4gKyAgICAgICAgICAgICBjaGlwLT5lY2Muc3RyZW5ndGggPSBjaGlwLT5iYXNlLmVjY3Jl
cS5zdHJlbmd0aDsKPiA+ID4gPiArICAgICAgICAgICAgIHByX2luZm8oIlVzaW5nIGRldGVjdGVk
IG5hbmQtZWNjLXN0ZXAtc2l6ZSAlZCwgbmFuZC1lY2Mtc3RyZW5ndGggJWRcbiIsCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGNoaXAtPmVjYy5zaXplLCBjaGlwLT5lY2Muc3RyZW5ndGgp
Owo+ID4gPiA+ICsgICAgIH0KPiA+ID4gPiArCj4gPiA+ID4gICAgICAgc3dpdGNoIChjaGlwLT5l
Y2Muc2l6ZSkgewo+ID4gPiA+ICAgICAgIGNhc2UgNTEyOgo+ID4gPiA+ICAgICAgICAgICAgICAg
aWYgKGNoaXAtPmVjYy5hbGdvID09IE5BTkRfRUNDX0hBTU1JTkcpCj4gPiA+Cj4gPiA+Cj4gPiA+
IFRoYW5rcywKPiA+ID4gTWlxdcOobAo+ID4KPiA+IEthbWFsCj4KPgo+Cj4KPiBUaGFua3MsCj4g
TWlxdcOobAoKS2FtYWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
