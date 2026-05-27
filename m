Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EFCD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 08:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFnjsDbpPF2+UiI4/lGSTVLgwPDGfEcsVnlPBPQROM4=; b=MEnPkCg178kAgi
	dL48uqZUE8O2B0KB7OmU+3243+43CEkSc+xSWys+48hk506fbCK0t8My5WcLxduTX+TuAOiu8ogoP
	cThcgCkBdvbiSVPg+SzRqSIKLZKaw028VDlZFO6OMYEhGyduQIutT4peP9MEnd3bmqJfBsK23jLp7
	kUQy/FdvIid80pAZEZcBl2TOusccRosiYk6cO7wnrTBPtedolLEo89jqZtwSsUTpM8A2dw+s57B5S
	C1A5Ob5EJLPM7aI2VwH44IVn+VSzgpc5eL/hE2+DUVx+rXZXurzNTXO/+4n6fxqkf6cg04XVSI2Qz
	cp0YaqQD76dtF3EftffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9e2-00000003Xw1-13J5;
	Wed, 27 May 2026 08:29:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9dy-00000003Xv2-3i3h
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 08:29:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1075CC2AC43;
	Wed, 27 May 2026 08:29:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 565C8601A1;
	Wed, 27 May 2026 08:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F025810888BA2;
	Wed, 27 May 2026 10:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779870575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CWZgbSks4vt0vDT6Ogk7ELZgoPhWG9xAqtrnA7KlwS8=;
	b=g4fYCeJby2XbHS6Dy67G2WdkA/EEsKMnySAr6k8VcXV7fowApuwy6+Ahkz7rqguwEg118z
	TRAlVnjOwW+6blmaWOWSdxSA6molBDJtTgwUsL4Pq5/uzPJ9pWyh1SDLpX9GzgcWw5V3bl
	3xl+oLlSwgpyiKas61c2hdrgROxxdYA1K2mFNaN1e3GnPDVa7kIzE9uyczs9RncJwW0I+X
	9YUgHiB/F08t4n2QUJknq6k+pBouiSkJC7sQW/cRlQlLxHmPCic62vbC6/rlUMJVjRdtVt
	j7V39WaHqPtilsk7toTSwTJHkmE7zyLyRyjatT8Md2p1mAryqR7gy2hvLxCsPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Qing Wu <ses1er@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] [v2] mtd: spinand: add support for additional
 Dosilicon models
In-Reply-To: <20260520003733.82514-1-ses1er@gmail.com> (Qing Wu's message of
	"Tue, 19 May 2026 20:37:33 -0400")
References: <20260520003733.82514-1-ses1er@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 10:29:33 +0200
Message-ID: <87zf1ljlw2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_012939_085177_E46F0C09 
X-CRM114-Status: GOOD (  16.25  )
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

SGkgUWluZywKCk9uIDE5LzA1LzIwMjYgYXQgMjA6Mzc6MzMgLTA0LCBRaW5nIFd1IDxzZXMxZXJA
Z21haWwuY29tPiB3cm90ZToKCkNvdWxkIHlvdSBwbGVhc2UgY2hhbmdlIHRoZSB0aXRsZSBmb3I6
CgogICAgICAibXRkOiBzcGluYW5kOiBkb3NpbGljb246IEFkZCBzdXBwb3J0IGZvciBhZGRpdGlv
bmFsIG1vZGVscyIKCj4gQWRkIHN1cHBvcnQgZm9yIGFkZGl0aW9uYWwgRG9zaWxpY29uIFNQSSBO
QU5EIGNoaXBzLgo+Cj4gRGF0YXNoZWV0cyBmb3IgY2hpcHMgaW5jbHVkZWQgaW4gdGhpcyBwYXRj
aDogaHR0cHM6Ly93d3cuZG9zaWxpY29uLmNvbS9TUEklMjBOQU5EJTIwRmxhc2guaHRtbAo+Cj4g
VGVzdGVkIG9uIGEgVFAtTGluayBUTC03RFI3MjUwIHdpdGggYSBEb3NpbGljb24gRFMzNVExR0Ig
KDB4RTUgMHhGMSkKPgo+IExpbmsgdG8gb3JpZ2luYWwgdjI6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjYwMjE3MjIxNDQ0LjExMTcxLTEtc2VzMWVyQGdtYWlsLmNvbS8KClRoaXMg
bGluayBzaG91bGQgYmUgYmVsb3cgdGhlIHRocmVlICctLS0nLgoKPiBTaWduZWQtb2ZmLWJ5OiBR
aW5nIFd1IDxzZXMxZXJAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBGaXhl
ZCBjb21waWxhdGlvbiBlcnJvcnMuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjAyMTcyMTE0MjcuOTEyMC0xLXNlczFlckBnbWFpbC5jb20KPiAtLS0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9zcGkvZG9zaWxpY29uLmMgfCAyMDMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTk2IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvZG9zaWxpY29u
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9kb3NpbGljb24uYwo+IGluZGV4IGY5OTg5OTg2NmNl
Yi4uNmE1MTAwYzZiZjk5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Rvc2ls
aWNvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvZG9zaWxpY29uLmMKPiBAQCAtMSw2
ICsxLDcgQEAKPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgLyoKPiAg
ICogQXV0aG9yOiBBaG1lZCBOYXNlZWYgPG5hc2VlZmttQGdtYWlsLmNvbT4KPiArICogQWRkaXRp
b25zOiBRaW5nIFd1IDxzZXMxZXJAZ21haWwuY29tPgoKVGhlcmUgaXMgR2l0IGZvciB0aGF0LCBw
bGVhc2UgZHJvcCB0aGF0IGxpbmUuCgo+ICtzdGF0aWMgaW50IGRzMzV4eGdiX29vYmxheW91dF9m
cmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiArCQkJCSAgIHN0cnVjdCBt
dGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+ICt7Cj4gKwlpZiAoc2VjdGlvbikKPiArCQlyZXR1cm4g
LUVSQU5HRTsKPiArCj4gKwkvKiBSZXNlcnZlIDEgYnl0ZXMgZm9yIHRoZSBCQk0uICovCj4gKwly
ZWdpb24tPm9mZnNldCA9IDE7CgpQbGVhc2UgcmVzZXJ2ZSAyLCB0aGF0IGlzIHdoYXQgd2UgaGF2
ZSBiZWVuIGRvaW5nIHNvIGZhci4KCk90aGVyd2lzZSBsZ3RtLiBJIGNhbiB0YWtlIGl0IGZvciB0
aGUgbmV4dCBtZXJnZSB3aW5kb3cgaWYgeW91IHJlc2VuZApyYXBpZGx5LgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
