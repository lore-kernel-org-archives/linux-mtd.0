Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1856C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUhU0To1R5H0CKFNzjMyjkYmxpEFIxk/3IcuLtsqHcM=; b=U8zsjk0NInnUWL
	7miWpsMfDEJ4r0dxiKjkis4K6b3eEPOoh4tz/qY32e6/sTPVTRYDEkn+fSmeRhuF1YrIKr8nu+qb/
	6tuDhcsNjOSMvQHt/O+AEd0BbmI7DCn3aX4H9kx+4Lwxey7QCeGdDcBXNLQZ1hr4vL2nKB6jqtUZm
	2vXdnesgWeztMlIFlMCEcPlFYb/kZIHfYdfSAPRG+0Q+gkggNuD+zXqGfwjJo0LBD8nMMnLCs7vaq
	8UK9i0gMShF5aif+Hw9sNXDdlKkhdhWkXr3qpJm5JkbCf44bnHP7+ItUQ8AF5Hkn1vo/wr81VL0mh
	ZM7rvo2YoIOdlzMubs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXYw-00000000ikY-3m3x;
	Mon, 10 Feb 2025 17:27:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXId-00000000fDs-2Mi3
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 17:10:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f4a4fbb35so59968475ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2025 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739207422; x=1739812222; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJBo65n/x3cGPmTDY6dfaDs6s3ZVqbAaIw7gB8ar1TU=;
        b=lFCrAoHn5VGpAxErHjGxJ5Mny5oLzOZAqERmzJPOdb9UCfblH9SWhre5G94Hs2Qydn
         aJiTudMv+oGIsujxSZH4CZ41P5wthwNKWyETiXtwS0v6Ai3Qp/KmB/146KI5V5YSt5cp
         TjJm+r039EXmy8opkpgUW2WZDVUwvztKjapNYQir9aPeG2jS0ijgi8eU5KcVz5x4NDAq
         84DcH3ewEmkCRhqvGV5EzthOaTovU5so4MahU857P7ENQ2bd0Q9FoJAAhhnwZ1ND4X6O
         poHVHC+UR+tLCQemuURGjeU0h5nE0hwgKIyG06naYzhOZ5OG6aXFJM7xaIwehZ5f+GM8
         yp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207422; x=1739812222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJBo65n/x3cGPmTDY6dfaDs6s3ZVqbAaIw7gB8ar1TU=;
        b=VNLDpVhauZQBxNfBMotJ5nKCqMcVlu7vg5V5gl5VyXOP0oXmEJVBrDI2SnRIIG10Ns
         fiQRMedjxP4juzbCvt4dJdCZ0Aq16GrS74DRak99TcAieKx36h45OPOK+UwtjnfaWCrI
         zf3bFHGGToFxGTU6DO9QWrnbLN2i5DpCzelPA8RFd1dQGwzlFbs8E/CyAv7gfOKnuQFo
         rtHg/YJ0iEUzv20nnbBOIazKcsdOQfww+TpzYdKl9N5BhGo0arzKeCcEbvylN2gSilxI
         SvyojxYH4vYKSQAkUMT4mN+m0QoI92nSAKoMVqaokvbSdidePOd7CXpj3ntUIngM0Xe+
         pcsg==
X-Forwarded-Encrypted: i=1; AJvYcCWr5J3lLGml9sRjPram9Pj7OU1F1KN3zpAnZWtI85FXRuWsiQ/nbWjcM+loZ9mjTcT58PJdzEQWF8g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3M3au8kAy85oHx6U0uxdVta5901Gb3+1WuAbVJ4vfLzBg3ECA
	/9XkP0qW30Yjz73L9RXTOk2oaVhhd37jbvpIh7Lq8e/LJUNoJeBgD22v0Z8a2w==
X-Gm-Gg: ASbGncsrrL0cCqCFeftrYZ4Caf4Kz+ZaRumEs85dFFAuysydFb6Vhdd/qyNOak8aEvv
	inP3QyZc8VLqTe2xlSCF7Jj4lpxl6yaKCTqy0QkyKaiFcrD6lR5FBHQgkPKTudBFlL42PHwnOGu
	pfe9MB5L3DIGknTQw130wXRJ73nWfdYEEEwjgYkL3dAz5aJl3p0dRLdL0XgsWXr5I+6B+lXOjlh
	smq7wXEFf8QNCvtAVd7P47oHjHfGswY6K9FXw0snyk4VrZGJ5ijAEQdOc846+iY1kG/CXlfk60l
	YYyNPE1m7FGa5UCS3rq7vd3a2X0B
X-Google-Smtp-Source: AGHT+IF56qTkw7TJubOEXPIM9zfQyfQzn7+cZYQk9mn9YGpujIBnDlW/B1WsBT0lOvPG9bCSoLR7yg==
X-Received: by 2002:a17:902:e54d:b0:21f:3823:482b with SMTP id d9443c01a7336-21fb6f54a29mr1014975ad.25.1739207395874;
        Mon, 10 Feb 2025 09:09:55 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f365446d7sm81455805ad.82.2025.02.10.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:09:55 -0800 (PST)
Date: Mon, 10 Feb 2025 22:39:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: qcom: fix broken config in
 qcom_param_page_type_exec
Message-ID: <20250210170950.zxgm5hjeb2a4evfn@thinkpad>
References: <20250209140941.16627-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250209140941.16627-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_091023_633306_69679D45 
X-CRM114-Status: GOOD (  22.53  )
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

T24gU3VuLCBGZWIgMDksIDIwMjUgYXQgMDM6MDk6MzhQTSArMDEwMCwgQ2hyaXN0aWFuIE1hcmFu
Z2kgd3JvdGU6Cj4gRml4IGJyb2tlbiBjb25maWcgaW4gcWNvbV9wYXJhbV9wYWdlX3R5cGVfZXhl
YyBjYXVzZWQgYnkgY29weS1wYXN0ZSBlcnJvcgo+IGZyb20gY29tbWl0IDBjMDgwODBmZDcxYyAo
Im10ZDogcmF3bmFuZDogcWNvbTogdXNlIEZJRUxEX1BSRVAgYW5kIEdFTk1BU0siKQo+IAo+IElu
IHFjb21fcGFyYW1fcGFnZV90eXBlX2V4ZWMgdGhlIHZhbHVlIG5lZWRzIHRvIGJlIHNldCB0bwo+
IG5hbmRjLT5yZWdzLT5jZmcwIGluc3RlYWQgb2YgaG9zdC0+Y2ZnMC4gVGhpcyB3cm9uZyBjb25m
aWd1cmF0aW9uIGNhdXNlZAo+IHRoZSBRY29tIE5BTkRDIGRyaXZlciB0byBtYWxmdW5jdGlvbiBv
biBhbnkgZGV2aWNlIHRoYXQgbWFrZXMgdXNlIG9mIGl0Cj4gKElQUTgwNngsIElQUTQweHgsIElQ
UTgwN3gsIElQUTYweHgpIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcjoKPiAKCkknbSB3b25kZXJp
bmcgd2hldGhlciB0aGUgb2ZmZW5kaW5nIGNvbW1pdCB3YXMgcmVhbGx5IHRlc3RlZCBvciBub3Qg
OigKCj4gWyAgICAwLjg4NTM2OV0gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6
IDB4MmMsIENoaXAgSUQ6IDB4YWEKPiBbICAgIDAuODg1OTA5XSBuYW5kOiBNaWNyb24gTkFORCAy
NTZNaUIgMSw4ViA4LWJpdAo+IFsgICAgMC44OTI0OTldIG5hbmQ6IDI1NiBNaUIsIFNMQywgZXJh
c2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTogNjQKPiBbICAgIDAu
ODk2ODIzXSBuYW5kOiBFQ0MgKHN0ZXAsIHN0cmVuZ3RoKSA9ICg1MTIsIDgpIGRvZXMgbm90IGZp
dCBpbiBPT0IKPiBbICAgIDAuODk2ODM2XSBxY29tLW5hbmRjIDc5YjAwMDAubmFuZC1jb250cm9s
bGVyOiBObyB2YWxpZCBFQ0Mgc2V0dGluZ3MgcG9zc2libGUKPiBbICAgIDAuOTEwOTk2XSBiYW0t
ZG1hLWVuZ2luZSA3OTg0MDAwLmRtYS1jb250cm9sbGVyOiBDYW5ub3QgZnJlZSBidXN5IGNoYW5u
ZWwKPiBbICAgIDAuOTE4MDcwXSBxY29tLW5hbmRjOiBwcm9iZSBvZiA3OWIwMDAwLm5hbmQtY29u
dHJvbGxlciBmYWlsZWQgd2l0aCBlcnJvciAtMjgKPiAKPiBSZXN0b3JlIG9yaWdpbmFsIGNvbmZp
Z3VyYXRpb24gZml4IHRoZSBwcm9ibGVtIGFuZCBtYWtlcyB0aGUgZHJpdmVyIHdvcmsKPiBhZ2Fp
bi4KPiAKPiBBbHNvIHJlc3RvcmUgdGhlIHdyb25nbHkgZHJvcHBlZCBjcHVfdG9fbGUzMiB0byBj
b3JyZWN0bHkgc3VwcG9ydCBCRQo+IHN5c3RlbXMuCj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKPiBGaXhlczogMGMwODA4MGZkNzFjICgibXRkOiByYXduYW5kOiBxY29tOiB1c2UgRklF
TERfUFJFUCBhbmQgR0VOTUFTSyIpCj4gVGVzdGVkLWJ5OiBSb2JlcnQgTWFya28gPHJvYmltYXJr
b0BnbWFpbC5jb20+ICMgSVBRODA3NCBhbmQgSVBRNjAxOAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBNYW5pdmFu
bmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgoKVGhhbmtz
IGZvciB0aGUgZml4IQoKLSBNYW5pCgo+IC0tLQo+IENoYW5nZXMgdjI6Cj4gLSBGaXggc21hdGNo
IHdhcm5pbmcgKGFkZCBtaXNzaW5nIGNwdV90b19sZTMyIHRoYXQgd2FzIGFsc28gZHJvcHBlZAo+
ICAgZnJvbSB0aGUgRklFTERfUFJFUCBwYXRjaCkKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4gaW5kZXggZDJkMmFlZWU0MmE3Li42NzIwYjU0Nzg5MmIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTE4ODEsMTggKzE4ODEsMTggQEAgc3RhdGlj
IGludCBxY29tX3BhcmFtX3BhZ2VfdHlwZV9leGVjKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsICBj
b25zdCBzdHJ1Y3QgbmFuZF8KPiAgCW5hbmRjLT5yZWdzLT5hZGRyMCA9IDA7Cj4gIAluYW5kYy0+
cmVncy0+YWRkcjEgPSAwOwo+ICAKPiAtCWhvc3QtPmNmZzAgPSBGSUVMRF9QUkVQKENXX1BFUl9Q
QUdFX01BU0ssIDApIHwKPiAtCQkgICAgIEZJRUxEX1BSRVAoVURfU0laRV9CWVRFU19NQVNLLCA1
MTIpIHwKPiAtCQkgICAgIEZJRUxEX1BSRVAoTlVNX0FERFJfQ1lDTEVTX01BU0ssIDUpIHwKPiAt
CQkgICAgIEZJRUxEX1BSRVAoU1BBUkVfU0laRV9CWVRFU19NQVNLLCAwKTsKPiAtCj4gLQlob3N0
LT5jZmcxID0gRklFTERfUFJFUChOQU5EX1JFQ09WRVJZX0NZQ0xFU19NQVNLLCA3KSB8Cj4gLQkJ
ICAgICBGSUVMRF9QUkVQKEJBRF9CTE9DS19CWVRFX05VTV9NQVNLLCAxNykgfAo+IC0JCSAgICAg
RklFTERfUFJFUChDU19BQ1RJVkVfQlNZLCAwKSB8Cj4gLQkJICAgICBGSUVMRF9QUkVQKEJBRF9C
TE9DS19JTl9TUEFSRV9BUkVBLCAxKSB8Cj4gLQkJICAgICBGSUVMRF9QUkVQKFdSX1JEX0JTWV9H
QVBfTUFTSywgMikgfAo+IC0JCSAgICAgRklFTERfUFJFUChXSURFX0ZMQVNILCAwKSB8Cj4gLQkJ
ICAgICBGSUVMRF9QUkVQKERFVjBfQ0ZHMV9FQ0NfRElTQUJMRSwgMSk7Cj4gKwluYW5kYy0+cmVn
cy0+Y2ZnMCA9IGNwdV90b19sZTMyKEZJRUxEX1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywgMCkgfAo+
ICsJCQkJCUZJRUxEX1BSRVAoVURfU0laRV9CWVRFU19NQVNLLCA1MTIpIHwKPiArCQkJCQlGSUVM
RF9QUkVQKE5VTV9BRERSX0NZQ0xFU19NQVNLLCA1KSB8Cj4gKwkJCQkJRklFTERfUFJFUChTUEFS
RV9TSVpFX0JZVEVTX01BU0ssIDApKTsKPiArCj4gKwluYW5kYy0+cmVncy0+Y2ZnMSA9IGNwdV90
b19sZTMyKEZJRUxEX1BSRVAoTkFORF9SRUNPVkVSWV9DWUNMRVNfTUFTSywgNykgfAo+ICsJCQkJ
CUZJRUxEX1BSRVAoQkFEX0JMT0NLX0JZVEVfTlVNX01BU0ssIDE3KSB8Cj4gKwkJCQkJRklFTERf
UFJFUChDU19BQ1RJVkVfQlNZLCAwKSB8Cj4gKwkJCQkJRklFTERfUFJFUChCQURfQkxPQ0tfSU5f
U1BBUkVfQVJFQSwgMSkgfAo+ICsJCQkJCUZJRUxEX1BSRVAoV1JfUkRfQlNZX0dBUF9NQVNLLCAy
KSB8Cj4gKwkJCQkJRklFTERfUFJFUChXSURFX0ZMQVNILCAwKSB8Cj4gKwkJCQkJRklFTERfUFJF
UChERVYwX0NGRzFfRUNDX0RJU0FCTEUsIDEpKTsKPiAgCj4gIAlpZiAoIW5hbmRjLT5wcm9wcy0+
cXBpY192ZXJzaW9uMikKPiAgCQluYW5kYy0+cmVncy0+ZWNjX2J1Zl9jZmcgPSBjcHVfdG9fbGUz
MihFQ0NfQ0ZHX0VDQ19ESVNBQkxFKTsKPiAtLSAKPiAyLjQ3LjEKPiAKCi0tIArgrq7grqPgrr/g
rrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
