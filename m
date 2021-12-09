Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAA6C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lkfq5Ojs6YSC+Hoaz7FQI4QuXsDOqslYbJV9mKH7AE8=; b=QH44r2wiay12I8
	+7BtzIM3Z/v9YbcwZevItFwnp/969D65Xpoo4ije/iH76yvDaX9iQHV7XGwCusiuW/JNQItyKebXJ
	HnORty4YntBx80UoTNPgIzlaOQZbipYMDTJI71u6a5HsHT3RGDGGU41yQsi6MH57X/0Mk3ql3idqx
	RXmXDkYIeCycN5XsBpoJRj2F7pAHoUdVvu2oSfiIP9UpW1FudOppI+mXosAcEVwWWhsJQ4IIxxKsB
	zlXMEU1v+Q7Sg6WUGZgsw9gN/rzhzhb7jeHbCSmDO10IXfjvWYqPsi7wRHKhyLTRZsUg8iTIsRONy
	FNErgUu0meV/2Rl4iULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKTp-00GLNH-Uw; Thu, 09 Dec 2021 14:33:06 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKTL-00GLDP-0e; Thu, 09 Dec 2021 14:32:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9FCF620000C;
 Thu,  9 Dec 2021 14:32:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/4] Renesas RZ/N1 NAND controller support
Date: Thu,  9 Dec 2021 15:32:24 +0100
Message-Id: <20211209143228.525234-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_063235_224285_E0C329E5 
X-CRM114-Status: GOOD (  13.71  )
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
ZWVycywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2MzoKKiBSZWJhc2VkIG9uIHRvcCBvZiBhIGZ1bGx5
LXVwc3RyZWFtIHJlY2VudCBrZXJuZWwuCiogUmVuYW1lZCB0aGUgY2xvY2tzIGluIHRoZSBiaW5k
aW5ncyBhbmQgdGhlIGRyaXZlciB0byBtYXRjaCB0aGUKICBkb2N1bWVudGF0aW9uIChsb3dlci1j
YXNlZCk6IG5hbmRfaGNsayAmIG5hbmRfZWNsay4KKiBBZGRlZCBhIG5ldyBjb21taXQgZGVzY3Jp
YmluZyB0aGUgTkFORCBjb250cm9sbGVyIGluIHRoZSByOWEwNmcwMzIKICBEVFNJLgoqIEFkZGVk
IHRoZSBSZXZpZXdlZC1ieSBhbmQgVGVzdGVkLWJ5IHRhZ3MgcmVjZWl2ZWQuCgpDaGFuZ2VzIGlu
IHYyOgoqIEFkZGVkIHRoZSBmYW1pbHktc3BlY2lmaWMgcnpuMSBjb21wYXRpYmxlIGFzIHN1Z2dl
c3RlZCBieSBHZWVydC4KICBVcGRhdGVkIHRoZSBiaW5kaW5ncywgdGhlIGJpbmRpbmcgZmlsZSBu
YW1lLCB0aGUgY29tcGF0aWJsZSB1c2VkIGluCiAgdGhlIGRyaXZlciwgdGhlIE1BSU5UQUlORVJT
IGVudHJ5LCBldGMuCiogQWRkZWQgYW4gQVJDSF9SRU5FU0FTIEtjb25maWcgZGVwZW5kZW5jeS4K
KiBDaGFuZ2VkIHRoZSB0eXBlICh0byB1bnNpZ25lZCkgb2YgYSBjb3VwbGUgb2YgdmFyaWFibGVz
LgoqIFJldHVybmVkIGVhcmxpZXIgd2hlbiBwb3NzaWJsZSB0byByZWR1Y2UgaW5kZW50YXRpb24u
CiogVXNlZCBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgaW5zdGVhZCBvZiBwbGF0Zm9ybV9n
ZXRfaXJxKCkgdG8gYXZvaWQKICBhIHVzZWxlc3Mgd2FybmluZy4KKiBIYW5kbGVkIHByb2JlIGRl
ZmVycmFsIGNvcnJlY3RseS4KKiBBcHBsaWVkIGEgbWFzc2l2ZSBzL25mYy9uYW5kYy8gYXMgc3Vn
Z2VzdGVkIGJ5IEdlZXJ0IHRvIGF2b2lkCiAgY29uZnVzaW9ucyB3aXRoIHRoZSBuZWFyLWZpZWxk
LWNvbW11bmljYXRpb24gZGV2aWNlLgoqIE1lbnRpb25lZCBFdmF0cm9uaXggYXMgb3JpZ2luYWwg
YXV0aG9ycyBvZiB0aGUgSVAgaW4gdGhlIGNvbW1pdCBsb2cgYW5kCiAgaW4gdGhlIGhlYWRlci4K
KiBBZGRlZCBhbiBhZGRpdGlvbmFsIGNoZWNrIG9uIHRoZSB2YWxpZGl0eSBvZiB0aGUgY2hpbGQg
bm9kZXMgcmVnIHByb3BlcnR5LgoqIEEgY291cGxlIG9mIHN0eWxlIGZpeGVzLgoKTWlxdWVsIFJh
eW5hbCAoNCk6CiAgZHQtYmluZGluZ3M6IG10ZDogcnpuMTogRGVzY3JpYmUgUmVuZXNhcyBSWi9O
MSBOQU5EIGNvbnRyb2xsZXIKICBtdGQ6IHJhd25hbmQ6IHJ6bjE6IEFkZCBuZXcgTkFORCBjb250
cm9sbGVyIGRyaXZlcgogIE1BSU5UQUlORVJTOiBBZGQgYW4gZW50cnkgZm9yIFJlbmVzYXMgUlov
TjEgTkFORCBjb250cm9sbGVyCiAgQVJNOiBkdHM6IHI5YTA2ZzAzMjogRGVzY3JpYmUgTkFORCBj
b250cm9sbGVyCgogLi4uL210ZC9yZW5lc2FzLHJ6bjEtbmFuZC1jb250cm9sbGVyLnlhbWwgICAg
IHwgICA2NCArCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICA3ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAzMi5kdHNpICAgICAgICAgICAgICB8
ICAgMTIgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwg
ICAgNiArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAg
ICAxICsKIGRyaXZlcnMvbXRkL25hbmQvcmF3L3J6bjEtbmFuZC1jb250cm9sbGVyLmMgICB8IDE0
MjIgKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgMTUxMiBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9yZW5lc2FzLHJ6bjEtbmFuZC1jb250cm9sbGVyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9yem4xLW5hbmQtY29udHJvbGxlci5jCgotLSAKMi4yNy4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
