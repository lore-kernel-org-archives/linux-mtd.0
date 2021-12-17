Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09988C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8poz8lzT9gCkZtnuVTqnLsPihRzTFOFg7HUVZtNoX0Q=; b=L90vijL9NO7In0
	qVLAx9nRkBQoe7xoyZ1Ubbx0WV2cYj2FaSwihkrbxFAE+m+rcZ0U7Za1O3IfFkXd5rz648P58ITbK
	GZxlY9ihG4VHSzsldlmnl9UEskOHRsBlCAFpe3HfhsQkoiUXOV83CE+jhuEWqCO5ggMMxhyo6AQDW
	Pz+mQFYOsI0a4NyeFGWtv+5f9LMUq1o4pWizuJPmT8B98O2Tpl4K31xOhDiLH/qYPrAZbl5vA83Vb
	BOMf4In0XsqYgPD8kzuW6XcHfZv16SbypxDE2mE0sZYIZsjtjWallOHlcb+9P0tlhVEYUyyhBKokd
	ySaE8Y5WNUU/1PS3zGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my98n-0094xJ-7I; Fri, 17 Dec 2021 09:03:01 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my98j-0094vP-IT
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 09:02:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4EF73FF817;
 Fri, 17 Dec 2021 09:02:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 0/4] Renesas RZ/N1 NAND controller support
Date: Fri, 17 Dec 2021 10:02:44 +0100
Message-Id: <20211217090248.259122-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_010257_814706_8FC790B4 
X-CRM114-Status: GOOD (  16.22  )
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

SGVsbG8sCgpIZXJlIGlzIGEgc2hvcnQgc2VyaWVzIGJyaW5naW5nIHN1cHBvcnQgZm9yIFJlbmVz
YXMgUlovTjEgTkFORApjb250cm9sbGVyLgoKVGhpcyB0aW1lIHRoZSBkcml2ZXIgaGFzIGJlZW4g
dGVzdGVkIHdpdGggYSBmdWxseS11cHN0cmVhbSBkZXZpY2UgdHJlZQpvbiB0b3Agb2YgYSB2NS4x
Ni1yYzQuIFRoZSBEVCB1c2VkIGlzIHZlcnkgY2xvc2UgdG8gdGhlIHI5YTA2ZzAzMi1kYi4KCkNo
ZWVycywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2NToKKiBBZGQgUm9iJ3MgYWNrIG9uIHRoZSBiaW5k
aW5ncy4KKiBEcm9wcGVkIHRoZSAjYWRkcmVzcy9zaXplLWNlbGxzIHByb3BlcnRpZXMgKGhhbmRs
ZWQgYnkgbmFuZC1jb250cm9sbGVyLnlhbWwpLgoqIEZpeGVkIGEgdHlwbyByZXBvcnRlZCBieSB0
aGUga2VybmVsIHRlc3Qgcm9ib3QgKHdoZW4gYnVpbGRpbmcgYXMgYSBtb2R1bGUpLgoKQ2hhbmdl
cyBpbiB2NDoKKiBTZXQgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzIHNldCB0byBmYWxzZSBpbiB0aGUg
YmluZGluZ3MuCiogQ2hhbmdlIHRoZSBjbG9jayBuYW1lcyBieSByZW1vdmluZyB0aGUgbmFuZF8g
cHJlZml4IHdoaWNoIGlzCiAgcmVkdW5kYW50LCBldmVuIHRob3VnaCB0aGUgY2xvY2tzIGFyZSBu
YW1lZCBsaWtlIHRoaXMgaW4gdGhlIHNwZWMuIFRoZQogIG5hbWUgcmVtYWlucyBjbGVhciBlbm91
Z2ggYW55d2F5LgoKQ2hhbmdlcyBpbiB2MzoKKiBSZWJhc2VkIG9uIHRvcCBvZiBhIGZ1bGx5LXVw
c3RyZWFtIHJlY2VudCBrZXJuZWwuCiogUmVuYW1lZCB0aGUgY2xvY2tzIGluIHRoZSBiaW5kaW5n
cyBhbmQgdGhlIGRyaXZlciB0byBtYXRjaCB0aGUKICBkb2N1bWVudGF0aW9uIChsb3dlci1jYXNl
ZCk6IG5hbmRfaGNsayAmIG5hbmRfZWNsay4KKiBBZGRlZCBhIG5ldyBjb21taXQgZGVzY3JpYmlu
ZyB0aGUgTkFORCBjb250cm9sbGVyIGluIHRoZSByOWEwNmcwMzIKICBEVFNJLgoqIEFkZGVkIHRo
ZSBSZXZpZXdlZC1ieSBhbmQgVGVzdGVkLWJ5IHRhZ3MgcmVjZWl2ZWQuCgpDaGFuZ2VzIGluIHYy
OgoqIEFkZGVkIHRoZSBmYW1pbHktc3BlY2lmaWMgcnpuMSBjb21wYXRpYmxlIGFzIHN1Z2dlc3Rl
ZCBieSBHZWVydC4KICBVcGRhdGVkIHRoZSBiaW5kaW5ncywgdGhlIGJpbmRpbmcgZmlsZSBuYW1l
LCB0aGUgY29tcGF0aWJsZSB1c2VkIGluCiAgdGhlIGRyaXZlciwgdGhlIE1BSU5UQUlORVJTIGVu
dHJ5LCBldGMuCiogQWRkZWQgYW4gQVJDSF9SRU5FU0FTIEtjb25maWcgZGVwZW5kZW5jeS4KKiBD
aGFuZ2VkIHRoZSB0eXBlICh0byB1bnNpZ25lZCkgb2YgYSBjb3VwbGUgb2YgdmFyaWFibGVzLgoq
IFJldHVybmVkIGVhcmxpZXIgd2hlbiBwb3NzaWJsZSB0byByZWR1Y2UgaW5kZW50YXRpb24uCiog
VXNlZCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgaW5zdGVhZCBvZiBwbGF0Zm9ybV9nZXRf
aXJxKCkgdG8gYXZvaWQKICBhIHVzZWxlc3Mgd2FybmluZy4KKiBIYW5kbGVkIHByb2JlIGRlZmVy
cmFsIGNvcnJlY3RseS4KKiBBcHBsaWVkIGEgbWFzc2l2ZSBzL25mYy9uYW5kYy8gYXMgc3VnZ2Vz
dGVkIGJ5IEdlZXJ0IHRvIGF2b2lkCiAgY29uZnVzaW9ucyB3aXRoIHRoZSBuZWFyLWZpZWxkLWNv
bW11bmljYXRpb24gZGV2aWNlLgoqIE1lbnRpb25lZCBFdmF0cm9uaXggYXMgb3JpZ2luYWwgYXV0
aG9ycyBvZiB0aGUgSVAgaW4gdGhlIGNvbW1pdCBsb2cgYW5kCiAgaW4gdGhlIGhlYWRlci4KKiBB
ZGRlZCBhbiBhZGRpdGlvbmFsIGNoZWNrIG9uIHRoZSB2YWxpZGl0eSBvZiB0aGUgY2hpbGQgbm9k
ZXMgcmVnIHByb3BlcnR5LgoqIEEgY291cGxlIG9mIHN0eWxlIGZpeGVzLgoKTWlxdWVsIFJheW5h
bCAoNCk6CiAgZHQtYmluZGluZ3M6IG10ZDogcnpuMTogRGVzY3JpYmUgUmVuZXNhcyBSWi9OMSBO
QU5EIGNvbnRyb2xsZXIKICBtdGQ6IHJhd25hbmQ6IHJ6bjE6IEFkZCBuZXcgTkFORCBjb250cm9s
bGVyIGRyaXZlcgogIE1BSU5UQUlORVJTOiBBZGQgYW4gZW50cnkgZm9yIFJlbmVzYXMgUlovTjEg
TkFORCBjb250cm9sbGVyCiAgQVJNOiBkdHM6IHI5YTA2ZzAzMjogRGVzY3JpYmUgTkFORCBjb250
cm9sbGVyCgogLi4uL210ZC9yZW5lc2FzLHJ6bjEtbmFuZC1jb250cm9sbGVyLnlhbWwgICAgIHwg
ICA2MSArCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICA3ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAzMi5kdHNpICAgICAgICAgICAgICB8ICAg
MTIgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAg
NiArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgICAx
ICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L3J6bjEtbmFuZC1jb250cm9sbGVyLmMgICB8IDE0MjIg
KysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgMTUwOSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9y
ZW5lc2FzLHJ6bjEtbmFuZC1jb250cm9sbGVyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9yem4xLW5hbmQtY29udHJvbGxlci5jCgotLSAKMi4yNy4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
