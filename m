Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33966C433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 09:48:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C002D64E07
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 09:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C002D64E07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ya1AbAdjMbnUDCqE4kb8n+lB9RDCO+TCuHt5VkHI2uo=; b=w2p7Qbfym3F4ArZHj5aMCJ3Qs
	6y1AaYA3zSqzPmVCe0FLD9RB+Un0/I56FPyd+uB4SiToTfukNAJ6qoePGjtxPuxho5X0RY2esxhm5
	02vhduyG9/0pt2Ji0iyNkJipBv8qvOhw9ohHk8uxnfl6wVS5JP1Uc37KLFAGUUjtryqGypQpfsWXY
	9ev3qvjb54YyPA8Ik0qLjUTah86kqiZlG9ZJL+rJJu0b1BHxKVAnSLcxjRtKC/x2ImkKM1/8Og78w
	Pg282EA/gKc88sSMu2aKnMngCreiS3qNKxsSmhsi0YN50DnRKyT1bsIYKaf12uMa1O4eLOeByASd1
	cU5APFNDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7xiS-00054a-Qa; Fri, 05 Feb 2021 09:47:52 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7xiQ-00053I-0N
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 09:47:51 +0000
Received: from xps13 (aputeaux-654-1-105-144.w90-2.abo.wanadoo.fr [90.2.4.144])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9DA9A100004;
 Fri,  5 Feb 2021 09:47:40 +0000 (UTC)
Date: Fri, 5 Feb 2021 10:47:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: zhengxunli <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Message-ID: <20210205104736.2771074c@xps13>
In-Reply-To: <1612517808-10010-2-git-send-email-zhengxunli@mxic.com.tw>
References: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
 <1612517808-10010-2-git-send-email-zhengxunli@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_044750_250287_AC0F7C76 
X-CRM114-Status: GOOD (  23.01  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp6aGVuZ3h1bmxpIDx6aGVuZ3h1bmxpQG14aWMuY29tLnR3PiB3cm90ZSBvbiBGcmks
ICA1IEZlYiAyMDIxIDE3OjM2OjQ3CiswODAwOgoKPiBUaGUgb2NhdGZsYXNoIGlzIGFuIHhTUEkg
Y29tcGxpYW50IG9jdGFsIERUUiBmbGFzaC4gQWRkIHN1cHBvcnQKPiBmb3IgdXNpbmcgaXQgaW4g
b2N0YWwgRFRSIG1vZGUuCj4gCj4gRW5hYmxlIE9jdGFsIERUUiBtb2RlIHdpdGggMjAgZHVtbXkg
Y3ljbGVzIHRvIGFsbG93IHJ1bm5pbmcgYXQgdGhlCj4gbWF4aW11bSBzdXBwb3J0ZWQgZnJlcXVl
bmN5IG9mIDIwME1oei4KPiAKPiBUcnkgdG8gdmVyaWZ5IHRoZSBmbGFzaCBJRCB0byBjaGVjayB3
aGV0aGVyIHRoZSBmbGFzaCBtZW1vcnkgaW4gb2N0YWwKPiBEVFIgbW9kZSBpcyBjb3JyZWN0LiBX
aGVuIHJlYWRpbmcgSUQgaW4gT0NUQUwgRFRSIG1vZGUsIElEIHdpbGwgYXBwZWFyCj4gaW4gYSBy
ZXBlYXRlZCBtYW5uZXIuIGV4OiBJRFswXSA9IDB4YzIsIElEWzFdID0gMHhjMiwgSURbMl0gPSAw
eDk0LAo+IElEWzNdID0gMHg5NC4uLiBSZWFycmFuZ2UgdGhlIG9yZGVyIHNvIHRoYXQgdGhlIElE
IGNhbiBwYXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IHpoZW5neHVubGkgPHpoZW5neHVubGlAbXhp
Yy5jb20udHc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyB8IDEyMSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTIxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gaW5kZXggOTIw
M2FiYS4uNzQ5ODk3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4
LmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiBAQCAtOCw2ICs4LDE2
IEBACj4gIAo+ICAjaW5jbHVkZSAiY29yZS5oIgo+ICAKPiArI2RlZmluZSBTUElOT1JfT1BfUkRf
Q1IyCQkweDcxCQkvKiBSZWFkIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgMiAqLwo+ICsjZGVmaW5l
IFNQSU5PUl9PUF9XUl9DUjIJCTB4NzIJCS8qIFdyaXRlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIg
MiAqLwo+ICsjZGVmaW5lIFNQSU5PUl9PUF9NWElDX0RUUl9SRAkJMHhlZQkJLyogRmFzdCBSZWFk
IG9wY29kZSBpbiBEVFIgbW9kZSAqLwo+ICsjZGVmaW5lIFNQSU5PUl9SRUdfTVhJQ19DUjJfTU9E
RQkweDAwMDAwMDAwCS8qIEZvciBzZXR0aW5nIG9jdGFsIERUUiBtb2RlICovCj4gKyNkZWZpbmUg
U1BJTk9SX1JFR19NWElDX09QSV9EVFJfRU4JMHgyCQkvKiBFbmFibGUgT2N0YWwgRFRSICovCj4g
KyNkZWZpbmUgU1BJTk9SX1JFR19NWElDX09QSV9EVFJfRElTCTB4MQkJLyogRGlzYWJsZSBPY3Rh
bCBEVFIgKi8KPiArI2RlZmluZSBTUElOT1JfUkVHX01YSUNfQ1IyX0RDCQkweDAwMDAwMzAwCS8q
IEZvciBzZXR0aW5nIGR1bW15IGN5Y2xlcyAqLwo+ICsjZGVmaW5lIFNQSU5PUl9SRUdfTVhJQ19E
Q18yMAkJMHgwCQkvKiBTZXR0aW5nIGR1bW15IGN5Y2xlcyB0byAyMCAqLwo+ICsjZGVmaW5lIE1Y
SUNfTUFYX0RDCQkJMjAJCS8qIE1heGltdW0gdmFsdWUgb2YgZHVtbXkgY3ljbGVzICovCj4gKwo+
ICBzdGF0aWMgaW50Cj4gIG14MjVsMjU2MzVfcG9zdF9iZnB0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25v
ciAqbm9yLAo+ICAJCQkgICAgY29uc3Qgc3RydWN0IHNmZHBfcGFyYW1ldGVyX2hlYWRlciAqYmZw
dF9oZWFkZXIsCj4gQEAgLTMzLDYgKzQzLDExMyBAQAo+ICAJLnBvc3RfYmZwdCA9IG14MjVsMjU2
MzVfcG9zdF9iZnB0X2ZpeHVwcywKPiAgfTsKPiAgCj4gKy8qKgo+ICsgKiBzcGlfbm9yX21hY3Jv
bml4X29jdGFsX2R0cl9lbmFibGUoKSAtIEVuYWJsZSBvY3RhbCBEVFIgb24gTWFjcm9uaXggZmxh
c2hlcy4KPiArICogQG5vcjoJCXBvaW50ZXIgdG8gYSAnc3RydWN0IHNwaV9ub3InCj4gKyAqIEBl
bmFibGU6CQl3aGV0aGVyIHRvIGVuYWJsZSBvciBkaXNhYmxlIE9jdGFsIERUUgo+ICsgKgo+ICsg
KiBUaGlzIGFsc28gc2V0cyB0aGUgbWVtb3J5IGFjY2VzcyBkdW1teSBjeWNsZXMgdG8gMjAgdG8g
YWxsb3cgdGhlIGZsYXNoIHRvCj4gKyAqIHJ1biBhdCB1cCB0byAyMDBNSHouCj4gKyAqCj4gKyAq
IFJldHVybjogMCBvbiBzdWNjZXNzLCAtZXJybm8gb3RoZXJ3aXNlLgo+ICsgKi8KPiArc3RhdGlj
IGludCBzcGlfbm9yX21hY3Jvbml4X29jdGFsX2R0cl9lbmFibGUoc3RydWN0IHNwaV9ub3IgKm5v
ciwgYm9vbCBlbmFibGUpCj4gK3sKPiArCXN0cnVjdCBzcGlfbWVtX29wIG9wOwo+ICsJdTggKmJ1
ZiA9IG5vci0+Ym91bmNlYnVmLCBpOwo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAoZW5hYmxlKSB7
Cj4gKwkJLyogVXNlIDIwIGR1bW15IGN5Y2xlcyBmb3IgbWVtb3J5IGFycmF5IHJlYWRzLiAqLwo+
ICsJCXJldCA9IHNwaV9ub3Jfd3JpdGVfZW5hYmxlKG5vcik7Cj4gKwkJaWYgKHJldCkKPiArCQkJ
cmV0dXJuIHJldDsKPiArCj4gKwkJKmJ1ZiA9IFNQSU5PUl9SRUdfTVhJQ19EQ18yMDsKPiArCQlv
cCA9IChzdHJ1Y3Qgc3BpX21lbV9vcCkKPiArCQkJU1BJX01FTV9PUChTUElfTUVNX09QX0NNRChT
UElOT1JfT1BfV1JfQ1IyLCAxKSwKPiArCQkJCSAgIFNQSV9NRU1fT1BfQUREUig0LCBTUElOT1Jf
UkVHX01YSUNfQ1IyX0RDLCAxKSwKPiArCQkJCSAgIFNQSV9NRU1fT1BfTk9fRFVNTVksCj4gKwkJ
CQkgICBTUElfTUVNX09QX0RBVEFfT1VUKDEsIGJ1ZiwgMSkpOwo+ICsKPiArCQlyZXQgPSBzcGlf
bWVtX2V4ZWNfb3Aobm9yLT5zcGltZW0sICZvcCk7Cj4gKwkJaWYgKHJldCkKPiArCQkJcmV0dXJu
IHJldDsKPiArCj4gKwkJcmV0ID0gc3BpX25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsKPiArCQlp
ZiAocmV0KQo+ICsJCQlyZXR1cm4gcmV0Owo+ICsKPiArCQlub3ItPnJlYWRfZHVtbXkgPSBNWElD
X01BWF9EQzsKCkkgYW0gc3RpbGwgbm90IGNvbnZpbmNlZCBieSB0aGlzIGNvbnN0YW50IHZhbHVl
LgoKVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
