Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A38CD4F27
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vprGjWtJWC4YBq7uTuTQaLF6Cb3kzYq/AUSAb7/9LEc=; b=OaS2A7Hv9AYeFwu1caxvN/KW5l
	w/5sUaf8yNR3t30DtIn/LyA45jX3Nm5sSt6D8kQiMnjgFP/GVCmL1MMCagMQ17O6HdZ5gnAU9xMA7
	0x43Bcrfnksyl2T/4jM4857a5kezKYgHFspOpmHuscSZvmEAHWc4vlTJQeuu8aIyEucX0gOuBXkyV
	ZVqp8L34fwUAgnWnJuHihuaoDroGK0/4/zJ1XrJHtiuPegNe85xHpnu/h2Wk6yaZTAyvwvN1i4d2h
	gm/HwYXmQUZ+Mswh+a8+Nm0Bfv2BimrtItKbWm5UythjJGFdykdOYaDHaXN+kN70m7XTBv0SIIxAD
	gPPr1Yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjb4F-008HVo-2G;
	Fri, 22 Sep 2023 07:59:15 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjb4D-008HTx-13
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 07:59:15 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 06FF3FF;
	Fri, 22 Sep 2023 09:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1695369549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5aWRlQvLj0Ai3NtLAWY4Y9rChkOr2OHujz5YgcNF/M=;
	b=e229GHSIJdvBvaGFssBf4z0racFX5PLrLsrl9SE4SkZiGJgVf0Ypekk9GucFxD9ZvgIZHk
	QysarpYZpevLLQL9Lc4U9gm73pxE+x+ZDAGMdVXMoGoR3JIlz9ezjyBQeZZ/tLX5LkSnah
	CW07bcLt5sH7Zz+GJmvJhnE2d4Y0IUMPJgydtMxgY6RdxHy/h5YePTRT+6FsNWYY/hRXp+
	IWn/PhZ0NPywFRI4jx4s7pI7ScrIXDW+39Jq2PngupXc6VqJbNq8Yg6AxRp8rxDa8Cp021
	YZleF1G8LvBG7R36JkObrX47yh/VenRHQTk/Rnkm5gmiPMrVHshTGa8yfYB5vw==
MIME-Version: 1.0
Date: Fri, 22 Sep 2023 09:59:08 +0200
From: Michael Walle <michael@walle.cc>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
In-Reply-To: <CAMuHMdUKxJDPs3Ow8E-g2bLr7c7jREf5gSqWZ+o5aWbGj6uO=w@mail.gmail.com>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
 <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org>
 <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
 <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
 <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
 <d4d998cff934328f58cec767f93a59b5@walle.cc>
 <CAMuHMdUK=HvvjeTDefzX9sbY-vaRFVixcSvKVqDPgBpGVt2dQA@mail.gmail.com>
 <CAMuHMdUKxJDPs3Ow8E-g2bLr7c7jREf5gSqWZ+o5aWbGj6uO=w@mail.gmail.com>
Message-ID: <f4751046b26a86b18aa7e446a4da81e8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_005913_517939_6A5293DD 
X-CRM114-Status: GOOD (  21.01  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMy0wOS0yMiAwOToxMCwgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46Cj4gT24gVGh1
LCBTZXAgMjEsIDIwMjMgYXQgNzowMeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiAKPiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+PiBPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCA2OjAx4oCv
UE0gTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4gCj4+IHdyb3RlOgo+PiA+ID4+IFdl
IHdvbid0IGJyZWFrIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBEVEJzIGlmIHdlIHVzZSBhIGxp
c3Qgb2YKPj4gPiA+PiBjb21wYXRpYmxlcy4gRmlyc3QgdGhlIHZlbmRvciBzcGVjaWZpYyBvbmUg
d2hpY2ggd2lsbCB1c2Ugc29tZSBxdWlya3MsCj4+ID4gPj4gYW5kIGlmIHRoYXQncyBub3QgYXZh
aWxhYmxlLCBoYXZlIGFzIHNlY29uZCB0aGUgZ2VuZXJpYyBqZWRlYyxzcGktbm9yCj4+ID4gPj4g
dG8KPj4gPiA+PiBmYWxsYmFjayB0by4KPj4gPiA+Cj4+ID4gPiBTdXJlLCB5b3Ugc2hvdWxkIHVz
ZSBhIGxpc3QuCj4+ID4gPgo+PiA+ID4gQnV0IHRoZSBjdXJyZW50IHJlY29tbWVuZGVkIHByYWN0
aWNlIGlzIHRvIG5vdCBoYXZlIGEgbGlzdCwKPj4gPiA+IGJ1dCBqdXN0ICJqZWRlYyxzcGktbm9y
IiAodXNpbmcgYSBsaXN0IHdpdGggYSBuZXcgRkxBU0ggcGFydCBuYW1lCj4+ID4gPiBjYXVzZXMg
Y2hlY2twYXRjaCBhbmQgZHRic19jaGVjayB3YXJuaW5ncykuIEhlbmNlIGlmIHlvdSBmb2xsb3cg
dGhhdAo+PiA+ID4gcmVjb21tZW5kYXRpb24sIHlvdSB3aWxsIHJ1biBpbnRvIGNvbXBhdGliaWxp
dHkgaXNzdWVzIHdpdGggb2xkZXIgRFRCcwo+PiA+ID4gd2hlbiB5b3UgZGlzY292ZXIgdGhlIHF1
aXJrIGxhdGVyLCBhbmQgZGVjaWRlIHRvIGFkZCBpdCB0byB0aGUgbGlzdC4KPj4gPgo+PiA+IFRo
ZSBTUEkgTk9SIGZsYXNoZXMgc2hvdWxkIGJlIGF1dG8gZGlzY292ZXJhYmxlLiBXaHkgZG8geW91
IG5lZWQgYQo+PiA+IGNvbXBhdGlibGUgc3RyaW5nPyBRdWlya3MgY2FuIGJlIGFkZGVkIHRvIHRo
ZSBmbGFzaF9pbmZvIGRhdGFiYXNlLgo+PiAKPj4gVGhpcyBhc3N1bWVzIHlvdSBkb24ndCBuZWVk
IHRoZSBxdWlyayBiZWZvcmUgeW91IGNhbiBpZGVudGlmeSB0aGUgCj4+IHBhcnQuCj4+IEknbSBu
b3Qgc3VyZSB0aGF0IGlzIGFsd2F5cyB0aGUgY2FzZS4KClllcywgYnV0IHRoYXQgc2VlbXMgYSBy
ZWFzb25hYmxlIGFzc3VtcHRpb24uCgo+IFJlbWluZGVyIHdoZXJlIHRoaXMgaXMgYXBwYXJlbnRs
eSBub3QgdGhlIGNhc2U6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9PUzBQUjAxTUI1OTIy
QTRGMTZERTg5MjMzNzNBQTVERDg4NkY3QUBPUzBQUjAxTUI1OTIyLmpwbnByZDAxLnByb2Qub3V0
bG9vay5jb20vCgpJIHRoaW5rIHRoYXQgb25lIGlzIHN0aWxsIHVuZGVyIGRpc2N1c3Npb24gYW5k
IHRoZXJlIGlzIHNvbWV0aGluZwpzdHJhbmdlIGdvaW5nIG9uIHRoZXJlLiBJbiBhbnkgY2FzZSwg
dGhlICJyZWFkIGlkIiBvcGVyYXRpb24gaXMgZG9uZQp3aXRoIGp1c3Qgc2luZ2xlIGJpdCBJL08s
IElPVywgUkRJRCBzaG91bGQgd29yay4gVW5sZXNzIHRoZXJlIGlzIGEKaGFyZHdhcmUgYnVnIGFu
ZCB0aGUgU1BJIGNvbnRyb2xsZXIgKCEpIHdpbGwgaG9sZCB0aGUgZmxhc2ggaW4gcmVzZXQKYnkg
cHVsbGluZyBkb3duIElPMy4gSSdkIGFyZ3VlLCB0aGF0IHNpbXBseSBsb29raW5nIGF0IHRoZSBm
bGFzaApjb21wYXRpYmxlIGlzIHRoZSB3cm9uZyBhcHByb2FjaCBoZXJlLgoKLW1pY2hhZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
