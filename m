Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD6CC282D6
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiD9ZUL4Pu+k2tAKRIylF8q4U0wvTgA6LPl51eDgnt4=; b=1iFSQBhnco/VJw
	XFfRsKgP8ydliErmMo6ZOCXQTDZaZHBX9owdIOHA6rny/JLVaG1ow3ZJJMuK1d55Ib8CieF6b9N9w
	NnyIJ9056VJjoCWX8qaQlzZdSabjW+diQB6zvvP7GWn345BC0B4F4Ygc6dpJSe5JF5rxkNjMfqgi0
	KQ6o0yRrzHFhcp10wvnm0sSB6JCaJb52Tb56H+XIiMp/Dp746cKZB8Vrc3XzdKjFiM+Sq559o0Ypz
	jvuN+A8W+BKInsWfFqSIcoS+hTTmbVY3ljBjYvP6lYovt//4sUrj5ScQU4UaTeg4EL3d2vWku7IWo
	5rJBvi+8XAGz6KrcOWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6W-00000004ZJx-3Tnh;
	Tue, 04 Mar 2025 12:10:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQk3-00000004S7I-07WB
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 11:47:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e5050d19e9so6714080a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 04 Mar 2025 03:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741088837; x=1741693637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdKvt+9tQm2qCrt7oFiiWlWL0il6DJKlMTh/YLfvuGQ=;
        b=nPtMNIXoHTXddf16OszmyQNhPyJojxGnYm7LUMr8yFDSWHveRhppE3CF7kszoCN31O
         2+O7NoBN5hxmtLAnvd/y3pxpLXhuAV6M2Eo9NwWYG6++LqoSJew9P9lvl+fuXLY0JvPX
         cZY9oxlvqXIu5/uF69Ps/bpMowOSgNUEBpKAAv4vQ61jdNcaXRq2BMXIw+Qrh4qNoR8e
         FJGDuNqVCa8/NCkPFpdTPuMBajC6YmMxtobamOLAxrAGV69RZhE4aY5zFELtgpqrFTzq
         8cB5c7WhPq2cICCudbp3GbcwbhrVTbdTjcpadjzvvPmtbXl5VfXeKi55983ULv7UJ8i8
         6cHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088837; x=1741693637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdKvt+9tQm2qCrt7oFiiWlWL0il6DJKlMTh/YLfvuGQ=;
        b=ElKuLfbUl29kg3aZy2wp3Tcv05JM/IIU27YM2gS+AOkNOI3Bi0NWzmLz4aYm5Cvub6
         xdLI4dsp4koMb/Y6R/JeY0dSKAoW4oCbWy73nkJPKPQj5v7bilfrWyaP2rN7cXtOrM2I
         zp0+KMUi0//k7T+hYvu5KToVrlCWNdS7941SPy/sWqdUd691lIOfyBKT2LY3WC50HYI5
         ObY4laC3cEqbGgvSY/lq8wOL0fIJoysrxctxSwc9iCNSSSS7x85q6xFi6kTSB0YC55kg
         I6b2Yoo5ySg297fKgVi7QoHgi1BSJh0HweMu5b/MqirI0PbmlFz8TZWQvIO3osfO2JxF
         FwDw==
X-Forwarded-Encrypted: i=1; AJvYcCV2nUzmFkFe+cqRqNhDKpmJ9sl+6o2cHgGtZTWfp9JHfc5uVYEwuZy7uoK48HIhJlPPr4KZL6obrMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAdWiJxnOBRF7IK7a+93cr8oJFnqg22AwGJ1pEng68sSd7AYIx
	PZ/dblbF6TEspYhlu1nuW9jAuHtSRYQBFTzksUzdzJ4d8W7Q202QIZa20FE1Meuuw6uJvx+lrJk
	s6LXQG7Y79F8jocwWg04uml7d8Ak=
X-Gm-Gg: ASbGncsOm26XrvU80z2oxUOZY2PtEcZEDu2OCFuXfRwukt7xi+J8maXXyUr9wedEb23
	ibVXGTkLxIkKP3d1Si3+cECTLDicl/gO6eTjAS5eLuvKngT0VHhWfklmDMpa52bwZghE/4QDP50
	dQUcxYmnHbrp93/rQ35i+ADEjxVZg=
X-Google-Smtp-Source: AGHT+IHeNVeHFv5jhJzVjg4LB/54QEae2d+Sjnh6QpxFmgh5nNZje3z8A3cZOjJzWmEkVq/tu0ZnH8vGN0maF/68lR0=
X-Received: by 2002:a05:6402:348f:b0:5dc:94ce:42a6 with SMTP id
 4fb4d7f45d1cf-5e4d6b4b980mr19108890a12.22.1741088836597; Tue, 04 Mar 2025
 03:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
 <20250121-loongson1-nand-v12-2-53507999de39@gmail.com> <87tt972dt0.fsf@bootlin.com>
In-Reply-To: <87tt972dt0.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 4 Mar 2025 19:46:39 +0800
X-Gm-Features: AQ5f1JrHSph0iUHkN40CrLh0rv6H1WjLXzdy0jpcSWywGhbQqeTnmVuEIdx_gPs
Message-ID: <CAJhJPsUw7YGKfBuFtUirOGuCA9hV6e-wjrL4L9b-5kmuVUW=ow@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_034719_068382_FD23812B 
X-CRM114-Status: GOOD (  17.04  )
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

SGVsbG8gTWlxdWVsLAoKT24gRnJpLCBGZWIgNywgMjAyNSBhdCAxOjE34oCvQU0gTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+ID4g
K3N0YXRpYyBpbmxpbmUgaW50IGxzMXhfbmFuZF9jaGVja19vcChzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwLCBjb25zdAo+ID4gIHN0cnVjdCBuYW5kX29wZXJhdGlvbiAqb3ApCj4KPiBObyBpbmxpbmUg
ZnVuY3Rpb24gaW4gYSBjIGZpbGUuCj4KPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgbHMxeF9uYW5k
X2hvc3QgKmhvc3QgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gPiArICAgICBj
b25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIxID0gTlVMTCwgKmluc3RyMiA9IE5VTEw7
Cj4gPiArICAgICBpbnQgb3BfaWQ7Cj4gPiArCj4gPiArICAgICBmb3IgKG9wX2lkID0gMDsgb3Bf
aWQgPCBvcC0+bmluc3Ryczsgb3BfaWQrKykgewo+ID4gKyAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIgPSAmb3AtPmluc3Ryc1tvcF9pZF07Cj4gPiArCj4gPiAr
ICAgICAgICAgICAgIGlmIChpbnN0ci0+dHlwZSA9PSBOQU5EX09QX0NNRF9JTlNUUikgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGlmICghaW5zdHIxKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW5zdHIxID0gaW5zdHI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZWxz
ZSBpZiAoIWluc3RyMikKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc3RyMiA9
IGluc3RyOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4g
PiArCj4gPiArICAgICBpZiAoIWluc3RyMSB8fCAhaW5zdHIyKQo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gMDsKPgo+IElzIHRoaXMgZXhwZWN0ZWQ/Cj4KPiA+ICsKPiA+ICsgICAgIGlmIChpbnN0
cjEtPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1JORE9VVCAmJgo+ID4gKyAgICAgICAgIGlu
c3RyMi0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfUk5ET1VUU1RBUlQpCj4gPiArICAgICAg
ICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgaWYgKGluc3RyMS0+Y3R4LmNtZC5vcGNv
ZGUgPT0gTkFORF9DTURfUkVBRDAgJiYKPiA+ICsgICAgICAgICBpbnN0cjItPmN0eC5jbWQub3Bj
b2RlID09IE5BTkRfQ01EX1JFQURTVEFSVCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
PiArCj4gPiArICAgICBpZiAoaW5zdHIxLT5jdHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9FUkFT
RTEgJiYKPiA+ICsgICAgICAgICBpbnN0cjItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX0VS
QVNFMikKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiArICAgICBpZiAoaW5z
dHIxLT5jdHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9TRVFJTiAmJgo+ID4gKyAgICAgICAgIGlu
c3RyMi0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfUEFHRVBST0cpCj4gPiArICAgICAgICAg
ICAgIHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgZGV2X2Vycihob3N0LT5kZXYsICJ1bnN1cHBv
cnRlZCBvcGNvZGUgc2VxdWVuY2U6ICV4ICV4IiwKPiA+ICsgICAgICAgICAgICAgaW5zdHIxLT5j
dHguY21kLm9wY29kZSwgaW5zdHIyLT5jdHguY21kLm9wY29kZSk7Cj4gPiArCj4gPiArICAgICBy
ZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgbHMxeF9uYW5k
X2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlvbiAqb3AsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sIGNoZWNrX29ubHkpCj4gPiArewo+ID4gKyAgICAgaW50IHJldDsK
PiA+ICsKPgo+ICAgICAgICAgaWYgKGNoZWNrX29ubHkpID8KClNvcnJ5LCBJJ20gbm90IHN1cmUg
aWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS4KbmFuZF9vcF9wYXJzZXJfZXhlY19vcCgpIG9ubHkg
Y2hlY2tzIHBhdHRlcm5zIGFuZCB3aWxsIHNraXAKcGF0dGVybi0+ZXhlYygpIHdoZW4gY2hlY2tf
b25seSA9IHRydWUuIFRoZXJlZm9yZSwKbHMxeF9uYW5kX2NoZWNrX29wKCkgc2hvdWxkIGhhbmRs
ZSBhbGwgb3Bjb2RlIGNoZWNrcyBpbiB0aGF0IGNhc2UsIGFuZApsZWF2ZSBjaGVja19vbmx5ID0g
ZmFsc2UgdG8gbmFuZF9vcF9wYXJzZXJfZXhlY19vcCgpLgpUaGVuIHRoZSBjb2RlIHdpbGwgcmV0
dXJuIHRvOgoKaWYgKGNoZWNrX29ubHkpCiAgICAgICAgcmV0dXJuIGxzMXhfbmFuZF9jaGVja19v
cChjaGlwLCBvcCk7CgpyZXR1cm4gbmFuZF9vcF9wYXJzZXJfZXhlY19vcChjaGlwLCAmbHMxeF9u
YW5kX29wX3BhcnNlciwgb3AsIGNoZWNrX29ubHkpOwoKQW0gSSByaWdodD8KCj4gPiArICAgICBy
ZXQgPSBsczF4X25hbmRfY2hlY2tfb3AoY2hpcCwgb3ApOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBuYW5kX29w
X3BhcnNlcl9leGVjX29wKGNoaXAsICZsczF4X25hbmRfb3BfcGFyc2VyLCBvcCwgY2hlY2tfb25s
eSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgbmFuZF9lY2Nf
YWxnb3NbXSA9IHsKPiA+ICsgICAgIFtOQU5EX0VDQ19BTEdPX1VOS05PV05dID0gIm5vbmUiLAo+
ID4gKyAgICAgW05BTkRfRUNDX0FMR09fSEFNTUlOR10gPSAiaGFtbWluZyIsCj4gPiArICAgICBb
TkFORF9FQ0NfQUxHT19CQ0hdID0gImJjaCIsCj4gPiArfTsKPgo+IE5vIHdheSB5b3UgbmVlZCB0
aGlzIGluIHlvdXIgZHJpdmVyIDotKQo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCgoKLS0gCkJlc3Qg
cmVnYXJkcywKCktlZ3VhbmcgWmhhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
