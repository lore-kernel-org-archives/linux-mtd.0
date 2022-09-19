Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF6C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5qAcjoV6PzWgh4Cs5WsjP+loYoU+WzPff3/b7NPXc4=; b=kCMfm47OB/5zbW
	HbGEumsL5mCUwwWO8sOzi9tQpalMHaeWlEHh9wpt8P8lLHFaKztNQfLcnmjoS6foGtL9A3qtUAEPH
	MedX/0GUTxI2HD9AZ6g0jTB5aE73fGGfVzwSQpuVMfQpt3hBXgSXbhTbsMpcUSGtytXZlHEGYV+00
	OtjYzYCm7CdWP7/XpczRZamdRdMtAiO6kynr6zld8dI2CzyZlJ3Losg5aNDXL9/mlcHxssnCZeUck
	VaviV0aLg6yIUr+2jcM4v83ETt946ZnpoVRUNCQsjwtnVAqGeBpQmoblrGUsCmE5K5sEKDCH/3PaO
	Iy6IniXzGnEvPWjC91jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJ9j-00ChOW-Tc; Mon, 19 Sep 2022 15:58:00 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJ9e-00ChKg-Au
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 15:57:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 885C1FF804;
	Mon, 19 Sep 2022 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663603071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rX6igEp7IvrSFf9zz5G2VF1s9bfuFqim/tJ7yj60HZk=;
	b=VFOQLqKEQQT+DyALaRT8PGXPTo9qwflkK+tTQ/Vf2iZGEYSJ6EF95G5CljZtBk2OY7FXAg
	9ZFNu7gFH3SySLgSQMFbi/QoY+pgwA/ChlAxzq8nyKW9UeN+fgx5+hR2udB2jdyuvAX9C4
	pr4MV+4wFvgvHE7uScz5+vDS86QTS2neExADk0Di7qBgqLqAzl1px4bRT6TGn/KaYc3h+B
	bKi1rqhmlD14tWElXrqHcHF1rCnfknvvciDYN53Zc/zGXa3J9LdYQoBGzVf/rwXqz9JHbm
	Ct/TcJX56HCUw8ok0klpUuxLr5RheZCHqICLkAux3RVtJ/DOsCD7CwFQ54oqsw==
Date: Mon, 19 Sep 2022 17:57:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Adrian Zaharia <Adrian.Zaharia@windriver.com>,
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
 jani.nurminen@windriver.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mtd: mtdpart: Fix cosmetic print
Message-ID: <20220919175749.6ba76d13@xps-13>
In-Reply-To: <43059215-aa56-e8c5-53a4-143643058797@gmail.com>
References: <20220825060407.335475-1-Adrian.Zaharia@windriver.com>
	<20220825060407.335475-2-Adrian.Zaharia@windriver.com>
	<43059215-aa56-e8c5-53a4-143643058797@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_085754_742677_A3445D52 
X-CRM114-Status: GOOD (  21.77  )
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

SGVsbG8sCgp6YWplYzVAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgMTMgU2VwIDIwMjIgMDk6Mzc6
MjEgKzAyMDA6Cgo+IE9uIDI1LjA4LjIwMjIgMDg6MDQsIEFkcmlhbiBaYWhhcmlhIHdyb3RlOgo+
ID4gRnJvbTogSmFuaSBOdXJtaW5lbiA8amFuaS5udXJtaW5lbkB3aW5kcml2ZXIuY29tPgo+ID4g
Cj4gPiBUaGUgcHJpbnQgb2YgdGhlIE1URCBwYXJ0aXRpb25zIGR1cmluZyBib290IGFyZSBvZmYt
Ynktb25lIGZvciB0aGUgc2l6ZS4KPiA+IEZpeCB0aGlzIGFuZCBzaG93IHRoZSByZWFsIGxhc3Qg
b2Zmc2V0LiAgCj4gCj4gSSBzZWUgdGhhdCBQQ0kgc3Vic3lzdGVtIGFuZCBwcmludGsoKSArICVw
UiBkbyB0aGF0LiBQcm9iYWJseSBtb3JlLiBJCj4gZ3Vlc3MgaXQgbWFrZXMgc2Vuc2UgYnV0IEkn
bSBhbHNvIHdvbmRlcmluZyBpZi9ob3cgY29uZnVzaW5nIGlzIHRoYXQKPiBjaGFuZ2UgZ29pbmcg
dG8gYmUgZm9yIHVzZXJzLiBXZSBkaWQgcHJpbnRpbmcgbGlrZSB0aGF0IGZvciBwcm9iYWJseQo+
IGRvemVucyBvZiB5ZWFycy4KCkFncmVlZCwgSSB3b3VsZCByYXRoZXIgbm90IG1lc3Mgd2l0aCB0
aGlzIG91dHB1dCB3aGljaCBtaWdodCBiZQpjb25zaWRlcmVkIHBhcnQgb2YgdGhlIEFCSSwgSSBh
bSBzdXJlIHRoZXJlIGFyZSBwbGVudHkgb2Ygc2NyaXB0cyBvdXQKdGhlcmUgd2hpY2ggZG8gc2ls
bHkgdGhpbmdzIHdpdGggdGhvc2UgbGluZXMgOi0pCgo+IAo+IAo+ID4gRml4ZXM6IDNkNmY2NTdj
ZWQyYiAoIm10ZDogbXRkcGFydDogRml4IGNvc21ldGljIHByaW50IikgIAo+IAo+IEkgY2FuJ3Qg
ZmluZCB0aGF0IGhhc2ggLyBjb21taXQgYW55d2hlcmUuIEFyZSB5b3Ugc3VyZSBpdCBleGlzdHM/
Cj4gCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE51cm1pbmVuIDxqYW5pLm51cm1pbmVuQHdp
bmRyaXZlci5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gWmFoYXJpYSA8QWRyaWFuLlph
aGFyaWFAd2luZHJpdmVyLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMg
fCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9t
dGQvbXRkcGFydC5jCj4gPiBpbmRleCBkNDQyZmE5NGM4NzIuLmZhYjEwZTZkNDE3MSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbXRk
cGFydC5jCj4gPiBAQCAtMTE4LDcgKzExOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRkX2luZm8gKmFs
bG9jYXRlX3BhcnRpdGlvbihzdHJ1Y3QgbXRkX2luZm8gKnBhcmVudCwKPiA+ICAgCQljaGlsZC0+
cGFydC5zaXplID0gcGFyZW50X3NpemUgLSBjaGlsZC0+cGFydC5vZmZzZXQ7ICAKPiA+ICAgPiAg
IAlwcmludGsoS0VSTl9OT1RJQ0UgIjB4JTAxMmxseC0weCUwMTJsbHggOiBcIiVzXCJcbiIsICAK
PiA+IC0JICAgICAgIGNoaWxkLT5wYXJ0Lm9mZnNldCwgY2hpbGQtPnBhcnQub2Zmc2V0ICsgY2hp
bGQtPnBhcnQuc2l6ZSwKPiA+ICsJICAgICAgIGNoaWxkLT5wYXJ0Lm9mZnNldCwgY2hpbGQtPnBh
cnQub2Zmc2V0ICsgY2hpbGQtPnBhcnQuc2l6ZSAtIDEsCj4gPiAgIAkgICAgICAgY2hpbGQtPm5h
bWUpOyAgCj4gPiAgID4gICAJLyogbGV0J3MgZG8gc29tZSBzYW5pdHkgY2hlY2tzICovICAKPiAK
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
