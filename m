Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8115EC624D0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtnZ7YGsrA9C5oU7ruOIIaVz8C43Cu4kkDa/1eu9i/4=; b=D6CektCZPgeP7b
	R7vA2AGaDRjjbstXDrs/gpVJg1Pn8LZkbPNYkPp6TI1ZRGyHYCw7MbQfuImLIr3vZ6pmbvG7E47AM
	zVpg2sqqbdrZHybDxxlCKmLFsu18xJ6UQXSisDW0ntkTvFX8doaTQkaIZH72ctztDgNNSjLvcehxd
	Tdfq/LBUPFmxcq8zs+Yo8Cf2LEkERhAVzDrA5UR7ozL9SZctAYFAf2J16iN0ziN/g58TrKnJqQvm7
	oPCXWPTcRcDtvE26qY7wD/l3Gs1nIQXgBGYsaDMFG26y2e+jmmYi3rH49QwFawMi9uypSaLRn6G8V
	jgM5B94hfJdL7Q06Wb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1htQ-0000000EJQK-3SmK;
	Wed, 02 Sep 2026 10:08:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1htO-0000000EJPq-09dt;
	Wed, 02 Sep 2026 10:08:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91AF81A195D;
	Wed,  2 Sep 2026 10:08:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 632E46053C;
	Wed,  2 Sep 2026 10:08:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F24D811C792F3;
	Wed,  2 Sep 2026 12:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788343701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xVRdbR32fbMwCjy/t/IfCUB0e7pTnQGXBNkJ9mb3Mzk=;
	b=WqLK9HD/tgyVgNJO/gLA6/XJnsi1JsewfVdkRfA1VY8ScLST05n2zKL1CqkfWSdbztexbH
	uLSzalGh7SrZvP+G/PPqBGGeD30kE8PRc2/v6mVZC4XkuflwLNhIcoVuCvlq0AiKIxsPjY
	dmYCds75vhQRtTsk6dQaT0o7ek8UMXpi5JRow6FT3QswbJbMQ8mwUHGBFnrlzASuIIa1Y2
	DQLHWWIbHB3TsNSOEAkUwturdmZQ26/2UTvkOUNQ/YpYPLIDF5XFkjm/L1m3aUq4H2Gj9V
	PnWSWGYjBz6LuM5fO7xgrw9rmEq4QxG5wUBDZaJAFoxgYwucA8M/GIAdtimMYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Jonathan Corbet" <corbet@lwn.net>,  "Shuah
 Khan" <skhan@linuxfoundation.org>,  "Steam Lin" <STLin2@winbond.com>,
  "Hsin-Yi Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 03/23] mtd: spi-nor: Refactor Read Status/Write
 Status support
In-Reply-To: <DKONYM8W4BAW.25PBIPPWCILG1@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 14:25:56 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-3-b637cf120d5c@bootlin.com>
	<DKONYM8W4BAW.25PBIPPWCILG1@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 12:08:14 +0200
Message-ID: <874ig87ypd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_030830_378286_A5F87C0D 
X-CRM114-Status: GOOD (  31.03  )
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

SGVsbG8gTWljaGFlbCwKCj4+IFRoZXJlIHdpbGwgcHJvYmFibHkgYmUgYnJlYWthZ2VzIG9uIG9s
ZGVyIGNoaXBzLiBUaGVzZSBjYW5ub3QgYmUKPj4gZ3Vlc3NlZCBiZWNhdXNlIHRoZXkgYXJlIG5v
dCBwcm9wZXJseSBsaXN0ZWQgaW4gbWFudWZhY3R1cmVyCj4+IGZpeHVwcyAoeWV0KS4gSWYgd2Ug
d2FudCBhIGNsZWFudXAvc2ltcGxpZmljYXRpb24sIHdlIHdpbGwgaGF2ZSB0byBjb3BlCj4+IHdp
dGggdGhpcyByaXNrLgo+Pgo+PiBJIGhvcGUgdGhlIGRpZmYgc3RhdHMgd2lsbCBtb3RpdmF0ZSBw
ZW9wbGUgdG8gaGF2ZSBhIGxvb2sgYW5kIHJlcG9ydAo+PiB0aGVpciB0ZXN0aW5nLgo+Pgo+PiBJ
IHdpbGwgYWxzbyBlYWdlcmx5IG1vbml0b3IgU2FzaGlrbydzIG91dHB1dCB3aGljaCB3aWxsIHBy
b2JhYmx5IGJlCj4+IHZlcnkgdXNlZnVsIHRvIGNhdGNoIG5pY2hlIHdlaXJkIGNhc2VzIHdoZXJl
IHRoZXNlIGNoYW5nZXMgbWlnaHQgYnJlYWsuCj4KPgo+IEhvbmVzdGx5LCBJJ20gc3RpbGwgbm90
IHNvbGQgYXQgdGhlIHNyMSBhbmQgc3IyIHNwbGl0LiBCdXQgc2luY2UKPiBzcGktbm9yIGlzIGtu
b3cgZm9yIGl0J3MgY29kZSBjaHVybi4gSSBjb3VsZCBqdXN0IHJld29yayB0aGF0IGxhdGVyCj4g
OikKCjonLSkKCj4gU3RpbGwgSSBoYWQgc29tZSBxdWVzdGlvbnMgaW4gdGhlIG9sZCB0aHJlYWQ6
Cj4gSSBkb24ndCBnZXQgd2h5IHRoZXJlIHNob3VsZCBiZSBhbnkgZW5kaWFubmVzcyBwcm9ibGVt
cz8KPiBKdXN0IHRoZSBsb3cgbGV2ZWwgcmVhZCBhbmQgd3JpdGUgd291bGQgaGF2ZSB0byBmaWd1
cmUgb3V0IGhvdyB0bwo+IHJlYWQgYW5kIHdyaXRlIHRoZSBzdGF0dXMgcmVnaXN0ZXJzLgoKWWVz
LCB0aGF0J3MgdGhlIHBvaW50LCB3aXRoIGFuIGFycmF5IHRoZXJlIGlzIG5vIGVuZGlhbm5lc3Mg
cHJvYmxlbSwKZXZlbiBsb3cgbGV2ZWwgaGVscGVycyBkbyBub3QgbmVlZCB0byBrbm93IG1lbW9y
eSBvcmRlcmluZy4gRW5kaWFubmVzcwppcyAqYWx3YXlzKiBhIHBhaW4sIGl0IGlzIG1vc3Qgb2Yg
dGhlIHRpbWUgd3JvbmdseSB1bmRlcnN0b29kLCBJIGhhdGUKZW5kaWFubmVzcyB0b3BpY3MgOikK
ClsuLi5dCgo+PiAraW50IHNwaV9ub3JfcmVhZF9zcjIoc3RydWN0IHNwaV9ub3IgKm5vciwgdTgg
KnNyMikKPj4gK3sKPj4gKwlzdHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0ZXIgKnBhcmFtcyA9
IG5vci0+cGFyYW1zOwo+PiArCWludCByZXQ7Cj4+ICsKPj4gKwlpZiAocGFyYW1zLT5vcGNvZGVz
LnJlYWRfc3IyKSB7Cj4+ICsJCXJldCA9IHNwaV9ub3JfcmVhZF9zcl9sbChub3IsIHBhcmFtcy0+
b3Bjb2Rlcy5yZWFkX3NyMiwgc3IyLCAxKTsKPj4gKwkJaWYgKHJldCkKPj4gKwkJCXJldHVybiBy
ZXQ7Cj4+ICsJfSBlbHNlIGlmIChzcGlfbm9yX2dldF9wcm90b2NvbF93aWR0aChub3ItPnJlYWRf
cHJvdG8pID09IDQgfHwKPj4gKwkJICAgc3BpX25vcl9nZXRfcHJvdG9jb2xfd2lkdGgobm9yLT53
cml0ZV9wcm90bykgPT0gNCkgewo+PiArCQkvKiBNYWtlIHN1cmUgdGhlIFFFIGJpdCBpcyBwZXJz
aXN0ZW50bHkga2VwdCAqLwo+PiArCQkqc3IyID0gcGFyYW1zLT5xZV9tYXNrWzFdOwo+Cj4gTWgu
IFNvIGJlZm9yZSB0aGVyZSB3YXMgYXQgbGVhc3QgYSBjaGVjayBpZiBhIHF1YWRfZW5hYmxlIGNi
IGlzIHNldC4KPiBJcyB0aGlzIG5vdyBpbXBsaWNpdD8gYmVjYXVzZSBxZV9tYXNrWzFdIGlzIHpl
cm8gaWYgdGhlcmUgaXMgbm8KPiBxdWFkX2VuYWJsZT8gVGhhdCBzaG91bGQgYXQgKmxlYXN0KiBn
ZXQgc29tZSBjb21tZW50LgoKWW91IGFyZSByaWdodCwgdGhpcyBpcyBtaXNzaW5nIHRoZSBzdF9t
aWNyb24gY2FzZS4gSSB3aWxsIHJlLWFkZCB0aGUKY2hlY2suCgo+IEkgdHJpZWQgdG8gYWN0dWFs
bHkgZ2V0IHRoZSBvcmlnaW5hbCB1c2UgY2FzZSwgYnV0IGFsbCBJJ3ZlIGZvdW5kCj4gaXMgVHVk
b3JzIGNvbW1pdCAzOWQxZTMzNDBjNzMgKCJtdGQ6IHNwaS1ub3I6IEZpeCBjbGVhcmluZyBvZiBR
RSBiaXQKPiBvbiBsb2NrKCkvdW5sb2NrKCkiKS4gVGhlcmUgd2Fzbid0IG11Y2ggb2YgYSBkaXNj
dXNzaW9uIG9uIHRoZSBNTCwKPiBhbmQgSSBjb3VsZG4ndCBmaW5kIHdoZXJlIEJvcmlzIHdhcyBz
dWdnZXN0aW5nIGl0Lgo+Cj4gU28gYmVmb3JlIHdlIGNhbm5vdCBnZXQgcmlkIG9mIGl0IGFueW1v
cmUsIHdlIHNob3VsZCBqdXN0IGhhbmRsZSBpdAo+IGluIHRoZSBvbmUgY2FsbGVyIHdoaWNoIGFj
dHVhbGx5IHVzZXMgaXQ6IHNwaV9ub3Jfc3Jfe3VuLH1sb2NrKCkuCj4gSSd2ZSBjaGVja2VkIHRo
ZSBjdXJyZW50IHNwaV9ub3Jfd3JpdGVfc3JfYW5kX2NoZWNrKCkgYW5kIHRoZSBvbmx5Cj4gYWN0
dWFsIHVzZXIgaXMgdGhlIHN3cC5jLiBhdG1lbC5jIGlzIGRvaW5nIGdsb2JhbCB3cml0ZSBwcm90
ZWN0aW9uCj4gb24vb2ZmLCB3aGljaCBJSVJDIG9ubHkgdXNlcyBTUjEuCgpZZXMuCgo+IFNvIGxl
dCdzIG1vdmUgdGhhdCB3ZWlyZCBoYW5kbGluZyB0aGVyZS4gVGhlbiBjaGFuY2VzIGFyZSwgd2Ug
Y2FuCj4gZ2V0IHJpZCBvZiBpdCBhcyB3ZSBrbm93IHdoYXQgZmxhc2hlcyBkbyBsb2NraW5nIGJl
Y2F1c2UgdGhhdCBpcyBub3QKPiBkaXNjb3ZlcmFibGUgYXQgcnVudGltZS4gSXQncyBqdXN0IHRl
ZGlvdXMgd29yayB0byBjaGVjayBhbGwgdGhlCj4gZGF0YXNoZWV0cy4gQnV0IGFzIHNvb24gYXMg
d2Ugbm93IHB1dCB0aGF0IGludG8gYSBtb3JlIGdlbmVyaWMgcGF0aCwKPiB3ZSBjYW4ndCBkbyBh
bnl0aGluZyBhYm91dCBpdCBhbnltb3JlLgoKSSB1bmRlcnN0YW5kIHRoZSBjb25jZXJuLCB3aGlj
aCBpcyByaWdodC4gSSBqdXN0IGFkZGVkIGEKInJlYWRfc3IyX2NhcmVmdWwiIGhlbHBlciBmb3Ig
dGhlIHN3cC5jIHB1cnBvc2UuCgo+PiArCX0gZWxzZSB7Cj4+ICsJCSpzcjIgPSAwOwo+Cj4gSSdk
IGV4cGVjdCBhbiAtRUlOVkFMIG9yIC1FSU8gaGVyZS4KClRoZXJlIGlzIGFuIGFjdHVhbCBjYXNl
IHRoYXQgaXMgcG9zc2libGUgd2hlcmUgd2UgZG8gbm90IHdhbnQgdG8gdXNlCnF1YWQgbW9kZSBv
biBhIEJGUFRfRFdPUkQxNV9RRVJfU1IyX0JJVDFfTk9fUkQgY2hpcC4gSSBiZWxpZXZlIHdlIHNo
b3VsZAprZWVwID0gMCBoZXJlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
