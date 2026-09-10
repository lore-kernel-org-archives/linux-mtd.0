Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F38C79FB9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 12:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAQhvZuUPM7U1QS4w+0OG5EhNMHoBlDENv47yOi8GIA=; b=IqThBEyJBmniZS
	rPXJ3CjY/WLR1wFtt8cth7+lK94QGu/D1fuKkLX2wCjyWC2LCG0xuQp21DOCggG8bPjDU+tzGkRMN
	DOYVXBW+fCd5IWDz3o5TCoj6pCo5ZmdHAGxWAX4XxpeAI5lzc1GyJPz0vZXB8zJsoFbU7MP+1nqR3
	J8RBgQ0VSrgKf2uOlP9hoCX8WR+x0KdLpEl8hdGchnhR60+SDugDckoMdH8yfUBlYAoP4+OP5aYaI
	va+qfY+4vIm3w04nYkAm0iH//XmtBVxvUYMqvsO3gx7L6r8LD57cUJNoV+zIoSXx1agJVbKDzKMZi
	0Sp/VUmETCCD3z1sJwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e4x-0000000EMLS-3rd1;
	Thu, 10 Sep 2026 12:40:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e4u-0000000EMKT-1hKE
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 12:40:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8522F1A010B;
	Thu, 10 Sep 2026 12:40:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5863E5FA2F;
	Thu, 10 Sep 2026 12:40:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E72711C78654;
	Thu, 10 Sep 2026 14:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789044027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q4jTORQ7x029cF9PeX8n/NioDl8L2Yhv88fNsnF4ayc=;
	b=Kx4zpCyOG53XEf3HMLST7rKS+mfAVaNUO3fvyS/l7cJ83O5PSzos9Yfs2Hbnc4vTat2Knf
	HELym89Lqk4ji+WaBzwMvwnlNKMyP1XAQCch7ngiNsBPrrMGrVQ0YR85e/FNJimAR5sAg2
	olufmZtFuYMLlg9Zqlf5NROxAqlgpHLMrJlFOjajCjWWLoHW+iCUCuFwapYw6fG9ehy+5e
	zGnNY0hScJ6XUlow0RmeORodkqkqkEhI6EGgMUOEZiST0eIrPQkL43VVE4y1CYMnqzK38i
	tQKfU9umBXVPvwsctGQLi53i0p9LpLUMV5y4TuxNegr30iWCLTlVR88xa6ykhg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sagnik Sasmal <sagnik@sagnik.me>
Cc: richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  mikhail.kshevetskiy@iopsys.eu,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Do not update the QE bit on devices
 without one
In-Reply-To: <010701a08b180a21-f4b7e929-ff1c-494e-99ec-c563bf7c92f4-000000@eu-central-1.amazonses.com>
	(Sagnik Sasmal's message of "Thu, 10 Sep 2026 11:33:23 +0000")
References: <010701a08b180a21-f4b7e929-ff1c-494e-99ec-c563bf7c92f4-000000@eu-central-1.amazonses.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 10 Sep 2026 14:40:24 +0200
Message-ID: <878q59s2iv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_054032_587809_4BE82EA8 
X-CRM114-Status: GOOD (  17.48  )
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

SGVsbG8sCgpPbiAxMC8wOS8yMDI2IGF0IDExOjMzOjIzIEdNVCwgU2FnbmlrIFNhc21hbCA8c2Fn
bmlrQHNhZ25pay5tZT4gd3JvdGU6Cgo+IENvbW1pdCBiZTBiODZjNjQ4YmYgKCJtdGQ6IHNwaW5h
bmQ6IEdhdGhlciBhbGwgdGhlIGJ1cyBpbnRlcmZhY2UKPiBzdGVwcyBpbiBvbmUgc2luZ2xlIGZ1
bmN0aW9uIikgbW92ZWQgcXVhZC1lbmFibGUgc2V0dXAgaW50bwo+IHNwaW5hbmRfY29uZmlndXJl
X2NoaXAoKS4gVGhlIG5ldyBjb2RlIG9ubHkgZGV0ZXJtaW5lcyB3aGV0aGVyIHF1YWQKPiBtb2Rl
IGlzIG5lZWRlZCB3aGVuIFNQSU5BTkRfSEFTX1FFX0JJVCBpcyBzZXQsIGJ1dCBjYWxscwo+IHNw
aW5hbmRfaW5pdF9xdWFkX2VuYWJsZSgpIHVuY29uZGl0aW9uYWxseS4gVGhpcyBjbGVhcnMgY29u
ZmlndXJhdGlvbgo+IHJlZ2lzdGVyIGJpdCAwIG9uIGRldmljZXMgd2l0aG91dCBhIFFFIGJpdC4K
Pgo+IFRoYXQgYml0IGlzIG5vdCB1bml2ZXJzYWxseSBhIFFFIGJpdC4gT24gdGhlIFdpbmJvbmQg
VzI1TjAyS1YgaXQgaXMKPiBILURJUywgd2hpY2ggZGlzYWJsZXMgdGhlIGFjdGl2ZS1sb3cgSE9M
RCBmdW5jdGlvbi4gQ2xlYXJpbmcgSC1ESVMKPiBlbmFibGVzIEhPTEQgZHVyaW5nIHNpbmdsZSBh
bmQgZHVhbCBJL08gb3BlcmF0aW9ucy4gSWYgSU8zIGlzIG5vdCBrZXB0Cj4gaGlnaCwgdGhlIGZs
YXNoIGNhbiBwYXVzZSBhIGNvbW1hbmQgYW5kIGlnbm9yZSBjbG9jayBhbmQgZGF0YS4KPgo+IEgt
RElTIGlzIG5vdCByZXN0b3JlZCBieSB0aGUgRkZoIHJlc2V0IGNvbW1hbmQsIGFsbG93aW5nIHRo
ZSBpbmNvcnJlY3QKPiBzdGF0ZSB0byBzdXJ2aXZlIGFuIFNvQyB3YXJtIHJlYm9vdCB3aGlsZSB0
aGUgZmxhc2ggcmVtYWlucyBwb3dlcmVkLgo+Cj4gQmVmb3JlIHRoZSByZWZhY3RvcmluZywgc3Bp
bmFuZF9pbml0X3F1YWRfZW5hYmxlKCkgcmV0dXJuZWQgd2l0aG91dAo+IHRvdWNoaW5nIHRoZSBj
b25maWd1cmF0aW9uIHJlZ2lzdGVyIHdoZW4gU1BJTkFORF9IQVNfUUVfQklUIHdhcyBub3QKPiBz
ZXQuIFJlc3RvcmUgdGhhdCBiZWhhdmlvci4KPgo+IFRoZSByZWdyZXNzaW9uIHdhcyByZXByb2R1
Y2VkIG9uIGEgSmlvIEpJRFU2NDAxIHdpdGggYW4gTVQ3OTg2IFNvQyBhbmQKPiBhIFcyNU4wMktW
LiBXaXRoIExpbnV4IDYuMTguNDQsIHN5c3VwZ3JhZGUgZmFpbGVkIGFuZCB0aGUgZm9sbG93aW5n
IHdhcm0KPiByZWJvb3QgaHVuZyBpbiBCTDIuIFdpdGggdGhpcyBjaGFuZ2UgYXBwbGllZCwgYm90
aCBzeXN1cGdyYWRlIGFuZCB3YXJtCj4gcmVib290IGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuCj4K
PiBGaXhlczogYmUwYjg2YzY0OGJmICgibXRkOiBzcGluYW5kOiBHYXRoZXIgYWxsIHRoZSBidXMg
aW50ZXJmYWNlIHN0ZXBzIGluIG9uZSBzaW5nbGUgZnVuY3Rpb24iKQo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IExMTQo+IFNpZ25lZC1vZmYtYnk6IFNhZ25payBT
YXNtYWwgPHNhZ25pa0BzYWduaWsubWU+CgpUaGFua3MgZm9yIHRoZSByZXBvcnQsIGFuZCB0aGUg
ZGVidWcgYW5kIHRoZSBwcm9wb3NhbC4gU29ycnkgZm9yIHRoZQpicmVha2FnZS4KCldoaWxlIHlv
dXIgc29sdXRpb24gd29ya3MsIEkgYmVsaWV2ZSBpdCB3b3VsZCBiZSBjbGVhbmVyIGRvIGl0IHRo
aXMgd2F5OgoKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCisrKyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwpAQCAtMTc5NywxMSArMTc5NywxMSBAQCBzdGF0aWMgaW50IHNw
aW5hbmRfY29uZmlndXJlX2NoaXAoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQogICAg
ICAgICAgICAgICAgICAgIHNwaW5hbmQtPnNzZHJfb3BfdGVtcGxhdGVzLndyaXRlX2NhY2hlLT5k
YXRhLmJ1c3dpZHRoID09IDQgfHwKICAgICAgICAgICAgICAgICAgICBzcGluYW5kLT5zc2RyX29w
X3RlbXBsYXRlcy51cGRhdGVfY2FjaGUtPmRhdGEuYnVzd2lkdGggPT0gNCkKICAgICAgICAgICAg
ICAgICAgICAgICAgcXVhZF9lbmFibGUgPSB0cnVlOwotICAgICAgIH0KIAotICAgICAgIHJldCA9
IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZShzcGluYW5kLCBxdWFkX2VuYWJsZSk7Ci0gICAgICAg
aWYgKHJldCkKLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7CisgICAgICAgICAgICAgICByZXQg
PSBzcGluYW5kX2luaXRfcXVhZF9lbmFibGUoc3BpbmFuZCwgcXVhZF9lbmFibGUpOworICAgICAg
ICAgICAgICAgaWYgKHJldCkKKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKKyAg
ICAgICB9CiAKICAgICAgICBpZiAoc3BpbmFuZC0+Y29uZmlndXJlX2NoaXApIHsKICAgICAgICAg
ICAgICAgIHJldCA9IHNwaW5hbmQtPmNvbmZpZ3VyZV9jaGlwKHNwaW5hbmQsIFNTRFIpOwoKRG8g
eW91IG1pbmQgdmFsaWRhdGluZyB0aGlzIGFuZCB1c2luZyBzb21ldGhpbmcgbGlrZSB0aGlzIGlu
IHlvdXIgdjI/ClRoaXMgd291bGQgYXZvaWQgdG8gY2hlY2sgdGhlIHNhbWUgZmxhZyBpbiB0d28g
ZGlmZmVyZW50IHBsYWNlcy4gSXQgYWxzbwprZWVwcyB0aGUgc3BpbmFuZF9pbml0X3F1YWRfZW5h
YmxlKCkgbWluaW1hbC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
