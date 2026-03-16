Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C829F53D6D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6IF/dHE9OyVc7ssUPC0sIyOqmBfsxHMEkWgI63R06o=; b=BpfHlY+0GLCadq
	Reitn8Eakd4/LMtrFfqqGFpOSjxnV4wzaSiZ7VGYlGRYZmuWR9R90RNsgzSIPMukkRAfbkEFJwF0K
	mTjpA8Ik8jA7dv9P/OItNxAYcpNCHX6+8wi55m7oN8nHd3n64GD9KetvZsVl8jBMp4S5Oy390D34D
	LUNuIDgQFJ3pXL7SaH+WbJppfJLvjXmn3pAFKuGzJkp9YQGoSfDJCfNo9x2i14oJR4C7oG7OETF94
	Bd1MwZ65snJ+3z8FNvEXwbxFjk0vVyv+x0BvIhjKCIKG1aVIO8i/dp4OLn9/FUNRsm96YOoQZXE7W
	J78iux4OErJBIzAiIRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AkI-00000004Rxa-0W3p;
	Mon, 16 Mar 2026 16:24:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AkF-00000004RxL-47wV
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Mar 2026 16:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fsPkZeHkrqESEeQOC+MVDP/zLgVYzecvDb+aXeU0UGU=; b=qU6nFA01dWQ01gvo0hOKNEv2JE
	Wrb4wCcCdpptcGY4AdtCOsVroXwCfDHrrXvYu/YeA/84tJxAS5CI3zrD62LD5a15zipQOx4KiFYN9
	CCPhCGkfb4HT5h6JbD8gIqCnNytqbrSbM0lIdmGpqchXU6YNp2krt4KPabADGd/Rhfq3k2wAv9SzM
	ClmPBuMi2ZeNqS9/LiMS8lJbxyRr8/AZe4/OlIZYNhj8tm9r6fxv/Gk3fBHB0uqmXGJp4qtCzwFG+
	hnnqYHSyOkHe1WvFjOhSzuOv6/0qQFk4WGHaolbQ5vzaUbnjMEJE0iie4PhBcoGToNv5v2c8TsI65
	LyKZyRXA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AkB-00000007CT8-3Sxr
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 16:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88D2A441E7
	for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 16:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF7EC2BC9E
	for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773678278;
	bh=FI+pEJOl+xfO28oSXW6gg09R5wZ6B4Wats0lJ39KDRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z+2tcJImXtkYeNcZSosHOCTo6NjAjMeei2Ddq3BB5KjdCf6w62GGNVATGDe4rTr4I
	 ODSYaddfodEEZZ063e2UxJkV7xZLwEobxGqz0m1IiOYz2UEXDDMh78p0Kz/CAPcowK
	 cGRU0uk0cVRD32okUxpFvvHHM3YvsxCwLcz5F3kKCgHLhREO3q1RAgfTD44ve15t8z
	 Oz/+bQSFQhr3ULHRmtX6aY5ZXw8XysQOciDO45yBVShI6Fwvi7o2cYGkldMT0Ojax4
	 RS6/DuuaNRXwKotemX4AgQYRY3RZw62729x8z2N9yoqmOOfrjY97AMeLoExocJHcPh
	 e0RBvixgM5sJg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so378290a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 09:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOJ2/bwysY14xdcdZg4igpFzPLCkiWwKV4EC+dRC/nWCzePT3b6la3ZeWRWJdbBUBFHTzNadr3O54=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz24N9g0elHr8SeJGLKRiuMmI22svhp6JKErPqUisoHlWjXxRT5
	kA9pSK8+gr5/8CIXxxHF/Xl0ht8e8syB1pU4UHpP5rSdMlgwUiMbigpn9Xzx2TX1YIIqzAOs8w8
	/+qN3XGapF47G7NcVLzMRt59f8DnurQ==
X-Received: by 2002:a05:6402:13d4:b0:665:57bf:7de6 with SMTP id
 4fb4d7f45d1cf-66706eea380mr157610a12.0.1773678276885; Mon, 16 Mar 2026
 09:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260309200351.1791162-1-Frank.Li@nxp.com> <20260313233450.GA3632753-robh@kernel.org>
 <PA4PR04MB93666895F0D685181FFAF5DA8840A@PA4PR04MB9366.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB93666895F0D685181FFAF5DA8840A@PA4PR04MB9366.eurprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Mar 2026 11:24:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Nw38mPHgZTTDMRY3zQ6NeOhp3PDvZobqwjdFy2HMitw@mail.gmail.com>
X-Gm-Features: AaiRm515QMiZFlZBbgAHua2Ztin7i7yfV9IvbR3MOhE5nRKlwuLZWSOHLGO-dh8
Message-ID: <CAL_Jsq+Nw38mPHgZTTDMRY3zQ6NeOhp3PDvZobqwjdFy2HMitw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: refactor NAND bindings and add nand-controller-legacy.yaml
To: Frank Li <frank.li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_162440_211654_5B3DFD92 
X-CRM114-Status: GOOD (  12.43  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgOTozN+KAr0FNIEZyYW5rIExpIDxmcmFuay5saUBueHAu
Y29tPiB3cm90ZToKPgo+ID4gPiArc2VsZWN0Ogo+ID4gPiArICBhbGxPZjoKPiA+ID4gKyAgICAt
IHByb3BlcnRpZXM6Cj4gPiA+ICsgICAgICAgICRub2RlbmFtZToKPiA+ID4gKyAgICAgICAgICBw
YXR0ZXJuOiAiXm5hbmQtY29udHJvbGxlcihALiopPyIKPiA+ID4gKyAgICAtIG5vdDoKPiA+ID4g
KyAgICAgICAgcHJvcGVydGllczoKPiA+ID4gKyAgICAgICAgICBjb21wYXRpYmxlOgo+ID4gPiAr
ICAgICAgICAgICAgY29udGFpbnM6Cj4gPiA+ICsgICAgICAgICAgICAgIHBhdHRlcm46ICJeZnNs
LCIKPiA+Cj4gPiBJIHdvdWxkIGp1c3QgZG8gJ3NlbGVjdDogZmFsc2UnIGFuZCBtYWtlIHN1cmUg
YWxsIG5vbi1sZWdhY3kKPiA+IGNvbnRyb2xsZXIgYmluZGluZ3MgcmVmZXJlbmNlIG5hbmQtY29u
dHJvbGxlci55YW1sLgo+Cj4gSSBmb3VuZCBzb21lIGNvbnRyb2xsZXIgaGF2ZSBub3QgY29tcGF0
aWJsZSBzdHJpbmcsIHN1Y2ggYXMKPiBhcmNoL2FybS9ib290L2R0cy9icm9hZGNvbS9iY200NzA4
LWx1eHVsLXh3Yy0xMDAwLmR0cwoKSXQncyB0aGVyZSBzb21ld2hlcmUgdGhvdWdoIHRoZSBzb3Vy
Y2Ugc3RydWN0dXJlIG1ha2VzIGl0IGhhcmQgdG8KZmluZC4gQ29udmVydGluZyB0aGUgZHRiIGJh
Y2sgdG8gZmxhdCBkdHMgZ2l2ZXMgdGhpczoKCiAgICAgICAgbmFuZC1jb250cm9sbGVyQDE4MDI4
MDAwIHsKICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYnJjbSxuYW5kLWlwcm9jIiwgImJy
Y20sYnJjbW5hbmQtdjYuMSIsCiJicmNtLGJyY21uYW5kIjsKICAgICAgICAgICAgICAgIHJlZyA9
IDwweDE4MDI4MDAwIDB4NjAwIDB4MTgxMWE0MDggMHg2MDAgMHgxODAyOGYwMCAweDIwPjsKICAg
ICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJuYW5kIiwgImlwcm9jLWlkbSIsICJpcHJvYy1leHQi
OwogICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwIDB4NDQgMHgwND47CiAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDAxPjsKICAgICAgICAgICAgICAgICNzaXplLWNl
bGxzID0gPDB4MDA+OwogICAgICAgICAgICAgICAgYnJjbSxuYW5kLWhhcy13cDsKCiAgICAgICAg
ICAgICAgICBuYW5kQDAgewogICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImJy
Y20sbmFuZGNzIjsKICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDA+OwogICAgICAg
ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDAxPjsKICAgICAgICAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MHgwMT47CiAgICAgICAgICAgICAgICAgICAgICAgIG5h
bmQtZWNjLWFsZ28gPSAiYmNoIjsKICAgICAgICAgICAgICAgICAgICAgICAgbmFuZC1lY2Mtc3Ry
ZW5ndGggPSA8MHgwOD47CiAgICAgICAgICAgICAgICAgICAgICAgIG5hbmQtZWNjLXN0ZXAtc2l6
ZSA9IDwweDIwMD47CgogICAgICAgICAgICAgICAgICAgICAgICBwYXJ0aXRpb25zIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMi
OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDE+
OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDE+OwoK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJ0aXRpb25AMCB7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJ1YmkiOwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAgMHg4MDAwMDAwPjsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICAgICAgICAgICAgICB9Owog
ICAgICAgICAgICAgICAgfTsKICAgICAgICB9OwoKCj4KPiBJIGFtIG5vdCBzdXJlIGlmIGl0IGlz
IHdyb25nLiBTbyBJIGhhdmUgbm90IGRpcmVjdCB1c2UgInNlbGVjdCBmYWxzZSIuCj4KPiBJcyBp
dCBva2F5IG9taXQgdGhlc2UgZHRzPwoKRXZlbiBpZiB0aGVyZSBhcmUgY2FzZXMsIHllcy4KClJv
YgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
