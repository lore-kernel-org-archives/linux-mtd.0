Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08394C3E8C5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 18:38:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9705A21534
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 18:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WRhGE176"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9705A21534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lHABUESAQWojSEBC5uAuEMPK5HVNomwppu7tGCULyPM=; b=WRhGE176evWGVHjs3CQ5pV8ygk
	tjswFs+5YFYpLu1T+c9Efwgj/Y67+rIUcZYn+eO/3pgmflOUpNdzVcu8pUtl/310w/aHHUr1R3cs6
	qwyLIWkQIUYC430M/INzl5a+/wYKUmK09hTV6ywW+e5z92tbe8b9DU/B+Gfcce2j3hBDG0k/i/+lw
	jS7SK5BmHeOuoATo9kjTkwe/XmYPKwn7pwW/918tXL1VJSf9EFZXztf3KpCTHDmTyCNsv8xRoiZqo
	a4ly8eEgpBHNIcEtRd6aixiKiDMaNTGJX9oyXWt8KAXftlhl7GLMxe3gittz4c94YKZ1VQNlTGYSr
	uv01gY3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiidK-0000TI-3C; Fri, 27 Nov 2020 18:38:14 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiidG-0000Sx-NR
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 18:38:12 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 15E961BF206;
 Fri, 27 Nov 2020 18:38:04 +0000 (UTC)
Date: Fri, 27 Nov 2020 19:38:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for v5.10-rc6
Message-ID: <20201127193803.324e1f83@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_133811_018588_93AA3C8E 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgdGhlIG5leHQgLXJjLgoK
VGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGY4Mzk0
ZjIzMmIxZWFiNjQ5Y2UyZGY1YzVmMTViMGU1MjhjOTIwOTE6CgogIExpbnV4IDUuMTAtcmMzICgy
MDIwLTExLTA4IDE2OjEwOjE2IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci01LjEwLXJjNgoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIGIzNmJmMGEwZmU1ZDE4NTYxZGQ5OGViNzc0ZWY2MWRkMzk2ZWRj
NDI6CgogIG10ZDogcmF3bmFuZDogc29jcmF0ZXM6IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlv
biB0byAtPmF0dGFjaF9jaGlwKCkgKDIwMjAtMTEtMjAgMTI6MzE6MjYgKzAxMDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ClJhdyBOQU5EIGNoYW5nZXM6CiogQmVjYXVzZSBvZiBhIHJlY2VudCBjaGFuZ2UgaW4gdGhlIGNv
cmUsIE5BTkQgY29udHJvbGxlciBkcml2ZXJzCiAgaW5pdGlhbGl6aW5nIHRoZSBFQ0MgZW5naW5l
IHRvbyBlYXJseSBpbiB0aGUgcHJvYmUgcGF0aCBhcmUKICBicm9rZW4uIERyaXZlcnMgc2hvdWxk
IHdhaXQgZm9yIHRoZSBOQU5EIGRldmljZSB0byBiZSBkaXNjb3ZlcmVkIGFuZAogIGl0cyBtZW1v
cnkgbGF5b3V0IGtub3duIGJlZm9yZSBkb2luZyBhbnkgRUNDIHJlbGF0ZWQgaW5pdGlhbGl6YXRp
b24sCiAgc28gaW5zdGVhZCBvZiByZXZlcnRpbmcgdGhlIGZhdWx0eSBjaGFuZ2Ugd2hpY2ggaXMg
YWN0dWFsbHkgbW92aW5nCiAgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiwgbGV0J3MgZml4IHRoZSBk
cml2ZXJzIGRpcmVjdGx5OiBzb2NyYXRlcywKICBzaGFycHNsLCByODUyLCBwbGF0X25hbmQsIHBh
c2VtaSwgdG1pbywgdHh4OW5kZm1jLCBvcmlvbiwgbXBjNTEyMSwKICBscGMzMnh4X3NsYywgbHBj
MzJ4eF9tbGMsIGZzbWMsIGRpc2tvbmNoaXAsIGRhdmluY2ksIGNzNTUzeCwgYXUxNTUwLAogIGFt
cy1kZWx0YSwgeHdheSBhbmQgZ3Bpby4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWlxdWVsIFJheW5hbCAoMTkpOgogICAg
ICBtdGQ6IHJhd25hbmQ6IGdwaW86IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAtPmF0
dGFjaF9jaGlwKCkKICAgICAgbXRkOiByYXduYW5kOiB4d2F5OiBNb3ZlIHRoZSBFQ0MgaW5pdGlh
bGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpCiAgICAgIG10ZDogcmF3bmFuZDogYW1zLWRlbHRh
OiBNb3ZlIHRoZSBFQ0MgaW5pdGlhbGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpCiAgICAgIG10
ZDogcmF3bmFuZDogYXUxNTUwOiBNb3ZlIHRoZSBFQ0MgaW5pdGlhbGl6YXRpb24gdG8gLT5hdHRh
Y2hfY2hpcCgpCiAgICAgIG10ZDogcmF3bmFuZDogY3M1NTN4OiBNb3ZlIHRoZSBFQ0MgaW5pdGlh
bGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpCiAgICAgIG10ZDogcmF3bmFuZDogZGF2aW5jaTog
TW92ZSB0aGUgRUNDIGluaXRpYWxpemF0aW9uIHRvIC0+YXR0YWNoX2NoaXAoKQogICAgICBtdGQ6
IHJhd25hbmQ6IGRpc2tvbmNoaXA6IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAtPmF0
dGFjaF9jaGlwKCkKICAgICAgbXRkOiByYXduYW5kOiBmc21jOiBNb3ZlIHRoZSBFQ0MgaW5pdGlh
bGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpCiAgICAgIG10ZDogcmF3bmFuZDogbHBjMzJ4eF9t
bGM6IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAtPmF0dGFjaF9jaGlwKCkKICAgICAg
bXRkOiByYXduYW5kOiBscGMzMnh4X3NsYzogTW92ZSB0aGUgRUNDIGluaXRpYWxpemF0aW9uIHRv
IC0+YXR0YWNoX2NoaXAoKQogICAgICBtdGQ6IHJhd25hbmQ6IG1wYzUxMjE6IE1vdmUgdGhlIEVD
QyBpbml0aWFsaXphdGlvbiB0byAtPmF0dGFjaF9jaGlwKCkKICAgICAgbXRkOiByYXduYW5kOiBv
cmlvbjogTW92ZSB0aGUgRUNDIGluaXRpYWxpemF0aW9uIHRvIC0+YXR0YWNoX2NoaXAoKQogICAg
ICBtdGQ6IHJhd25hbmQ6IHR4eDluZGZtYzogTW92ZSB0aGUgRUNDIGluaXRpYWxpemF0aW9uIHRv
IC0+YXR0YWNoX2NoaXAoKQogICAgICBtdGQ6IHJhd25hbmQ6IHRtaW86IE1vdmUgdGhlIEVDQyBp
bml0aWFsaXphdGlvbiB0byAtPmF0dGFjaF9jaGlwKCkKICAgICAgbXRkOiByYXduYW5kOiBwYXNl
bWk6IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAtPmF0dGFjaF9jaGlwKCkKICAgICAg
bXRkOiByYXduYW5kOiBwbGF0X25hbmQ6IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAt
PmF0dGFjaF9jaGlwKCkKICAgICAgbXRkOiByYXduYW5kOiByODUyOiBNb3ZlIHRoZSBFQ0MgaW5p
dGlhbGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpCiAgICAgIG10ZDogcmF3bmFuZDogc2hhcnBz
bDogTW92ZSB0aGUgRUNDIGluaXRpYWxpemF0aW9uIHRvIC0+YXR0YWNoX2NoaXAoKQogICAgICBt
dGQ6IHJhd25hbmQ6IHNvY3JhdGVzOiBNb3ZlIHRoZSBFQ0MgaW5pdGlhbGl6YXRpb24gdG8gLT5h
dHRhY2hfY2hpcCgpCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYW1zLWRlbHRhLmMgICAgIHwgMTIg
KysrKysrKysrLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jICAgICAgfCAxMSAr
KysrKysrKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvY3M1NTN4X25hbmQuYyAgIHwgMjQgKysr
KysrKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kYXZpbmNpX25hbmQu
YyAgfCAgOCArKysrLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hpcC5jICAgIHwg
MjkgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2Zz
bWNfbmFuZC5jICAgICB8IDMwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZ3Bpby5jICAgICAgICAgIHwgMTEgKysrKysrKysrLS0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2xwYzMyeHhfbWxjLmMgICB8IDIzICsrKysrKysrKysrKystLS0tLS0tLS0t
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jICAgfCAyNiArKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYyAgIHwgMTkg
KysrKysrKysrKysrKysrKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jICAg
IHwgMTkgKysrKysrKysrKysrKysrKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvcGFzZW1pX25h
bmQuYyAgIHwgMTkgKysrKysrKysrKysrKysrKystLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvcGxh
dF9uYW5kLmMgICAgIHwgMjAgKysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3I4NTIuYyAgICAgICAgICB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuaCAgICAgICAgICB8ICAxICsKIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3NoYXJwc2wuYyAgICAgICB8IDMyICsrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zb2NyYXRlc19uYW5kLmMgfCAy
MSArKysrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RtaW9fbmFuZC5j
ICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9tdGQv
bmFuZC9yYXcvdHh4OW5kZm1jLmMgICAgIHwgMTQgKysrKysrKysrLS0tLS0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3h3YXlfbmFuZC5jICAgICB8IDE4ICsrKysrKysrKysrKysrKystLQogMjAgZmls
ZXMgY2hhbmdlZCwgMjk0IGluc2VydGlvbnMoKyksIDExNiBkZWxldGlvbnMoLSkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
