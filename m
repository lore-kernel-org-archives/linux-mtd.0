Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0663C47422
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 18:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjTgwH40tEY1njzHwsCax/Rsbfx7g7JPj5xazFrk7/c=; b=o1Gy3+irgcFSgL
	Qt+2A5fmYXARYISu3Njlib8NXZ1eUOR5QrASRIKLxk/KdDLY9fW/ulcjTXMl1DkVeDv+RNN4TxZae
	dQDwY0WeBu9+2d12/vTf6D29WOC+PNQgjKwHS/fTBRGElf94J6HQyLT9qtAe/dypqRAPBKl8Spq03
	lU/qieO7HoEK1LDk8Zpkqn4bfyiYXCqpfLRNcFwL8tviHzbRtbeBPXbH6i1RVjXsnZBU2TrztHoWO
	aUV/sMKQgJbs9t12sT5Lr6lXbEjUQ7LRMkokgaIqvEKI3zriLIU/cBu5VoriDnp6cBGIJqdav9FHF
	+pCOXbJYzgf1oDi66V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4lE-00000001QiH-3KiP;
	Thu, 25 Jan 2024 18:47:36 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4lA-00000001Qg6-3mHI
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 18:47:35 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6ddf26eba3cso4596472a34.0
        for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2024 10:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706208449; x=1706813249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttNcHqhpvqsqcpLQNkj3//EbIezpIbk0mMweN0OSVS8=;
        b=FAL0Wu2lcOpTyPK8TOGcOjZDrnqszImkstFj+OJ8Dk8PF9dmqJpwjzQC8kiBkRTtgu
         50IMe01ftFj1AVTOfHtJ0vCaDwTpxUWg6qRC4JWtObPtIVOIu87gRqRuIHZzQkENCqsi
         xWlrHZozjt/V7zINVFXdw8SFdol1naenG7Ejw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706208449; x=1706813249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttNcHqhpvqsqcpLQNkj3//EbIezpIbk0mMweN0OSVS8=;
        b=dcw5Lzs6udNRzgNVAP88qSdtyANtQ/JMxDjInS2ommX0t+EZFmIiYXZorbouvmyzp3
         DmLCoXkN3WhVH19Z6NbM+9DpEt3P5yuTcg36gDluf//Uh968BKxlhrdVjzoYbIQ17/PQ
         M387DqATAccfK0/TYGcUHCJzMKNScZ8He2s60qtMK5nsHRiq3mFPRQrfh7TPJSQBv2Tw
         JLk/+jLTzs2/a/ajjNb0OSmevksZKdFvCMFrmBzdbt5WtUHPSQtRs2kRNlHWcNyC46+0
         jUYrR8hJa0TwQx5XXzs6dNfrwJ+R9FAaVjitVf9BvAg8CYtd1noblutddgKxyQZEQxq9
         MugQ==
X-Gm-Message-State: AOJu0Yxaza28SmVMqFBqV/U35Yl4dg+ZP5iXgCZvPZjx+pmxMmvDQPA7
	x01rcQ32UsBNugDMOxAffAEPhJ1fS51yzZ7zYoMEtD8Z2YUxV0GVQeQNmYOZACl7u1IcJCjJlNg
	8xRaWdgr/LMPwArWrAvoPskUvIKlRdENj/hhe
X-Google-Smtp-Source: AGHT+IEMzhey6Q+f69HKEUNoCFK5af03wKnBO6EmvVB6elV2DQ5+0JR9R9FQljOPHjmgwhSK7ddkYo7su0eyg544RPc=
X-Received: by 2002:a05:6830:116:b0:6dd:ec86:b4c3 with SMTP id
 i22-20020a056830011600b006ddec86b4c3mr215290otp.65.1706208448903; Thu, 25 Jan
 2024 10:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20240124030458.98408-1-dregan@broadcom.com> <20240124030458.98408-10-dregan@broadcom.com>
 <20240124183706.0af8fb90@xps-13>
In-Reply-To: <20240124183706.0af8fb90@xps-13>
From: David Regan <dregan@broadcom.com>
Date: Thu, 25 Jan 2024 10:47:18 -0800
Message-ID: <CAA_RMS6VeAmJUYxVYknYrcf5vVWGzEx3npSpSujFhKKL15zjVA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] mtd: rawnand: brcmnand: update log level messages
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Regan <dregan@broadcom.com>, dregan@mail.com, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	computersforpeace@gmail.com, kdasu.kdev@gmail.com, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Peshkin <joel.peshkin@broadcom.com>, 
	Tomer Yacoby <tomer.yacoby@broadcom.com>, Dan Beygelman <dan.beygelman@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com, 
	andre.przywara@arm.com, baruch@tkos.co.il, 
	linux-arm-kernel@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_104733_093868_F26DC0CA 
X-CRM114-Status: GOOD (  24.43  )
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

T24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgOTozN+KAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2aWQsCj4KPiBkcmVnYW5AYnJvYWRj
b20uY29tIHdyb3RlIG9uIFR1ZSwgMjMgSmFuIDIwMjQgMTk6MDQ6NTcgLTA4MDA6Cj4KPiA+IFVw
ZGF0ZSBsb2cgbGV2ZWwgbWVzc2FnZXMgc28gdGhhdCBtb3JlIGNyaXRpY2FsIG1lc3NhZ2VzCj4g
PiBjYW4gYmUgc2Vlbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2Fu
QGJyb2FkY29tLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpo
YW5nQGJyb2FkY29tLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+ID4gLS0t
Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBBZGRlZCB0byBwYXRjaCBzZXJpZXMKPiA+IC0tLQo+
ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA2ICsrKy0tLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiBpbmRleCA2YjVk
NzZlZmYwZWMuLmE0ZTMxMWI2Nzk4YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMKPiA+IEBAIC0xMTQzLDcgKzExNDMsNyBAQCBzdGF0aWMgaW50IGJj
bW5hbmRfY3RybF9wb2xsX3N0YXR1cyhzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCwKPiA+ICAg
ICAgIGlmICgodmFsICYgbWFzaykgPT0gZXhwZWN0ZWRfdmFsKQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiA+Cj4gPiAtICAgICBkZXZfd2FybihjdHJsLT5kZXYsICJ0aW1lb3V0IG9uIHN0
YXR1cyBwb2xsIChleHBlY3RlZCAleCBnb3QgJXgpXG4iLAo+ID4gKyAgICAgZGV2X2VycihjdHJs
LT5kZXYsICJ0aW1lb3V0IG9uIHN0YXR1cyBwb2xsIChleHBlY3RlZCAleCBnb3QgJXgpXG4iLAo+
Cj4gSSBkb24ndCBzZWUgdGhlIHBvaW50IGJ1dCBpZiB5b3Ugd2FudC4KPgo+ID4gICAgICAgICAg
ICAgICAgZXhwZWN0ZWRfdmFsLCB2YWwgJiBtYXNrKTsKPiA+Cj4gPiAgICAgICByZXR1cm4gLUVU
SU1FRE9VVDsKPiA+IEBAIC0yMTk2LDcgKzIxOTYsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3Jl
YWQoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4gICAgICAgICAgICAgICB9
Cj4gPgo+ID4gLSAgICAgICAgICAgICBkZXZfZGJnKGN0cmwtPmRldiwgInVuY29ycmVjdGFibGUg
ZXJyb3IgYXQgMHglbGx4XG4iLAo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKGN0cmwtPmRldiwg
InVuY29ycmVjdGFibGUgZXJyb3IgYXQgMHglbGx4XG4iLAo+Cj4gVXBwZXIgbGF5ZXIgd2lsbCBj
b21wbGFpbiwgeW91IGNhbiBrZWVwIHRoaXMgYXQgdGhlIGRlYnVnIGxldmVsLgoKSSd2ZSBkaXNj
b3ZlcmVkIHRoYXQgdGhlIHVwcGVyIGxheWVyIHdpbGwgY29tcGxhaW4sIGJ1dCB0eXBpY2FsbHkK
d2l0aCBpbmZvcm1hdGlvbiB0aGF0IGlzIG1heWJlIG5vdCB1c2VmdWwgZm9yIGRlYnVnZ2luZy4K
Cj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKWVycl9hZGRy
KTsKPiA+ICAgICAgICAgICAgICAgbXRkLT5lY2Nfc3RhdHMuZmFpbGVkKys7Cj4gPiAgICAgICAg
ICAgICAgIC8qIE5BTkQgbGF5ZXIgZXhwZWN0cyB6ZXJvIG9uIEVDQyBlcnJvcnMgKi8KPiA+IEBA
IC0yMjExLDcgKzIyMTEsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3JlYWQoc3RydWN0IG10ZF9p
bmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgZXJyID0gYnJjbW5hbmRfcmVhZF9ieV9waW8obXRkLCBjaGlwLCBhZGRyLCB0cmFucywgYnVm
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9v
YiwgJmVycl9hZGRyKTsKPiA+Cj4gPiAtICAgICAgICAgICAgIGRldl9kYmcoY3RybC0+ZGV2LCAi
Y29ycmVjdGVkIGVycm9yIGF0IDB4JWxseFxuIiwKPiA+ICsgICAgICAgICAgICAgZGV2X2luZm8o
Y3RybC0+ZGV2LCAiY29ycmVjdGVkIGVycm9yIGF0IDB4JWxseFxuIiwKPgo+IERlZmluaXRlbHkg
bm90ISBXYXkgdG9vIHZlcmJvc2UuIFBsZWFzZSBrZWVwIHRoaXMgb25lIGFzIGl0IGlzLgoKb2sK
Cj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKWVycl9hZGRy
KTsKPiA+ICAgICAgICAgICAgICAgbXRkLT5lY2Nfc3RhdHMuY29ycmVjdGVkICs9IGNvcnJlY3Rl
ZDsKPiA+ICAgICAgICAgICAgICAgLyogQWx3YXlzIGV4Y2VlZCB0aGUgc29mdHdhcmUtaW1wb3Nl
ZCB0aHJlc2hvbGQgKi8KPgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcyEKCi1EYXZlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
