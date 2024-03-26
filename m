Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBFECD11DD
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnr4/0wNQQuuW5TdkF6/BsAb3xWfxSY+95HzIzjAsm0=; b=XYf3m6OzEn3hZF
	7/BVqmMyVOk8nuB8HWuN1C2crjS1U60GATc7NNqY65oaYVquLhabe7BZ0lM1fE90uOlG+G6GBamNn
	3HlxGmC1Cy0TNPmAeVr7uQxlZREIT81dleFutSvwZU67JRZNIRMvNHpvWmCc2BOMwfvm9r4JohAsT
	p7bvYCwHm34QTj/a3kwcX2YPNsDTf0HviCEJ5/knh1fGRYTgyyoG7UY2AhLEMfAogVFTSG576g0ky
	Ip/tQbJFvFT9tRd02UFron7Q8N0WIrxtAhbzRq5SRh0exiePjdzFFMS7dFTxQKrAbw2O7rzOixSf6
	ibD34OR0Tg2fapsqxN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp77N-00000004k90-3FEB;
	Tue, 26 Mar 2024 13:45:33 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp777-00000004k5G-1HcT
	for linux-mtd@lists.infradead.org;
	Tue, 26 Mar 2024 13:45:31 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4766e56ccccso2177437137.0
        for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2024 06:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711460715; x=1712065515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6CFIsPoIauKZBqshqHp0Tfq5JZS7/GYw0tJCvyXUDs=;
        b=B4vcZEwf4pxcONu21l4UqWxTaKPS7mqCiz5HZ4o8RXHYTpFJSN+u5vK918z0TENGVn
         bSbpqSlIZxr3egIG0AGtA3p1X97fAlM0FkB+okvqu7qFVfDJPtxafD/Hul1PEAKJ0kwj
         ZJ5RByeL3VuCM376/RyBG+HISxJFAW6BpWn+HvQt9xDYzq3yzvaYnGeb0fxQgEe1bH5y
         Q1LtqIwqWmbg+gE47Lr5ym1XFtGF+UMvbww5WNhvYk8KUqI20IXOvqVNGAHtxyt3ytjU
         4JNOge6RixH4vBqzU4rE6R+09/NOAiCmuseOEYfSiWxXq5yMoVBoRkhixS35dFwfU2rh
         QJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711460715; x=1712065515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6CFIsPoIauKZBqshqHp0Tfq5JZS7/GYw0tJCvyXUDs=;
        b=U82k2bi7FoVxPYrWea9mAAHkesmSHYmq2OZ6k+hF/v94Kh5Vwk565YFSMEZY5gNec7
         29MB1d5bO2ThC3Fh6sfeyCvgUNtthGRHJ9+SHiM7BSGTraugwGMmvvfk7ACQhmg2KlD4
         Wxv82R3ejL8FmhyCtnrFp+BYepXOdz5fg8ZKEYYW+rnkF4kYQYDjOpZM0blFRbJXLuVI
         Mxo5h9sgAsaSXHOP+40b2IATb8dqMZuhHJwjmNtasmHS1G7ezMNskmNzRDiXwbqgRmcj
         bI31YanEZNssI5kensay+lhgySGYyPeOMfVYhGBhZULZfDxjXh/HZ0OEv0zni/nwfLK/
         lWmg==
X-Forwarded-Encrypted: i=1; AJvYcCVu+7S+6PRWh3YmHaKQ1nnUf8Sq2fY0XTw0HlkXnaMyVyhh9YsSFDZWiGv9cznIfkpW4aXAKkL1/RtC7uKUkNeHS8EL/WHJTKNa4mqEWA==
X-Gm-Message-State: AOJu0YxuTYvtN5DOZ9WCBkIKbQB5TsVWOWOE58HxbiLQ9T0bWNd7ACrX
	ZX0fTmS/EIjAbt3pkipVUN5OkcsNjCglHzAdjvvWtob3GUmQHHNjULTR/nWdUCpquEWx7mO5ToI
	D9lNYIYeJjWbq+mcSWhXTugjtroo=
X-Google-Smtp-Source: AGHT+IFqrJNEWrzG0Ero6le2NPrqt+W43On//IsUbutGmw0oFdEgRJQtpdc4g0hsPnwoTFqxsW6rxIESkWheoE6P8bg=
X-Received: by 2002:a05:6102:358a:b0:478:2bfd:2e53 with SMTP id
 h10-20020a056102358a00b004782bfd2e53mr2021666vsu.27.1711460714592; Tue, 26
 Mar 2024 06:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjQPo8hoawK73H7FOVitQHp21HHODExO+7cguGrtURKWg@mail.gmail.com>
 <321330094.101965.1711390802883.JavaMail.zimbra@nod.at>
In-Reply-To: <321330094.101965.1711390802883.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 26 Mar 2024 19:15:03 +0530
Message-ID: <CAOuPNLik9B0spBUYOVSekAns+zf=-zemit=DoVt0r6Us71p=Gw@mail.gmail.com>
Subject: Re: linux-mtd: ubiattach taking long time
To: Richard Weinberger <richard@nod.at>
Cc: linux-fsdevel@kvack.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
	Richard Weinberger <richard.weinberger@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_064517_560662_D3C8703E 
X-CRM114-Status: GOOD (  17.86  )
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

RGVhciBSaWNoYXJkLCBUaGFuayB5b3Ugc28gbXVjaCBmb3IgeW91ciByZXBseS4gUGxlYXNlIGZp
bmQgc29tZQpjb21tZW50cyBpbmxpbmUuCgpPbiBNb24sIDI1IE1hciAyMDI0IGF0IDIzOjUwLCBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IFBpbnR1LAo+Cj4g
LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gVm9uOiAiUGludHUgQWdhcndhbCIg
PHBpbnR1LnBpbmdAZ21haWwuY29tPgo+ID4gSSBoYXZlIHRyaWVkIHVzaW5nIGZhc3RtYXAgYXMg
d2VsbCwgYnV0IHN0aWxsIG5vIGRpZmZlcmVuY2UuCj4gPiBBcmUgdGhlcmUgYW55IG90aGVyIHRl
Y2huaXF1ZXMgdG8gaW1wcm92ZSB0aGUgdWJpYXR0YWNoIHRpbWluZyA/Cj4gPgo+ID4gTG9nczoK
PiA+IC0tLS0tLS0tLS0KPiA+IERvaW5nIGZyb20gaW5pdHJhbWZzOgo+ID4ge3t7Cj4gPiBbICAg
IDYuOTQ5MTQzXVsgIFQyMTRdIHViaTA6IGF0dGFjaGluZyBtdGQ1NAo+ID4gWyAgICA4LjAyMzc2
Nl1bICBUMjE0XSB1YmkwOiBzY2FubmluZyBpcyBmaW5pc2hlZAo+Cj4gTm8gZmFzdG1hcCBhdHRh
Y2ggaGVyZS4KPgo+IE1ha2Ugc3VyZSB0byBzZXQgZm1fYXV0b2NvbnZlcnQ6Cj4gaHR0cDovL3d3
dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpLmh0bWwjTF9mYXN0bWFwCj4gSWYgc2V0
LCBVQkkgY3JlYXRlIGFmdGVyIGEgZmV3IHdyaXRlcyBhIGZhc3RtYXAuCj4KWWVzLCBJIGhhdmUg
c2V0IGZtX2F1dG9jb252ZXJ0PTEgb24gY21kbGluZSBhbmQgZW5hYmxlZCBmYXN0bWFwIG9uIHRo
ZQpvdGhlciBsb2dzLgp7e3sKWyAgICAwLjAwMDAwMF1bICAgIFQwXSBLZXJuZWwgY29tbWFuZCBs
aW5lOiAuLi4gZm1fYXV0b2NvbnZlcnQ9MQp1YmkubXRkPTU0LDAsMzAgLi4uClsuLi5dClsgICAg
Ni43MDI4MTddWyAgICBUMV0gdWJpMDogZGVmYXVsdCBmYXN0bWFwIHBvb2wgc2l6ZTogMTcwClsg
ICAgNi43MDI4MjJdWyAgICBUMV0gdWJpMDogZGVmYXVsdCBmYXN0bWFwIFdMIHBvb2wgc2l6ZTog
ODUKWyAgICA2LjcwMjgyNl1bICAgIFQxXSB1YmkwOiBhdHRhY2hpbmcgbXRkNTQKW+KApl0KWyAg
ICA3Ljc4NDk1NV1bICAgIFQxXSB1YmkwOiBzY2FubmluZyBpcyBmaW5pc2hlZApbICAgIDcuNzk3
MTM1XVsgICAgVDFdIHViaTA6IGF0dGFjaGVkIG10ZDU0IChuYW1lICJzeXN0ZW0iLCBzaXplIDg2
NyBNaUIpCn19fQpJcyB0aGVyZSBhbnl0aGluZyBtaXNzaW5nIGhlcmUgPwpDYW4gd2UgaW5jcmVh
c2UgdGhlIHBvb2wgc2l6ZSA/IFdpbGwgaXQgaGVscCB0byBpbXByb3ZlIHRoZSB0aW1pbmcgPwoK
PiBTcGVha2luZyBvZiBvdGhlciB0ZWNobmlxdWVzLCB5b3UgY2FuIGltcHJvdmUgc2Nhbm5pbmcg
dGltZSBhbHNvIGJ5Cj4gdHVuaW5nIFVCSSBmb3IgeW91ciBOQU5EIGNvbnRyb2xsZXIvc2V0dXAu
Cj4gRS5nLiB0cmFuc2ZlcnJpbmcgb25seSB0aGUgYW1vdW50IG9mIGJ5dGVzIG5lZWRlZCBmb3Ig
YW4gaGVhZGVyLgo+IE9yIHJlYWRpbmcgd2l0aG91dCBFQ0MgYW5kIHJlLXJlYWRpbmcgd2l0aCBF
Q0MgaWYgdGhlIGhlYWRlciBDUkMtY2hlY2sgZmFpbHMuCj4KU29ycnksIEkgY291bGQgbm90IGdl
dCB0aGlzIGZ1bGx5LgpJcyBpdCBwb3NzaWJsZSB0byBlbGFib3JhdGUgbW9yZSB3aXRoIHNvbWUg
cmVmZXJlbmNlID8KRG8gd2UgaGF2ZSBzb21lIHNwZWNpYWwgY29tbWFuZHMvcGFyYW1ldGVycyB0
byBkbyBpdCBpZiB3ZSB1c2UgaW5pdHJhbWZzID8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
