Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93892C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DDC206D7
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8ZI0B6I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64DDC206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uw0cQCN7Zk7BoU7GTOKM3GoRq+D+wZVu6g5Sx+xjbO8=; b=D8ZI0B6I/ayJWo
	xnM+LiQXKsqsqyICn74zpLZVEDCqgCiLfrBjWNZHF3TJ9T7TAoLgLk9ieU2gTdy2m8sRfLCqNhr/B
	oTObShka6zwuM5BYI9HoJubSBIkg8aVh2Y3Fud3D0o93GqqFaUce/GaMxcGVJKbsNQNHY4ciO+nyg
	3W2OffP4bnfprE9LjOU3DsPSJgsowD6WBhAv3Nhd1gOtyDOIJ5iyRWW1WArNnvWgOS8y2Yx7ZxlZG
	pOkeq0SPGXj1fBmy1UjmQxtDK666y9JdYSxjTaiYho6PpK2uie52LoSJYI51Xt6lBWwl2WCNP+IDD
	HWubHsd4/SDK5F46aNdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMlw-0008E2-53; Tue, 28 Apr 2020 09:43:24 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMlg-000800-7p
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 09:43:09 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CCB1DC0014;
 Tue, 28 Apr 2020 09:43:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/9] Misc timing changes
Date: Tue, 28 Apr 2020 11:42:53 +0200
Message-Id: <20200428094302.14624-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_024308_415183_2FD397D9 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpXaGlsZSB3b3JraW5nIG9uIHRoZSBlYXJseSAtPmV4ZWNfb3AoKSBpbml0aWFsaXph
dGlvbnMsIEkgZmlndXJlZCB0aGUKbG9naWMgbWlnaHQgbmVlZCB0byBiZSB1cGRhdGVkIGEgbGl0
dGxlIGJpdCBpbiBvcmRlciB0byBzdXBwb3J0CiJwcm9ibGVtYXRpYyIgSVBzIGxpa2UgQXJhc2Fu
IHdoaWNoIGRvIG5vdCBsZWF2ZSBhIGxvdCBvZiBsYXRpdHVkZSB0bwp0aGUgY29yZS4gV2hpbGUg
ZG9pbmcgdGhlc2UgY2hhbmdlcyBpbiB0aGUgbG9naWMsIEkgYWxzbyBkZWNpZGVkIHRvCmNsZWFu
dXAgdGhpcyBwb3J0aW9uIGEgYml0LCB3aGljaCBlbmRlZCB3aXRoIHRoZSB3cml0aW5nIG9mIGEg
ZmV3CmFjdHVhbCBmaXhlcy4KCkNoZWVycywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2MzoKKiBGaXhl
ZCB0eXBvcyBvbiB0Q0NTIGFuZCBmZW10b3NlY29uZHMgKFNlcmdlaSkuCiogQWRkIEZpeGVzL1N0
YWJsZSB0YWdzIHRvIHRoZSBwYXRjaCBmaXhpbmcgdGhlIHBhcmFtIHBhZ2UgZGV0ZWN0aW9uLgoq
IEluaXRpYWxpemVkIHRoZSBjb250ZW50IG9mIHRoZSBzcmNidWYgYXJyYXkgKGluIHRoZSBPTkZJ
IHBhcmFtZXRlcgogIHBhZ2UgYml0d2lzZSByZWNvdmVyeSBsb2dpYykgd2l0aCBhIGZvciBsb29w
IHRvIGF2b2lkIGhhcmRjb3JpbmcgdGhlCiAgbnVtYmVyIG9mIHBhcmFtZXRlciBwYWdlcyBhbnl3
aGVyZSBhcyBzdWdnZXN0ZWQgYnkgQm9yaXMuCiogQWRkZWQgUmV2aWV3ZWQtYnkgdGFncy4KCkNo
YW5nZXMgaW4gdjI6CiogVXBkYXRlZCBhIGJpdCB0aGUga2VybmVsIGRvYyBhcyBzdWdnZXN0ZWQg
YnkgQm9yaXMuCiogVXBkYXRlZC9maXhlZCB0eXBvcyBpbiB0aGUgY29tbWl0IGxvZ3MgZm9sbG93
aW5nIEJvcmlzIGFuZCBTZXJnZXkKICBjb21tZW50cy4KKiBEcm9wcGVkIHRoZSBPTkZJL0pFREVD
IHBhcmFtZXRlciBwYWdlIHJlYWQgc2ltcGxpZmljYXRpb24uIEluZGVlZAogIHRoZXkgY2FuIGNh
dXNlIHRyb3VibGVzLiBJIG1vdmVkIHRoZXNlIHR3byBwYXRjaGVzIHRvIGFub3RoZXIgc2VyaWVz
CiAgd2hpY2ggdGFrZXMgY2FyZSBhYm91dCB1cGRhdGluZyBzb21lIG9mIHRoZSBjb3JlJ3Mgb3Bl
cmF0aW9ucyBmb3IKICBjb21wbGV4IGNvbnRyb2xsZXJzLgoKTWlxdWVsIFJheW5hbCAoOSk6CiAg
bXRkOiByYXduYW5kOiB0aW1pbmdzOiBBZGQgbW9kZSBpbmZvcm1hdGlvbiB0byB0aGUgdGltaW5n
cyBzdHJ1Y3R1cmUKICBtdGQ6IHJhd25hbmQ6IHRpbWluZ3M6IEZpeCBkZWZhdWx0IHRSX21heCBh
bmQgdENDU19taW4gdGltaW5ncwogIG10ZDogcmF3bmFuZDogb25maTogRml4IHJlZHVuZGFuY3kg
ZGV0ZWN0aW9uIGNoZWNrCiAgbXRkOiByYXduYW5kOiBvbmZpOiBVc2UgaW50ZXJtZWRpYXRlIHZh
cmlhYmxlcyB0byBpbXByb3ZlIHJlYWRhYmlsaXR5CiAgbXRkOiByYXduYW5kOiBvbmZpOiBEZWZp
bmUgdGhlIG51bWJlciBvZiBwYXJhbWV0ZXIgcGFnZXMKICBtdGQ6IHJhd25hbmQ6IG9uZmk6IEF2
b2lkIGRvaW5nIGEgY29weSBvZiB0aGUgcGFyYW1ldGVyIHBhZ2UKICBtdGQ6IHJhd25hbmQ6IG9u
Zmk6IERyb3AgYSB1c2VsZXNzIHBhcmFtZXRlciBwYWdlIHJlYWQKICBtdGQ6IHJhd25hbmQ6IGpl
ZGVjOiBEZWZpbmUgdGhlIG51bWJlciBvZiBwYXJhbWV0ZXIgcGFnZXMKICBtdGQ6IHJhd25hbmQ6
IGplZGVjOiBVc2UgaW50ZXJtZWRpYXRlIHZhcmlhYmxlcyB0byBpbXByb3ZlIHJlYWRhYmlsaXR5
CgogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9qZWRlYy5jICAgfCAxMSArKysrLS0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyAgICB8IDUxICsrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX3RpbWluZ3MuYyB8IDExICsrKysr
LS0KIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgICAgIHwgMTAgKysrKy0tCiA0IGZp
bGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
