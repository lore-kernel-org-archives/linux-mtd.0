Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7D7C07E9B
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 06:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9218610F7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 06:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9218610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tu4t7Lwij/DJQ9V3WC2MUQW00KB/fXK9iJhowmWT3xs=; b=C7XYRaAOHbc03LGVFtvRWzoZeU
	jaz2RdpUsRS1pto+qzb+gpsQhtqj6I3l+Pkt8nLGxYseP8qyLnnFtha3fqxkHwU1FmyYqvfElsTLr
	+Ak388cnQ/4iIkrbCpmNNqUrM23FtZQsgwgZgACAi3MhPs61qvmyOSfVivC3o99K4qJTyJrAuk+4s
	9+7zxck10HniQoEaVU8/6aJpoF8B4jC+ZUPKK74CQ133D9xl4AX0fKXZBtQ0/3QwuHJaaHlZFqaXn
	LaFooPjhGSy5zMPwC0zGOZgkY4k/lPUTOOqtpOxwfiEE+2VHb7RU31w9Q/7mp3fgqTZ9TCKEIuLsh
	ekjfJOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5jQU-00C1if-L4; Tue, 20 Jul 2021 06:40:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5jQR-00C1ht-CK
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 06:40:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 38E546169BC2;
 Tue, 20 Jul 2021 08:40:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2vmFpKXdmr5S; Tue, 20 Jul 2021 08:40:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C12B36169BD2;
 Tue, 20 Jul 2021 08:40:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NPuSyuIQ7j5f; Tue, 20 Jul 2021 08:40:15 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 88A5B6169BC2;
 Tue, 20 Jul 2021 08:40:15 +0200 (CEST)
Date: Tue, 20 Jul 2021 08:40:15 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
Message-ID: <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
 <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
 <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF90 (Linux)/8.8.12_GA_3809)
Thread-Topic: How to get actual image size from MTD partition
Thread-Index: c6zZTS0QxRlvwgld28+UkRfD2UKnsA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_234019_612722_5B388DA3 
X-CRM114-Status: GOOD (  12.76  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlBpbnR1IEFnYXJ3YWwiIDxw
aW50dS5waW5nQGdtYWlsLmNvbT4KPiBPa2F5IHRoYW5rIHlvdS4KPiBXZSBoYXZlIHRyaWVkIGRt
LXZlcml0eSB3aXRoIHNxdWFzaGZzIChmb3Igb3VyIHJvb3RmcykgYnV0IHdlIGFyZQo+IGZhY2lu
ZyBzb21lIG1vdW50aW5nIGlzc3Vlcy4KPiBbLi4uXQo+IFsgICAgNC42OTc3NTddIGRldmljZS1t
YXBwZXI6IGluaXQ6IGFkZGluZyB0YXJnZXQgJzAgOTYxNjAgdmVyaXR5IDEKPiAvZGV2L210ZGJs
b2NrMzQgL2Rldi9tdGRibG9jazM5IDQwOTYgNDA5NiAxMjAyMCA4IHNoYTI1Ngo+IGQ3YjhhN2Qw
YzAxYjlhZWM4ODg5MzA4NDEzMTNhODE2MDNhNTBhMmE3YmU0NDYzMWM0YzgxMzE5N2E1MGQ2ODEK
PiBhZWUwODdhNWJlM2I5ODI5NzhjOTIzZjU2NmE5NDYxMzQ5NmI0MTdmMmFmNTkyNjM5YmM4MGQx
NDFlMzRkZmU3Jwo+IFsgICAgNC43MDQ3NzFdIGRldmljZS1tYXBwZXI6IHZlcml0eTogc2hhMjU2
IHVzaW5nIGltcGxlbWVudGF0aW9uCj4gInNoYTI1Ni1nZW5lcmljIgo+IFsuLi5dCj4gWyAgICA0
LjcyNzM2Nl0gZGV2aWNlLW1hcHBlcjogaW5pdDogZG0tMCBpcyByZWFkeQo+IFsgICAgNC45MTI1
NThdIFZGUzogQ2Fubm90IG9wZW4gcm9vdCBkZXZpY2UgImRtLTAiIG9yCj4gdW5rbm93bi1ibG9j
aygyNTMsMCk6IGVycm9yIC01Cj4gCj4gVGhlIHNhbWUgd29ya3Mgd2l0aCBleHQ0IGVtdWxhdGlv
bi4KPiBTbywgbm90IHN1cmUgaWYgdGhlcmUgYXJlIGFueSBjaGFuZ2VzIG1pc3Npbmcgdy5yLnQu
IHNxdWFzaGZzIG9uIDQuMTQga2VybmVsID8KCkkgZG9uJ3Qga25vdy4KCj4gQW55d2F5cywgSSB3
aWxsIGNyZWF0ZSBhIHNlcGFyYXRlIHRocmVhZCBmb3IgZG0tdmVyaXR5IGlzc3VlIGFuZCBrZWVw
Cj4gdGhpcyB0aHJlYWQgc3RpbGwgb3BlbiBmb3IgVUJJIGltYWdlIHNpemUgaXNzdWUuCj4gV2Ug
bWF5IHVzZSBkbS12ZXJpZnkgZm9yIHJvb3RmcyBkdXJpbmcgYm9vdGluZywgYnV0IHN0aWxsIHdl
IG5lZWQgdG8KPiBwZXJmb3JtIGludGVncml0eSBjaGVjayBmb3Igb3RoZXIgbmFuZCBwYXJ0aXRp
b25zIGFuZCBVQkkgdm9sdW1lcy4KPiAKPiBTbywgaW5zdGVhZCBvZiBjYWxjdWxhdGluZyB0aGUg
Y2hlY2tzdW0gZm9yIHRoZSBlbnRpcmUgcGFydGl0aW9uLCBpcwo+IGl0IHBvc3NpYmxlIHRvIHBl
cmZvcm0gY2hlY2tzdW0gb25seSBiYXNlZCBvbiB0aGUgaW1hZ2Ugc2l6ZSA/Cj4gUmlnaHQgbm93
LCB3ZSBhcmUgc3RpbGwgZXhwbG9yaW5nIHdoYXQgYXJlIHRoZSBiZXN0IHBvc3NpYmxlCj4gbWVj
aGFuaXNtcyBhdmFpbGFibGUgZm9yIHRoaXMuCgpJIHN0aWxsIGRvbid0IGZ1bGx5IHVuZGVyc3Rh
bmQgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBhY2hpZXZlLgpJcyBpdCBhYm91dCBjcnlwdG9ncmFw
aGljIGludGVncml0eSBvZiB5b3VyIHN0b3JhZ2Ugb3IgZGV0ZWN0aW5nCmVycm9ycyBhZnRlciB0
aGUgZmxhc2hpbmcgcHJvY2Vzcz8KCkJ1dCBsZXQgbWUgYWR2ZXJ0aXNlIHViaWJsb2NrIGEgc2Vj
b25kIHRpbWUuIElmIHlvdSBwbGFjZSB5b3VyIHNxdWFzaGZzIG9uCmEgVUJJIHN0YXRpYyB2b2x1
bWUsIFVCSSBrbm93cyB0aGUgZXhhY3QgbGVuZ3RoIGFuZCB5b3UgY2FuIGNoZWNrc3VtIGl0Cm1v
cmUgZWFzaWx5LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
