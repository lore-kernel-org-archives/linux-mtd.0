Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA23C282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 14:42:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D55F2080D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 14:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHjHKJu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D55F2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ECqwWpZnuEVu2CC2ajmYuDtiB/HVEmNIFsI4MgXGdP8=; b=SHjHKJu5wp8qeb
	gzGUuJQKUNM/ZzRw9cz0aiue38dL3vRFx+NcO40N5YegXlji4ZmiJ3d8zHPOa0ac7CTAjcnrzv8lN
	PTo5ttmCf4UbKiIMIv5Y/BJ2yFMZhtAfV6ZjNiKuj/CWvT5CrpBNFC58h0PWWQxzA9TjoEh1Wq3LI
	xq+m6cOr1RtLPP72f1DkULjLXVsXcuPdmBaidufNIftOgvmffG19G6QMiq6qAQwDTg/C47xA/0Rv8
	EBEWUhpiM/leNFK/Mxwpc9SMQoWDISB6tsWN0kaieuc0ImSzCPAU0hNu6GxWFXC0IXufZnJV6USLt
	K+7sqw93DQPPdKajlZog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipvUd-0006wR-B6; Fri, 10 Jan 2020 14:42:31 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipvUa-0006w0-4X
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 14:42:29 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F40E6240011;
 Fri, 10 Jan 2020 14:42:19 +0000 (UTC)
Date: Fri, 10 Jan 2020 15:42:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for v5.5-rc6
Message-ID: <20200110154218.0b28309f@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_064228_315901_373979A2 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTGludXMsCgpUaGlzIGlzIHRoZSBNVEQgZml4ZXMgUFIgZm9yIHY1LjUtcmM2LgoKVGhh
bmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGM3OWY0NmEy
ODIzOTBlMGY1YjMwNjAwN2JmN2IxMWE0NmQ1Mjk1Mzg6CgogIExpbnV4IDUuNS1yYzUgKDIwMjAt
MDEtMDUgMTQ6MjM6MjcgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210
ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTUuNS1yYzYKCmZvciB5b3UgdG8gZmV0Y2gg
Y2hhbmdlcyB1cCB0byA4MmRlNmE2ZmI2N2UxNmEzMGVjMmY1ODZiMWY2OTc2YzJkN2I0YjYyOgoK
ICBtdGQ6IHNwaS1ub3I6IEZpeCB0aGUgd3JpdGluZyBvZiB0aGUgU3RhdHVzIFJlZ2lzdGVyIG9u
IG1pY3JvbiBmbGFzaGVzICgyMDIwLTAxLTA5IDIwOjExOjM0ICswMTAwKQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNVEQ6
Ciogc21fZnRsOiBGaXggTlVMTCBwb2ludGVyIHdhcm5pbmcuCgpSYXcgTkFORDoKKiBDYWRlbmNl
OiBmaXggY29tcGlsZSB0ZXN0aW5nLgoqIFNUTTMyOiBBdm9pZCBsb2NraW5nLgoKT25lbmFuZDoK
KiBGaXggc2V2ZXJhbCBzcGFyc2UvYnVpbGQgd2FybmluZ3MuCgpTUEktTk9SOgoqIEFkZCBhIGZs
YWcgdG8gZml4IGludGVyYWN0aW9uIHdpdGggTWljcm9uIHBhcnRzLgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbWlyIE1h
aGRpIEdob3JiYW5pYW4gKDEpOgogICAgICBtdGQ6IG9uZW5hbmQ6IG9tYXAyOiBGaXggZXJyb3Jz
IGluIHN0eWxlCgpBcm5kIEJlcmdtYW5uICgxKToKICAgICAgbXRkOiBzbV9mdGw6IGZpeCBOVUxM
IHBvaW50ZXIgd2FybmluZwoKQ2hyaXN0b3BoZSBLZXJlbGxvICgxKToKICAgICAgbXRkOiByYXdu
YW5kOiBzdG0zMl9mbWMyOiBhdm9pZCB0byBsb2NrIHRoZSBDUFUgYnVzCgpLcnp5c3p0b2YgS296
bG93c2tpICgxKToKICAgICAgbXRkOiBvbmVuYW5kOiBzYW1zdW5nOiBGaXggaW9tZW0gYWNjZXNz
IHdpdGggcmVndWxhciBtZW1jcHkKClBldGVyIFVqZmFsdXNpICgxKToKICAgICAgbXRkOiBvbmVu
YW5kOiBvbWFwMjogUGFzcyBjb3JyZWN0IGZsYWdzIGZvciBwcmVwX2RtYV9tZW1jcHkKClR1ZG9y
IEFtYmFydXMgKDEpOgogICAgICBtdGQ6IHNwaS1ub3I6IEZpeCB0aGUgd3JpdGluZyBvZiB0aGUg
U3RhdHVzIFJlZ2lzdGVyIG9uIG1pY3JvbiBmbGFzaGVzCgpWYXN5bCBHb21vbm92eWNoICgxKToK
ICAgICAgbXRkOiBjYWRlbmNlOiBGaXggY2FzdCB0byBwb2ludGVyIGZyb20gaW50ZWdlciBvZiBk
aWZmZXJlbnQgc2l6ZSB3YXJuaW5nCgogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29tYXAyLmMg
ICAgICAgICAgICAgICB8IDE0ICsrKysrKy0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L29uZW5hbmRfYmFzZS5jICAgICAgICB8IDE0ICsrKysrKy0tLS0tLQogZHJpdmVycy9tdGQvbmFu
ZC9vbmVuYW5kL3NhbXN1bmdfbXRkLmMgICAgICAgICB8ICA4ICsrKy0tLS0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMgfCAxMyArKysrKystLS0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgICAgICAgICB8IDM4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQogZHJpdmVycy9tdGQvc21fZnRsLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMg
ICAgICAgICAgICAgICAgICB8ICAxICsKIGluY2x1ZGUvbGludXgvbXRkL2ZsYXNoY2hpcC5oICAg
ICAgICAgICAgICAgICAgfCAgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCsp
LCAyOCBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
