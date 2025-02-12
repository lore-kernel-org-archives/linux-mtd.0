Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D999C021A0
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jTTK6QSmIYif4T5fKN9xa/Z9Yv2hILT7W1RgxMihbEU=; b=V5iOMmNVnHf5mgofkjUHRnTStK
	xzAL5wawrN1Ej0kteIC3yZArekIqyHk8jEG0lS9S8tiqHZln2K7m+cuM5gvqBcNiOcqBY0248UBx+
	MwhwWAij8LbOL9k9OQ1GLhegPEGEaQLMW6X2yzrnSCXSVaPGbeLLLnCmWuNHELFs29hfzhmA7xZMt
	mBsF7B8bxY1nfbUQwdlWK/QulFij54vBTXW8611bC1LGI3K7j82B3Ai7ga+2MmDKBl2LEteGx0mtK
	Gr4CXqqQ3GNcB0+IsCRH2s64/uOvvGvQSUcERNoaeURjJAvk7SNr7dTxtAQ0IIrGsd83RrpPDBQCX
	E6VHpkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKku-00000008xMk-2ASY;
	Wed, 12 Feb 2025 21:58:52 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKkr-00000008xMF-1mkl
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 21:58:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 357372E612C;
	Wed, 12 Feb 2025 22:58:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id coYm_Np6a3Zy; Wed, 12 Feb 2025 22:58:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CF0862E6137;
	Wed, 12 Feb 2025 22:58:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4ILO1FcL_Gy8; Wed, 12 Feb 2025 22:58:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B1DB92E612C;
	Wed, 12 Feb 2025 22:58:43 +0100 (CET)
Date: Wed, 12 Feb 2025 22:58:43 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Ashley Herron <herroash@amazon.com>
Cc: alex@nextthing.co, boris brezillon <boris.brezillon@free-electrons.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, rdlee@amazon.com
Message-ID: <574215219.28176795.1739397523614.JavaMail.zimbra@nod.at>
In-Reply-To: <20250212204646.4400-1-herroash@amazon.com>
References: <1446764217-15021-1-git-send-email-richard@nod.at> <20250212204646.4400-1-herroash@amazon.com>
Subject: Re: [RFC] UBI statistics and bitrot interface
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF135 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBI statistics and bitrot interface
Thread-Index: qAC69IBIZRW7EH+9VR3i4juGj/YTvQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_135849_608473_9935350B 
X-CRM114-Status: GOOD (  10.54  )
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

QXNobGV5LAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFzaGxleSBI
ZXJyb24iIDxoZXJyb2FzaEBhbWF6b24uY29tPgo+PiBUaGlzIHNlcmllcyBhZGRzIG5ldyBpb2N0
bCgpcyB0byBVQkkgc3VjaCB0aGF0IHVzZXJzcGFjZSBjYW4gcXVlcnkKPj4gcmVhZC9lcmFzZSBj
b3VudGVycyBhbmQgdHJpZ2dlciByZS1yZWFkcy9zY3J1YmJpbmcgb2YgUEVCcy4KPj4gRXNwZWNp
YWxseSBmb3IgTUxDIE5BTkQgZmxhc2ggd2hlcmUgcmVhZCBkaXN0dXJiIGFuZCBkYXRhIHJldGVu
dGlvbgo+PiBpcyBhIGJpZyB0b3BpYyB0aGlzIGludGVyZmFjZSBjYW4gYmUgdXNlZCBieSBhcHBs
aWNhdGlvbnMgdG8gZm9zdGVyIHRoZSBOQU5ELgo+PiBQYXJhbGxlbCB0byB0aGlzIHNlcmllcyBh
dCBwYXRjaCBzZXJpZXMgYWdhaW5zdCBtdGQtdXRpbHMgaXMgc2VudCB0aGF0Cj4+IGltcGxlbWVu
dHMgYSB1YmloZWFsdGhkIHdoaWNoIG1ha2VzIHVzZSBvZiB0aGF0IGludGVyZmFjZS4KPiAKPiAK
Pj4gW1BBVENIIDEvNV0gVUJJOiBJbnRyb2R1Y2UgcHJlcGFyZV9lcmFzZV93b3JrKCkKPj4gW1BB
VENIIDIvNV0gVUJJOiBJbnRyb2R1Y2UgaW5fcHEoKQo+IEVxdWl2YWxlbnQgY2hhbmdlcyBwcmVz
ZW50LCBjYW4gYmUgZHJvcHBlZC4KPj4gW1BBVENIIDMvNV0gVUJJOiBFeHBvc2UgdGhlIGJpdHJv
dCBpbnRlcmZhY2UKPiBFcXVpdmFsZW50IGNoYW5nZXMgcHJlc2VudCwgY2FuIGJlIGRyb3BwZWQu
Cj4+IFtQQVRDSCA0LzVdIFVCSTogQWRkIGJhc2ljIHJlYWQgY291bnRlciBzdXBwb3J0Cj4+IFtQ
QVRDSCA1LzVdIFVCSTogRXhwb3NlIFVCSSBzdGF0aXN0aWNzIGludGVyZmFjZQo+IAo+IEhpIFJp
Y2hhcmQsIEkgYW0gd2FudGluZyB0byBhZGQgc3RhdGlzdGljIG1ldHJpY3MgdG8gVUJJIGRldmlj
ZXMgYW5kIG15Cj4gc2VhcmNoaW5nIGZvciBleGlzdGluZyBzb2x1dGlvbnMgYnJvdWdodCBtZSB0
byB0aGlzIHN0YWxlIHBhdGNoIHNldC4KPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGUgcGF0Y2hzZXQg
d2VudCBzdGFsZSBvdGhlciB0aGFuIGxvdyBwcmlvcml0eSB0byBnZXQgaXQKPiBtZXJnZWQgYW5k
IGl0IHdhcyBmb3Jnb3R0ZW4/IEFuZCB3b3VsZCB5b3UgY29uc2lkZXIgcmV2aXZpbmcgaXQgaWYg
eW91IGRvbid0Cj4gc2VlIGFueSBjb25jZXJucz8KPiBUaGFua3MsIEFzaGxleQoKSUlSQywgdGhp
cyBwYXRjaGVzIGhhdmUgYmVlbiBwYXJ0IG9mIG91ciBmYWlsZWQgYXBwcm9hY2ggdG8gc3VwcG9y
dCBNTEMKTkFORC4gT25lIHBhcnQgd2FzIGV4cG9zaW5nIGEgbW9yZSBvciBsZXNzIHNvcGhpc3Rp
Y2F0ZWQgaW50ZXJmYWNlCnRvIHVzZXJzcGFjZSBzdWNoIHRoYXQgYSBOQU5EIGZsYXNoIHNwZWNp
ZmljIGRhZW1vbiBjYW4gZm9zdGVyIHRoZSBjaGlwLgoKQWZ0ZXIgc29tZSBpdGVyYXRpb25zLCB1
YmloZWFsdGhkIHdhcyBib3JuLiBCdXQgaXQgZG9lcyBub3QgdXNlIGEgc3RhdGlzdGljcwppbnRl
cmZhY2UuCgpXaGF0IGtpbmQgb2YgbWV0cmljcyBhcmUgeW91IGxvb2tpbmcgZm9yPwpNYXliZSBz
b21lIGVCUEYvdHJhY2luZyBtYWdpYyB3aWxsIGFscmVhZHkgc2VydmUgeW91IGVub3VnaCBkYXRh
IHBvaW50cz8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
