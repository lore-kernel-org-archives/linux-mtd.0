Return-Path: <SRS0=L/qC=VK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E94C71142
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jul 2019 23:39:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE162064A
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jul 2019 23:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3nYGar8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="ZPDM/M+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE162064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyBw5VdjJVlWYBVCswgjJOxB8xAc6jx1K8AXo8LKpxM=; b=j3nYGar8wYzC1M
	xRGbDffl99buELBGBvwtOx88WCMLsRSSB+WUUlF7uVS4f5555IJZK4jua5KNIdZyWvzOQIjaAmWar
	xVksCTFBF+t+x7nv455J1BJvoOQWXWUMm940+JICbtEbsnTlnQoICXE75Ug+ixdxasfgkTeVUwxS5
	yqFkWaRnFoGQ0ut3Bx2goH6YgbKcqrIKqd8Peb2VZzMkpex+v/iatiQYOi4sKkuobvPIyzfQA/o8w
	IohCmhyr9kvH6iXMgH28GUo0Klt3GEPKSpxsiwJWdgtKpVpSxe9HG9P8aDsvbBBCU1sAWL9v9megp
	DLG9Ro1/i/paFwVbueqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmRbe-0006JD-S4; Sat, 13 Jul 2019 23:39:06 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmRbZ-0006Ic-4j
 for linux-mtd@lists.infradead.org; Sat, 13 Jul 2019 23:39:03 +0000
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x6DNcXHx025043
 for <linux-mtd@lists.infradead.org>; Sun, 14 Jul 2019 08:38:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6DNcXHx025043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1563061114;
 bh=D9pbrTjD/dqwhKk+y191+uZ3i09jNpt6GI//YlslbF8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZPDM/M+90TxXTpVrpS8nmGDBoDAmy/otOJyMs8t4NcW9TQyjaWL7dE6jo638hbF02
 e8377yCqpdgqs634YABh9k402tbgqcTmWsNV54KJHwQlZEK3K8nWjhbiSzpPkheh+b
 ffk+/Yt69kkXFypYIXyMD4s7/F2yaEGcVkmuCvRYQzWi7E4J3x0P136HvqaC2AerCB
 v/qor5WQ7zb1C4FaJfwzeeifritT5wppdoAFOZwwF58mR7Ytqs9iGLJB+B/AchPnGs
 hvULE9A3Qrm6QFHCQ7pH84UGTFTDgswX1zC8Dh0vLoSUhTTq15kDxzFvzMjiQ2C0IR
 2fJFBL7+9beVQ==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id m23so9053197vso.1
 for <linux-mtd@lists.infradead.org>; Sat, 13 Jul 2019 16:38:33 -0700 (PDT)
X-Gm-Message-State: APjAAAXiRS6/EEabnWwZd8Zqh9Vm5/wJ0i3LfI6jiOyoSqvDk24+SV4b
 HULVU3FUj5OlPlb/SD096in3wRvbcCgKo2+5854=
X-Google-Smtp-Source: APXvYqz7FXm0oP6FGHZYY9YFOlW2+XjgzCe0Da31HjR1aO7rfcVxizTh3hB+rg2GzOLhrBD7CGGk1PNa5nbX0jMXBgg=
X-Received: by 2002:a67:f495:: with SMTP id o21mr12562362vsn.54.1563061112478; 
 Sat, 13 Jul 2019 16:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190618030926.30616-1-yamada.masahiro@socionext.com>
 <1318390798.95477.1560838785550.JavaMail.zimbra@nod.at>
 <CAK7LNARA62uqi8rkDeJ=zjA6vnruTAH2VGOBd4=sQMhF+FHMLA@mail.gmail.com>
 <957967732.18164.1561621143523.JavaMail.zimbra@nod.at>
In-Reply-To: <957967732.18164.1561621143523.JavaMail.zimbra@nod.at>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 14 Jul 2019 08:37:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQLheA3E0UrjirNHzpS2x+xmjc2YCupCBMNoHOwviz6GQ@mail.gmail.com>
Message-ID: <CAK7LNAQLheA3E0UrjirNHzpS2x+xmjc2YCupCBMNoHOwviz6GQ@mail.gmail.com>
Subject: Re: [PATCH v2] jffs2: remove C++ style comments from uapi header
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190713_163901_412525_0D4FAF17 
X-CRM114-Status: GOOD (  13.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgNDozOSBQTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0PiB3cm90ZToKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+
IFZvbjogIk1hc2FoaXJvIFlhbWFkYSIgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+
ID4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gPiBDQzogIlZpZ25lc2ggUmFnaGF2
ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAiQm9yaXMgQnJlemlsbG9uIiA8YmJyZXppbGxvbkBr
ZXJuZWwub3JnPiwgImxpbnV4LWtlcm5lbCIKPiA+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnPiwgIk1hcmVrIFZhc3V0IiA8bWFyZWsudmFzdXRAZ21haWwuY29tPiwgImxpbnV4LW10ZCIg
PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwKPiA+ICJNaXF1ZWwgUmF5bmFsIiA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4sICJCcmlhbiBOb3JyaXMiIDxjb21wdXRlcnNmb3JwZWFj
ZUBnbWFpbC5jb20+LCAiRGF2aWQgV29vZGhvdXNlIgo+ID4gPGR3bXcyQGluZnJhZGVhZC5vcmc+
Cj4gPiBHZXNlbmRldDogRG9ubmVyc3RhZywgMjcuIEp1bmkgMjAxOSAwOTowNjozMQo+ID4gQmV0
cmVmZjogUmU6IFtQQVRDSCB2Ml0gamZmczI6IHJlbW92ZSBDKysgc3R5bGUgY29tbWVudHMgZnJv
bSB1YXBpIGhlYWRlcgo+Cj4gPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAzOjIwIFBNIFJpY2hh
cmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOgo+ID4+Cj4gPj4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4+ID4gVm9uOiAiTWFzYWhpcm8gWWFtYWRhIiA8eWFt
YWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Cj4gPj4gPiBBbjogImxpbnV4LW10ZCIgPGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+ID4+ID4gQ0M6ICJCb3JpcyBCcmV6aWxsb24iIDxi
YnJlemlsbG9uQGtlcm5lbC5vcmc+LCAiTWlxdWVsIFJheW5hbCIKPiA+PiA+IDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiwgIkJyaWFuIE5vcnJpcyIKPiA+PiA+IDxjb21wdXRlcnNmb3JwZWFj
ZUBnbWFpbC5jb20+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJN
YXJlawo+ID4+ID4gVmFzdXQiIDxtYXJlay52YXN1dEBnbWFpbC5jb20+LAo+ID4+ID4gIk1hc2Fo
aXJvIFlhbWFkYSIgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiwgInJpY2hhcmQiIDxy
aWNoYXJkQG5vZC5hdD4sCj4gPj4gPiAiRGF2aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFk
Lm9yZz4sCj4gPj4gPiAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zz4KPiA+PiA+IEdlc2VuZGV0OiBEaWVuc3RhZywgMTguIEp1bmkgMjAxOSAwNTowOToyNgo+ID4+
ID4gQmV0cmVmZjogW1BBVENIIHYyXSBqZmZzMjogcmVtb3ZlIEMrKyBzdHlsZSBjb21tZW50cyBm
cm9tIHVhcGkgaGVhZGVyCj4gPj4KPiA+PiA+IExpbnV4IGtlcm5lbCB0b2xlcmF0ZXMgQysrIHN0
eWxlIGNvbW1lbnRzIHRoZXNlIGRheXMuIEFjdHVhbGx5LCB0aGUKPiA+PiA+IFNQRFggTGljZW5z
ZSB0YWdzIGZvciAuYyBmaWxlcyBzdGFydCB3aXRoIC8vLgo+ID4+ID4KPiA+PiA+IE9uIHRoZSBv
dGhlciBoYW5kLCB1YXBpIGhlYWRlcnMgYXJlIHdyaXR0ZW4gaW4gbW9yZSBzdHJpY3QgQywgd2hl
cmUKPiA+PiA+IHRoZSBDKysgY29tbWVudCBzdHlsZSBpcyBmb3JiaWRkZW4uCj4gPj4gPgo+ID4+
ID4gSSBzaW1wbHkgZHJvcHBlZCB0aGVzZSBsaW5lcyBpbnN0ZWFkIG9mIGZpeGluZyB0aGUgY29t
bWVudCBzdHlsZS4KPiA+PiA+Cj4gPj4gPiBUaGlzIGNvZGUgaGFzIGJlZW4gYWx3YXlzIGNvbW1l
bnRlZCBvdXQgc2luY2UgaXQgd2FzIGFkZGVkIGFyb3VuZAo+ID4+ID4gTGludXggMi40LjkgKGku
ZS4gY29tbWVudGVkIG91dCBmb3IgbW9yZSB0aGFuIDE3IHllYXJzKS4KPiA+PiA+Cj4gPj4gPiAn
TWF5YmUgbGF0ZXIuLi4nIHdpbGwgbmV2ZXIgaGFwcGVuLgo+ID4+Cj4gPj4gOi0pCj4gPj4KPiA+
PiA+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lv
bmV4dC5jb20+Cj4gPj4KPiA+PiBBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiAvL3JpY2hhcmQKPiA+Cj4gPgo+ID4gV2ls
bCB0aGlzIGJlIHBpY2tlZCB1cCBmb3IgdjUuMy1yYzEgPwo+Cj4gWWVzLgo+Cj4gVGhhbmtzLAo+
IC8vcmljaGFyZAoKCgpMb29rcyBsaWtlIHRoaXMgdHJpdmlhbCBwYXRjaCBtaXNzZWQgdGhlIHB1
bGwgcmVxdWVzdC4KCgpNeSBtb3RpdmF0aW9uIGlzIHRvIG1ha2Ugc3VyZSBVQVBJIGhlYWRlcnMK
YXJlIHJlYWxseSBjb21waWxhYmxlIGluIHVzZXItc3BhY2UsCmFuZCBub3cgY2hlY2tlZCBieSB0
aGUgZm9sbG93aW5nIGNvbW1pdDoKCmNvbW1pdCBkNmZjOWZjYmFhNjU1Y2ZmMmQyYmUwNWUxNjg2
N2QxOTE4Zjc4Yjg1CkF1dGhvcjogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29j
aW9uZXh0LmNvbT4KRGF0ZTogICBNb24gSnVsIDEgMDk6NTg6NDAgMjAxOSArMDkwMAoKICAgIGti
dWlsZDogY29tcGlsZS10ZXN0IGV4cG9ydGVkIGhlYWRlcnMgdG8gZW5zdXJlIHRoZXkgYXJlIHNl
bGYtY29udGFpbmVkCgoKCklzIHRoZXJlIGEgY2hhbmNlIGZvciBpdCBiZWluZyBtZXJnZWQsCm9y
IG11c3Qgd2FpdCB1bnRpbCB2NS40LXJjMSA/CgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8g
WWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
