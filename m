Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F403AC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:19:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4412661424
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4412661424
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iwzmYJL8JBsxcDMQtnQFGVABhWreRRXMsTJj29VIpIo=; b=GM8qHSNoAKRvcPH7mNNBYnSN0
	SWopDRa73XE4Yx6o9BhHy1lxeXcSAkUmKsgypulfnKtUs9qWKx+sz4g/CU34qwosiEJ3ZJ+GDkk9A
	nQ6fTlEErJPOgmElbH1Tx7KDw5+Hwoknj2XzHMpSaHq1nuTRC4hEt+A1in/iAZnVKBy44dj4NdYQ4
	QTQzSyvsJnfNr548E0KO3mCbeeS9qysfEsHhf9Iqttr+kW49AAdaTCMBWhiVNz18k9dkVEdagsP38
	jym5fmNXskYSdw3QfkFCcg3iM0yEMZmHpSlWylViBKKc+pRMGNmXS0uoKMgz03P1HBPD2rjY3jb+f
	U0mhGvRwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg303-00DuUg-Eq; Mon, 10 May 2021 10:18:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg300-00DuUE-O4
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=GtIW9rIoJu6t5Bdsm4NYWASOalK/hfB9SW3mVD3G08A=; b=XJJ3+5AbSMb29ZnrGdDiW9++hI
 joyOhBIlK1t5S/ayF1o7vGbIYFw3i/NY0b7dAwwyu0PfRMmsx45hViH+Vpluvdlp8hd6Qpm6gMiYw
 wmVIzPUdIdBTVV2BPzbJRJtImg+9mr7NKDzXSPMUEqo070A6tL9UqHhG86cs48n5EPJZcxBYi658n
 YgZm5+bMfDwZSHRhVOJS7Hn6r64R2CgFe9VKbCZM8ZDJn3nQtjB6uZO+hrSFQfeCUCSySC1O4n4we
 d9j8sEx+SO/Es6M3qQ1tp7+lCObaEzW/FK1PIpsLO0cWNL9VpJ992zjYDt50o8kaihsVvGWYIMN0S
 jGckcKRg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2zx-008WDj-V4
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:18:51 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B28F26000F;
 Mon, 10 May 2021 10:18:42 +0000 (UTC)
Date: Mon, 10 May 2021 12:18:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3] mtd: super: don't rely on mtdblock device minor
Message-ID: <20210510121837.14274d4f@xps13>
In-Reply-To: <YHRj5MUb5MGdPQqw@makrotopia.org>
References: <YG9qzC/SaD7SNWVm@makrotopia.org> <YHRj5MUb5MGdPQqw@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_031850_157221_DB548D79 
X-CRM114-Status: GOOD (  20.39  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIEdvbGxlIDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+IHdyb3RlIG9u
IE1vbiwgMTIgQXByIDIwMjEgMTY6MTQ6NDQKKzAxMDA6Cgo+IEZvciBibGt0cmFucyBkZXZpY2Vz
IHdpdGggcGFydGl0aW9ucyAoaWUuIHBhcnRfYml0cyAhPSAwKSB0aGUKPiBhc3N1bXB0aW9uIHRo
YXQgdGhlIG1pbm9yIG51bWJlciBvZiB0aGUgbXRkYmxvY2sgZGV2aWNlIG1hdGNoZXMKPiB0aGUg
bXRkbnVtIGRvZXNuJ3QgaG9sZCB0cnVlLgo+IFByb3Blcmx5IHJlc29sdmUgbXRkIGRldmljZSBm
cm9tIGJsa3RyYW5zIGxheWVyIGluc3RlYWQuCgpVbmZvcnR1bmF0ZWx5IEkgY2Fubm90IGFwcGx5
IHlvdXIgcGF0Y2ggYW55bW9yZSwgd291bGQgeW91IG1pbmQKcmViYXNpbmcgaXQgb24gdG9wIG9m
IHY1LjEzLXJjMT8KClRoYW5rcywKTWlxdcOobAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
R29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiAtLS0KPiB2MzogZml4IHR5cG8gaW4gcGF0
Y2ggZGVzY3JpcHRpb24KPiB2MjogcmVtb3ZlIEJVRygpIGNhbGxzIGFzIHJlcXVlc3RlZCBieSBN
aXF1ZWwgUmF5bmFsCj4gCj4gIGRyaXZlcnMvbXRkL210ZHN1cGVyLmMgfCAzMSArKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRzdXBlci5j
IGIvZHJpdmVycy9tdGQvbXRkc3VwZXIuYwo+IGluZGV4IGMzZTIwOTgzNzJmMmUuLmQzYWY4MGE3
Y2U4NmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkc3VwZXIuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL210ZHN1cGVyLmMKPiBAQCAtOSw2ICs5LDcgQEAKPiAgICovCj4gIAo+ICAjaW5jbHVk
ZSA8bGludXgvbXRkL3N1cGVyLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tdGQvYmxrdHJhbnMuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L25hbWVpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L2N0eXBlLmg+Cj4gQEAgLTEyMSw3ICsxMjIsOCBAQCBpbnQgZ2V0
X3RyZWVfbXRkKHN0cnVjdCBmc19jb250ZXh0ICpmYywKPiAgewo+ICAjaWZkZWYgQ09ORklHX0JM
T0NLCj4gIAlzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2Owo+IC0JaW50IHJldCwgbWFqb3I7Cj4g
KwlzdHJ1Y3QgbXRkX2Jsa3RyYW5zX2RldiAqYmxrdHJhbnNfZGV2Owo+ICsJaW50IHJldCwgbWFq
b3IsIHBhcnRfYml0czsKPiAgI2VuZGlmCj4gIAlpbnQgbXRkbnI7Cj4gIAo+IEBAIC0xNjksMjEg
KzE3MSwzNiBAQCBpbnQgZ2V0X3RyZWVfbXRkKHN0cnVjdCBmc19jb250ZXh0ICpmYywKPiAgCS8q
IHRyeSB0aGUgb2xkIHdheSAtIHRoZSBoYWNrIHdoZXJlIHdlIGFsbG93ZWQgdXNlcnMgdG8gbW91
bnQKPiAgCSAqIC9kZXYvbXRkYmxvY2skKG4pIGJ1dCBkaWRuJ3QgYWN0dWFsbHkgX3VzZV8gdGhl
IGJsb2NrZGV2Cj4gIAkgKi8KPiAtCWJkZXYgPSBsb29rdXBfYmRldihmYy0+c291cmNlKTsKPiAr
CWJkZXYgPSBibGtkZXZfZ2V0X2J5X3BhdGgoZmMtPnNvdXJjZSwgRk1PREVfUkVBRCwgTlVMTCk7
Cj4gIAlpZiAoSVNfRVJSKGJkZXYpKSB7Cj4gIAkJcmV0ID0gUFRSX0VSUihiZGV2KTsKPiAgCQll
cnJvcmYoZmMsICJNVEQ6IENvdWxkbid0IGxvb2sgdXAgJyVzJzogJWQiLCBmYy0+c291cmNlLCBy
ZXQpOwo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gLQlwcl9kZWJ1ZygiTVREU0I6IGxvb2t1cF9i
ZGV2KCkgcmV0dXJuZWQgMFxuIik7Cj4gKwlwcl9kZWJ1ZygiTVREU0I6IGJsa2Rldl9nZXRfYnlf
cGF0aCgpIHJldHVybmVkIDBcbiIpOwo+ICAKPiAgCW1ham9yID0gTUFKT1IoYmRldi0+YmRfZGV2
KTsKPiAtCW10ZG5yID0gTUlOT1IoYmRldi0+YmRfZGV2KTsKPiAtCWJkcHV0KGJkZXYpOwo+ICAK
PiAtCWlmIChtYWpvciA9PSBNVERfQkxPQ0tfTUFKT1IpCj4gLQkJcmV0dXJuIG10ZF9nZXRfc2Jf
YnlfbnIoZmMsIG10ZG5yLCBmaWxsX3N1cGVyKTsKPiArCWlmIChtYWpvciA9PSBNVERfQkxPQ0tf
TUFKT1IpIHsKPiArCQlpZiAoIWJkZXYtPmJkX2Rpc2spIHsKPiArCQkJYmxrZGV2X3B1dChiZGV2
LCBGTU9ERV9SRUFEKTsKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfQo+ICsKPiArCQlibGt0
cmFuc19kZXYgPSAoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKikoYmRldi0+YmRfZGlzay0+cHJp
dmF0ZV9kYXRhKTsKPiArCQlpZiAoIWJsa3RyYW5zX2RldiB8fCAhYmxrdHJhbnNfZGV2LT50cikg
ewo+ICsJCQlibGtkZXZfcHV0KGJkZXYsIEZNT0RFX1JFQUQpOwo+ICsJCQlyZXR1cm4gLUVJTlZB
TDsKPiArCQl9Cj4gKwkJbXRkbnIgPSBibGt0cmFuc19kZXYtPmRldm51bTsKPiArCQlwYXJ0X2Jp
dHMgPSBibGt0cmFuc19kZXYtPnRyLT5wYXJ0X2JpdHM7Cj4gKwkJYmxrZGV2X3B1dChiZGV2LCBG
TU9ERV9SRUFEKTsKPiArCQlpZiAoTUlOT1IoYmRldi0+YmRfZGV2KSAhPSAobXRkbnIgPDwgcGFy
dF9iaXRzKSkKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICsJCXJldHVybiBtdGRfZ2V0X3Ni
X2J5X25yKGZjLCBtdGRuciwgZmlsbF9zdXBlcik7Cj4gKwl9Cj4gKwlibGtkZXZfcHV0KGJkZXYs
IEZNT0RFX1JFQUQpOwo+ICAjZW5kaWYgLyogQ09ORklHX0JMT0NLICovCj4gIAo+ICAJaWYgKCEo
ZmMtPnNiX2ZsYWdzICYgU0JfU0lMRU5UKSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
