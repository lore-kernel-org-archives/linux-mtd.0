Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B236FC04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=738/JukB3s8Q58e1GcEqkQWTqNg79F78XugfyuxL01g=; b=QT/N8o0WpjfHCr
	lutPw2WjM+R0AoeM/u3n/CIbtYrvSOJMq+hgQ5NngD2CP//nco2n+OqSifBzaVdiI7bskeNx2w/Ar
	pZbNA4qj2hMXu7grVtj/YMgVKOWpsIhQ+XJzGrR7mkMv9uwqR1nsD9+lqj0/DH+QBIIaMAkuGCuxY
	uwW9256D3JGMxWJKNyZk7wDtJ692E4a465dZfXzaZiXeM9ZW9gjDOWGgoLI55uNNxJrVR9NgEmrdD
	ifJ2bCpC6M+s3LS/7LyaOQQUXEzrG3Op0wdkj5ON+sIgY4iieBjywizaJHvbGOAw7ZTYwU5KM9tu/
	1uViME01xMBiOoa9KsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92Mn-0000000EUDB-0ITv;
	Mon, 20 May 2024 12:43:49 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92Mk-0000000EU9z-03NM
	for linux-mtd@lists.infradead.org;
	Mon, 20 May 2024 12:43:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 031BD40003;
	Mon, 20 May 2024 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716209017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/bZqhMhLpFnI8MSy/Le7u2at2ACghAX1DiKyzwBhx8=;
	b=Y5RCrHfEI9cp4Rpl09xzDfPx1BWhLVhhOLEHYb9opBCpXwTY1wA5YxT1DhMtxvkIF0z72P
	sndEaNXUhO6IWJKkXjVfarump5Qgmku1xG1cfRL4aeyW+XeiSW7mXqIsQ3H/dMTJNP6i9i
	s6jjZqgodugbXGRncI0V7qGyQNohiLEuZjEBKjHgjuwRTlmAR8byVTLlFTjfQSwL7D7GaC
	VrUdT0F9boligLRphJRAvWpjC8TeuDKcXpD1TO2Gn44cSajLA55V/NnkDTDxBGJtsiafks
	yjx02pqWu8EuaTDIscuobgmBOeRbhNIAfBszQDWIOCFv1BzwkqcsZZ0q4tbBKA==
Date: Mon, 20 May 2024 14:43:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
 <richard@nod.at>, <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <quic_srichara@quicinc.com>,
 <quic_varada@quicinc.com>, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [PATCH v5 5/7] spi: spi-qpic: add driver for QCOM SPI NAND
 flash Interface
Message-ID: <20240520144334.79c754e3@xps-13>
In-Reply-To: <434590e3-9298-dde9-f527-6596dbd1952b@quicinc.com>
References: <20240508083637.3744003-1-quic_mdalam@quicinc.com>
	<20240508083637.3744003-6-quic_mdalam@quicinc.com>
	<20240516145642.644a7f1c@xps-13>
	<434590e3-9298-dde9-f527-6596dbd1952b@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_054346_504206_294655CA 
X-CRM114-Status: GOOD (  23.70  )
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

SGksCgo+ID4+ICtzdGF0aWMgaW50IHFjb21fc3BpX2lvX29wKHN0cnVjdCBxY29tX25hbmRfY29u
dHJvbGxlciAqc25hbmRjLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4gPj4gK3sKPiA+
PiArCWludCByZXQsIHZhbCwgb3Bjb2RlOwo+ID4+ICsJYm9vbCBjb3B5ID0gZmFsc2UsIGNvcHlf
ZnRyID0gZmFsc2U7Cj4gPj4gKwo+ID4+ICsJcmV0ID0gcWNvbV9zcGlfc2VuZF9jbWRhZGRyKHNu
YW5kYywgb3ApOwo+ID4+ICsJaWYgKHJldCkKPiA+PiArCQlyZXR1cm4gcmV0Owo+ID4+ICsKPiA+
PiArCXNuYW5kYy0+YnVmX2NvdW50ID0gMDsKPiA+PiArCXNuYW5kYy0+YnVmX3N0YXJ0ID0gMDsK
PiA+PiArCXFjb21fY2xlYXJfcmVhZF9yZWdzKHNuYW5kYyk7Cj4gPj4gKwlxY29tX2NsZWFyX2Jh
bV90cmFuc2FjdGlvbihzbmFuZGMpOwo+ID4+ICsJb3Bjb2RlID0gb3AtPmNtZC5vcGNvZGU7Cj4g
Pj4gKwo+ID4+ICsJc3dpdGNoIChvcGNvZGUpIHsKPiA+PiArCWNhc2UgU1BJTkFORF9SRUFESUQ6
Cj4gPj4gKwkJc25hbmRjLT5idWZfY291bnQgPSA0Owo+ID4+ICsJCXFjb21fcmVhZF9yZWdfZG1h
KHNuYW5kYywgTkFORF9SRUFEX0lELCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gPj4gKwkJY29w
eSA9IHRydWU7Cj4gPj4gKwkJYnJlYWs7Cj4gPj4gKwljYXNlIFNQSU5BTkRfR0VUX0ZFQVRVUkU6
Cj4gPj4gKwkJc25hbmRjLT5idWZfY291bnQgPSA0Owo+ID4+ICsJCXFjb21fcmVhZF9yZWdfZG1h
KHNuYW5kYywgTkFORF9GTEFTSF9GRUFUVVJFUywgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+ID4+
ICsJCWNvcHlfZnRyID0gdHJ1ZTsKPiA+PiArCQlicmVhazsKPiA+PiArCWNhc2UgU1BJTkFORF9T
RVRfRkVBVFVSRToKPiA+PiArCQlzbmFuZGMtPnJlZ3MtPmZsYXNoX2ZlYXR1cmUgPSAqKHUzMiAq
KW9wLT5kYXRhLmJ1Zi5vdXQ7Cj4gPj4gKwkJcWNvbV93cml0ZV9yZWdfZG1hKHNuYW5kYywgJnNu
YW5kYy0+cmVncy0+Zmxhc2hfZmVhdHVyZSwKPiA+PiArCQkJCSAgIE5BTkRfRkxBU0hfRkVBVFVS
RVMsIDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPiA+PiArCQlicmVhazsKPiA+PiArCWRlZmF1bHQ6
Cj4gPj4gKwkJcmV0dXJuIDA7ICAKPiA+IAo+ID4gTm8gZXJyb3Igc3RhdGU/ICAKPiAgICBXZSBj
YW4ndCByZXR1cm4gcmV0dXJuIGVycm9yIGhlcmUgLCBzaW5jZSB0aGlzIEFQSSBpcyBub3QgZm9y
IGNoZWNraW5nIHN1cHBvcnRlZCBjb21tYW5kLgoKSSBubyBsb25nZXIgcmVtZW1iZXIgZXhhY3Rs
eSB3aGVyZSB0aGlzIGlzIGNhbGxlZCwgYnV0IGlmIHRoZXJlIGFyZQpwb3NzaWJsZSB1bmhhbmRs
ZWQgY2FzZXMsIEkgd2FudCBhbiBlcnJvciB0byBiZSByZXR1cm5lZC4KCj4gICAgV2UgY2FuIHJl
dHVybiBlcnJvciBvbmx5IGlmIHdlIHN1Ym1pdHRlZCB0aGUgZGVzY3JpcHRvci4gVGhhdCBhbHJl
YWR5IHdlIGFyZSBoYW5kbGluZy4KCi4uLgoKPiA+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9u
YW5kLXFwaWMtY29tbW9uLmgKPiA+PiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMt
Y29tbW9uLmgKPiA+PiBAQCAtMzE1LDExICszMTUsNTYgQEAgc3RydWN0IG5hbmRjX3JlZ3Mgewo+
ID4+ICAgCV9fbGUzMiByZWFkX2xvY2F0aW9uX2xhc3QxOwo+ID4+ICAgCV9fbGUzMiByZWFkX2xv
Y2F0aW9uX2xhc3QyOwo+ID4+ICAgCV9fbGUzMiByZWFkX2xvY2F0aW9uX2xhc3QzOwo+ID4+ICsJ
X19sZTMyIHNwaV9jZmc7Cj4gPj4gKwlfX2xlMzIgbnVtX2FkZHJfY3ljbGU7Cj4gPj4gKwlfX2xl
MzIgYnVzeV93YWl0X2NudDsKPiA+PiArCV9fbGUzMiBmbGFzaF9mZWF0dXJlOyAgCj4gPj4gICA+
PiAgIAlfX2xlMzIgZXJhc2VkX2N3X2RldGVjdF9jZmdfY2xyOyAgCj4gPj4gICAJX19sZTMyIGVy
YXNlZF9jd19kZXRlY3RfY2ZnX3NldDsKPiA+PiAgIH07ICAKPiA+PiAgID4+ICsvKiAgCj4gPj4g
KyAqIEVDQyBzdGF0ZSBzdHJ1Y3QKPiA+PiArICogQGNvcnJlY3RlZDoJCUVDQyBjb3JyZWN0ZWQK
PiA+PiArICogQGJpdGZsaXBzOgkJTWF4IGJpdCBmbGlwCj4gPj4gKyAqIEBmYWlsZWQ6CQlFQ0Mg
ZmFpbGVkCj4gPj4gKyAqLwo+ID4+ICtzdHJ1Y3QgcWNvbV9lY2Nfc3RhdHMgewo+ID4+ICsJdTMy
IGNvcnJlY3RlZDsKPiA+PiArCXUzMiBiaXRmbGlwczsKPiA+PiArCXUzMiBmYWlsZWQ7Cj4gPj4g
K307Cj4gPj4gKwo+ID4+ICtzdHJ1Y3QgcXBpY19lY2Mgewo+ID4+ICsJc3RydWN0IGRldmljZSAq
ZGV2Owo+ID4+ICsJY29uc3Qgc3RydWN0IHFwaWNfZWNjX2NhcHMgKmNhcHM7Cj4gPj4gKwlzdHJ1
Y3QgY29tcGxldGlvbiBkb25lOwo+ID4+ICsJdTMyIHNlY3RvcnM7Cj4gPj4gKwl1OCAqZWNjZGF0
YTsKPiA+PiArCWJvb2wgdXNlX2VjYzsKPiA+PiArCXUzMiBlY2NfbW9kZXM7Cj4gPj4gKwlpbnQg
ZWNjX2J5dGVzX2h3Owo+ID4+ICsJaW50IHNwYXJlX2J5dGVzOwo+ID4+ICsJaW50IGJibV9zaXpl
Owo+ID4+ICsJaW50IGVjY19tb2RlOwo+ID4+ICsJaW50IGJ5dGVzOwo+ID4+ICsJaW50IHN0ZXBz
Owo+ID4+ICsJaW50IHN0ZXBfc2l6ZTsKPiA+PiArCWludCBzdHJlbmd0aDsKPiA+PiArCWludCBj
d19zaXplOwo+ID4+ICsJaW50IGN3X2RhdGE7Cj4gPj4gKwl1MzIgY2ZnMCwgY2ZnMTsKPiA+PiAr
CXUzMiBjZmcwX3JhdywgY2ZnMV9yYXc7Cj4gPj4gKwl1MzIgZWNjX2J1Zl9jZmc7Cj4gPj4gKwl1
MzIgZWNjX2JjaF9jZmc7Cj4gPj4gKwl1MzIgY2xyZmxhc2hzdGF0dXM7Cj4gPj4gKwl1MzIgY2xy
cmVhZHN0YXR1czsKPiA+PiArCWJvb2wgYmNoX2VuYWJsZWQ7Cj4gPj4gK307Cj4gPj4gKwo+ID4+
ICtzdHJ1Y3QgcXBpY19lY2M7Cj4gPj4gKwo+ID4+ICAgLyoKPiA+PiAgICAqIE5BTkQgY29udHJv
bGxlciBkYXRhIHN0cnVjdAo+ID4+ICAgICoKPiA+PiBAQCAtMzI5LDYgKzM3NCw3IEBAIHN0cnVj
dCBuYW5kY19yZWdzIHsKPiA+PiAgICAqCj4gPj4gICAgKiBAY29yZV9jbGs6CQkJY29udHJvbGxl
ciBjbG9jawo+ID4+ICAgICogQGFvbl9jbGs6CQkJYW5vdGhlciBjb250cm9sbGVyIGNsb2NrCj4g
Pj4gKyAqIEBpb21hY3JvX2NsazoJCWlvIG1hY3JvIGNsb2NrCj4gPj4gICAgKgo+ID4+ICAgICog
QHJlZ3M6CQkJYSBjb250aWd1b3VzIGNodW5rIG9mIG1lbW9yeSBmb3IgRE1BIHJlZ2lzdGVyCj4g
Pj4gICAgKgkJCQl3cml0ZXMuIGNvbnRhaW5zIHRoZSByZWdpc3RlciB2YWx1ZXMgdG8gYmUKPiA+
PiBAQCAtMzM4LDYgKzM4NCw3IEBAIHN0cnVjdCBuYW5kY19yZWdzIHsKPiA+PiAgICAqCQkJCWlu
aXRpYWxpemVkIHZpYSBEVCBtYXRjaCBkYXRhCj4gPj4gICAgKgo+ID4+ICAgICogQGNvbnRyb2xs
ZXI6CQkJYmFzZSBjb250cm9sbGVyIHN0cnVjdHVyZQo+ID4+ICsgKiBAY3RscjoJCQlzcGkgY29u
dHJvbGxlciBzdHJ1Y3R1cmUKPiA+PiAgICAqIEBob3N0X2xpc3Q6CQkJbGlzdCBjb250YWluaW5n
IGFsbCB0aGUgY2hpcHMgYXR0YWNoZWQgdG8gdGhlCj4gPj4gICAgKgkJCQljb250cm9sbGVyCj4g
Pj4gICAgKgo+ID4+IEBAIC0zNzUsNiArNDIyLDcgQEAgc3RydWN0IHFjb21fbmFuZF9jb250cm9s
bGVyIHsgIAo+ID4+ICAgPj4gICAJc3RydWN0IGNsayAqY29yZV9jbGs7ICAKPiA+PiAgIAlzdHJ1
Y3QgY2xrICphb25fY2xrOwo+ID4+ICsJc3RydWN0IGNsayAqaW9tYWNyb19jbGs7ICAKPiA+PiAg
ID4+ICAgCXN0cnVjdCBuYW5kY19yZWdzICpyZWdzOyAgCj4gPj4gICAJc3RydWN0IGJhbV90cmFu
c2FjdGlvbiAqYmFtX3R4bjsKPiA+PiBAQCAtMzgyLDYgKzQzMCw3IEBAIHN0cnVjdCBxY29tX25h
bmRfY29udHJvbGxlciB7Cj4gPj4gICAJY29uc3Qgc3RydWN0IHFjb21fbmFuZGNfcHJvcHMgKnBy
b3BzOyAgCj4gPj4gICA+PiAgIAlzdHJ1Y3QgbmFuZF9jb250cm9sbGVyIGNvbnRyb2xsZXI7ICAK
PiA+PiArCXN0cnVjdCBzcGlfY29udHJvbGxlciAqY3RscjsKPiA+PiAgIAlzdHJ1Y3QgbGlzdF9o
ZWFkIGhvc3RfbGlzdDsgIAo+ID4+ICAgPj4gICAJdW5pb24geyAgCj4gPj4gQEAgLTQxOCw2ICs0
NjcsMjEgQEAgc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyIHsgIAo+ID4+ICAgPj4gICAJdTMy
IGNtZDEsIHZsZDsgIAo+ID4+ICAgCWJvb2wgZXhlY19vcHdyaXRlOwo+ID4+ICsJc3RydWN0IHFw
aWNfZWNjICplY2M7Cj4gPj4gKwlzdHJ1Y3QgcWNvbV9lY2Nfc3RhdHMgZWNjX3N0YXRzOwo+ID4+
ICsJc3RydWN0IG5hbmRfZWNjX2VuZ2luZSBlY2NfZW5nOwo+ID4+ICsJdTggKmRhdGFfYnVmOwo+
ID4+ICsJdTggKm9vYl9idWY7Cj4gPj4gKwl1MzIgd2xlbjsKPiA+PiArCXUzMiBhZGRyMTsKPiA+
PiArCXUzMiBhZGRyMjsKPiA+PiArCXUzMiBjbWQ7Cj4gPj4gKwl1MzIgbnVtX2N3Owo+ID4+ICsJ
dTMyIHBhZ2VzaXplOwo+ID4+ICsJYm9vbCBvb2Jfcnc7Cj4gPj4gKwlib29sIHBhZ2Vfcnc7Cj4g
Pj4gKwlib29sIHJhd19ydzsKPiA+PiArCWJvb2wgcmVhZF9sYXN0X2N3Owo+ID4+ICAgfTsgIAo+
ID4gCj4gPiBJZiBhbGwgdGhlc2UgZGVmaW5pdGlvbnMgYXJlIG9ubHkgdXNlZCBieSB0aGUgc3Bp
IGNvbnRyb2xsZXIsIEkgZG9uJ3QKPiA+IHNlZSB3aHkgeW91IHdhbnQgdG8gcHV0IHRoZW0gaW4g
dGhlIGNvbW1vbiBmaWxlLiAgCj4gICBXZSBhcmUgdXNpbmcgcWNvbV9uYW5kX2NvbnRyb2xsZXJ7
Li59IHN0cnVjdHVyZSBhcyBjb21tb24gYi93IHJhdyBuYW5kCj4gICBhbmQgc3BpIG5hbmQuIFRo
ZXNlIGFsbCB2YXJpYWJsZXMgd2lsbCBiZSB1c2VkIGJ5IHNwaSBuYW5kIG9ubHkgLCBidXQKPiAg
IHFjb21fbmFuZF9jb250cm9sbGVyIHN0cnVjdHVyZSBpcyBwYXNzZWQgYWNyb3NzIGFsbCB0aGUg
U1BJIEFQSSwgdGhhdHMKPiAgIHdoeSBkZWZpbmUgdGhlc2UgYWxsIHZhcmlhYmxlcyBpbnNpZGUg
cWNvbV9uYW5kX2NvbnRyb2xsZXIgc3RydWN0dXJlLgo+ICAgc28gdGhhdCBpIGNhbiBhY2Nlc3Mg
ZGlyZWN0bHR5LgoKTWF5YmUgeW91IGNhbiBtb3ZlIHRoZSBzcGktbmFuZCBzcGVjaWZpYyB2YXJp
YWJsZXMgaW4gYSBzdHJ1Y3QsIGFuZCB0aGUKcmF3IE5BTkQgc3BlY2lmaWMgdmFyaWFibGVzIGlu
IGFub3RoZXIsIGFuZCB0aGVuIHVzZSBhbiBlbnVtIGluIHRoaXMKc3RydWN0dXJlLiBUaGlzIHdh
eSBvbmx5IHRoZSB1c2VmdWwgZmllbGRzIGFyZSBhdmFpbGFibGUuIE9yIG1heWJlIHlvdQpjYW4g
aGF2ZSB0d28gcG9pbnRlcnMgYW5kIG9ubHkgcG9wdWxhdGUgdGhlIHJlbGV2YW50IG9uZSBmcm9t
IHRoZQpyZWxldmFudCBkcml2ZXIgd2l0aCB0aGUgZmllbGRzIHRoYXQgYXJlIG1pc3NpbmcuIEJ1
dCB0aGlzIGlzIGEgZ2VuZXJpYwppbmNsdWRlLCBzbyBkb24ndCBwdXQgc3BlY2lmaWMgZmllbGRz
IHRoZXJlIGp1c3QgYmVjYXVzZSBpdCBpcwpjb252ZW5pZW50LgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
