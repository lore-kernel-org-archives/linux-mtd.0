Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F693C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69CE126756
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pptrKRLt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69CE126756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yauTYhkOR1DRiL5wmPG/8X5Wry7Pqd0JAUhbhUDemWs=; b=pptrKRLtsb+UBZ
	aS7E0sLmfhHBkpxggjp0oo18jY6s9EfcqhxhIXuRT+d9HqxCHoOq18mp9YnyQUhcMUDvFeOBI7vSL
	isZOWIMoFyZkjX2AzYtaIzfTw3NlKD38CYzhBpEh1WcZwipb7uO8lR3qHYZMrOUM5nVAybWoKwP6Z
	ydkCUn2wUDDiJioeKQkgF87rM1DYv/6OO5GGmATYVLhWWUy+yMOGhyWBERHm9+pe0pVKnlcDHQJXH
	WY6/aExEz9akGmEz+cx4j7cPz6z6FCxkYQCxFR8lrt5L/l8q/t76g+CQZ9uTOkxuqwsmrhSHBa1IV
	xDgs78NDt7OsxWTdSXxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXmXY-00047D-Dj; Mon, 03 Jun 2019 12:58:16 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXmXV-00046r-B6
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 12:58:14 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1643B6074CFE;
 Mon,  3 Jun 2019 14:58:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Z1-LrsNwAI0x; Mon,  3 Jun 2019 14:58:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BFF696074CF0;
 Mon,  3 Jun 2019 14:58:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OpRPXwgVLnuU; Mon,  3 Jun 2019 14:58:10 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 99B3A608313E;
 Mon,  3 Jun 2019 14:58:10 +0200 (CEST)
Date: Mon, 3 Jun 2019 14:58:10 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Steve deRosier <derosier@gmail.com>
Message-ID: <1496138474.79078.1559566690511.JavaMail.zimbra@nod.at>
In-Reply-To: <CALLGbRJRLoEPW4dTVCvjp7qBDXEefjBTT4_731m_9XD=KgH8Cw@mail.gmail.com>
References: <CAM===sSAP-qRv7jxBs9KZDFyuL+Dx3wSkQfSOiSQtp8Z8FQcMw@mail.gmail.com>
 <CAFLxGvymOZbBM=wtK-fcgYOv7OOucpcZ1eZJ9GQmUH8h9Jcc+Q@mail.gmail.com>
 <CAM===sSzy4=joOnzLxbSDoC=4HgmXj7QF14vzFCKTWt8z-JLoA@mail.gmail.com>
 <CALLGbRJRLoEPW4dTVCvjp7qBDXEefjBTT4_731m_9XD=KgH8Cw@mail.gmail.com>
Subject: Re: UBIFS on write-protected NAND
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: UBIFS on write-protected NAND
Thread-Index: /vwMihgli4DaAHF0Nldkpqerfd1jZg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_055813_525534_3F2DEB66 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-mtd <linux-mtd@lists.infradead.org>, Leon Pollak <leon.pollak@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFlvdXIgSFcgZW5naW5lZXJzIGFyZSB3
cm9uZyBhbmQgZGlkIG5vdCByZWFkIGFuZCBfdW5kZXJzdGFuZF8gdGhlIE5BTkQKPiBkYXRhc2hl
ZXRzLiBOb3IgZG8gdGhleSB1bmRlcnN0YW5kIHRoZSBzb2Z0d2FyZSBhbmQgd2hhdCBpdCBkb2Vz
LiBUaGUKPiBkYXlzIG9mIHRoZSBIVyBndXkgZGVzaWduaW5nIHNvbWV0aGluZyBhbmQgdGhyb3dp
bmcgaXQgb3ZlciB0aGUgd2FsbAo+IGFuZCBhc2tpbmcgdGhlIFNXIGd1eSB0byBtYWtlIGl0IHdv
cmsgYXJlIGxvbmcgb3Zlci4KPiAKPiBJZiB5b3Ugd2FudCBOQU5EIHRvIHN0YXkgYm9vdGFibGUg
ImRlc3BpdGUgZXZlcnl0aGluZyBpbiB0aGUgd29ybGQiLAo+IHlvdSBjYW4ndCBydW4gaXQgd3Jp
dGUgcHJvdGVjdGVkLiBOQU5EIHdpbGwgYml0LXJvdCBvdmVyIHRpbWUuIEl0IGlzCj4gdGhlIG5h
dHVyZSBvZiBOQU5ELiBVQklGUyBkZXRlY3RzIHRoaXMgYW5kIHdpbGwgbW92ZSBkYXRhIGFyb3Vu
ZCBhcwo+IG5lY2Vzc2FyeSB0byBrZWVwIGl0IHJlYWRhYmxlLiBUaGVyZSBhcmUgY2VydGFpbiBh
cmVhcyB0aGF0IHJlYWxseQo+IG9ubHkgZ2V0IHJlYWQgYXQgYm9vdCB0aW1lLCBzbyBpZiBpdCdz
IHdyaXRlIHByb3RlY3RlZCBhdCB0aGF0IHBvaW50LAo+IHlvdSdyZSBzdW5rIC0gVUJJRlMgY2Fu
J3QgZG8gdGhlIHdvcmsgb2YgcHJlc2VydmluZyB0aGUgTkFORCB0aGF0IGl0Cj4gaXMgZGVzaWdu
ZWQgdG8gZG8uCj4gCj4gSWYgaXQgd2VyZSBtZSwgaW4gdS1ib290IChvciB3aGF0ZXZlciBib290
bG9hZGVyIHlvdSdyZSB1c2luZyksIEknZAo+IGZsaXAgdGhlIEdQSU8gaG9sZGluZyB0aGUgL1dQ
IGxpbmUgdG8gbWFrZSB0aGUgTkFORCB3cml0YWJsZSBiZWZvcmUgSQo+IGJvb3RlZCB0aGUga2Vy
bmVsIGFuZCB0aGVuIEknZCBsZWF2ZSBpdCB0aGVyZS4KPiAKPiBUaGUgb3RoZXIgd2F5IHJlcXVp
cmVzIG1vcmUgZWZmb3J0IC0geW91IGNvdWxkIGdvIGludG8geW91ciBOQU5ECj4gZHJpdmVyLCBm
aW5kIHRoZSBsb3ctbGV2ZWwgd3JpdGUgc2VxdWVuY2VzIGFuZCBmbGlwIHRoZSBHUElPIHRvIHdy
aXRlCj4gYW5kIGNsb3NlIGl0IHRvIHByb3RlY3QgYWZ0ZXIgeW91J3JlIGRvbmUuIEJ1dCwgcGF5
IHZlcnkgY2xvc2UKPiBhdHRlbnRpb24gdG8geW91ciBkYXRhc2hlZXRzIHRvIGJlIHN1cmUgeW91
IGhhdmUgeW91ciBzZXR1cCBhbmQgaG9sZAo+IHRpbWVzIGNvcnJlY3QgaWYgeW91J3JlIGdvaW5n
IHRvIGRvIHRoYXQuCj4gCj4gVGhlIGZpbmFsIHdheSB0byBkbyBpdCBpcyB0byBub3QgdXNlIFVC
SUZTIGF0IGFsbC4gIFJ1biBhIFIvTyBpbWFnZQo+IGxpa2Ugc3F1YXNoZnMgYW5kIHJ1biB0aGUg
TkFORCB3aXRoIHdheSBoaWdoZXIgRUNDIHRoYW4gcmVxdWlyZWQgYW5kCj4gaG9wZSB0aGF0IG92
ZXIgdGhlIGxpZmV0aW1lIG9mIHRoZSBkZXZpY2UgeW91IGRvbid0IGFjY3VtdWxhdGUgbW9yZQo+
IHRoYW4gdGhhdCBiaXQtZmxpcHMgaW4gYW55IHNlY3RvciB0aGF0IHlvdSBjYXJlIGFib3V0LgoK
QW1lbi4gOi0pCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
