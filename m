Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634B3606A31E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yq6xPbHu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mrHh6gNr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b6DEJXQZN7wsHw9oVe9D+2qLH1bcQGITRUSLTze8IPU=; b=yq6xPbHu53Ply4KpJxDfzwIsrs
	UZxryELaD38BmhWheriQr1dmtEi+Fy1K1+E//pfUHlc6hukiHMKqdb7ZjsBNg2Wr9Q77yo9gvCI79
	AOFguKiH3hEmWfXoNjr7e7VZVvQ2kTSv3fHceJeY1YmDDDEEKGj02YPVLwYSx1fQUN/iOb5SzTcpy
	z8psT1ui64ypaFxMwmBxr0UhrkAFP3qjBelDztIJWVrJHo3+BydG4OnQ0I7XKx15Pm7F3yH7nTukD
	9/x4pk/Heq+VEVu57lj5XImfNskFxJ3r8LlhQHhcLTPtErqtFMrEPazHZguGnuyQt/Sb1+FHLvnll
	EdtEUHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWX36-0000000CmJd-2rYc;
	Thu, 26 Nov 2026 10:49:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWX33-0000000CmJC-3fnL
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 10:49:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09325C2B9C7;
	Thu, 26 Nov 2026 10:50:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B248B60237;
	Thu, 26 Nov 2026 10:49:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2B0411E6B2E5;
	Thu, 26 Nov 2026 11:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795690186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n2gJ4sD41uTH00NZ3mpn1mrUv9pUW3hdigzbmKMQ4mo=;
	b=mrHh6gNruUe/EEnCdTwpBn9QYJSujVkcRgIAM+O6i3EJ+3Xp2JOKEme4BtCN4SgCu6f9dV
	Ii56otDJ1+Eu5X0uxUtAQuwRhL8+/MOCs9sBaij6DJfVa7bgN+DsVFN1lUwHR2fbs/7dIK
	Vp5zW/yuW8wi31CvuQ9X2F4j8ZEhB2j6t6FRTYEYmNSgXwTGb1RJzEht35VFaldjI0WjTR
	quY9aKRPLk4E09mwKvUxWTGHKJqk+MvALdUFHZd+FGKd+Ednb6O0olvG7CEkFXC8IMqB/S
	lQg4IN9tOu+RSFWkaypo7GiQh9BpRPCT8hoo6qfkCWxj7DIArFIQCQHB5kZX8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  filipp.dunsky@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND
 controller
In-Reply-To: <20261123-b4-cs7542-nand-v2-1-9d9f08608534@gmail.com> (Fil Dunsky
	via's message of "Mon, 23 Nov 2026 23:27:06 +0300")
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
	<20261123-b4-cs7542-nand-v2-1-9d9f08608534@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 11:49:41 +0100
Message-ID: <87pkvryiii.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_024954_531143_565F708F 
X-CRM114-Status: GOOD (  17.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjMvMTEvMjAyNiBhdCAyMzoyNzowNiArMDMsIEZpbCBEdW5za3kgdmlhIEI0IFJlbGF5IDxk
ZXZudWxsK2ZpbGlwcC5kdW5za3kuZ21haWwuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9t
OiBGaWwgRHVuc2t5IDxmaWxpcHAuZHVuc2t5QGdtYWlsLmNvbT4KPgo+IERlc2NyaWJlIHRoZSBm
bGFzaCByZWdpc3RlciBiYW5rIGFuZCB0aGUgc2luZ2xlIDgtYml0IE5BTkQgdGFyZ2V0IHVzZWQK
PiBvbiBDUzc1NDIuIFNwZWNpZnkgdGhlIFJPTS1jb21wYXRpYmxlIEhhbW1pbmcgRUNDIGNvbmZp
Z3VyYXRpb24gYW5kCj4gYWxsb3cgc3RhbmRhcmQgTkFORCBwYXJ0aXRpb24gZGVzY3JpcHRpb25z
LiBGaXJtd2FyZSBzdXBwbGllcyB0aGUgYnVzCj4gdGltaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTog
RmlsIER1bnNreSA8ZmlsaXBwLmR1bnNreUBnbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5n
cy9tdGQvY29ydGluYSxjczc1NDItbmFuZC55YW1sICAgICAgICAgIHwgNjYgKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY29ydGluYSxjczc1
NDItbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jb3J0
aW5hLGNzNzU0Mi1uYW5kLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMC4uYzlhYjlkNGQ5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvY29ydGluYSxjczc1NDItbmFuZC55YW1sCj4gQEAgLTAsMCAr
MSw2NiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL210ZC9jb3J0aW5hLGNzNzU0Mi1uYW5kLnlhbWwjCj4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6
IENvcnRpbmEgU3lzdGVtcyBDUzc1NDIgTkFORCBjb250cm9sbGVyCj4gKwo+ICttYWludGFpbmVy
czoKPiArICAtIEZpbCBEdW5za3kgPGZpbGlwcC5kdW5za3lAZ21haWwuY29tPgo+ICsKPiArZGVz
Y3JpcHRpb246Cj4gKyAgVGhlIGZsYXNoIGNvbnRyb2xsZXIgc3VwcG9ydHMgcHJvZ3JhbW1lZCBJ
L08gdHJhbnNmZXJzIGFuZCBhIGhhcmR3YXJlCj4gKyAgSGFtbWluZyBFQ0MgZW5naW5lLiBGaXJt
d2FyZSBpbml0aWFsaXplcyB0aGUgTkFORCBidXMgdGltaW5nLgo+ICsKPiArYWxsT2Y6Cj4gKyAg
LSAkcmVmOiBuYW5kLWNvbnRyb2xsZXIueWFtbCMKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29t
cGF0aWJsZToKPiArICAgIGNvbnN0OiBjb3J0aW5hLGNzNzU0Mi1uYW5kCj4gKwo+ICsgIHJlZzoK
PiArICAgIG1heEl0ZW1zOiAxCgpObyBjbG9jaywgaW50ZXJydXB0LCBkbWEsIHJlc2V0Li4uIG5v
dGhpbmc/Cgo+ICsKPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gKyAgIl5uYW5kQFswLTlhLWZdJCI6
Cj4gKyAgICB0eXBlOiBvYmplY3QKPiArICAgICRyZWY6IHJhdy1uYW5kLWNoaXAueWFtbCMKPiAr
ICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgIHJlZzoKPiArICAgICAgICBjb25zdDogMAoKRG9lcyB0
aGUgY29udHJvbGxlciByZWFsbHkgc3VwcG9ydHMgYSBzaW5nbGUgQ1M/CgpJIGFtIG5vdCB0YWxr
aW5nIGFib3V0IHRoZSBkcml2ZXIuCgo+ICsgICAgICBuYW5kLWJ1cy13aWR0aDoKPiArICAgICAg
ICBjb25zdDogOAoKQWxyZWFkeSBkZWZhdWx0cyB0byA4LCBtb3N0IG9mIHRoZSB0aW1lIHdlIGp1
c3QgZG9uJ3QgZGVmaW5lIGl0CmZ1cnRoZXIuIEkgZG9uJ3Qga25vdyB3aGF0IGlzIGJlc3QgaGVy
ZS4KCj4gKyAgICAgIG5hbmQtZWNjLW1vZGU6Cj4gKyAgICAgICAgY29uc3Q6IGh3Cj4gKyAgICAg
IG5hbmQtZWNjLWFsZ286Cj4gKyAgICAgICAgY29uc3Q6IGhhbW1pbmcKPiArICAgICAgbmFuZC1l
Y2Mtc3RlcC1zaXplOgo+ICsgICAgICAgIGNvbnN0OiAyNTYKPiArICAgICAgbmFuZC1lY2Mtc3Ry
ZW5ndGg6Cj4gKyAgICAgICAgY29uc3Q6IDEKClRoaXMgaXMgbm90IGEgbGltaXRhdGlvbiBvZiB5
b3VyIGNvbnRyb2xsZXIgYW5kIHRoZXNlIHByb3BlcnRpZXMgYXJlCm9ubHkgcmVsZXZhbnQgaWYg
eW91IHdhbnQgdG8gb3ZlcndyaXRlIHdoYXQgdGhlIE5BTkQgcmVxdWVzdGVkLiBZb3UgbWF5Cmhh
dmUgc29mdHdhcmUgRUNDIGVuZ2luZSBzdXBwb3J0LiBBbHNvLCBhIHN0ZXAgc2l6ZSBvZiAyNTYg
dG9kYXkgaXMKcXVpdGUgdW5jb21tb24sIGFyZSB5b3Ugc3VyZT8KCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
