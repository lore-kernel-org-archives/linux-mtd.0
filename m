Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5594EE4993
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxJPaGQhJRahU5tsfXv8u/q0LA5l1YplJ+gXJ8eFZfY=; b=SXH8QB9MI6uflk
	0VUMxxja89C4HMZXEFcxkAQps0bVSCwEjftQrk5ItBp7IxBppbtLJmjiARCGyQ2xOk8rIIYQMQGI3
	lPYxOgWd57KRZdQW21Kee08IoQ8dxwVSD5cP860Pa3Cg5pYGGpNHrURDyn720SK4oax3d+PNTRODF
	UYRxEOfvGakBY5VMZaxX955gJGv8DFaoHdj+UAfbL2BJBLto1hNZN7SWI6QLtiwoChIDxrn+Zzvhz
	oRt+gKjO6MYDMkCQVp2BEjaGM2DhRPF9uaNI7iqqHbh4IXBD3UagIVnzNzUzd6D/9P1YuWfUVt/R+
	UzYAJZjhlc4Zz8f3V4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjR6-00HaAV-0A;
	Wed, 23 Aug 2023 08:41:56 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjR0-00Ha9r-1D
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 08:41:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4DC21C000A;
	Wed, 23 Aug 2023 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692780106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNJLYcePSzkI7fEgI2jMjFA/0rGYxuU3e2TyRTVFSFE=;
	b=A7tOKQWIcGPOvT0j6jF7kbdbQOsovtM5aYdAKKsO+/2RM63fT0iP6lbAhetSbowi2FY+8P
	1OQ6au4sgjpITbGhbEKMtT0QV0GB5SC6/OdmpV9sZwsoP7MrCa4Z6LRciccJkJnHsS0ouG
	3Z1aBETaNQoY6NR22CfxFI8kLjeNe3ywSavHFHKt1qDV7wtHA3hg8TlZSS1sPGCsFgt19t
	6fTB4JdfvmyApx+UD7YEPsWnWeLz65xhz3zTFWkw1klWPchhiiF61zj80GBRIdGP9OhExZ
	/o/zcOFZsxdsfDwKQNKTkOnoM4yG05UWrgNd2jRe5qSqXGW68tLARD1W/x8EfQ==
Date: Wed, 23 Aug 2023 10:41:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
Message-ID: <20230823104143.760cc5bc@xps-13>
In-Reply-To: <01925ff8-1d19-a729-429a-89866fad319f@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
	<20230822122534.872646-3-mmkurbanov@sberdevices.ru>
	<20230822153556.630e65b9@xps-13>
	<01925ff8-1d19-a729-429a-89866fad319f@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_014150_846035_BB4BD779 
X-CRM114-Status: GOOD (  14.95  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDIyIEF1
ZyAyMDIzIDE5OjU3OjExICswMzAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMjIuMDguMjAyMyAx
NjozNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIE1hcnRpbiwKPiA+IAo+ID4gbW1rdXJi
YW5vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDIyIEF1ZyAyMDIzIDE1OjI1OjM0ICsw
MzAwOgo+ID4gICAKPiA+PiBUaGUgZmlyc3QgNCBieXRlcyBhcmUgcmVzZXJ2ZWQgZm9yIGJhZCBi
bG9jayBkYXRhLiAgCj4gPiAKPiA+IEFyZSB5b3Ugc3VyZSBhYm91dCB0aGF0PyBJJ3ZlIG5ldmVy
IHNlZW4gNC1ieXRlcyBCQk0uICAKPiAKPiBZZXMsIEknbSBzdXJlLiBJIGhhdmUgY2hlY2tlZCBp
biBhbGwgdGhlIHJlbGV2YW50IGRhdGFzaGVldHM6Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IHwgICAgICAgIE5hbWUgICAgICAgIHwgTWF4IEJ5dGUgfCBNaW4gQnl0ZSB8ICBBcmVhICAg
fCAgICAgICAgRGVzY3JpcHRpb24gICAgICAgIHwKPiB8ICAgICAgICAgICAgICAgICAgICB8IEFk
ZHJlc3MgIHwgQWRkcmVzcyAgfCAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8
Cj4gfC0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAo+IHwgTVQyOUYyRzAxQUJBR0QgWzFdIHwgICAg
ICAgICAgfCAgICAgICAgICB8ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwK
PiB8LS0tLS0tLS0tLS0tLS0tLS0tLS18ICAgICAgICAgIHwgICAgICAgICAgfCAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gfCBNVDI5RjJHMDFBQkJHRCBbMl0gfCAgICAg
ICAgICB8ICAgICAgICAgIHwgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+
IHwtLS0tLS0tLS0tLS0tLS0tLS0tLXwgICA4MDNoICAgfCAgIDgwMGggICB8ICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiB8IE1UMjlGMUcwMUFCQUZEIFszXSB8ICAgICAg
ICAgIHwgICAgICAgICAgfCAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4g
fC0tLS0tLS0tLS0tLS0tLS0tLS0tfCAgICAgICAgICB8ICAgICAgICAgIHwgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfAo+IHwgTVQyOUY0RzAxQURBR0QgWzRdIHwgICAgICAg
ICAgfCAgICAgICAgICB8ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiB8
LS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0tfCBTcGFyZSAwIHwgUmVz
ZXJ2ZWQgKGJhZCBibG9jayBkYXRhKSB8Cj4gfCBNVDI5RjRHMDFBQkFGRCBbNV0gfCAgICAgICAg
ICB8ICAgICAgICAgIHwgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+IHwt
LS0tLS0tLS0tLS0tLS0tLS0tLXwgICAgICAgICAgfCAgICAgICAgICB8ICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwKPiB8IE1UMjlGNEcwMUFCQkZEIFs2XSB8ICAgICAgICAg
IHwgICAgICAgICAgfCAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gfC0t
LS0tLS0tLS0tLS0tLS0tLS0tfCAgMTAwM2ggICB8ICAxMDAwaCAgIHwgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfAo+IHwgTVQyOUY4RzAxQURBRkQgWzddIHwgICAgICAgICAg
fCAgICAgICAgICB8ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiB8LS0t
LS0tLS0tLS0tLS0tLS0tLS18ICAgICAgICAgIHwgICAgICAgICAgfCAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8Cj4gfCBNVDI5RjhHMDFBREJGRCBbOF0gfCAgICAgICAgICB8
ICAgICAgICAgIHwgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBOb3RlOiB0byB2aWV3IHRoZSBkYXRhc2hlZXQgb24g
dGhlIE1pY3JvbiAoaHR0cHM6Ly93d3cubWljcm9uLmNvbS8pIHdlYnNpdGUsIHlvdSBuZWVkCj4g
dG8gcmVnaXN0ZXIuCgpJIGRvbid0IHRoaW5rIHRoZSBmb3VyIGJ5dGVzIGhhdmUgYW55ICJiYWQg
YmxvY2sgc3BlY2lmaWMiIG1lYW5pbmcuIEluCnByYWN0aWNlLCB0aGUgZGF0YXNoZWV0IHN0YXRl
czoKCglWYWx1ZSBwcm9ncmFtbWVkIGZvciBiYWQgYmxvY2sgYXQgdGhlIGZpcnN0IGJ5dGUgb2Yg
c3BhcmUKCWFyZWE6IDAwaAoKU28gb25seSB0aGUgZmlyc3QgYnl0ZSBpcyB1c2VkIHRvIG1hcmsg
dGhlIGJsb2NrIGJhZCwgdGhlIHJlc3QgaXMKcHJvYmFibHkgbWFya2VkICJyZXNlcnZlZCIgZm9y
IHNpbXBsaWNpdHkuIEkgYmVsaWV2ZSB3ZSBzaG91bGQga2VlcCB0aGUKY3VycmVudCBsYXlvdXQg
YmVjYXVzZSBpdCB3b3VsZCBvdGhlcndpc2UgYnJlYWsgdXNlcnMgZm9yIG5vIHJlYWwKcmVhc29u
LgoKPiBMaW5rczoKPiAgIFsxXSBodHRwczovL2RhdGFzaGVldC5sY3NjLmNvbS9sY3NjLzE5MTIx
MTE0MzdfTWljcm9uLVRlY2gtTVQyOUYyRzAxQUJBR0RXQi1JVC1HX0M0MTA4NjMucGRmIC0gcGFn
ZSA0NQo+ICAgWzJdIGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQvZ2xvYmFs
L2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25hbmQtZmxhc2gvNzAtc2VyaWVzL203OWFf
MmdiXzFfOHZfbmFuZF9zcGkucGRmIC0gcGFnZSA0Ngo+ICAgWzNdIGh0dHBzOi8vZGF0YXNoZWV0
Lmxjc2MuY29tL2xjc2MvMjIwOTIwMTAzMF9NaWNyb24tVGVjaC1NVDI5RjFHMDFBQkFGRFdCLUlU
LUZfQzI5MDU2ODYucGRmIC0gcGFnZSA0Ngo+ICAgWzRdIGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20v
LS9tZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25hbmQt
Zmxhc2gvNzAtc2VyaWVzL203OWFfZGRwXzRnYl8zdl9uYW5kX3NwaS5wZGYgLSBwYWdlIDQ2Cj4g
ICBbNV0gaHR0cHM6Ly93d3cubWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1l
bnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQvbmFuZC1mbGFzaC83MC1zZXJpZXMvbTcwYV80Z2JfM3Zf
bmFuZF9zcGkucGRmIC0gcGFnZSA0Nwo+ICAgWzZdIGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vLS9t
ZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25hbmQtZmxh
c2gvNzAtc2VyaWVzL203MGFfNGdiXzFfOHZfbmFuZF9zcGkucGRmIC0gcGFnZSA0OQo+ICAgWzdd
IGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9w
cm9kdWN0cy9kYXRhLXNoZWV0L25hbmQtZmxhc2gvNzAtc2VyaWVzL203MGFfZGRwXzhnYl8zdl9u
YW5kX3NwaS5wZGYgLSBwYWdlIDQ4Cj4gICBbOF0gaHR0cHM6Ly93d3cubWljcm9uLmNvbS8tL21l
ZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQvbmFuZC1mbGFz
aC83MC1zZXJpZXMvbTcwYV9kZHBfOGdiXzFfOHZfbmFuZF9zcGkucGRmIC0gcGFnZSA0OAo+IAoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
