Return-Path: <SRS0=bVXU=AR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5D6C433E1
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2020 06:28:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F3892075B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2020 06:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oZ6Qb3DJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F3892075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ytDjnLQ50F01cps17l61ohE4anct9KKI33IYP2QzqQg=; b=oZ6Qb3DJmuIi6its54VYz34ol
	5aQ6ERFcENDhGQONoxDK8teXck/VEN1oWq1lf2iiJTmmfoG0BhLHB/DAGc9Bxdau/fa3VNDi5HFze
	Ebl/vEpZEOf9wqo/Ap62E/sle3VsxjTz9VVmxcSWU7LQb1tTIi/JkeuMVEdRtL1+fLcKWa6pyXVsS
	J7E3OvvYozOC0+s2xUi1SUh4n0oQSZ0JlhRyYnnKaPSgnEFOULsLsIO4XCsly6muFbyBNDC8bUGPN
	p10Xbj/gBOWJhSL6pZJW9yLBQgJ1XKW86nj0eFt9qf0GYVqt+KXiY5sbx70eREwdFv9wQhMN21DZV
	W8KtZ0nXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsKb1-0001Hr-6f; Mon, 06 Jul 2020 06:27:19 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsKay-0001Gb-GG
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2020 06:27:17 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DB14D1BF203;
 Mon,  6 Jul 2020 06:27:10 +0000 (UTC)
Date: Mon, 6 Jul 2020 08:27:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Priyank Bhatt <priyankbhatt196@gmail.com>
Subject: Re: Octal RAM driver support related query
Message-ID: <20200706082709.5bcc6ce7@xps13>
In-Reply-To: <aceb03c8-00f4-a6f5-01c3-55621aa6d3d0@gmail.com>
References: <aceb03c8-00f4-a6f5-01c3-55621aa6d3d0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_022716_635993_FDE34887 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org, miquel@bootlin.com,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUHJpeWFuaywKCittdGQgbWFpbnRhaW5lcnMKK210ZCBsaXN0CgpQcml5YW5rIEJoYXR0IDxw
cml5YW5rYmhhdHQxOTZAZ21haWwuY29tPiB3cm90ZSBvbiBNb24sIDYgSnVsIDIwMjAKMTE6MDU6
MTQgKzA1MzA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBJIGFtIHdvcmtpbmcgb24gTlhQJ3MgaU1YOCBh
bmQgdHJ5aW5nIHRvIGNvbW11bmljYXRlIHRvIGFuIElTU0kgT2N0YWwgUkFNIHdpdGggaXRzIGZs
ZXhTUEkgaW50ZXJmYWNlLiBJIHdhcyByZWNlbnRseSBnb2luZyB0aHJvdWdoIGEgcHJlc2VudGF0
aW9uICpNVEQ6IFdoYXQncyBuZXc/ICpmcm9tIHd3dy5ib290bGluLmNvbSBhbmQgYXQgdGhlIGVu
ZCBJIGZvdW5kIHRoYXQgaW4gd2hhdCdzIG5leHQgc2VjdGlvbiB5b3UgaGF2ZSBsaXN0ZWQgaHlw
ZXJSQU0gc3VwcG9ydC4KPiAKPiBTbyBteSBxdWVzdGlvbjogSXMgdGhlcmUgYW55IE9jdGFsUkFN
IHN1cHBvcnRlZCBkcml2ZXIgd2hpY2ggSSBjYW4gcmVmZXIgdG8gY3JlYXRlIG15IG93biBmb3Ig
YSBzcGVjaWZpYyBjaGlwIG1hbnVmYWN0dXJlcj8KPiBSaWdodCBub3cgSSBhbSByZWZlcnJpbmcg
bWNocDIzazI1Ni5jKG1pY3JvY2hpcCkgU1BJIFJBTSBkcml2ZXIgaW5zaWRlIC9kcml2ZXIvbXRk
L2RldmljZXMuIEJ1dCBJIGFtIGEgbGl0dGxlIGNvbmZ1c2VkIGFzIHRvIGhvdyB0byB1c2UgbXkg
ZHJpdmVyIGluIE9jdGFsIG1vZGUuCgpJIGd1ZXNzIHdlIHNob3VsZCBhc2sgVmlnbmVzaCBhYm91
dCBpdCBiZWNhdXNlIGhlIGlzIHRoZSBvbmUgbWFzdGVyaW5nCnRoaXMgc3Vic3lzdGVtLCBJIGNv
dWxkIG9ubHkgZ2l2ZSB5b3UgZHVtcCBhbnN3ZXJzIGFib3V0IHRoZXNlIGRldmljZXMKOikKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
