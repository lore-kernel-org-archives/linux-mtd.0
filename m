Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0334CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q9DbGhqz5AZjfWA8L+yB3hypSbwj/moFGE+JNXrpB0o=; b=IUeSG26r+T269Yfz2/rMc9N3lH
	v/OTJ1i9OiqnTMREA93hy51vQ2HUyF/LxTv52CnvTloeL5UlIUYpUo2yihTr8ktuU7Cd2KoWq5wFf
	SMAtNJsLz64zNdbNunXIRadxUh+PX3lh9eqtM9KCRih0JsVyrgNxszxzhIM8LVy5E2LeJSNW75H7Z
	dYVIB6V0cZhNw3bmDEraxyYvQqB5X5IhO8NxFqG0HffjCiXrBVsLHpmw1LvnBc7z77rk7J4qTiHfX
	NvjGJAuxfvHwjG0td/x+4CUp0E8+364zIIo9UNcPNZvV0Rn+ZXEw2crFIjEhQM8xcudIlJZTaSVwg
	Ey7/KgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiav-0028xZ-Gx; Tue, 19 Apr 2022 07:48:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiXW-0026pg-FH
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 07:44:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B13F66081114;
 Tue, 19 Apr 2022 09:44:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6LRon2-smQdu; Tue, 19 Apr 2022 09:44:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 34D8E6081119;
 Tue, 19 Apr 2022 09:44:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jpDpcPeI0wes; Tue, 19 Apr 2022 09:44:31 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 162756081114;
 Tue, 19 Apr 2022 09:44:31 +0200 (CEST)
Date: Tue, 19 Apr 2022 09:44:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Scott Zhang <macromarship@gmail.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <542373121.266606.1650354270993.JavaMail.zimbra@nod.at>
In-Reply-To: <20220419093317.7fe2ae6c@xps13>
References: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
 <20220414192413.0db7ef46@xps13>
 <CABy3iKzERYHD8Kj+NNnPdAxTxO6ANwrUJGcJO77385RtY1ddGg@mail.gmail.com>
 <20220415102929.5c654933@xps13>
 <CABy3iKwAVYkstq4=fg6cjh4VRAzSwGa7JNy494Ag69e_t9UTjA@mail.gmail.com>
 <20220419093317.7fe2ae6c@xps13>
Subject: Re: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
Thread-Index: izsvU/7jKU+5bleqKvRIX7Jgzqx+TA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_004446_827486_C9245959 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IERpZCB5b3UgcnVuIHRoZSB2YXJpb3Vz
IG5hbmQgdGVzdHMgYmVzaWRlcyBuYW5kYml0ZXJycz8gSWYgdGhleSBhbGwKPiBwYXNzIHRoZW4g
bWF5YmUgUmljaGFyZCB3aWxsIGJlIG1vcmUgaGVscGZ1bCB0aGFuIEkgYW0uLi4KClsuLi5dCiAK
Pj4gCj4+IEJ1dCBJIG5vdGljZWQgdGhlIGx6byBkZWNvbXByZXNzIGVycm9yIGlzIHN0aWxsIHRo
ZXJlLgo+PiBJIGRpZCAgZm9sbG93aW5nIGFjdGlvbnMgdG8gdGVzdC4KPj4gL2Rldi9tdGQzIGlz
IG1vdW50ZWQgb24gL29wdCB1c2luZyB1Ymlmcy4KPj4gdGFyIHpjdmYgL3Jvb3Qvb3B0LnRhci5n
eiAvb3B0ICAoZG9uZSB3aXRob3V0IGVycm9yKQo+PiBmb3JtYXQgL29wdC4KPj4gdGFyIHp4dmYg
L3Jvb3Qvb3B0LnRhci5neiAtQyAvCgpIb3cgZGlkIHlvdSBjcmVhdGUgdWJpZnM/CgpEb2VzIHlv
dXIgbmFuZCBkcml2ZXIgcGFzcyB1YmkgdGVzdHM/Cgo+PiBUaGVuIHdoZW4gSSBydW4gcGhwIHBy
b2dyYW0gd2hpY2ggaXMgaW4gb3B0LiBJIHNhdyBkbWVzZwo+PiBbICAxMTguODUwMDAwXSBVQklG
UyBlcnJvciAodWJpMDowIHBpZCAxNTI2KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4+IGRl
Y29tcHJlc3MgMjI5MyBieXRlcywgY29tcHJlc3NvciBsem8sIGVycm9yIC0yMgo+PiBbICAxMTgu
ODYwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTI2KTogZG9fcmVhZHBhZ2U6IGJhZCBk
YXRhCj4+IG5vZGUgKGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4+IFsgIDExOC44NzAwMDBdIFVCSUZT
IGVycm9yICh1YmkwOjAgcGlkIDE1MjYpOiBkb19yZWFkcGFnZTogY2Fubm90IHJlYWQKPj4gcGFn
ZSAxNSBvZiBpbm9kZSAzOTYsIGVycm9yIC0yMgo+PiBbICAxMTguODgwMDAwXSBVQklGUyBlcnJv
ciAodWJpMDowIHBpZCAxNTI2KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4+IGRlY29tcHJl
c3MgMjI5MyBieXRlcywgY29tcHJlc3NvciBsem8sIGVycm9yIC0yMgo+PiBbICAxMTguOTAwMDAw
XSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTI2KTogZG9fcmVhZHBhZ2U6IGJhZCBkYXRhCj4+
IG5vZGUgKGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4+IFsgIDExOC45MDAwMDBdIFVCSUZTIGVycm9y
ICh1YmkwOjAgcGlkIDE1MjYpOiBkb19yZWFkcGFnZTogY2Fubm90IHJlYWQKPj4gcGFnZSAxNSBv
ZiBpbm9kZSAzOTYsIGVycm9yIC0yMgo+PiBbICAxMTguOTIwMDAwXSBVQklGUyBlcnJvciAodWJp
MDowIHBpZCAxNTI2KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4+IGRlY29tcHJlc3MgMjI5
MyBieXRlcywgY29tcHJlc3NvciBsem8sIGVycm9yIC0yMgo+PiBbICAxMTguOTMwMDAwXSBVQklG
UyBlcnJvciAodWJpMDowIHBpZCAxNTI2KTogZG9fcmVhZHBhZ2U6IGJhZCBkYXRhCj4+IG5vZGUg
KGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4+IFsgIDExOC45NDAwMDBdIFVCSUZTIGVycm9yICh1Ymkw
OjAgcGlkIDE1MjYpOiBkb19yZWFkcGFnZTogY2Fubm90IHJlYWQKPj4gcGFnZSAxNSBvZiBpbm9k
ZSAzOTYsIGVycm9yIC0yMgo+PiAKPj4gSSByZW1vdmVkIHRoZSB1Ymlmc19kdW1wX25vZGUgY2Fs
bCB0byBhdm9pZCBtYW55IGR1bXAgdGV4dC4gVGhlCj4+IHByb2JsZW0gaXMgd2hlbiBJIHJ1biBw
aHAgcHJvZ3JhbSwgbG90cyBvZiBhYm92ZSBsb2dzIGR1bXBlZC4KPj4gQnV0IEkgZG9uJ3Qgc2Vl
IGFueSBlZmZlY3Qgb2YgdGhlIGFib3ZlIGxvZ3MuIHRoZSBwcm9ncmFtIHNlZW1zIHJ1bm5pbmcu
Cj4+IElzIHRoZXJlIGEgcG9zc2liaWxpdHkgdGhlIHVuZGVybHlpbmcgbmFuZCBkcml2ZXIgZGF0
YSBpcyBvaywgYnV0IHRoZQo+PiBsem8gY29tcHJlc3MvZGVjb21wcmVzcyBjb2RlIGhhcyBidWdz
ID8gIEkgYW0gcnVubmluZyBsaW51eC01LjQueQo+PiBjbG9uZWQgZnJvbSBrZXJuZWwub3JnLgoK
RG9lcyB0aGUgcHJvYmxlbSBvbmx5IGhhcHBlbiB3aXRoIGx6bz8KClBsZWFzZSByZS10ZXN0IHdp
dGggbm8gY29tcHJlc3NvciBlbmFibGVkIChjb21wcj1ub25lKSBhbmQgYWxzbyBtb3VudCB3aXRo
CnRoZSBjaGtfZGF0YV9jcmMgbW91bnQgb3B0aW9uLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
