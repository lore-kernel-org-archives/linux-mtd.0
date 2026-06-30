Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17898C43458
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 22:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGa8JNarhWwjl46lO/5r0hfDVfL2wJbVH3iiji0uZtI=; b=Zh8+FzG0kVuzSA
	TK9+YLiBdY9+0pcC/OHbYT7E8iu+HbkEanCgfNtdgq4eA/H7b4Zy7GVKbutxcc2QbhZm1Fbb3eNfW
	fqTPBOacDwRFtLnKK/w8D8mpAh+xQxTR0vDoRe7+GojJ9TypMiht9cb2ERlQ8losjLOzJAxEBEmTi
	f2PsRIDttGhmyl5AJPHrhNO4T1Y6f/tkNEKmZMg+fIxIIM1kT/JXnZmPGfbAS3GdJk6/Bdl5whFGo
	Btn++Ocb5QV5myPcy3pr2E3Lu5xitWd9+1Y6vvfhCwX84XmbWlyFFysbQvLPCzrV/vxmPVmx3/dgc
	kk33vGi9tSpitbLz5VmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegta-00000000Ivp-2Mtv;
	Tue, 30 Jun 2026 22:25:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegtZ-00000000Ivd-1Nhq
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jun 2026 22:25:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8D6A43ECE
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 22:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA741F00AC4
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 22:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858332;
	bh=lJSNchfWEyMduAfk7UjM53bR+D02Dxe2C6sVldFvt8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VO7G2t1Fop7D33uO3A+qYFU4/l49qMz4/fv7261otOP5CpUOFZac93RTf5iLSqCqr
	 e/eln6tInnaYZvtLwA6lA74onbV4Oa9fKZcxZQOG1AAbpxy2m+OeDcfmDH+nJLq4QI
	 zQFyjZP5nygLQQ1ZNMPk/DMTusm4KdUWG7lIlzdhcurKcO8og80hyqQmTMGfPHBVZr
	 oSTiTUDs2eM5DEo8XzJu8uMABRjNNbKy5dMR3QVfzqHZt1q6Y70ZDSezEsGF31qIqS
	 /f8aNeCj5iiqzEcKMWD7AplC9VBa7hffu7TKGV3vZd6IFM+ligf7Hy0CkmkWcMpRzE
	 iAcMdmOt3tK0Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so3299760e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 15:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpHCHfEWLJ2FnZwd/FCntQh5NmFWB5Krx00UyhHP5KxPdtiYLc116/8WTQTh0lrwyBqjS9WOLibfTQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXa97iYo+Ysu+vLDLGM3GHV2dUtRxBira8nGD6UPODS2S4A3oQ
	OWsXZy0HdGo9wqiRiUosk6/sFSeEGq99OFLGkt/V1UgdkoKe9fFJTFheZmKJ08tQEKqprNhBzGz
	QL7o3Q9AwnXoSz0zbGWnqaUu617xhOIU=
X-Received: by 2002:ac2:4bca:0:b0:5ae:bce4:b696 with SMTP id
 2adb3069b0e04-5aebdb8913amr1285650e87.15.1782858331615; Tue, 30 Jun 2026
 15:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com> <20260630092406.150587-4-manikandan.m@microchip.com>
In-Reply-To: <20260630092406.150587-4-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:25:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLk9Vw6tv+S0jno80g1cQNOJ8UH=E_XKEnXdbdKB6QMWJg@mail.gmail.com>
X-Gm-Features: AVVi8CeKBUAk9hYd7-xedVdQUq3OtUOkiZl_3QiYFyIqzcOrLBrHLUbSYsRIb2A
Message-ID: <CAD++jLk9Vw6tv+S0jno80g1cQNOJ8UH=E_XKEnXdbdKB6QMWJg@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] mtd: spi-nor: sfdp: expose the SFDP as a read-only
 NVMEM device
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

SGkgTWFuaWthbmRhbiwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFR1ZSwgSnVuIDMwLCAy
MDI2IGF0IDExOjI14oCvQU0gTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4KPG1hbmlrYW5kYW4ubUBt
aWNyb2NoaXAuY29tPiB3cm90ZToKCj4gUmVnaXN0ZXIgdGhlIGNhY2hlZCBTRkRQIGFzIGEgcmVh
ZC1vbmx5IE5WTUVNIGRldmljZSByb290ZWQgYXQgdGhlCj4gZmxhc2gncyAic2ZkcCIgY2hpbGQg
bm9kZSwgZXhwb3NpbmcgaXQgaW4gb24tZmxhc2ggYnl0ZSBvcmRlci4gVGhpcyBsZXRzCj4gTlZN
RU0gY2VsbHMgcmVmZXJlbmNlIGFueSBTRkRQIGRhdGE6IGEgZml4ZWQtbGF5b3V0IGZvciBwYXJh
bWV0ZXJzIGF0IGEKPiBrbm93biBvZmZzZXQsIG9yIGFuIG52bWVtLWxheW91dCBwYXJzZXIgZm9y
IHZlbmRvciBkYXRhIHdob3NlIGxvY2F0aW9uCj4gbXVzdCBiZSBkaXNjb3ZlcmVkIGF0IHJ1bnRp
bWUuIFRoZSBkZXZpY2UgaXMgb25seSByZWdpc3RlcmVkIHdoZW4gYW4KPiAic2ZkcCIgbm9kZSBp
cyBwcmVzZW50IGluIHRoZSBkZXZpY2UgdHJlZS4KCkl0IHNlZW1zIHRoZSBleGlzdGluZyBzZXJp
YWwgTk9SIGRyaXZlciBjb3JlIGFscmVhZHkgcmVhZHMgb3V0IHRoZSBTRkRQCmFuZCBzdG9yZXMg
aXQgaW4gIG5vci0+c2ZkcC0+ZHdvcmRzLCByaWdodD8KClRoaXMgc2hvdWxkIGJlIG1lbnRpb25l
ZCBpbiB0aGUgY29tbWl0IHNvIHdlIGtub3cgd2hlbiB0aGUgc3R1ZmYKaXMgYWN0dWFsbHkgcmVh
ZCBpbiBmcm9tIHRoZSBmbGFzaCBtZW1vcnkuCgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRh
biBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPgooLi4uKQoKPiBAQCAt
MzIwNCw2ICszMjA0LDExIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9pbml0X3BhcmFtcyhzdHJ1Y3Qg
c3BpX25vciAqbm9yKQo+ICAgICAgICAgICAgICAgICBzcGlfbm9yX2luaXRfcGFyYW1zX2RlcHJl
Y2F0ZWQobm9yKTsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgLyogRXhwb3NlIHRoZSBTRkRQIGFz
IGFuIE5WTUVNIGRldmljZS4gKi8KCkFkZCAiaWYgYW5kIG9ubHkgaWYgdGhlIGZsYXNoIGhhcyBh
biBTRkRQIgoKPiArc3RhdGljIGludCBzcGlfbm9yX3NmZHBfbnZtZW1fcmVhZCh2b2lkICpwcml2
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpCgpOYW1lIGl0IF9yZWdfcmVhZCgpIHRvIG1pcnJv
ciB0aGUgbnZtZW0gcHJvdG90eXBlLgoKPiArLyoqCj4gKyAqIHNwaV9ub3JfcmVnaXN0ZXJfc2Zk
cF9udm1lbSgpIC0gZXhwb3NlIHRoZSBTRkRQIGFzIGEgcmVhZC1vbmx5IE5WTUVNIGRldmljZQo+
ICsgKiBAbm9yOiAgICAgICBwb2ludGVyIHRvIGEgJ3N0cnVjdCBzcGlfbm9yJwo+ICsgKgo+ICsg
KiBFeHBvc2UgdGhlIHdob2xlIFNGRFAsIGluIG9uLWZsYXNoIGJ5dGUgb3JkZXIsIGFzIGEgcmVh
ZC1vbmx5IE5WTUVNIGRldmljZQo+ICsgKiByb290ZWQgYXQgdGhlIGZsYXNoJ3MgInNmZHAiIGNo
aWxkIG5vZGUuIFRoaXMgbGV0cyBnZW5lcmljIChmaXhlZC1sYXlvdXQpIG9yCj4gKyAqIHZlbmRv
ciAobnZtZW0tbGF5b3V0KSBjZWxscyByZWZlcmVuY2UgYW55IFNGRFAgZGF0YS4gVGhlIGRldmlj
ZSBpcyBvbmx5Cj4gKyAqIHJlZ2lzdGVyZWQgd2hlbiBhbiAic2ZkcCIgbm9kZSBpcyBkZXNjcmli
ZWQgaW4gdGhlIGRldmljZSB0cmVlLgo+ICsgKgo+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcyBv
ciBpZiB0aGVyZSBpcyBub3RoaW5nIHRvIGRvLCAtZXJybm8gb3RoZXJ3aXNlLgo+ICsgKi8KPiAr
aW50IHNwaV9ub3JfcmVnaXN0ZXJfc2ZkcF9udm1lbShzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICt7
Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBub3ItPmRldjsKPiArICAgICAgIHN0cnVj
dCBudm1lbV9jb25maWcgY29uZmlnID0geyB9Owo+ICsgICAgICAgc3RydWN0IG52bWVtX2Rldmlj
ZSAqbnZtZW07Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOwo+ICsgICAgICAgaW50
IHJldDsKPiArCj4gKyAgICAgICBpZiAoIW5vci0+c2ZkcCkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4gKwo+ICsgICAgICAgbnAgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShkZXZfb2Zfbm9k
ZShkZXYpLCAic2ZkcCIpOwo+ICsgICAgICAgaWYgKCFucCkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIDA7CgpJZiB0aGlzIG5vZGUgbmFtZSBpcyByZXF1aXJlZCB0byBiZSBuYW1lZCBsaWtlIHRo
YXQgaXQgaGFzIHRvIGJlCmVuZm9yY2VkIGluIHRoZSBzY2hlbWEuCgpJIHdvdWxkIGluc3RlYWQg
Y2hlY2sgYWxsIHRoZSBub2RlcyAoZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkKQpmb3IgdGhlIHJp
Z2h0IGNvbXBhdGlibGUgImplZGVjLHNmZHAiLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
