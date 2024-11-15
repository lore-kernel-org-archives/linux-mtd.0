Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B6D637DB
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0TJrv3/bTCr5PZJRId2UvVpp1U60p+IgcOBM40AafLU=; b=UEEAeSm9lBHpNu
	w/p4dtpLjq4305UqjEfmrR3+6ocdC7c2VugVzjQcz8/iXJ1cZsQZ+EdGM9Ws06Woi1dpyLzRjR5tW
	pYYqV2W6ayNrCHhgthfGXglIQY2kCFeKhhU55qO8jLTIcYUZXOuUd9n+VcZfuxonUi2fkDqajVYGm
	FsPf6PAhAwBvKGbSNkcW9Q+KPtF8/DKFsTWPzMYtHHJmG0P8GTxxF5TLXeofYef8A09ewJFvLN5MU
	+/kyzHBG/HW525ceA01WsAxKxXN/wgFsTI286fQyOylGWUZCUaExfQ1Lwh0L74IVO1qiI2lnXrBHN
	6eyRrJTVLNNhlCbCydRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLV-00000002nZT-2vQH;
	Fri, 15 Nov 2024 13:26:45 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLP-00000002nRz-1Q42
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 13:26:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 20F1120005;
	Fri, 15 Nov 2024 13:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731677194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vya+/aulsxN6jrI3L2J+A9p7VNvahxNnPqnUJh8M+QA=;
	b=JgousXi0G4U3C5TFxZ+KYuxpxNpzFcSiZnC7fLoVmxhH0yTC/1my3Tf3GNvO9IlRU0sf5L
	Tq/6FMFlAteqYnbKg2xsdkEt1ntByjsPJicOHYqvUPLqaJyGDsHcsHpmtd+max8rzmpib0
	hLRFUjYP25bhJFk14hlehY9k9kWaciJiTJpIpEpn+RQhSgfHhP5oh/pX0qxHiving3FXvO
	6L0Tx/2fEGcHwF1O05UjgcuVwBVy4hq4w5zQsYvYitxNRUN+vy4mFnPcDD/w6H1zqNq7V7
	CRNxfN8+/PAE0vGmUuTZQs1aXfdcXBpFesX0PeRCJkQFDNA6IQaerBm5j/DmhQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v4 00/10] Implement setup_interface() in the DaVinci NAND controller
Date: Fri, 15 Nov 2024 14:26:21 +0100
Message-ID: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052639_716037_05B8CA35 
X-CRM114-Status: GOOD (  14.57  )
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

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBpbXBsZW1lbnQgdGhlIHNldHVwX2lu
dGVyZmFjZSgpIG9wZXJhdGlvbiBpbgp0aGUgRGFWaW5jaSBOQU5EIGNvbnRyb2xsZXIgdG8gZW5h
YmxlIHRoZSB1c2Ugb2YgYWxsIE9ORkkgbW9kZXMgYW5kCmltcHJvdmUgdGhlIE5BTkQgYWNjZXNz
IHNwZWVkLgoKUEFUQ0ggNiBkZXBlbmRzIG9uIFBBVENIIDEtMi0zLTQtNQpQQVRDSCAxMCBkZXBl
bmRzIG9uIFBBVENIIDYtOC05CgpUaGlzIE5BTkQgY29udHJvbGxlciBpcyBwcmVzZW50IGluIHRo
ZSBEYVZpbmNpIChPTUFQIEwxMzgpIGFuZCBLZXlzdG9uZTIKU29DcyBhbmQgZnVuY3Rpb25zIGFz
IGEgJ2NoaWxkJyBvZiB0aGUgQUVNSUYgY29udHJvbGxlci4gU28gaXRzIHRpbWluZ3MKYXJlIHNl
dCBieSB0aGUgQUVNSUYgY29udHJvbGxlciBpdHNlbGYgZnJvbSBkZXZpY2UtdHJlZSBwcm9wZXJ0
aWVzLgpJbXBsZW1lbnRpbmcgdGhlIHNldHVwX2ludGVyZmFjZSgpIGNhbGxiYWNrIGltcGxpZXMg
YmVpbmcgYWJsZSB0byB1cGRhdGUKZHluYW1pY2FsbHkgdGhlc2UgdGltaW5ncywgc28gdGhlIGZp
cnN0IHRocmVlIHBhdGNoZXMgb2YgdGhlIHNlcmllcyBtb2RpZnkKdGhlIEFFTUlGIGRyaXZlciB0
byBwcm92aWRlIGl0cyAnY2hpbGRyZW4nIGEgd2F5IHRvIG1vZGlmeSB0aGVpciBjaGlwCnNlbGVj
dCB0aW1pbmcgY29uZmlndXJhdGlvbi4KClRoZSByZW1haW5pbmcgcGF0Y2hlcyBpbXBsZW1lbnQg
dGhlIHNldHVwX2ludGVyZmFjZSgpIG9wZXJhdGlvbi4KVGhlIGNvbXB1dGF0aW9uIG9mIHRoZSBy
ZWdpc3RlcidzIGNvbnRlbnRzIGlzIGRpcmVjdGx5IGJhc2VkIG9uCsKnMjAuMy4yLjMgb2YgdGhl
IE9NQVAtTDEzOCBUUk0gWzFdCgpUaGlzIGhhcyBiZWVuIHRlc3RlZCBvbiB0d28gcGxhdGZvcm1z
IGJhc2VkIHVwb24gdGhlIERhVmluY2kgU29DLiBPbmUgaXMKaW50ZXJmYWNlZCB3aXRoIGEgTWFj
cm9uaXggTVgzMFVGNEcxOEFDIE5BTkQsIHRoZSBvdGhlciB3aXRoIGEgVG9zaGliYQpOQU5ELgoK
WzFdIDogaHR0cHM6Ly93d3cudGkuY29tL2xpdC91Zy9zcHJ1aDc3Yy9zcHJ1aDc3Yy5wZGYKCkNo
YW5nZSBsb2c6CiAqIHY0CiAgIFBBVENIIDEsMiwzIFtuZXddOgogICAgIC0gQ3JlYXRlIHRoZSBz
dHJ1Y3QgYWVtaWZfY3NfdGltaW5ncyBpbnNpZGUgdGhlIGFscmVhZHkgZXhpc3RpbmcKICAgICAg
IHN0cnVjdCBhZW1pZl9jc19kYXRhCiAqIHYzCiAgIFBBVENIIDEgW25ld106CiAgICAgLSBXcmFw
IHRoZSB2ZXJpZmljYXRpb24gb2YgQ1MgdGltaW5nIGNvbmZpZ3VyYXRpb24gaW50byBhIGZ1bmN0
aW9uCiAgIFBBVENIIDI6CiAgICAgLSBGaXggY29tbWVudHMKICAgUEFUQ0ggMzoKICAgICAtIFJl
cGxhY2UgdGhlIHNwaW4tbG9jayB3aXRoIGEgbXV0ZXgKICAgUEFUQ0ggNzoKICAgICAtIEFkZCBo
YW5kbGluZyBvZiB0aGUgTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkgY2FzZQogICAgIC0gc2V0
dXBfaW50ZXJmYWNlKCkgcmV0dXJucyBlcnJubyBvbiBmYWlsdXJlcwoKICogdjIKICAgQ292ZXIg
bGV0dGVyIDoKICAgICAtIEFkZCBkZXBlbmRlbmN5IGRldGFpbHMKICAgICAtIFJlbW92ZSB0aGUg
cXVlc3Rpb24gYWJvdXQgdGktYWVtaWYuaCBsb2NhdGlvbgogICBQQVRDSCAxIDoKICAgICAtIEZp
eCBhZW1pZl9jc190aW1pbmdzJ3MgZGVzY3JpcHRpb24gaW4gdGhlIGNvbW1lbnRzCiAgIFBBVENI
IDIgOgogICAgIC0gRml4IHR5cG8gaW4gdGhlIGNvbmZpZ19jc19sb2NrJ3MgZGVzY3JpcHRpb24g
aW4gdGhlIGNvbW1lbnRzCiAgICAgLSBNb3ZlIGluY2x1ZGUvbWVtb3J5L3RpLWFlbWlmLmggdG8g
aW5jbHVkZS9saW51eC9tZW1vcnkvdGktYWVtaWYuaAogICBQQVRDSCAzIFtORVddIDoKICAgICAt
IEZpeCBkZXBlbmRlbmN5IGlzc3VlIHdpdGggYWVtaWYgY29udHJvbGxlciBpbiBLY29uZmlnCiAg
IFBBVENIIDUgOgogICAgIC0gQWRkIGRldGFpbHMgYWJvdXQgdGhlIGNsb2NrIGJpbmRpbmdzIGlu
IHRoZSBjb21taXQgbG9nCiAgICAgLSBSZXBsYWNlIGRldm1fY2xrX2dldCgpIHdpdGggZGV2bV9j
bGtfZ2V0X2VuYWJsZWQoKQogICAgIC0gVXNlIGRldl9lcnJfcHJvYmUoKSB0byByZXR1cm4gdGhl
IGRldm1fY2xrX2dldF9lbmFibGVkKCkgZXJyb3IKClt2MV0gOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNDEwMzAxMDQ3MTcuODg2ODgtMS1iYXN0aWVuLmN1cnV0Y2hldEBib290bGlu
LmNvbS8KW3YyXSA6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTEwNjA4NTUwNy43
NjQyNS0xLWJhc3RpZW4uY3VydXRjaGV0QGJvb3RsaW4uY29tLwpbdjNdIDogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjQxMTEzMDk0OTM4LjQ0ODE3LTEtYmFzdGllbi5jdXJ1dGNoZXRA
Ym9vdGxpbi5jb20vCgpCYXN0aWVuIEN1cnV0Y2hldCAoMTApOgogIG1lbW9yeTogdGktYWVtaWY6
IFN0b3JlIHRpbWluZ3MgcGFyYW1ldGVyIGluIG51bWJlciBvZiBjeWNsZXMgLSAxCiAgbWVtb3J5
OiB0aS1hZW1pZjogUmVtb3ZlIHVubmVjZXNzYXJ5IGxvY2FsIHZhcmlhYmxlcwogIG1lbW9yeTog
dGktYWVtaWY6IFdyYXAgQ1MgdGltaW5ncyBpbnRvIGEgc3RydWN0CiAgbWVtb3J5OiB0aS1hZW1p
ZjogQ3JlYXRlIGFlbWlmX2NoZWNrX2NzX3RpbWluZ3MoKQogIG1lbW9yeTogdGktYWVtaWY6IENy
ZWF0ZSBhZW1pZl9zZXRfY3NfdGltaW5ncygpCiAgbWVtb3J5OiB0aS1hZW1pZjogRXhwb3J0IGFl
bWlmXypfY3NfdGltaW5ncygpCiAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiBBbHdheXMgZGVwZW5k
cyBvbiBUSV9BRU1JRgogIG10ZDogcmF3bmFuZDogZGF2aW5jaTogT3JkZXIgaGVhZGVycyBhbHBo
YWJldGljYWxseQogIG10ZDogcmF3bmFuZDogZGF2aW5jaTogQWRkIGNsb2NrIHJlc291cmNlCiAg
bXRkOiByYXduYW5kOiBkYXZpbmNpOiBJbXBsZW1lbnQgc2V0dXBfaW50ZXJmYWNlKCkgb3BlcmF0
aW9uCgogZHJpdmVycy9tZW1vcnkvdGktYWVtaWYuYyAgICAgICAgICAgfCAxODcgKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAg
fCAgIDQgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RhdmluY2lfbmFuZC5jIHwgIDk0ICsrKysr
KysrKysrKystCiBpbmNsdWRlL2xpbnV4L21lbW9yeS90aS1hZW1pZi5oICAgICB8ICAzMiArKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCAyMzcgaW5zZXJ0aW9ucygrKSwgODAgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZW1vcnkvdGktYWVtaWYuaAoKLS0gCjIu
NDcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
