Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B07C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:16:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F30764D99
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F30764D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i5fVM7dgSchP2FMQFrACCH65fjAuYso3kWQtzq+rh2g=; b=R1UdRgq8OPumuQCcylMZrlwJq
	pFz2vgmV1xVxKvLsr6aFDrIaRr0+5frgDQZB4Nv40H/CjaUYFfet9FL8BnKyZiGhVTHIi12Ug59js
	0i/S6OHFpuxc4C7ruiHd0RM5RQzJ+l6qk2Rugu81jealhUdc3m3lWapK3WX66qNCuCleo2ZXhS+nU
	osMXrEAWLZp7aXeXaRUoEdAnwN1tFriyYc8R2hpwU4/1vloKjkVcyIxWGWMvx5Ags49fhMNLy/qpd
	9HGm1nxJimvF3epSJMFYaJGzG76+WHAB5mKVTLD/BBOrrMF8nz6BoFDqvhN7kn350Gaj9qO9An2cR
	J+4hpTJ/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9nSe-0003zQ-Tl; Wed, 10 Feb 2021 11:15:09 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9nSW-0003uz-R6
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 11:15:02 +0000
X-Originating-IP: 90.2.4.167
Received: from xps13 (aputeaux-654-1-105-167.w90-2.abo.wanadoo.fr [90.2.4.167])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 44AA11BF206;
 Wed, 10 Feb 2021 11:14:55 +0000 (UTC)
Date: Wed, 10 Feb 2021 12:14:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
Message-ID: <20210210121429.4fb5ecf3@xps13>
In-Reply-To: <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
 <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_061501_024354_8E22FFE0 
X-CRM114-Status: GOOD (  21.17  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlrbG9zLAoKTWlrbG9zIFN6ZXJlZGkgPG1pa2xvc0BzemVyZWRpLmh1PiB3cm90ZSBvbiBX
ZWQsIDEwIEZlYiAyMDIxIDExOjE2OjQ1CiswMTAwOgoKPiBPbiBUdWUsIEZlYiA5LCAyMDIxIGF0
IDEwOjM5IFBNIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOgo+ID4K
PiA+IE1pa2xvcywKPiA+Cj4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tICAKPiA+
ID4gSWYgeW91IGxvb2sgYXQgZnVzZV9kb19pb2N0bCgpIGl0IGRvZXMgdmFyaWFibGUgbGVuZ3Ro
IGlucHV0IGFuZAo+ID4gPiBvdXRwdXQgYXQgdGhlIHNhbWUgdGltZS4gIEkgZ3Vlc3MgeW91IG5l
ZWQgc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhhdC4gIAo+ID4KPiA+IEknbSBub3Qgc3VyZSB3aGV0
aGVyIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkuCj4gPgo+ID4gSW4gTVVTRSBvbmUgdXNlIGNhc2Ug
d291bGQgYmUgYXR0YWNoaW5nIHR3byBkaXN0aW5jdCAodmFyaWFibGUgbGVuZ3RoKSBidWZmZXJz
IHRvIGEKPiA+IHNpbmdsZSBGVVNFIHJlcXVlc3QsIGluIGJvdGggZGlyZWN0aW9ucy4KPiA+IElm
IEkgcmVhZCBmdXNlX2RvX2lvY3RsKCkgY29ycmVjdGx5LCBpdCBhdHRhY2hlcyBhbHdheXMgYSBz
aW5nbGUgYnVmZmVyIHBlciByZXF1ZXN0Cj4gPiBidXQgZG9lcyBtdWx0aXBsZSByZXF1ZXN0cy4g
IAo+IAo+IFJpZ2h0Lgo+IAo+ID4gSW4gTVVTRSB3ZSBjb2xkIGdvIHRoZSBzYW1lIHBhdGggYW5k
IGlzc3VlIHVwIHRvIHR3byByZXF1ZXN0cy4KPiA+IE9uZSBmb3IgaW4tYmFuZCBhbmQgb3B0aW9u
YWxseSBhIHNlY29uZCBvbmUgZm9yIHRoZSBvdXQtb2YtYmFuZCBkYXRhLgo+ID4gSG1tbT8gIAo+
IAo+IERvZXMgaW4tYmFuZCBhbmQgT09CIGRhdGEgbmVlZCB0byBiZSBoYW5kbGVkIHRvZ2V0aGVy
PwoKU2hvcnQgYW5zd2VyOiB5ZXMuCgo+IElmIHNvLCB0aGVuIHR3byByZXF1ZXN0cyBpcyBub3Qg
YSBnb29kIG9wdGlvbi4KCk1vcmUgZGV0YWlsZWQgYW5zd2VyOgoKVGhlcmUgaXMgYSB0eXBlIG9m
IE1URCBkZXZpY2UgKE5BTkQgZGV2aWNlcykgd2hpY2ggYXJlIGNvbXBvc2VkLCBmb3IKZWFjaCBw
YWdlLCBvZiBYIGluLWJhbmQgYnl0ZXMgcGx1cyBZIG91dC1vZi1iYW5kIG1ldGFkYXRhIGJ5dGVz
LgoKQWNjZXNzaW5nIGVpdGhlciB0aGUgaW4tYmFuZCBkYXRhLCBvciB0aGUgb3V0LW9mLWJhbmQg
ZGF0YSwgb3IgYm90aCBhdAp0aGUgc2FtZSB0aW1lIGFyZSBhbGwgdmFsaWQgdXNlIGNhc2VzLgoK
KiBSZWFkIG9wZXJhdGlvbiBkZXRhaWxzOgogIEZyb20gYSBoYXJkd2FyZSBwb2ludCBvZiB2aWV3
LCB0aGUgb3V0LW9mLWJhbmQgZGF0YSBpcyAoYWxtb3N0KQogIGFsd2F5cyByZXRyaWV2ZWQgd2hl
biB0aGUgaW4tYmFuZCBkYXRhIGlzIHJlYWQgYmVjYXVzZSBpdCBjb250YWlucwogIG1ldGEtZGF0
YSB1c2VkIHRvIGNvcnJlY3QgZXZlbnR1YWwgYml0ZmxpcHMuIEluIHRoaXMgY2FzZSwgaWYgYm90
aAogIGFyZWFzIGFyZSByZXF1ZXN0ZWQsIGl0IGlzIGhpZ2hseSBub24tZWZmaWNpZW50IHRvIGRv
IHR3byByZXF1ZXN0cywKICB0aGF0J3Mgd2h5IHRoZSBNVEQgY29yZSBhbGxvd3MgdG8gZG8gYm90
aCBhdCB0aGUgc2FtZSB0aW1lLgoqIFdyaXRlIG9wZXJhdGlvbiBkZXRhaWxzOgogIEV2ZW4gd29y
c2UsIGluIHRoZSB3cml0ZSBjYXNlLCB5b3UgKm11c3QqIHdyaXRlIGJvdGggYXQgdGhlIHNhbWUK
ICB0aW1lLiBJdCBpcyBwaHlzaWNhbGx5IGltcG9zc2libGUgdG8gZG8gb25lIGFmdGVyIHRoZSBv
dGhlciAoc3RpbGwKICB3aXRoIGFjdHVhbCBoYXJkd2FyZSwgb2YgY291cnNlKS4KClRoYXQgaXMg
d2h5IGl0IGlzIHByZWZlcmFibGUgdGhhdCBNVVNFIHdpbGwgYmUgYWJsZSB0byBhY2Nlc3MgYm90
aCBpbgphIHNpbmdsZSByZXF1ZXN0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
