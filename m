Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D43F417F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMSeBbCHZnK8O+TkRrAdPb/YRQIaPKD7T+4EKbjbT/Q=; b=3UJI2xqV+tZuuR
	MKAMXZGx49oB1leq44Ci4SG+ZblyeEVI6EjsrCIZZZRdU/7XhnqiTRoHtLk8mYGvtpcVxKKF2w7yD
	OLZmW1yNN/ju4cflw+EOomKmZhFQlMFvlxeVW6WAI0QcPULQrLk67nyBc8Fc+dt3oA4Yt9Nfg2g/N
	OWdXC0ApOfSk8zoIRBlL3y3mFf6PicDQiNT9yZdNk/W/lg4/fValrcRk6z8V6XXX6dsBGimKkajZ8
	oBsyjNMzSX7aEdXVGcCbBs0Ycfl5IDQq6R7Ve+yFjh4n2Jy4Yy55S9aoSx/8EMBgRdNxko82gCOlX
	Cur1iNedpU1S33/I3kOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc1A-00000007Wlt-1ZGQ;
	Mon, 09 Mar 2026 14:55:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc18-00000007Wkb-02QF
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 14:55:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F42371A2D5A;
	Mon,  9 Mar 2026 14:55:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2A245FFB8;
	Mon,  9 Mar 2026 14:55:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FC7E10369BEE;
	Mon,  9 Mar 2026 15:55:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773068131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jh+FCAS/4Hjk8fG0CPCWhgPb40rw2l45k0VLkA5kkUM=;
	b=BCYNJOELgYNenmU3FgK6Nf7EezM1qBjNq3ISA4ibSYIrnecJrr8cI/XrBZteSXLqZbxZuY
	fX2r4M5cWGkvYt4OZbNefxMcwC/ZnwK4VmsDE/ufq6+7NUhMNUmWRZWLR3e35vCdeb95SA
	Z7FMVGmP5bXp2p5XnNaAL9IN+TZtzvXEn5JtuTqKWtkacOcQTbhzPJEfLoBIztPmqEoyhx
	lW4DM3sF4V9iZHv5IMpAjkO0ywQnf3DHFTda7uC+faeatM/5AXN0Q3eHeZfx1a0rOospVd
	mi6sWOFsYOJfibbC4v1Jk9dQ1/1b6ypnNsvSzr2s7NCZuEUaSnu6NZ8OXzUJFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,
  Jakub Czapiga <czapiga@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
In-Reply-To: <20260108121430.1096844-1-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Thu, 8 Jan 2026 13:14:29 +0100")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 15:55:28 +0100
Message-ID: <873429oxwf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_075534_181337_87D0D10D 
X-CRM114-Status: GOOD (  25.45  )
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

SGVsbG8gU1BJIE5PUiBmb2xrcyA6LSkKCisgVGFrYWhpcm8KCk9uIDA4LzAxLzIwMjYgYXQgMTM6
MTQ6MjkgKzAxLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKCj4gQ29tbWl0IDUwMDhjM2VjM2Y4OSAoIm10ZDogc3BpLW5vcjogY29yZTogQ2hlY2sgcmVh
ZCBDUiBzdXBwb3J0IikgYWRkcyBhCj4gY29udHJvbGxlciBjaGVjayB0byBtYWtlIHN1cmUgdGhl
IGNvcmUgd2lsbCBub3QgdXNlIENSIHJlYWRzIG9uCj4gY29udHJvbGxlcnMgbm90IHN1cHBvcnRp
bmcgdGhlbS4gVGhlIGFwcHJvYWNoIGlzIHZhbGlkIGJ1dCB0aGUgZml4IGlzCj4gaW5jb3JyZWN0
LiBVbmZvcnR1bmF0ZWx5LCB0aGUgYXV0aG9yIGNvdWxkIG5vdCBjYXRjaCBpdCwgYmVjYXVzZSB0
aGUKPiBleHBlY3RlZCBiZWhhdmlvciB3YXMgbWV0LiBUaGUgcGF0Y2ggaW5kZWVkIGRyb3BzIHRo
ZSBSRENSIGNhcGFiaWxpdHksCj4gYnV0IGl0IGRvZXMgaXQgZm9yIGFsbCBjb250cm9sbGVycyEK
Pgo+IFRoZSBpc3N1ZSBjb21lcyBmcm9tIHRoZSB1c2Ugb2Ygc3BpX25vcl9zcGltZW1fY2hlY2tf
b3AoKSB3aGljaCBpcyBhbgo+IGludGVybmFsIGhlbHBlciBkZWRpY2F0ZWQgdG8gY2hlY2sgcGFn
ZSBvcGVyYXRpb25zLCBpZS4gaXQgaXMgb25seSB1c2VkCj4gZm9yIHBhZ2UgcmVhZHMgYW5kIHBh
Z2UgcHJvZ3JhbXMgKGRlc3BpdGUgaXRzIGdlbmVyaWMgbmFtZSkuCj4KPiBUaGlzIGhlbHBlciBs
b29rcyBmb3IgdGhlIGJpZ2dlc3QgbnVtYmVyIG9mIGFkZHJlc3MgYnl0ZXMgdGhhdCBjYW4gYmUK
PiB1c2VkIGZvciBhIHBhZ2Ugb3BlcmF0aW9uIGFuZCB0cmllcyA0IHRoZW4gMy4gSXQgdGhlbiBj
YWxscyB0aGUgdXN1YWwKPiBzcGktbWVtIGhlbHBlcnMgdG8gZG8gdGhlIGNoZWNrcy4gVGhlc2Ug
d2lsbCBhbHdheXMgZmFpbCBiZWNhdXNlIHRoZXJlCj4gaXMgbm93IGFuIGluY29uc2lzdGVuY3k6
IHRoZSBhZGRyZXNzIGN5Y2xlcyBhcmUgZm9yY2VkIHRvIDQgKHRoZW4gMykKPiBieXRlcywgYnV0
IHRoZSBidXMgd2lkdGggZHVyaW5nIHRoZSBhZGRyZXNzIGN5Y2xlcyByaWdodGZ1bGx5IHJlbWFp
bnMgMDoKPiBpbXBvc3NpYmxlLCB0aGUgb3BlcmF0aW9uIGlzIGludmFsaWQuCj4KPiBUaGUgY29y
cmVjdCBjaGVjayBpbiB0aGlzIGNhc2UgaXMgdG8gZGlyZWN0bHkgY2FsbCBzcGlfbWVtX3N1cHBv
cnRzX29wKCkKPiB3aGljaCBkb2Vzbid0IG1lc3NlcyB1cCB3aXRoIHRoZSBvcGVyYXRpb24gY29u
dGVudC4KPgo+IEZpeGVzOiA1MDA4YzNlYzNmODkgKCJtdGQ6IHNwaS1ub3I6IGNvcmU6IENoZWNr
IHJlYWQgQ1Igc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KClRoZXNlIHR3byBwYXRjaGVzIGFyZSBmaXhlcyB3aGljaCBu
ZWVkIHRvIGdldCBpbiwgSSdkIGxpa2UgdG8gcGljayB0aGVtCmZvciB0aGUgbmV4dCBmaXhlcyBN
VEQgUFIgdGhhdCBJIGFtIHByZXBhcmluZywgYnV0IEkgd2FzIGV4cGVjdGluZyBzb21lCmtpbmQg
b2YgYWNrbm93bGVkZ2VtZW50IG9uIGl0LgoKQ2hlbmcgTWluZyBhbHJlYWR5IGZhY2VkIHRoZSBz
YW1lIGlzc3VlIG9uIGhpcyBzaWRlIGFuIGlkZW50aWNhbCBwYXRjaAphbHJlYWR5LgoKVGhhbmtz
LApNaXF1w6hsCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuYwo+IGluZGV4IGQzZjhhNzhlZmQzYi4uMWYyZTMxMmZlZWM3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKPiBAQCAtMjQ2Niw3ICsyNDY2LDcgQEAgc3BpX25vcl9zcGltZW1fYWRqdXN0X2h3Y2Fwcyhz
dHJ1Y3Qgc3BpX25vciAqbm9yLCB1MzIgKmh3Y2FwcykKPiAgCj4gIAkJc3BpX25vcl9zcGltZW1f
c2V0dXBfb3Aobm9yLCAmb3AsIG5vci0+cmVnX3Byb3RvKTsKPiAgCj4gLQkJaWYgKHNwaV9ub3Jf
c3BpbWVtX2NoZWNrX29wKG5vciwgJm9wKSkKPiArCQlpZiAoIXNwaV9tZW1fc3VwcG9ydHNfb3Ao
bm9yLT5zcGltZW0sICZvcCkpCj4gIAkJCW5vci0+ZmxhZ3MgfD0gU05PUl9GX05PX1JFQURfQ1I7
Cj4gIAl9Cj4gIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
