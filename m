Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49E3C6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2024 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/07LWfUzKKY0rmFesq6PmdsFfVHi+I7G7rGAf/Xpl+M=; b=IKc5NzKx54moFp
	0yzGw+VBlfgpmMR0LOjcL5+KsWc5MECjZ2z20M3g/61Nehy2oKN+mSf5IUqG1dNPlxlos6yA3ezjr
	BQiIyZYZ2slYhCY7CbGs7pgYGEpTKtuCJ8WE+3ml2vfQKLqtOs1DTr6a5JX/E0fb22S9EAxfhXI7O
	Qy8hg5uKd+mox3c6PdpnudpXc7DyQ8V6pSl+ak3KbC2zc7VLy13NlEr159XU0g8gX0qXsfXFiYSul
	HjV1Qlb6jveD7WVDyAwOtidsC7Zcq73TkiG/+40ErGkpb+qo0ijSVy6ciR4eXEO6X/3BuTIKUCP2J
	DX+jIZUs9X1qPJDSGhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rru8c-0000000EGEL-0t8Y;
	Wed, 03 Apr 2024 06:30:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rru8Y-0000000EGDY-3kZ6
	for linux-mtd@lists.infradead.org;
	Wed, 03 Apr 2024 06:30:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e0411c0a52so50948765ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2024 23:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712125814; x=1712730614; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RD/Ll+en1rNJsL6MJyoQafEtmHmvnu+TP2GShmlV2E=;
        b=xmttgyGopCq5Bu5KBGRvE9IHHVozRramv6LsXtKqpCfeep7sibHZ+Yzg5FLxdKjM48
         86JhEH6zzAhxknwqL3YaM0QGtyLQAEFnFYOaLOluqExqgva+cBjMUYKyELKSGC68Cm/9
         sJA6+rBYMyZeroEllNTWXR3ayaaX/fm/s7N12BB5+JMCVDqZ767RZk0rScBN7Efu7NT0
         Sq5Na+PQgl1LZZGunP8HgJlz1uMGTQiaw9ZYeqBDn53AuadUHrkyvgXyAoYJjr/cO767
         w1rGaVt26dE3N7QH+b4ZcknEPqPQi5tS/7ZVUQvGbyHOM2+Hdh772T/89uWsLI99683Q
         iMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712125814; x=1712730614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RD/Ll+en1rNJsL6MJyoQafEtmHmvnu+TP2GShmlV2E=;
        b=cJnNrJduXApsIB1WbUYlwfvD0vFbh0gP65ZntZaAljcvQ+AbBsxQ/wU4SD37GHkhgm
         ACrL532ttMK9MxIY+CV9s06q5Tz/FP4Lrxlc+INaEy904N9UhH67fxtfYzQaNTfWqDnA
         /M22UMifkOW4GJEqnFerz3oa8ZxD+gUkNvgaSe/WkPt7A6D9DPRg9iKbJrFc728VEi94
         G7/z+7c5SK9dtBX7jsm3sXFTl2Pz3L3USEDQP9kwUtyn8W6uNxxL6JCSgbucCCuIkQhS
         HutcqHRs7GhVDgMs6OQbfIf69b+MqpWBa8mc22yekgvCpXzHQevZVXjy3Ck185dra0YN
         2mXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4rl/W6WcoYy9uGURAAMps5jiFkzqPrtV+v8HLZwtahhE1LaRyX+G/AfY/mlI9ChMh4c/3xq5+vgP62rjJQja1Ep1UWCf8Ol/jY5D/Mw==
X-Gm-Message-State: AOJu0YwVd3lmQpqVZLwTUUpVufnnmdrKleZmR/cQJpJOzPtXTiSBv6a+
	bL13z6nM2y9XRF9qynm5a47vTmipOeViFgfr3tL3EjOGPr4xLWxhxAcVf5XU3A==
X-Google-Smtp-Source: AGHT+IFB1/jew2jwqrDsxXrqrjGsZHTMzuxqjY1GHMh3+JdUbou30h3sipXmeEKmZIIzGMunMk8+TA==
X-Received: by 2002:a17:902:dacf:b0:1e2:367:9879 with SMTP id q15-20020a170902dacf00b001e203679879mr15757623plx.45.1712125813278;
        Tue, 02 Apr 2024 23:30:13 -0700 (PDT)
Received: from thinkpad ([103.246.195.197])
        by smtp.gmail.com with ESMTPSA id d14-20020a170903230e00b001e06c1eed85sm12341503plh.141.2024.04.02.23.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 23:30:12 -0700 (PDT)
Date: Wed, 3 Apr 2024 12:00:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: qcom: Fix broken misc_cmd_type in
 exec_op
Message-ID: <20240403063008.GA25309@thinkpad>
References: <20240402214136.29237-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402214136.29237-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_233019_142507_78314A06 
X-CRM114-Status: GOOD (  23.35  )
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

T24gVHVlLCBBcHIgMDIsIDIwMjQgYXQgMTE6NDE6MzRQTSArMDIwMCwgQ2hyaXN0aWFuIE1hcmFu
Z2kgd3JvdGU6Cj4gbWlzY19jbWRfdHlwZSBpbiBleGVjX29wIGhhdmUgbXVsdGlwbGUgcHJvYmxl
bXMuIFdpdGggY29tbWl0IGE4Mjk5MGM4YTQwOQo+ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQg
cmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBhdGgiKSBpdCB3YXMKPiByZXdvcmtlZCBh
bmQgZ2VuZXJhbGl6ZWQgYnV0IGFjdHVhbGx5IGRyb3BwZWQgdGhlIGhhbmRsaW5nIG9mIHRoZQo+
IE9QX1JFU0VUX0RFVklDRSBjb21tYW5kLgo+IAo+IFRoZSByZXdvcmsgaXRzZWxmIHdhcyBjb3Jy
ZWN0IHdpdGggc3VwcG9ydGluZyBjYXNlIHdoZXJlIGEgc2luZ2xlIG1pc2MKPiBjb21tYW5kIGlz
IGhhbmRsZWQsIGJ1dCBiZWNhbWUgcHJvYmxlbWF0aWMgYnkgdGhlIGFkZGl0aW9uIG9mIGV4aXRp
bmcKPiBlYXJseSBpZiB3ZSBkaWRuJ3QgaGFkIGFuIE9QX0JMT0NLX0VSQVNFIG9yIGFuIE9QX1BS
T0dSQU1fUEFHRSBvcGVyYXRpb24uCj4gCj4gQWxzbyBhZGRpdGlvbmFsIGxvZ2ljIHdhcyBhZGRl
ZCB3aXRob3V0IGNsZWFyIGV4cGxhaW5hdGlvbiBjYXVzaW5nIHRoZQo+IE9QX1JFU0VUX0RFVklD
RSBjb21tYW5kIHRvIGJlIGJyb2tlbiBvbiB0ZXN0aW5nIGl0IG9uIGEgaXBxODA2eCBuYW5kYy4K
PiAKPiBBZGQgc29tZSBhZGRpdGlvbmFsIGxvZ2ljIHRvIHJlc3RvcmUgT1BfUkVTRVRfREVWSUNF
IGNvbW1hbmQgaGFuZGxpbmcKPiByZXN0b3Jpbmcgb3JpZ2luYWwgZnVuY3Rpb25hbGl0eS4KPiAK
CkknZCBsaWtlIHRvIHJld29yZCB0aGUgY29tbWl0IHN1YmplY3QgYW5kIGRlc2NyaXB0aW9uIGFz
IGJlbG93LiBCdXQgSSBob3BlCk1pcXVlbCBjYW4gYW1tZW5kIGl0IHdoaWxlIGFwcGx5aW5nOgoK
Im10ZDogcmF3bmFuZDogcWNvbTogRml4IGJyb2tlbiBPUF9SRVNFVF9ERVZJQ0UgY29tbWFuZCBp
biBxY29tX21pc2NfY21kX3R5cGVfZXhlYygpCgpXaGlsZSBtaWdyYXRpbmcgdG8gZXhlY19vcHMg
aW4gY29tbWl0IGE4Mjk5MGM4YTQwOSAoIm10ZDogcmF3bmFuZDogcWNvbToKQWRkIHJlYWQvcmVh
ZF9zdGFydCBvcHMgaW4gZXhlY19vcCBwYXRoIiksIE9QX1JFU0VUX0RFVklDRSBjb21tYW5kIGhh
bmRsaW5nCmdvdCBicm9rZW4gdW5pbnRlbnRpb25hbGx5LiBSaWdodCBub3cgZm9yIHRoZSBPUF9S
RVNFVF9ERVZJQ0UgY29tbWFuZCwKcWNvbV9taXNjX2NtZF90eXBlX2V4ZWMoKSB3aWxsIHNpbXBs
eSByZXR1cm4gMCB3aXRob3V0IGhhbmRsaW5nIGl0LiBFdmVuLAppZiB0aGF0IGdldHMgZml4ZWQs
IGFuIHVubmVjZXNzYXJ5IEZMQVNIX1NUQVRVUyByZWFkIGRlc2NyaXB0b3IgY29tbWFuZCBpcwpi
ZWluZyBhZGRlZCBpbiB0aGUgbWlkZGxlIGFuZCB0aGF0IHNlZW1zIHRvIGJlIGNhdXNpbmcgdGhl
IGNvbW1hbmQgdG8gZmFpbApvbiBJUFE4MDZ4IGRldmljZXMuCgpTbyBsZXQncyBmaXggdGhlIGFi
b3ZlIHR3byBpc3N1ZXMgdG8gbWFrZSBPUF9SRVNFVF9ERVZJQ0UgY29tbWFuZCB3b3JraW5nCmFn
YWluLiIKCj4gRml4ZXM6IGE4Mjk5MGM4YTQwOSAoIm10ZDogcmF3bmFuZDogcWNvbTogQWRkIHJl
YWQvcmVhZF9zdGFydCBvcHMgaW4gZXhlY19vcCBwYXRoIikKPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdt
YWlsLmNvbT4KCldpdGggdGhlIGFib3ZlIGNoYW5nZSwKClJldmlld2VkLWJ5OiBNYW5pdmFubmFu
IFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgoKLSBNYW5pCgo+
IC0tLQo+IENoYW5nZXMgdjM6Cj4gLSBNZXJnZSBwYXRjaGVzCj4gLSBSZXdvcmsgY29tbWl0IGRl
c2NyaXB0aW9uCj4gQ2hhbmdlcyB2MjoKPiAtIFNwbGl0IHBhdGNoZXMKPiAKPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYwo+IGluZGV4IGIwNzk2MDVjODRkMy4uYjhjZmY5MjQwYjI4IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYwo+IEBAIC0yODE1LDcgKzI4MTUsNyBAQCBzdGF0aWMgaW50IHFjb21f
bWlzY19jbWRfdHlwZV9leGVjKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHN0cnVjdCBu
YW5kX3N1Ygo+ICAJCQkgICAgICBob3N0LT5jZmcwX3JhdyAmIH4oNyA8PCBDV19QRVJfUEFHRSkp
Owo+ICAJCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9ERVYwX0NGRzEsIGhvc3QtPmNmZzFfcmF3
KTsKPiAgCQlpbnN0cnMgPSAzOwo+IC0JfSBlbHNlIHsKPiArCX0gZWxzZSBpZiAocV9vcC5jbWRf
cmVnICE9IE9QX1JFU0VUX0RFVklDRSkgewo+ICAJCXJldHVybiAwOwo+ICAJfQo+ICAKPiBAQCAt
MjgzMCw5ICsyODMwLDggQEAgc3RhdGljIGludCBxY29tX21pc2NfY21kX3R5cGVfZXhlYyhzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBzdHJ1Y3QgbmFuZF9zdWIKPiAgCW5hbmRjX3NldF9y
ZWcoY2hpcCwgTkFORF9FWEVDX0NNRCwgMSk7Cj4gIAo+ICAJd3JpdGVfcmVnX2RtYShuYW5kYywg
TkFORF9GTEFTSF9DTUQsIGluc3RycywgTkFORF9CQU1fTkVYVF9TR0wpOwo+IC0JKHFfb3AuY21k
X3JlZyA9PSBPUF9CTE9DS19FUkFTRSkgPyB3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RFVjBf
Q0ZHMCwKPiAtCTIsIE5BTkRfQkFNX05FWFRfU0dMKSA6IHJlYWRfcmVnX2RtYShuYW5kYywKPiAt
CU5BTkRfRkxBU0hfU1RBVFVTLCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gKwlpZiAocV9vcC5j
bWRfcmVnID09IE9QX0JMT0NLX0VSQVNFKQo+ICsJCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRf
REVWMF9DRkcwLCAyLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gIAo+ICAJd3JpdGVfcmVnX2RtYShu
YW5kYywgTkFORF9FWEVDX0NNRCwgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+ICAJcmVhZF9yZWdf
ZG1hKG5hbmRjLCBOQU5EX0ZMQVNIX1NUQVRVUywgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+IC0t
IAo+IDIuNDMuMAo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7g
rprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
