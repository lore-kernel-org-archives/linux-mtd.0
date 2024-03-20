Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E44C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkeiWMFj3wFuxgKJLFxQn8hOXizMu5CVW6G4BLFthcs=; b=CG5tqonr3STv4l
	5glpsQr65zwRMwm+MDS9hn4FreP3NotDaK45/a82wtW3Io+otiI18HyCAt3Xv2zS1Fju3Vlh5s5mB
	rv041XR9yev9VfjFJS+dSGaueA+ZjXP9shRbxSxqeNzwqaEgxiA9yIwOFV/FO4FpSmN1PZHWgDw4+
	QoXFYtycE7Nv4q/CtZKclkcDRbPO6xNlrpSegzHA1D4oXt27GRZE5uDrGbF2zDXjRrhp077hP6Ly/
	SGKsDqmYZ5R26jygcWj48jowdIvPLJ1zH1GNRK0+VDqprL4sLbOzX5P172pqQvHGwk5jbxMPFfA0L
	Kd0e/XzKDN/+/6PQ850w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmq39-0000000FqT9-0kPJ;
	Wed, 20 Mar 2024 07:07:47 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmq36-0000000FqS6-1eQ4
	for linux-mtd@lists.infradead.org;
	Wed, 20 Mar 2024 07:07:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A01A020003;
	Wed, 20 Mar 2024 07:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710918459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AL30gxN2yDxjzqImljq77WKx4g//YWKGdQLQDyEKupE=;
	b=R6H1BQAoVXPekaFsRtzSoEQBULpxTVygeQ5dgqe41dUWGbQm3BwMbL/BkjcYVigscVk7cW
	93TzuvNn/tzdDUEFGKQiEaJr0dmWsCJkzO42E0MIt+gB3EkUgIcNzrNDwvjjulQqDJV1iC
	7TghrDUA50RUSI84CT6HanpAWNattl09gNrGskDLdup3YatpyrIdwBROO2dIGgDmYx5Kis
	qclT1+rueoDo0Q/12GvPbQ7eE41u9AZgd/FQ8xr/nkdyWBsHEYK3dacjF4UXMhvgbyhSCd
	yfozFtxn4bnKbjSFrQ31rCw7AcR/dVzivfHP+vi6tK4oFVKSqkXkaBchU9Ih9g==
Date: Wed, 20 Mar 2024 08:07:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix broken misc_cmd_type in exec_op
Message-ID: <20240320080737.00e7bb37@xps-13>
In-Reply-To: <20240320001141.16560-1-ansuelsmth@gmail.com>
References: <20240320001141.16560-1-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_000745_018212_8FC1937D 
X-CRM114-Status: GOOD (  18.53  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAyMCBNYXIg
MjAyNCAwMToxMTozOSArMDEwMDoKCj4gbWlzY19jbWRfdHlwZSBpbiBleGVjX29wIGhhdmUgbXVs
dGlwbGUgcHJvYmxlbXMuIFdpdGggY29tbWl0IGE4Mjk5MGM4YTQwOQo+ICgibXRkOiByYXduYW5k
OiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBhdGgiKSBpdCB3YXMK
PiByZXdvcmtlZCBhbmQgZ2VuZXJhbGl6ZWQgYnV0IGFjdHVhbGx5IGRyb3BwZWQgdGhlIGhhbmRs
aW5nIG9mIHRoZQo+IFJFU0VUX0RFVklDRSBjb21tYW5kLgo+IAo+IFRoZSByZXdvcmsgaXRzZWxm
IHdhcyBjb3JyZWN0IHdpdGggc3VwcG9ydGluZyBjYXNlIHdoZXJlIGEgc2luZ2xlIG1pc2MKPiBj
b21tYW5kIGlzIGhhbmRsZWQsIGJ1dCBiZWNhbWUgcHJvYmxlbWF0aWMgYnkgdGhlIGFkZGl0aW9u
IG9mIGV4aXRpbmcKPiBlYXJseSBpZiB3ZSBkaWRuJ3QgaGFkIGFuIEVSQVNFIG9yIGFuIE9QX1BS
T0dSQU1fUEFHRSBvcGVyYXRpb24uCj4gCj4gQWxzbyBhZGRpdGlvbmFsIGxvZ2ljIHdhcyBhZGRl
ZCB3aXRob3V0IGNsZWFyIGV4cGxhaW5hdGlvbiBjYXVzaW5nIHRoZQo+IGVyYXNlIGNvbW1hbmQg
dG8gYmUgYnJva2VuIG9uIHRlc3RpbmcgaXQgb24gYSBpcHE4MDZ4IG5hbmRjLgo+IAo+IEFkZCBz
b21lIGFkZGl0aW9uYWwgbG9naWMgdG8gcmVzdG9yZSBSRVNFVF9ERVZJQ0UgY29tbWFuZCBoYW5k
bGluZyBhbmQKPiBmaXggZXJhc2UgY29tbWFuZC4KPiAKPiBGaXhlczogYTgyOTkwYzhhNDA5ICgi
bXRkOiByYXduYW5kOiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBh
dGgiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmMgfCA3ICsrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gaW5kZXggYjA3OTYwNWM4NGQzLi5iOGNmZjkyNDBiMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4gQEAgLTI4MTUsNyArMjgxNSw3IEBAIHN0YXRpYyBpbnQgcWNvbV9taXNj
X2NtZF90eXBlX2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qgc3RydWN0IG5hbmRf
c3ViCj4gIAkJCSAgICAgIGhvc3QtPmNmZzBfcmF3ICYgfig3IDw8IENXX1BFUl9QQUdFKSk7Cj4g
IAkJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0RFVjBfQ0ZHMSwgaG9zdC0+Y2ZnMV9yYXcpOwo+
ICAJCWluc3RycyA9IDM7Cj4gLQl9IGVsc2Ugewo+ICsJfSBlbHNlIGlmIChxX29wLmNtZF9yZWcg
IT0gT1BfUkVTRVRfREVWSUNFKSB7Cj4gIAkJcmV0dXJuIDA7Cj4gIAl9Cj4gIAo+IEBAIC0yODMw
LDkgKzI4MzAsOCBAQCBzdGF0aWMgaW50IHFjb21fbWlzY19jbWRfdHlwZV9leGVjKHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXAsIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ygo+ICAJbmFuZGNfc2V0X3JlZyhj
aGlwLCBOQU5EX0VYRUNfQ01ELCAxKTsKPiAgCj4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5E
X0ZMQVNIX0NNRCwgaW5zdHJzLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gLQkocV9vcC5jbWRfcmVn
ID09IE9QX0JMT0NLX0VSQVNFKSA/IHdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfREVWMF9DRkcw
LAo+IC0JMiwgTkFORF9CQU1fTkVYVF9TR0wpIDogcmVhZF9yZWdfZG1hKG5hbmRjLAo+IC0JTkFO
RF9GTEFTSF9TVEFUVVMsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPiArCWlmIChxX29wLmNtZF9y
ZWcgPT0gT1BfQkxPQ0tfRVJBU0UpCj4gKwkJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9ERVYw
X0NGRzAsIDIsIE5BTkRfQkFNX05FWFRfU0dMKTsKClVnaC4gSG93IGRpZCB0aGF0IHdlbnQgdGhy
b3VnaC4uLgoKSSBkb24ndCB3YW50IHRvIGdldCBpbnRvIHRoZSBkZXRhaWxzIG9mIHRoaXMgY29u
dHJvbGxlciwgYnV0IHRoZSBmaXgKbG9va3MgbGVnaXRpbWF0ZS4KCj4gIAl3cml0ZV9yZWdfZG1h
KG5hbmRjLCBOQU5EX0VYRUNfQ01ELCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gIAlyZWFkX3Jl
Z19kbWEobmFuZGMsIE5BTkRfRkxBU0hfU1RBVFVTLCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7CgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
