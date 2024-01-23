Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189EFC47DDB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hRMGelVjUnXXs2PbuLxMm7DqqksPS9+xu2BqQw2sFak=; b=D6mPAhEKW36FXwQ19isB+SjsRa
	BteIuGdxIXfM40Jf9XS/0cNdx9HzXVE929xeGxGQ/suRhNkvJw2MDlBsPudnxKEnIjEoGtHtv/Yq9
	JFZLRn9KEtfzbcYmnzDBtLgQqmCUGoc8H6q4cFD5ROrNfR038wDBrPtxqJd6jub/2KXc2Y5CkmGBC
	ymI1AX1//PATrZ+FjN6UBTnG+AIncUXQpkPG9+KEjUcUHK9HrMCI1etzZcUtKjHp6CDPIj17nwvmK
	4rxHLE0I6P6Evrm4njH5IdHOY3yJkCdOMvjeeiHuKEwIT1uGTSwczYGXWjNxcNx+rvKVe9UA9ozbX
	R1mBUpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSBIO-00FOm2-2M;
	Tue, 23 Jan 2024 07:34:08 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSBIJ-00FOlG-2G
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 07:34:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A852A62348A5;
	Tue, 23 Jan 2024 08:33:50 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id C95b7-kullDY; Tue, 23 Jan 2024 08:33:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D0DB262348AD;
	Tue, 23 Jan 2024 08:33:49 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LVv_iuyZy6oW; Tue, 23 Jan 2024 08:33:49 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B081462348A5;
	Tue, 23 Jan 2024 08:33:49 +0100 (CET)
Date: Tue, 23 Jan 2024 08:33:49 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1132174888.268752.1705995229529.JavaMail.zimbra@nod.at>
In-Reply-To: <20240120230824.2619716-1-willy@infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
Subject: Re: [PATCH 00/15] ubifs folio conversion
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs folio conversion
Thread-Index: yV5JKxte5MOiQKmOBz01bk7RXzFV8g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_233403_912860_2A399251 
X-CRM114-Status: GOOD (  12.85  )
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

TWF0dGhldywKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJNYXR0aGV3
IFdpbGNveCIgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBu
b2QuYXQ+Cj4gQ0M6ICJNYXR0aGV3IFdpbGNveCIgPHdpbGx5QGluZnJhZGVhZC5vcmc+LCAibGlu
dXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gR2VzZW5kZXQ6IFNvbm50
YWcsIDIxLiBKYW51YXIgMjAyNCAwMDowODowOAo+IEJldHJlZmY6IFtQQVRDSCAwMC8xNV0gdWJp
ZnMgZm9saW8gY29udmVyc2lvbgoKPiBUaGlzIHBhdGNoc2V0IGNvbnZlcnRzIHViaWZzIHRvIHVz
ZSBmb2xpb3MgdGhyb3VnaG91dC4gIEkgbWFkZSBzb21lCj4gYXR0ZW1wdCB0byBzdXBwb3J0IGxh
cmdlIGZvbGlvcywgYnV0IG1vcmUgd29yayBkZWZpbml0ZWx5IG5lZWRzIHRvIGJlCj4gZG9uZSBi
ZWZvcmUgaXQgY2FuIGJlIGVuYWJsZWQuICBJdCdzIG5vdCBjbGVhciB0byBtZSB3aGV0aGVyIGl0
J3Mgd29ydGgKPiBkb2luZywgc28gSSd2ZSBsZWZ0IHRoYXQgZm9yIHlvdSA7LSkKCndoYXQgaXMg
dGhlIGJlbmVmaXQgb2YgbGFyZ2UgZm9saW9zPwoKPiBUaGUgZmlyc3QgcGF0Y2ggZml4ZXMgYSBt
aXNwbGFjZWQgY2FsbCB0byBTZXRQYWdlVXB0b2RhdGUgd2hpY2ggaGFzIGJlZW4KPiB3aXRoIHVz
IHNpbmNlIHRoZSBpbml0aWFsIG1lcmdlIG9mIHViaWZzLiAgSXQgbG9va3MgdG8gYmUgYSBwcmV0
dHkgaGFyZAo+IHJhY2UgdG8gaGl0LCB3aGljaCBpcyB3aHkgaXQgcHJvYmFibHkgaGFzbid0IGFm
ZmVjdGVkIGFueW9uZS4KClRoYW5rcyBhIGxvdCBmb3IgaWRlbnRpZnlpbmcgYW5kIGZpeGluZyB0
aGlzIG9uZSEKCj4gV2l0aCBteSB1c3VhbCB0ZXN0IGNvbmZpZywgdGhpcyBzYXZlcyBhYm91dCAy
a0Igb2Yga2VybmVsIHRleHQgKGFsbW9zdAo+IDElKS4gIFNvbWUgZnVuY3Rpb25zIHNocmluayBt
b3JlIHRoYW4gb3RoZXJzLCBlZyB1Ymlmc193cml0ZV9iZWdpbgo+IHJlZHVjZXMgYnkgYWxtb3N0
IGEgdGhpcmQuICBZTU1WIHdpdGggZGlmZmVyZW50IGNvbmZpZ3MuCj4gCj4gSSd2ZSBkb25lIGEg
ZmV3IG90aGVyIHVwZGF0ZXMgd2hpbGUgSSdtIGluIGhlcmU7IGVnIHNldHRpbmcvY2xlYXJpbmcK
PiBQYWdlRXJyb3IgaXMgcG9pbnRsZXNzIGJlY2F1c2UgdGhlIFZGUyBkb2Vzbid0IHVzZSBpdCBh
bmQgdWJpZnMgZG9lc24ndAo+IHRlc3QgaXQuICBBbmQgd2UncmUgcGhhc2luZyBvdXQgdXNlIG9m
IFBhZ2VQcml2YXRlIC8gZm9saW9fdGVzdF9wcml2YXRlKCkKPiBpbiBmYXZvdXIgb2YganVzdCB0
ZXN0aW5nIHdoZXRoZXIgZm9saW8tPnByaXZhdGUgaXMgc2V0Lgo+IAo+IEkgcmFuIHRoaXMgdGhy
b3VnaCB4ZnN0ZXN0cyBhbmQgaXQgZGlkbid0IHNlZW0gYW55IHdvcnNlLgoKQ2FuIHlvdSByZWNv
bW1lbmQgYSBzcGVjaWZpYyByZWFsIGxvYWQgd29ya2xvYWQgdG8gc3RyZXNzIHRlc3QgeW91ciBj
aGFuZ2VzPwoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
