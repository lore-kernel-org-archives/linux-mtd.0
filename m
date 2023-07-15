Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F161C001DC
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 15:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8E3P8PKWX12SdlRgYoPdOvo1gwKUA2pyfrDGjPQS3RA=; b=zn20tEhIpVjOWG
	a01/I6EzFFlzAAH95pdGlhApXm9pMwKFBJsIoh9mkOcI9cBQsvxvkg6RMiQDQX4JDJ36INO1ot5ml
	pUKcXqVYWsRrzje3R2qyEUTw0P6KF76NQYKW5yuvZe0czqc0TP5H8+djGF+H7JUIE954+hF3mC+g8
	qZEwbTEClFBK9WVBEgCM2sJiqaHufNyA5ay5s3Mq1pH+mz9HN41Ndy+29F+EZsl/BRlnMbtnB//Px
	VtxaluGJNmGkd9TA7Ed8Jtx3/egddvV2PhImIwuUfq8NLJ9VXw/dCrJ5AAEcevth4mc2VAe9jDDAj
	sY4TLKs0bY5OadZd3PQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhcf-0094T4-04;
	Sat, 15 Jul 2023 15:55:53 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhcb-0094Rv-0p
	for linux-mtd@lists.infradead.org;
	Sat, 15 Jul 2023 15:55:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A88B21C0003;
	Sat, 15 Jul 2023 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689436541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/7fa1VodGmzW8y0BKaOaML3SEXmiAKlgK+Q/+vMQV8=;
	b=dUH6X1Y12IOT2F/sFhd4jGSWKbwni4/FzOi0GZOEN5k4LPXlD9Aw7mB0U6xeWT6zGwPLf7
	buhDI5e6DpVZWdnjfizz98ZRZHj+y4U1ZcmsL6nvukOOj7fUAQ/cTHg99Sa3wpTaTk7Yh/
	4R8hHVg49rPBpA1s7/ElgLGKuywYt7H20Li9CwzReflL0Dnq2Q+gCDs+RBVUX7uIPuWF6C
	OxOecvHzgww6n5qpiLkUJlhx/BkOR4d7rZvOvhMvvY64Mmqq6yOEPKA1f3PFrTJm/i1qnr
	aSVPoLaewwsYN6qGYbNPxUiHz+M6mrxWqCTkwhTDgWQS66Y+jD9UBVMU1fvl+g==
Date: Sat, 15 Jul 2023 17:55:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mtd: rawnand: add nand-skip-bbtscan and
 nand-no-bbm-quirk DT options
Message-ID: <20230715175538.7142a141@xps-13>
In-Reply-To: <2b0dc481-562f-c8df-545e-dcf6548adb07@gmail.com>
References: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
	<2b0dc481-562f-c8df-545e-dcf6548adb07@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_085549_444101_B4FBBA7C 
X-CRM114-Status: GOOD (  17.47  )
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

SGkgSm9oYW4sCgpqYng2MjQ0QGdtYWlsLmNvbSB3cm90ZSBvbiBTYXQsIDE1IEp1bCAyMDIzIDEy
OjQ5OjE4ICswMjAwOgoKPiBBIE5BTkQgY2hpcCBjYW4gY29udGFpbiBhIGRpZmZlcmVudCBkYXRh
IGZvcm1hdCB0aGVuIHRoZSBNVEQgZnJhbWV3b3JrCj4gZXhwZWN0cyBpbiB0aGUgZXJhc2UgYmxv
Y2tzIGZvciB0aGUgQmFkIEJsb2NrIFRhYmxlKEJCVCkuCj4gUmVzdWx0IGlzIGEgZmFpbGVkIHBy
b2JlLCB3aGlsZSBub3RoaW5nIHdyb25nIHdpdGggdGhlIGhhcmR3YXJlLgo+IFNvbWUgTVREIGZs
YWdzIG5lZWQgdG8gYmUgc2V0IHRvIGdhaW4gYWNjZXNzIGFnYWluLgo+IAo+IFNraXAgdGhlIGF1
dG9tYXRpYyBCQlQgc2NhbiB3aXRoIHRoZSBOQU5EX1NLSVBfQkJUU0NBTiBvcHRpb24KPiBzbyB0
aGF0IHRoZSBvcmlnaW5hbCBjb250ZW50IGlzIHVuY2hhbmdlZCBkdXJpbmcgdGhlIGRyaXZlciBw
cm9iZS4KPiBUaGUgTkFORF9OT19CQk1fUVVJUksgb3B0aW9uIGFsbG93cyB1cyB0byBlcmFzZSBi
YWQgYmxvY2tzIHdpdGgKPiB0aGUgbmFuZF9lcmFzZV9uYW5kKCkgZnVuY3Rpb24gYW5kIHRoZSBm
bGFzaF9lcmFzZSBjb21tYW5kLgo+IAo+IEFkZCBuYW5kLXNraXAtYmJ0c2NhbiBhbmQgbmFuZC1u
by1iYm0tcXVpcmsgRGV2aWNlIFRyZWUgb3B0aW9ucywKPiBzbyB0aGUgdXNlciBoYXMgdGhlICJm
cmVlZG9tIG9mIGNob2ljZSIgYnkgbmV1dHJhbAo+IGFjY2VzcyBtb2RlIHRvIHJlYWQgYW5kIHdy
aXRlIGluIHdoYXRldmVyIGZvcm1hdCBpcyBuZWVkZWQuCgpUaGlzIHNvdW5kcyBsaWtlIGEgcGFy
dGlhbCBzb2x1dGlvbi4gSG93IGRvIHlvdSBoYW5kbGUgYmFkIGJsb2Nrcz8KCj4gU2lnbmVkLW9m
Zi1ieTogSm9oYW4gSm9ua2VyIDxqYng2MjQ0QGdtYWlsLmNvbT4KPiAtLS0KPiAKPiBQcmV2aW91
cyBkaXNjdXNzaW9uOgo+IFtQQVRDSCB2MyAzLzNdIG10ZDogcmF3bmFuZDogcm9ja2NoaXAtbmFu
ZC1jb250cm9sbGVyOiBhZGQgc2tpcGJidCBvcHRpb24KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1tdGQvMTYxODM4MjU2MC4yMzI2OTMxLjE2ODkyNjE0MzUwMjIuSmF2YU1haWwuemlt
YnJhQG5vZC5hdC8KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCA2
ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmMKPiBpbmRleCBhNmFmNTIxODMyYWEuLmYwZmE1YzM1MTliMSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAgLTU1MjEsNiArNTUyMSwxMiBAQCBzdGF0aWMg
aW50IHJhd25hbmRfZHRfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJaWYgKG9mX3By
b3BlcnR5X3JlYWRfYm9vbChkbiwgIm5hbmQtaXMtYm9vdC1tZWRpdW0iKSkKPiAgCQljaGlwLT5v
cHRpb25zIHw9IE5BTkRfSVNfQk9PVF9NRURJVU07Cj4gCj4gKwlpZiAob2ZfcHJvcGVydHlfcmVh
ZF9ib29sKGRuLCAibmFuZC1uby1iYm0tcXVpcmsiKSkKPiArCQljaGlwLT5vcHRpb25zIHw9IE5B
TkRfTk9fQkJNX1FVSVJLOwo+ICsKPiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woZG4sICJu
YW5kLXNraXAtYmJ0c2NhbiIpKQo+ICsJCWNoaXAtPm9wdGlvbnMgfD0gTkFORF9TS0lQX0JCVFND
QU47Cj4gKwo+ICAJaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChkbiwgIm5hbmQtb24tZmxhc2gt
YmJ0IikpCj4gIAkJY2hpcC0+YmJ0X29wdGlvbnMgfD0gTkFORF9CQlRfVVNFX0ZMQVNIOwo+IAo+
IC0tCj4gMi4zMC4yCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
