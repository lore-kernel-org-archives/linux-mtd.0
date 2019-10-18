Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14622CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 14:37:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8331222BD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 14:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bc3ao/In"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8331222BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nHvLCeOGXwROizeAmkOCnRoyxDVgrPItH62CFgWXu3g=; b=bc3ao/In5Bz4N7
	kWpydOqlH0wsSTiiUZ9eyl4uwUh7ma72yMNqA4/18wY1Y8lzN/fGIy0HhP76POwGYFGe2jlL5x/fi
	+sQX0PkybAmPaZvye05+2mUWAsYkgDpQSKPn1hxjtKboYZ3LqgEaNftuXr0kdIEldoCfFc+/OWtiu
	yAm1hgkY/yCbiyZ+5V6T3TiKk9hwwoVjNcBKSkZwkFIyKtDcHhClTfVz4IStMjIM1ptXWpilUH9Lp
	L5p7rii/NnpN34epNr2U65JLGlFLzQDlJpwn3OuBIwtswI9fm/nrsv/B9s8uBxmYwDOsgI4Um5pG0
	razv3f04CZOuNfzydp0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLTNE-0006MN-GS; Fri, 18 Oct 2019 14:37:00 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLTN3-0006EI-SK; Fri, 18 Oct 2019 14:36:51 +0000
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 31813E0014;
 Fri, 18 Oct 2019 14:36:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spear_smi: Fix nonalignment not handled in memcpy_toio
Date: Fri, 18 Oct 2019 16:36:43 +0200
Message-Id: <20191018143643.29676-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_073650_046786_EB784C6A 
X-CRM114-Status: GOOD (  15.11  )
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
Cc: stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW55IHdyaXRlIHdpdGggZWl0aGVyIGRkIG9yIGZsYXNoY3AgdG8gYSBkZXZpY2UgZHJpdmVuIGJ5
IHRoZQpzcGVhcl9zbWkuYyBkcml2ZXIgd2lsbCBwYXNzIHRocm91Z2ggdGhlIHNwZWFyX3NtaV9j
cHlfdG9pbygpCmZ1bmN0aW9uLiBUaGlzIGZ1bmN0aW9uIHdpbGwgZ2V0IGNhbGxlZCBmb3IgY2h1
bmtzIG9mIHVwIHRvIDI1NiBieXRlcy4KSWYgdGhlIGFtb3VudCBvZiBkYXRhIGlzIHNtYWxsZXIs
IHdlIG1heSBoYXZlIGEgcHJvYmxlbSBpZiB0aGUgZGF0YQpsZW5ndGggaXMgbm90IDQtYnl0ZSBh
bGlnbmVkLiBJbiB0aGlzIHNpdHVhdGlvbiwgdGhlIGtlcm5lbCBwYW5pY3MKZHVyaW5nIHRoZSBt
ZW1jcHk6CgogICAgIyBkZCBpZj0vZGV2L3VyYW5kb20gYnM9MTAwMSBjb3VudD0xIG9mPS9kZXYv
bXRkNgogICAgc3BlYXJfc21pX2NweV90b2lvIFs2MjBdIGRlc3QgYzkwNzAwMDAsIHNyYyBjN2Jl
ODgwMCwgbGVuIDI1NgogICAgc3BlYXJfc21pX2NweV90b2lvIFs2MjBdIGRlc3QgYzkwNzAxMDAs
IHNyYyBjN2JlODkwMCwgbGVuIDI1NgogICAgc3BlYXJfc21pX2NweV90b2lvIFs2MjBdIGRlc3Qg
YzkwNzAyMDAsIHNyYyBjN2JlOGEwMCwgbGVuIDI1NgogICAgc3BlYXJfc21pX2NweV90b2lvIFs2
MjBdIGRlc3QgYzkwNzAzMDAsIHNyYyBjN2JlOGIwMCwgbGVuIDIzMwogICAgVW5oYW5kbGVkIGZh
dWx0OiBleHRlcm5hbCBhYm9ydCBvbiBub24tbGluZWZldGNoICgweDgwOCkgYXQgMHhjOTA3MDNl
OAogICAgWy4uLl0KICAgIFBDIGlzIGF0IG1lbWNweSsweGNjLzB4MzMwCgpXb3JrYXJvdW5kIHRo
aXMgaXNzdWUgYnkgdXNpbmcgdGhlIGFsdGVybmF0ZSBfbWVtY3B5X3RvaW8oKSBtZXRob2QKd2hp
Y2ggYXQgbGVhc3QgZG9lcyBub3QgcHJlc2VudCB0aGUgc2FtZSBwcm9ibGVtLgoKRml4ZXM6IGYx
OGRiYmIxYmZlMCAoIm10ZDogU1QgU1BFQXI6IEFkZCBTTUkgZHJpdmVyIGZvciBzZXJpYWwgTk9S
IGZsYXNoIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU3VnZ2VzdGVkLWJ5OiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KCkhlbGxvLAoKVGhp
cyBwYXRjaCBjb3VsZCBub3QgYmUgdGVzdGVkIHdpdGggYSBtYWlubGluZSBrZXJuZWwgKG9ubHkg
Y29tcGlsZWQpCmJ1dCB3YXMgdGVzdGVkIHdpdGggYSBzdGFibGUgNC4xNC54IGtlcm5lbC4gSSBo
YXZlIHJlYWxseSBubyBpZGVhIHdoeQptZW1jcHkgZmFpbHMgaW4gdGhpcyBzaXR1YXRpb24gdGhh
dCdzIHdoeSBJIHByb3Bvc2UgdGhpcyB3b3JrYXJvdW5kCmJ1dCBJIGJldCB0aGVyZSBpcyBzb21l
dGhpbmcgZGVlcGVyIG5vdCB3b3JraW5nLgoKVGhhbmtzLApNaXF1w6hsCgogZHJpdmVycy9tdGQv
ZGV2aWNlcy9zcGVhcl9zbWkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3BlYXJf
c21pLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3NtaS5jCmluZGV4IDk4NmY4MWQyZjkz
ZS4uZDg4ODYyNWEzMjQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NwZWFyX3Nt
aS5jCisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3BlYXJfc21pLmMKQEAgLTYxNCw3ICs2MTQs
NyBAQCBzdGF0aWMgaW5saW5lIGludCBzcGVhcl9zbWlfY3B5X3RvaW8oc3RydWN0IHNwZWFyX3Nt
aSAqZGV2LCB1MzIgYmFuaywKIAljdHJscmVnMSA9IHJlYWRsKGRldi0+aW9fYmFzZSArIFNNSV9D
UjEpOwogCXdyaXRlbCgoY3RybHJlZzEgfCBXQl9NT0RFKSAmIH5TV19NT0RFLCBkZXYtPmlvX2Jh
c2UgKyBTTUlfQ1IxKTsKIAotCW1lbWNweV90b2lvKGRlc3QsIHNyYywgbGVuKTsKKwlfbWVtY3B5
X3RvaW8oZGVzdCwgc3JjLCBsZW4pOwogCiAJd3JpdGVsKGN0cmxyZWcxLCBkZXYtPmlvX2Jhc2Ug
KyBTTUlfQ1IxKTsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
