Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5FACF8857
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6v7ty0ggorouZvGznT18bOKjGDCZqrP1Rf5Xk7nq+p4=; b=mlcWPLsg5bw5wM
	Cgq1fMTVq2BhVGL5eR5XhzJAgN/ymQRkjIysKnz0+/7pP1TZEoH7mqDgjmQ+9dHD8IVVQCkKHOSP7
	JAVtLHy2zSRuGWoja8DBeTnJY/6Xtrpg1yU/dxILUdKx1PN8BBTIxXWaUbjY3yFfqWeEtMnG8OUP7
	DeHJ3x9iuSXw0qdpqAJBh2AcHSrubBflQxRO8oIvfKN2dw9cEcgpaxpD9JW2VKNyDIGWZKkyYKmZN
	87Gq8qGJo4Z84Lwrlt4DgtZzMGzhoE7OY2ptZlTud7IBNl0cucJaWd70m3P1TsQz+gdWy5sDo0CkM
	Y9OxuFJLCbv4ODFlOtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swojb-0000000E67I-1bTz;
	Fri, 04 Oct 2024 20:17:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnbY-0000000Dowg-0VO4;
	Fri, 04 Oct 2024 19:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=; b=RJ2LnklGF1Fw7+oucTXKLqyVKl
	lBweDFp1A6G40dexxEAbW5xrm002ht6fY6vr3ru7txjuzf55xf6Ce7XgYBHYwwROKFyUSmrY7bswz
	vYk/COS0iCQvJ3TfnQNotFRuGafqPlM2DAtpHEGNbLoW/SEKj/xzE0QQjE/Dg67LJxj+0QtCWH2aA
	g74wubNGuLUQ+7ihRiCotZbYysGiGVci0zd6FHicP4mFK0wlCl40I06I3PV1xpm572SM4w6kvF023
	5yeswmYFghOWf/ELL1jKKBMhETTZs2uu+QHVXXvqLjAbvZ8W5/5+inFJlPk3R+/PFCNrw+bU+/0mw
	G7ScPuRA==;
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnbU-00000003uPb-3bbq;
	Fri, 04 Oct 2024 19:04:42 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6e129c01b04so21546987b3.1;
        Fri, 04 Oct 2024 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728068677; x=1728673477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=;
        b=LWLH3KWiND0kyFsxU2wDJ5twWG6f3A2p84R9QaSNja4h5SjWjs1GDev2bR9loAU6yf
         GA6Wyacvm+ibVL9JO1UQJwDB09yXp2OjNCxrPD6/y7ngFGSTk6M2xfjw/Z4MXQVX/r18
         fN807zF3Tar7++ZNfv81yUc4WmK+//DznohjvXs0MOcOnLRg3a6g6mzC2ssNpwaOhuza
         NT8uKDNNQ9f7NTl9w8Whc2LEvyy0kEy7dkmOMhz6jbyahcooSVVCx9fxvvh0a5XG5NMR
         /nuhDu+GJgSTlNpRBU0m+QVtuCgtD9xLsSW6Dvh7juUNTh0k5RhErHpMaPNaSVMjohjK
         DwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728068677; x=1728673477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=;
        b=MAs8ViCYwXkD9SnaQKpO48sfL+KpDKD00sNZWXqln7uWbSwp+ky863nWguov8mhCN9
         BcL3pnNz5mEgjymKl+ovZT+4g0sdJF8P6BqiXnf5R8Z2U7BJoQIJcwyx2KkpvaP7Iekn
         vbxRZM1U1Ss+qF+SQQL9k358cmIX+JaZ/emC/Kfg9s1S1aY3PbadDxE54FllWErfSqq2
         NJCwAMLQmEh7jMSUYqIZ6akEqv4aPU8zONhB/kxfR4fSzx4S0dq/ktHrkPjHI+bTqXhj
         U6dZHCGiGKd0VF5vVSnA+oF5iVcO3T+ICnQ08wS1iAaDCgrzZxbfjmirvEYxwmZ59clD
         unAg==
X-Forwarded-Encrypted: i=1; AJvYcCUdAgsP2lMUYQes416EES2Omev+ZdFwyDtuaeeyed0VEbm/H1q+LXGp7OprA9EAv8UoFsH4ed5USTEqwfPHGUM=@lists.infradead.org, AJvYcCVQAXjj0a+j50rhAi80JnY8XCNrl8uI/dUg0fab9GnqNVQ4bjpkQgA3j+CU93NEcCH2eDG59yU5sZ4q@lists.infradead.org, AJvYcCX+B4OeTTugjk4wm8N/ziYFXqir8DVLAiS2NS8bUr5ipReqP8dWs9eZIFgfsw7H+/POJkAHaxmTa2zZzUYbiwXp@lists.infradead.org
X-Gm-Message-State: AOJu0YwiVwBSzpLO4ltHb5NwxKh+1tkG+G69CByH6JTLFjVKbOFa8LV3
	ZiHI7iUgd5CHt1ss43wp00QYyD21B+VQXbJDLpj+HwvszNw7EBERgWRh6RwNAu8ouYh+1bPB9lf
	GXRxTXy5CuZc3ZKxfImK0DJqVbYA=
X-Google-Smtp-Source: AGHT+IH9scQLWNqJQHayBVbx3/oOvir8TuLyhF6I1u9sp0NdVUUfeeiiIOFw8tGmDwqe/ZpBUA1tc6SRGklljrBAiUA=
X-Received: by 2002:a05:690c:6813:b0:6e2:2600:ed86 with SMTP id
 00721157ae682-6e2c72f779cmr34932837b3.45.1728068677613; Fri, 04 Oct 2024
 12:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241004000015.544297-1-rosenp@gmail.com> <20241004000015.544297-6-rosenp@gmail.com>
 <39dcfa4b-1a22-4296-b190-ac39480d034a@kernel.org>
In-Reply-To: <39dcfa4b-1a22-4296-b190-ac39480d034a@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Oct 2024 12:04:26 -0700
Message-ID: <CAKxU2N9-DxfsANMfT8DZ-LuKJ3bqjckyfd=+Lg_qtRn985BuoQ@mail.gmail.com>
Subject: Re: [PATCHv2 5/5] documentation: use nvmem-layout in examples
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"moderated list:BROADCOM BCMBCA ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_200441_004120_0647E753 
X-CRM114-Status: GOOD (  18.95  )
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

T24gVGh1LCBPY3QgMywgMjAyNCBhdCAxMToyNeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAwNC8xMC8yMDI0IDAyOjAwLCBSb3NlbiBQZW5l
diB3cm90ZToKPiA+IG52bWVtLWNlbGxzIGFyZSBkZXByZWNhdGVkIGFuZCByZXBsYWNlZCB3aXRo
IG52bWVtLWxheW91dC4gRm9yIHRoZXNlCj4gPiBleGFtcGxlcywgcmVwbGFjZS4gVGhleSdyZSBu
b3QgcmVsZXZhbnQgdG8gdGhlIG1haW4gcG9pbnQgb2YgdGhlCj4gPiBkb2N1bWVudCBhbnl3YXku
Cj4KPiBQbGVhc2UgdXNlIHN1YmplY3QgcHJlZml4ZXMgbWF0Y2hpbmcgdGhlIHN1YnN5c3RlbS4g
WW91IGNhbiBnZXQgdGhlbSBmb3IKPiBleGFtcGxlIHdpdGggYGdpdCBsb2cgLS1vbmVsaW5lIC0t
IERJUkVDVE9SWV9PUl9GSUxFYCBvbiB0aGUgZGlyZWN0b3J5Cj4geW91ciBwYXRjaCBpcyB0b3Vj
aGluZy4gRm9yIGJpbmRpbmdzLCB0aGUgcHJlZmVycmVkIHN1YmplY3RzIGFyZQo+IGV4cGxhaW5l
ZCBoZXJlOgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2RldmljZXRy
ZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwjaS1mb3ItcGF0Y2gtc3VibWl0dGVy
cwo+Cj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb3NlbiBQZW5ldiA8cm9zZW5wQGdtYWlsLmNv
bT4KPiA+IC0tLQo+ID4gIC4uLi9tdGQvcGFydGl0aW9ucy9xY29tLHNtZW0tcGFydC55YW1sICAg
ICAgICB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0KPiA+ICAuLi4vYmluZGluZ3MvbmV0L21hcnZl
bGwsYXF1YW50aWEueWFtbCAgICAgICAgfCAxMyArKysrKysrKy0tLS0tCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Fj
b20sc21lbS1wYXJ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvcWNvbSxzbWVtLXBhcnQueWFtbAo+ID4gaW5kZXggMWMyYjRlNzgwY2E5Li44
YWUxNDk1MzRiMjMgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvcWNvbSxzbWVtLXBhcnQueWFtbAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Fjb20sc21lbS1wYXJ0
LnlhbWwKPiA+IEBAIC00NSwxNyArNDUsMjAgQEAgZXhhbXBsZXM6Cj4gPiAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJxY29tLHNtZW0tcGFydCI7Cj4gPgo+ID4gICAgICAgICAgICAgIHBhcnRp
dGlvbi1hcnQgewo+ID4gLSAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm52bWVtLWNlbGxz
IjsKPiA+IC0gICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiAtICAgICAg
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gICAgICAgICAgICAgICAgICBsYWJlbCA9
ICIwOmFydCI7Cj4gPgo+ID4gLSAgICAgICAgICAgICAgICBtYWNhZGRyX2FydF8wOiBtYWNhZGRy
QDAgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDY+Owo+ID4gLSAgICAg
ICAgICAgICAgICB9Owo+ID4gKyAgICAgICAgICAgICAgICBudm1lbS1sYXlvdXQgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1sYXlvdXQiOwo+Cj4gVGhpcyBk
b2VzIG5vdCBsb29rIHJpZ2h0IC0gdGhlIGJpbmRpbmcgc3RpbGwgZXhwZWN0cyBudm1lbS1jZWxs
cy4gSQo+IHdvbmRlciBob3cgZG9lcyB0aGUgbnZtZW0tY2VsbHMueWFtbCB3b3JrIGlmIHRoZSBj
b21wYXRpYmxlIGlzIGJlaW5nCj4gcmVtb3ZlZCBzbyBpdCBpcyBub3QgYmVpbmcgc2VsZWN0ZWQu
Ck5vdCBzdXJlIEkgZm9sbG93IGhlcmUuIFlvdSBtZWFuIHJlcGxhY2UgbnZtZW0tY2VsbHMueWFt
bCB3aXRoCm52bWVtLWxheW91dC55YW1sID8KPgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRv
Zgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
