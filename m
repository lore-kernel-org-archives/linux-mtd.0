Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79855CCA464
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acExF0PIDoMqt55m6ubaU/szTxE27cIbOeixxHCKKE8=; b=tjmOUZrlVx6XTz
	LLsX4lbjJNqpUWPYZECTK2QHICS55GOwvMXLKIWlA1XmETz943pxWc56MposR7s50yuJhDB1E/VGD
	i0jjtRq8Ysx0twlpYk7cOvvJt7FSTzzPzlAGPtr+kaRQ2u1kqXeWXR5BkuVExUs0raMUiC17qvPm/
	ImZrquM7OtrOPlm3UBSF+MvNQmy4CI5pmh1ISlJ/NPmjHKD1+sSHZHL7HWohP4Sh4HSCxKLg8GLiN
	40AIMhdkpzmUFHIGV0rH1FPu+bXz+sHNGQwpG3zG7DZ6JvW9/+/+cmqzaj3VPBqX4pWUABnXExHHu
	TzAYg++LjNswVs/F4YtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfLq-00000002flT-0WqC;
	Fri, 16 Oct 2026 10:39:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfLo-00000002fjQ-1dMO
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 10:39:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEEB1439ED;
	Fri, 16 Oct 2026 10:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF261F000C4;
	Fri, 16 Oct 2026 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792147187;
	bh=1zDWfx3/qT7inXKrDL/dj6g+9A/hBWZepBY65K3FFIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D7927W+fTiYlqY5W0qi+6R7HIRfaUkpwakPhBrZohZsJNF5rHA1ch+Sls7+8blPtG
	 dJhn0pFJ1jKeznf+WJ0+Mm+PrL7xyxzISLKb8dopzl9PP4kIpe+Q4zCnSgTKKUNho2
	 WwVogwLIQ1QDPZ/TyOBJ+FWHSDLxU0/MrnUsE7522cxnztoAjLAWArvVDtG8Kcb78z
	 m/e9569Ju2aLv27ssy7yAZB/kqGUdCXK9K+eR/t6ifx4FEQpnh3IDG2Ert/4w3jawO
	 6aoMzWufxz7CkHyvPaVNK97LeS5FVQsD35nr6VZHKUtXZPbxTW9Pgcta/Cb0rP4AAb
	 cQCxbNMDAZ8zw==
Message-ID: <sashiko-outbox-174189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] spi: dt-bindings: cadence: Make XSPI's IRQ line
 optional
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261016102917.171095-8-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
 <20261016102917.171095-8-paul.cercueil@bootlin.com>
Date: Fri, 16 Oct 2026 10:39:46 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogY2FkZW5jZS14
c3BpOiBwb2xsaW5nIG1vZGUgc2lsZW50bHkgaWdub3JlcyBTRE1BIGVycm9ycwotLQoKY29tbWl0
IDQ1N2Y2NDg5N2M1M2Y3ZTk5ZDRmYTczOTJkYmJlYzYzMjkxYTlhOTcKQXV0aG9yOiBUYW5tYXkg
SmFnZGFsZSA8dGFubWF5QG1hcnZlbGwuY29tPgoKc3BpOiBkdC1iaW5kaW5nczogY2FkZW5jZTog
TWFrZSBYU1BJJ3MgSVJRIGxpbmUgb3B0aW9uYWwKClRoaXMgY29tbWl0IG1vZGlmaWVzIHRoZSBD
YWRlbmNlIFhTUEkgZGV2aWNlIHRyZWUgYmluZGluZ3MgdG8gbWFrZSB0aGUKaW50ZXJydXB0cyBw
cm9wZXJ0eSBvcHRpb25hbC4gSXQgaW5kaWNhdGVzIHRoYXQgdGhlIHNwaS1jYWRlbmNlLXhzcGkK
ZHJpdmVyIGZ1bmN0aW9ucyBpbiBwb2xsaW5nIG1vZGUgd2hlbiBhbiBJUlEgaXMgbm90IHByb3Zp
ZGVkLgoKPiBzcGk6IGR0LWJpbmRpbmdzOiBjYWRlbmNlOiBNYWtlIFhTUEkncyBJUlEgbGluZSBv
cHRpb25hbAo+ICAgICAKPiBUaGUgc3BpLWNhZGVuY2UteHNwaSBkcml2ZXIgd2lsbCBoYXBwaWx5
IHdvcmsgd2l0aG91dCBhbiBJUlEgbGluZQo+IHJlZ2lzdGVyZWQsIHdoaWNoIG1lYW5zIHRoYXQg
dGhpcyBJUlEgbGluZSBpcyBvcHRpb25hbC4KCltTZXZlcml0eTogSGlnaF0KRG9lcyB0aGUgZHJp
dmVyIGFjdHVhbGx5IHdvcmsgY29ycmVjdGx5IHdpdGhvdXQgYW4gSVJRIGxpbmU/CgpMb29raW5n
IGF0IGNkbnNfeHNwaV9pc19zZG1hX3JlYWR5KCkgaW4gZHJpdmVycy9zcGkvc3BpLWNhZGVuY2Ut
eHNwaS5jLAp0aGUgcG9sbGluZyBsb29wIGNoZWNrcyBmb3IgdGhlIHRyaWdnZXIgYml0IGJ1dCBm
YWlscyB0byBjaGVjayBvciBjbGVhciB0aGUKU0RNQSBlcnJvciBiaXQ6Cgpkcml2ZXJzL3NwaS9z
cGktY2FkZW5jZS14c3BpLmM6Y2Ruc194c3BpX2lzX3NkbWFfcmVhZHkoKSB7Ci4uLgoJaWYgKGNk
bnNfcmVhZGxfcG9sbChjZG5zX3hzcGktPmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NUQVRVU19S
RUcsCgkJCSAgICBjdHJsX3N0YXQsIChjdHJsX3N0YXQgJiBDRE5TX1hTUElfU0RNQV9UUklHR0VS
KSwKCQkJICAgIE1SVkxfWFNQSV9QT0xMX0RFTEFZX1VTLCBNUlZMX1hTUElfUE9MTF9USU1FT1VU
X1VTLAoJCQkgICAgc2xlZXApKSB7CgkJcmV0dXJuIGZhbHNlOwoJfQouLi4KfQoKSWYgYSBoYXJk
d2FyZSBTRE1BIHRyYW5zYWN0aW9uIGVycm9yIG9jY3VycyB3aGlsZSB0aGUgZGV2aWNlIGlzIGlu
IHBvbGxpbmcKbW9kZSwgdGhlIGVycm9yIGlzIGlnbm9yZWQuIFRoaXMgY291bGQgY2F1c2UgdGhl
IGRyaXZlciB0byBibGluZGx5IHByb2NlZWQKb3IgdW5uZWNlc3NhcmlseSB0aW1lIG91dCwgcG90
ZW50aWFsbHkgcmVzdWx0aW5nIGluIHNpbGVudCBkYXRhIGNvcnJ1cHRpb24KZHVyaW5nIGZsYXNo
IEkvTy4KClNob3VsZCB0aGUgcG9sbGluZyBsb2dpYyBoYW5kbGUgQ0ROU19YU1BJX1NETUFfRVJS
T1IgYmVmb3JlIG1ha2luZyB0aGUKaW50ZXJydXB0cyBwcm9wZXJ0eSBvcHRpb25hbD8KCj4gICAg
IAo+IFNpZ25lZC1vZmYtYnk6IFRhbm1heSBKYWdkYWxlIDx0YW5tYXlAbWFydmVsbC5jb20+Cj4g
Q28tZGV2ZWxvcGVkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsLmNlcmN1ZWlsQGJvb3RsaW4uY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWwuY2VyY3VlaWxAYm9vdGxpbi5j
b20+Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cGkvY2Rucyx4c3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Bp
L2NkbnMseHNwaS55YW1sCj4gaW5kZXggMzhhNTc5NTU4OWRlMi4uZGQ4ZDAzYzA3ZTY4OCAxMDA2
NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2NkbnMseHNw
aS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9jZG5z
LHhzcGkueWFtbAo+IEBAIC00Myw3ICs0Myw2IEBAIHByb3BlcnRpZXM6Cj4gIHJlcXVpcmVkOgo+
ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gLSAgLSBpbnRlcnJ1cHRzCj4gIAo+ICBhbGxP
ZjoKPiAgICAtICRyZWY6IHNwaS1jb250cm9sbGVyLnlhbWwjCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDE2MTAyOTE3LjE3MTA5
NS0xLXBhdWwuY2VyY3VlaWxAYm9vdGxpbi5jb20/cGFydD03CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
