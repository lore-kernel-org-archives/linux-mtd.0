Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9949D277CA
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Jan 2026 00:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2s3d/e/trWZrrDEs2h8+TZD6He92SJMIdUFuLXVuwg=; b=FDeDsGiexA3z2J
	tgW0jT9wMOIWZOaKLdMNaGn8OBOkfF2M8jjLElMwPyhJ1BJDNemOeS0+AhCY9bE1xhmjw2fkjRZdj
	giFqVTPbP0tFZh1SJGWGuERXAi4cxAVSm3B+YjQPqC9w2P8hkKE6DD2dtFZHji+Gk+9X7P8OYcrfd
	9/qabmji1l60iVNokVG3UpKAXQMMC9DC4bXxQbUWwWTbcChhSTrzqN2EwT+QgYm+0yy/RkJzXfMTb
	KkEvxYFm5oqizCpUyJmHPqEkdGdMJAW/Pjw8IXI9I0FlMzmJXF2ZSwdu3c8NFDgmWkrLS2aajpBoz
	P5WmbM4rpKJ0tz/aVs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMw4-00000003897-3pAd;
	Sat, 10 Jan 2026 00:34:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMw3-00000003891-1qog
	for linux-mtd@lists.infradead.org;
	Sat, 10 Jan 2026 00:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8628A60052
	for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2026 00:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3659FC4CEF1
	for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2026 00:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768005270;
	bh=n9j4w5nJYKbxcwM73KIWngQepQ+L/d3sKcNUKAyIKtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y3j1l10C+hAb4+TwRKe4Yib5x0tP27Svztx8ryAtaW5SCgjFum36gzCyn9TvCKILf
	 3RpShiT0yTvU2h7okf9Fq/EOlpZmTwXg6F5nYoc7x91qI6O/JNEj2PHvq6atrtyZhV
	 amcBUYADbpTh+C2lJkCjRJxvjo/S1OObtidjLIWnPvLevAlUzygmhQ7eX9b64ZPH9O
	 lIhxGQZW7izhpKMbgILxwbUqtpCz9wGSzR1ti1fLrEwiyh9lmxVI4O2yZNDA1ogkw/
	 i+qSWFPBwubHAHuv9OEZmgQZhI47KjI7OSjAJXr0+IcOF/tJbglNF2WbZxq16ZHY6t
	 BUhA/Pj6Z5uWw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1004936566b.2
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2026 16:34:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWU2n7Y38+3wMgTDxi4KpbzFfTQVwopfXw7IfZvRtu9chwkh13SJ8aY+2ZZjgLwBNOL4g56nDh+Jys=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6QVoToYUP7glIvF2IhIZymdtqTsPF+RD8yipGTavuIzqs2ukb
	gM/F/RCIWlq614tHldrRNTDelyb0SYronltrL7a7Fjt2qtg7Q0gGirBtBzJbC/jYqVToD5S3Hh/
	SNQ8sXOo/d6+7cb0lvGm4cS2HGOJ/Mw==
X-Google-Smtp-Source: AGHT+IHN7k0nlGN3BF9fptQCLroS2OEfJY1/5qH3rkE+fPUZiyIh4ww1H45mbZW8XjV64hyoMyOZFamozMjqQOGqBVw=
X-Received: by 2002:a17:907:c08:b0:b83:3773:e72a with SMTP id
 a640c23a62f3a-b8444c3fc0bmr1024959766b.1.1768005268828; Fri, 09 Jan 2026
 16:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org> <87fr8fxipc.fsf@bootlin.com>
In-Reply-To: <87fr8fxipc.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Jan 2026 18:34:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKV+3ZnqpbQ4USmJh-dngik_jZdnpOw0bGcxD0RSSzfxA@mail.gmail.com>
X-Gm-Features: AZwV_QjC5h7SzUM3Etvm3QTQEL2XLjJtwO-GnUAtRHPbI0yx2ANvpooNSCKrkpM
Message-ID: <CAL_JsqKV+3ZnqpbQ4USmJh-dngik_jZdnpOw0bGcxD0RSSzfxA@mail.gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: mtd: Ensure partition node properties
 are documented
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAzOjAy4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBSb2IsCj4KPiBPbiAwOC8wMS8yMDI2
IGF0IDExOjUzOjE2IC0wNiwgIlJvYiBIZXJyaW5nIChBcm0pIiA8cm9iaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+ID4gUGFydGl0aW9uIG5vZGVzIHdpdGhvdXQgYSBjb21wYXRpYmxlIGhhdmUgbm8g
cmVzdHJpY3Rpb25zIG9uIGFkZGl0aW9uYWwKPiA+IHByb3BlcnRpZXMuIEZpeCB0aGlzIGJ5IGVu
c3VyaW5nICd1bmV2YWx1YXRlZFByb3BlcnRpZXMnIGlzIHNldCB3aGVuCj4gPiB0aGVyZSdzIG5v
IGNvbXBhdGlibGUgcHJvcGVydHkuIElmIHRoZXJlIGlzIGEgY29tcGF0aWJsZSBwcm9wZXJ0eSwg
dGhlbgo+ID4gdGhlcmUgc2hvdWxkIGJlIGEgc3BlY2lmaWMgc2NoZW1hIGZvciBpdCB3aGljaCB3
aWxsIGVuZm9yY2UKPiA+ICd1bmV2YWx1YXRlZFByb3BlcnRpZXMnLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPgo+IE92
ZXJhbGwgdGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhpcyBzZXJpZXMsIEkndmUgYmVlbiBzcnVn
Z2xpbmcgd2hpbGUKPiBkZWZpbmluZyB0aGVzZSBhbmQgeW91ciBhcHByb2FjaCBzZWVtcyB2ZXJ5
IHJlbGV2YW50LiBJIGFtIGZpbmUgd2l0aCBhbGwKPiB0aGUgcGF0Y2hlcyBpbiB0aGlzIHNlcmll
cywgYnV0IHdpbGwgd2FpdCBhIGJpdCBmb3Igb3RoZXJzIHRvIG1ha2UgYSBiaXQKPiBvZiBmZWVk
YmFjay4KPgo+IFsuLi5dCj4KPiA+ICskZGVmczoKPiA+ICsgIHBhcnRpdGlvbi1ub2RlOgo+ID4g
KyAgICB0eXBlOiBvYmplY3QKPiA+ICsgICAgaWY6Cj4gPiArICAgICAgbm90Ogo+ID4gKyAgICAg
ICAgcmVxdWlyZWQ6IFsgY29tcGF0aWJsZSBdCj4gPiArICAgIHRoZW46Cj4gPiArICAgICAgJHJl
ZjogJyMnCj4gPiArICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKyAgICBl
bHNlOgo+ID4gKyAgICAgICRyZWY6ICcjJwo+Cj4gVGhpcywgaG93ZXZlciwgaXMgdG90YWwgYmxh
Y2ttYWdpYyB0byBtZS4gV291bGQgeW91IG1pbmQgZXhwbGFpbmluZyB3aGF0Cj4KPiAgICAgICAk
cmVmOiAnIycKPgo+IGluZGljYXRlcz8gSXMgdGhpcyBhIHBsYWNlaG9sZGVyIGluZGljYXRpbmcg
ImEgcmVmZXJlbmNlIG11c3QgYmUgZ2l2ZW4/CgpJdCdzIHdoYXQncyBrbm93biBhcyBKU09OIHBv
aW50ZXJzLiBUaGUgJyMnIGlzIGEgcmVmZXJlbmNlIHRvIHRoZSB0b3AKbGV2ZWwgb2YgdGhpcyBz
Y2hlbWEuCgo+IEFsc28gSSBkbyBub3QgdW5kZXJzdGFuZCB0aGUgZmluYWwgZWxzZSBjYXNlLCB3
aGF0IGlzIGl0IGNvdmVyaW5nPwoKSXQncyByZWFsbHkganVzdCB0aGVyZSBzbyBhICRyZWYgdG8K
cGFydGl0aW9uLnlhbWwjLyRkZWZzL3BhcnRpdGlvbi1ub2RlIGFwcGxpZXMgdGhlIHNjaGVtYSAo
YWxsIG9mCnBhcnRpdGlvbi55YW1sKSB3aGV0aGVyIHRoZXJlJ3MgYSBjb21wYXRpYmxlIHByb3Bl
cnR5IG9yIG5vdC4KClRoaXMgYWxsIGp1c3Qgd29ya3MgYXJvdW5kIHRoYXQgYSBzY2hlbWEgbGlr
ZSB0aGlzIGRvZXNuJ3Qgd29yazoKCiRyZWY6IGZvby55YW1sCmlmOgogIC4uLgp0aGVuOgogIHVu
ZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKClRoZSBldmFsdWF0aW9uIG9mIHVuZXZhbHVhdGVk
UHJvcGVydGllcyBkb2Vzbid0ICJzZWUiIHRoZSAkcmVmIGJlaW5nCmluIHRoZSBwYXJlbnQuIFNv
IHdlIGNhbid0IGZhY3RvciBvdXQgdGhlICRyZWYuCgpIb3BlIHRoYXQgbWFrZXMgc2Vuc2UuCgpS
b2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
