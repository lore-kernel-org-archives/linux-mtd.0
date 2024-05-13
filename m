Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D099C25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 07:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+IqkqaoubV+4uw8gnstTy5eMYSRPzZR5dT2x0rqrps=; b=CpS8SFw1GTLP/b
	MkOeE0Lwfa2OSM01MSHEWM6fNT8mN7dTIQalQQL6uREeo7LDZCSJ1rAPUqT7IbAwiiP2BQvKy0McM
	LtKcrtoovMW3WaPKUZ5WkKdM2hdCIwyCSNbkoO/X4KeAEwQvZmYWxKE8NfLJekOv3c1GtSlOm5Hrv
	OtBifnzBm+7GEQbAoo5Qv9VRGefXqYpEjATnhuyO0/HBskoG2y5oyDfC5WcI4rsLLFGblJJhIDl5O
	td3KsYLWr3HR8N0ehVJekkWIQWo8gksyNnUlM7mM3OU+QzOkoGfJ41wHSmSZrgV82ZNcklQs0Ch7j
	kxQvmk8TXyM9j2p3laJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QBE-0000000C2YY-2qzl;
	Mon, 13 May 2024 07:33:04 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QBB-0000000C2Vj-3vIN
	for linux-mtd@lists.infradead.org;
	Mon, 13 May 2024 07:33:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 314E7E001F;
	Mon, 13 May 2024 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715585578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGmscOb+RgNNTwX16x2NIpkC81OXkCaqv8GhmS1ltgA=;
	b=AdaBrLDx81aISXeOcJ1wlfC5GtkrGSMwUMj+w08VjW+Vg55bCqkw48A+nPB+6UAxbslci7
	EP+hCIRpGJNsUc2Yqwlcw/GbWx0Fp2T+uc7FS7WLjLa57IjxKQ9GekXUYiXyu/Ekilf2D4
	6NVrEyHb4eWJ2El43vQmtnKGvRNjhv7g6AJUX9yEOIbc9t7qswKaEItY8euTP2O/VbT6Pw
	v8ubGRw1Zlj4J688XSq0llafwA/h4yW29MyM8g+eatjaehfdkBeyuf7eLvaft1aZ8zlJxf
	84mNssU6FVXMnub5Q70nUONJzRUvJH0r0ljcZomOxrFeBIuW7XIqo6gqrcjkhQ==
Date: Mon, 13 May 2024 09:32:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <20240513093256.363861d1@xps-13>
In-Reply-To: <20240513091902.2c00d30a@xps-13>
References: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
	<20240508-mtd-nand-mxc-nand-exec-op-v2-2-6b7366b7831f@pengutronix.de>
	<20240513091902.2c00d30a@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_003302_284774_1F4E5069 
X-CRM114-Status: GOOD (  20.22  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gTW9uLCAxMyBNYXkgMjAyNCAwOTox
OTowMiArMDIwMDoKCj4gSGkgU2FzY2hhLAo+IAo+ID4gQEAgLTE3MTcsOSArMTQ2NSwxMTEgQEAg
c3RhdGljIGludCBteGNuZF9zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
aW50IGNoaXBuciwKPiA+ICAJcmV0dXJuIGhvc3QtPmRldnR5cGVfZGF0YS0+c2V0dXBfaW50ZXJm
YWNlKGNoaXAsIGNoaXBuciwgY29uZik7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgbXhj
bmRfZXhlY19vcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4gKwkJCSBjb25zdCBzdHJ1Y3Qg
bmFuZF9vcGVyYXRpb24gKm9wLAo+ID4gKwkJCSBib29sIGNoZWNrX29ubHkpCj4gPiArewo+ID4g
KwlzdHJ1Y3QgbXhjX25hbmRfaG9zdCAqaG9zdCA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShj
aGlwKTsKPiA+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiA+
ICsJaW50IGksIGosIGJ1Zl9sZW47Cj4gPiArCXZvaWQgKmJ1Zl9yZWFkID0gTlVMTDsKPiA+ICsJ
Y29uc3Qgdm9pZCAqYnVmX3dyaXRlID0gTlVMTDsKPiA+ICsJY29uc3Qgc3RydWN0IG5hbmRfb3Bf
aW5zdHIgKmluc3RyOwo+ID4gKwlib29sIHJlYWRpZCA9IGZhbHNlOwo+ID4gKwlib29sIHN0YXR1
c3JlcSA9IGZhbHNlOwo+ID4gKwo+ID4gKwlkZXZfZGJnKGhvc3QtPmRldiwgIiVzOiAlZCBpbnN0
cnVjdGlvbnNcbiIsIF9fZnVuY19fLCBvcC0+bmluc3Rycyk7ICAKPiAKPiBNYXliZSB5b3Ugd2Fu
dCB0byBnZXQgcmlkIG9mIHRoaXMgZGVidWcgbGluZS4KPiAKPiA+ICsKPiA+ICsJaWYgKGNoZWNr
X29ubHkpCj4gPiArCQlyZXR1cm4gMDsKPiA+ICsKPiA+ICsJZm9yIChpID0gMDsgaSA8IG9wLT5u
aW5zdHJzOyBpKyspIHsKPiA+ICsJCWluc3RyID0gJm9wLT5pbnN0cnNbaV07Cj4gPiArCj4gPiAr
CQluYW5kX29wX3RyYWNlKCIgICIsIGluc3RyKTsKPiA+ICsKPiA+ICsJCXN3aXRjaCAoaW5zdHIt
PnR5cGUpIHsKPiA+ICsJCWNhc2UgTkFORF9PUF9XQUlUUkRZX0lOU1RSOgo+ID4gKwkJCS8qCj4g
PiArCQkJICogTkZDIGhhbmRsZXMgUi9CIGludGVybmFsbHkuIFRoZXJlZm9yZSwgdGhpcyBmdW5j
dGlvbgo+ID4gKwkJCSAqIGFsd2F5cyByZXR1cm5zIHN0YXR1cyBhcyByZWFkeS4gIAo+IAo+IFRo
aXMgaXMgbm8gbG9uZ2VyIGEgc3RhbmRhbG9uZSBmdW5jdGlvbiwgbWF5YmU6Cj4gCj4gIlRoZSBj
b250cm9sbGVyIGhhbmRsZXMgdGhlIFIvQiBwaW4gaW50ZXJuYWxseSwgdGhlcmVmb3JlIHRoZXJl
IGlzCj4gbm90aGluZyB0byBkbyBoZXJlLiIKCkFuZCB0aGlzIGlzIGFjdHVhbGx5IHZlcnkgd3Jv
bmcuCgpZb3Ugc2hvdWxkIGNhbGwgd2FpdF9vcF9kb25lKCkgaW5zdGVhZC4KCj4gCj4gPiArCQkJ
ICovCj4gPiArCQkJYnJlYWs7Cj4gPiArCQljYXNlIE5BTkRfT1BfQ01EX0lOU1RSOgo+ID4gKwkJ
CWlmIChpbnN0ci0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfUEFHRVBST0cpCj4gPiArCQkJ
CWhvc3QtPmRldnR5cGVfZGF0YS0+c2VuZF9wYWdlKG10ZCwgTkZDX0lOUFVUKTsKCkFjdHVhbGx5
IHRoaXMgaXMgbm90IHRoZSByaWdodCBwbGFjZS4gWW91IHNob3VsZCB0cmlnZ2VyIHRoZSB0cmFu
c2Zlcgpmcm9tIGNvbnRyb2xsZXIgU1JBTSB0byBOQU5EIChhbmQgdGhlIG90aGVyIHdheSBhcm91
bmQpIGluIHRoZQpOQU5EX09QX0RBVEFfT1VUX0lOU1RSIGNhc2UuCgpIZXJlIHlvdSBzaG91bGQg
anVzdCBjYWxsIC0+c2VuZF9jbWQuCgo+ID4gKwo+ID4gKwkJCWhvc3QtPmRldnR5cGVfZGF0YS0+
c2VuZF9jbWQoaG9zdCwgaW5zdHItPmN0eC5jbWQub3Bjb2RlLCB0cnVlKTsKPiA+ICsKPiA+ICsJ
CQlpZiAoaW5zdHItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1JFQURJRCkKPiA+ICsJCQkJ
cmVhZGlkID0gdHJ1ZTsKPiA+ICsJCQlpZiAoaW5zdHItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRf
Q01EX1NUQVRVUykKPiA+ICsJCQkJc3RhdHVzcmVxID0gdHJ1ZTsKPiA+ICsKPiA+ICsJCQlicmVh
azsKPiA+ICsJCWNhc2UgTkFORF9PUF9BRERSX0lOU1RSOgo+ID4gKwkJCWZvciAoaiA9IDA7IGog
PCBpbnN0ci0+Y3R4LmFkZHIubmFkZHJzOyBqKyspIHsKPiA+ICsJCQkJYm9vbCBpc2xhc3QgPSBq
ID09IGluc3RyLT5jdHguYWRkci5uYWRkcnMgLSAxOwo+ID4gKwkJCQlob3N0LT5kZXZ0eXBlX2Rh
dGEtPnNlbmRfYWRkcihob3N0LCBpbnN0ci0+Y3R4LmFkZHIuYWRkcnNbal0sIGlzbGFzdCk7Cj4g
PiArCQkJfQo+ID4gKwkJCWJyZWFrOwo+ID4gKwkJY2FzZSBOQU5EX09QX0RBVEFfT1VUX0lOU1RS
Ogo+ID4gKwkJCWJ1Zl93cml0ZSA9IGluc3RyLT5jdHguZGF0YS5idWYub3V0Owo+ID4gKwkJCWJ1
Zl9sZW4gPSBpbnN0ci0+Y3R4LmRhdGEubGVuOwo+ID4gKwo+ID4gKwkJCW1lbWNweTMyX3RvaW8o
aG9zdC0+bWFpbl9hcmVhMCwgYnVmX3dyaXRlLCBidWZfbGVuKTsKPiA+ICsJCQlpZiAoY2hpcC0+
b29iX3BvaSkKPiA+ICsJCQkJY29weV9zcGFyZShtdGQsIGZhbHNlLCBjaGlwLT5vb2JfcG9pKTsg
IAo+IAo+IFRoaXMgY29weSBzaG91bGQgbm90IGJlIG5lZWRlZC4gSXQgc2hvdWxkIGJlIGluIHlv
dXIgcGFnZSBhY2Nlc3NvcnMgaWYKPiBuZWVkZWQuCj4gCj4gPiArCj4gPiArCQkJYnJlYWs7Cj4g
PiArCQljYXNlIE5BTkRfT1BfREFUQV9JTl9JTlNUUjoKPiA+ICsKPiA+ICsJCQlidWZfcmVhZCA9
IGluc3RyLT5jdHguZGF0YS5idWYuaW47Cj4gPiArCQkJYnVmX2xlbiA9IGluc3RyLT5jdHguZGF0
YS5sZW47Cj4gPiArCj4gPiArCQkJaWYgKHJlYWRpZCkgewo+ID4gKwkJCQlob3N0LT5kZXZ0eXBl
X2RhdGEtPnNlbmRfcmVhZF9pZChob3N0KTsKPiA+ICsJCQkJcmVhZGlkID0gZmFsc2U7Cj4gPiAr
Cj4gPiArCQkJCW1lbWNweTMyX2Zyb21pbyhob3N0LT5kYXRhX2J1ZiwgaG9zdC0+bWFpbl9hcmVh
MCwgYnVmX2xlbiAqIDIpOwo+ID4gKwo+ID4gKwkJCQlpZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRf
QlVTV0lEVEhfMTYpIHsKPiA+ICsJCQkJCXU4ICpidWZyID0gYnVmX3JlYWQ7Cj4gPiArCQkJCQl1
MTYgKmJ1ZncgPSBob3N0LT5kYXRhX2J1ZjsKPiA+ICsJCQkJCWZvciAoaiA9IDA7IGogPCBidWZf
bGVuOyBqKyspCj4gPiArCQkJCQkJYnVmcltqXSA9IGJ1Zndbal07Cj4gPiArCQkJCX0gZWxzZSB7
Cj4gPiArCQkJCQltZW1jcHkoYnVmX3JlYWQsIGhvc3QtPmRhdGFfYnVmLCBidWZfbGVuKTsKPiA+
ICsJCQkJfQo+ID4gKwkJCQlicmVhazsKPiA+ICsJCQl9Cj4gPiArCj4gPiArCQkJaWYgKHN0YXR1
c3JlcSkgewo+ID4gKwkJCQkqKHU4KilidWZfcmVhZCA9IGhvc3QtPmRldnR5cGVfZGF0YS0+Z2V0
X2Rldl9zdGF0dXMoaG9zdCk7Cj4gPiArCQkJCXN0YXR1c3JlcSA9IGZhbHNlOwo+ID4gKwkJCQli
cmVhazsKPiA+ICsJCQl9Cj4gPiArCj4gPiArCQkJaG9zdC0+ZGV2dHlwZV9kYXRhLT5yZWFkX3Bh
Z2UoY2hpcCk7Cj4gPiArCj4gPiArCQkJaWYgKElTX0FMSUdORUQoYnVmX2xlbiwgNCkpIHsKPiA+
ICsJCQkJbWVtY3B5MzJfZnJvbWlvKGJ1Zl9yZWFkLCBob3N0LT5tYWluX2FyZWEwLCBidWZfbGVu
KTsKPiA+ICsJCQl9IGVsc2Ugewo+ID4gKwkJCQltZW1jcHkzMl9mcm9taW8oaG9zdC0+ZGF0YV9i
dWYsIGhvc3QtPm1haW5fYXJlYTAsIG10ZC0+d3JpdGVzaXplKTsKPiA+ICsJCQkJbWVtY3B5KGJ1
Zl9yZWFkLCBob3N0LT5kYXRhX2J1ZiwgYnVmX2xlbik7Cj4gPiArCQkJfQo+ID4gKwo+ID4gKwkJ
CWJyZWFrOwo+ID4gKwkJfQo+ID4gKwl9Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30gIAo+
IAo+IE90aGVyd2lzZSBJJ20gdmVyeSBoYXBweSB3aXRoIHRoZSBsb29rLgo+IAo+IFRoYW5rcywK
PiBNaXF1w6hsCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
