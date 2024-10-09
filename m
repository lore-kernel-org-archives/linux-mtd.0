Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F0DCED609
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 06:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i2NbNwgoswja3kahkmKRlzt2TLLoNt26jUjVHXGEErk=; b=ree0Esk5dSntU5qYsiHp0bM+OU
	b8j35Y8kNShbjqB4bWzWBBPEsYlPrbq60LizAG6TKaIb1hlEJcZfcmCyqp0WHNcL4BghTVIB8Yr31
	+ip/h9g6Z3pxiLyAqxgioIQAkE7BliVL7KDOl/NS3PiDfst0/4dIXQraeaotBUjmFgv8sk/RnudI3
	0GvSAPscSDkEHLj6eif7Mgs3BhFfYkugjJBjckjqn4QoNVVai5pv/4t2XsJIyXvfrTIi0KNZGvU4U
	MB0CBvuk1DiBX60mjdVQRC+W50At9otGlwsFieffIndnuypldIPDacTMGoOh11Ns6x4XF7272izSE
	sXFZWS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syPnr-0000000825Q-3E5j;
	Wed, 09 Oct 2024 06:04:07 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syPno-0000000822h-2bTD
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 06:04:06 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 44441294730;
	Wed,  9 Oct 2024 08:03:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SDQz2X6cGIl0; Wed,  9 Oct 2024 08:03:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 835172A87E7;
	Wed,  9 Oct 2024 08:03:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ay6qInBW_KBx; Wed,  9 Oct 2024 08:03:52 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 51353294730;
	Wed,  9 Oct 2024 08:03:52 +0200 (CEST)
Date: Wed, 9 Oct 2024 08:03:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Benedikt Spranger <b.spranger@linutronix.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <883601802.30668.1728453832223.JavaMail.zimbra@nod.at>
In-Reply-To: <0840be30-63bc-449d-a9a4-c4e6b54c8885@huawei.com>
References: <20241008133342.1937674-1-b.spranger@linutronix.de> <0840be30-63bc-449d-a9a4-c4e6b54c8885@huawei.com>
Subject: Re: [PATCH 1/1] ubifs: Try to recover from missing znode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF131 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Try to recover from missing znode
Thread-Index: I2FbrW4jE5dKP7zIOPm0UuQ/GQmFIA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_230404_833270_E2BDB97C 
X-CRM114-Status: UNSURE (   7.23  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiQmVuZWRpa3QgU3ByYW5nZXIiIDxiLnNwcmFu
Z2VyQGxpbnV0cm9uaXguZGU+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3Jn
PiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBHZXNlbmRldDogTWl0dHdvY2gsIDkuIE9r
dG9iZXIgMjAyNCAwNDoyMzowMgo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggMS8xXSB1YmlmczogVHJ5
IHRvIHJlY292ZXIgZnJvbSBtaXNzaW5nIHpub2RlCgo+IOWcqCAyMDI0LzEwLzggMjE6MzMsIEJl
bmVkaWt0IFNwcmFuZ2VyIOWGmemBkzoKPj4gQWZ0ZXIgcG93ZXJjdXQgb24gYSBzeXN0ZW0gdXNp
bmcgdWJpZnMgbW91bnRpbmcgZmFpbGVkOgo+PiAKPj4gMjAyNC0wOS0zMFQxMjozODoyNi44ODA0
ODcrMDI6MDAgc29uamEga2VybmVsOiBVQklGUyBlcnJvciAodWJpMDowIHBpZCAyMTc4KToKPj4g
dWJpZnNfcmVhZF9ub2RlIFt1Ymlmc106IGJhZCBub2RlIHR5cGUgKDI1NSBidXQgZXhwZWN0ZWQg
OSkKPj4gMjAyNC0wOS0zMFQxMjozODoyNi44ODA1MDYrMDI6MDAgc29uamEga2VybmVsOiBVQklG
UyBlcnJvciAodWJpMDowIHBpZCAyMTc4KToKPj4gdWJpZnNfcmVhZF9ub2RlIFt1Ymlmc106IGJh
ZCBub2RlIGF0IExFQiAxMDM6NDY5MjAsIExFQiBtYXBwaW5nIHN0YXR1cyAwCj4+IDIwMjQtMDkt
MzBUMTI6Mzg6MjYuODgwNTA5KzAyOjAwIHNvbmphIGtlcm5lbDogTm90IGEgbm9kZSwgZmlyc3Qg
MjQgYnl0ZXM6Cj4+IDIwMjQtMDktMzBUMTI6Mzg6MjYuODgwNTEwKzAyOjAwIHNvbmphIGtlcm5l
bDogMDAwMDAwMDA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+IGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+IC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Lgo+PiAKPj4gV2hpbGUgdHJhdmVyc2luZyBvdmVyIHpicmFuY2hlcyBkdXJpbmcgdGhlIGpvdXJu
YWwgcmVwbGF5IG9uZSB6YnJhbmNoCj4+IHBvaW50cyB0byBhIHpub2RlLCB3aGljaCB3YXMgbm90
IHdyaXR0ZW4gdG8gdGhlIGZsYXNoIGFuZCB0aGVyZWZvcmUgdGhlCj4+IGZsYXNoIGlzIGVtcHR5
Lgo+IAo+IFVCSUZTIGd1YXJhbnRlZXMgdHdvIHRoaW5ncyBmb3Igem5vZGVzOgo+IDEpIGFsbCBp
bmRleCBub2RlcyhpbiBjb21taXQgc2VxIE4pIGFyZSB3cml0dGVuIG9uIGZsYXNoIGJlZm9yZSBt
YXN0ZXIKPiBub2Rlcyhmb3IgY29tbWl0IHNlcSBOKSBhcmUgd3JpdHRlbi4KPiAyKSBhbGwgaW5k
ZXggbm9kZXMoaW4gY29tbWl0IHNlcSBOKSB3b24ndCBiZSBlcmFzZWQgZnJvbSBmbGFzaCBiZWZv
cmUKPiBtYXN0ZXIgbm9kZXMoZm9yIGNvbW1pdCBzZXEgTisxKSBhcmUgd3JpdHRlbi4KPiBTbywg
SSBkb24ndCB1bmRlcnN0YW5kIHRoYXQgd2h5IHpub2RlcyBub3QgZXhpc3QgZHVyaW5nIGpvdXJu
YWwgcmVwbGF5aW5nPwoKSW4gYWRkaXRpb24gdG8gdGhhdCwgaXMganVzdCBvbmUgem5vZGUgbWlz
c2luZyBvciBhcmUgbGFyZ2VyIHBhcnRzIG9mIHRoZSBmbGFzaAplbXB0eT8KClRoYW5rcywKLy9y
aWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
