Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676B6D5C0CD
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Dec 2025 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7W4/s5Ph0Uvbv8iOfrt2xlNHJY8eAULTOB6D8rjtg0=; b=B3wQv1vnklU8E8
	2eYj9R6EFBfabSU33EPqt6j0OO7v7ivQvd3cLCk8QU8K7Wzzgc5zs9hN4f3VMJoEQf3zpoSyzGvd3
	BCNEU+xqCaReT0oV4qWl9zLAeeHi7POlgStoN0CMi99TpaQJ6Ao8jQDZNpVHQhes8jpydTJabcKhz
	WK4fHk+Z9yUobrcV2yQoy1mW7ZA+tBDSgy2xYxjUEZ5aJq3dAVhTlcJHKY+Zl3qF42F/745v3E039
	NpNE5HRf+H2Wiwuc6wMXPb4TtNFcQ/G1/rwV5Wls6z7AhtSaxRGkwPNlRHMYm1l0u2XXiaJ/ON2Ex
	ZpyyY/o5wolCvstfYvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ4p-00000004tdD-1QGb;
	Tue, 16 Dec 2025 08:06:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ4f-00000004tc4-2fk4
	for linux-mtd@lists.infradead.org;
	Tue, 16 Dec 2025 08:06:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A39704E41B69;
	Tue, 16 Dec 2025 08:06:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71CAA6071C;
	Tue, 16 Dec 2025 08:06:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E92E511942F8B;
	Tue, 16 Dec 2025 09:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765872379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mnPu3NaHdaqZPL8dQQmj9+t+nxocDNQkhh5BcD8Z/gI=;
	b=HrcE/nmsHuBxRg2BtHY9NPWXttK4ycNK2CvFdTGa2R3FroXElfzg5ZvWPL/4BiQekvC5zd
	bGT3OZI2CcuwwoexfBDYLj+nxU/QLg3zWYLKTFBqYyfH85uFF158xWpWMlxH9BQgnwT0ET
	aTZcvpeiV/BZlvvBpNsjwFNqbiE3xGCT6mlTNv7R0mmdWX+9zB7S80Q2cxDbVmYN6oOMSe
	ZeaISxFdLt4fuawXDCyfFiTuS0IyaqwhTTB2tRd3b0rZ78FJDMH2Qd0onE4wir9NlPlBvG
	8LUZSbExXljzhDu3w69RenFt8KtvHJlATSxCEzTLHiYA0O1FkQ6DNI+triLHhg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: sm_ftl: use strscpy() in sm_attr_show()
In-Reply-To: <20251206035313.10190-1-dharanitharan725@gmail.com>
	(Dharanitharan R.'s message of "Sat, 6 Dec 2025 03:53:13 +0000")
References: <20251206035313.10190-1-dharanitharan725@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 16 Dec 2025 09:06:16 +0100
Message-ID: <87ike6svev.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_000625_815406_B297AF1F 
X-CRM114-Status: UNSURE (   9.89  )
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

SGVsbG8sCgpPbiAwNi8xMi8yMDI1IGF0IDAzOjUzOjEzIEdNVCwgRGhhcmFuaXRoYXJhbiBSIDxk
aGFyYW5pdGhhcmFuNzI1QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEluIHNtX2Z0bC5jLCB0aGUgc21f
YXR0cl9zaG93KCkgZnVuY3Rpb24gY3VycmVudGx5IGNvcGllcwo+IGF0dHJpYnV0ZSBkYXRhIHVz
aW5nOgo+Cj4gICAgIHN0cm5jcHkoYnVmLCBzbV9hdHRyLT5kYXRhLCBzbV9hdHRyLT5sZW4pOwo+
ICAgICByZXR1cm4gc21fYXR0ci0+bGVuOwo+Cj4gVXNpbmcgc3RybmNweSgpIGNhbiBiZSB1bnNh
ZmUgYmVjYXVzZSBpdCBkb2VzIG5vdCBndWFyYW50ZWUKPiBhIE5VTCB0ZXJtaW5hdG9yIGlmIHRo
ZSBzb3VyY2UgbGVuZ3RoIGVxdWFscyB0aGUgYnVmZmVyIHNpemUuCj4gQWx0aG91Z2ggc21fYXR0
ci0+ZGF0YSBjb21lcyBmcm9tIGludGVybmFsIHN0cnVjdHVyZXMgYW5kCj4gaXMgTlVMLXRlcm1p
bmF0ZWQsIGl0IGlzIGNsZWFuZXIgYW5kIHNhZmVyIHRvIHVzZSBzdHJzY3B5KCksCj4gd2hpY2gg
Z3VhcmFudGVlcyBOVUwgdGVybWluYXRpb24gYW5kIGF2b2lkcyB6ZXJvLXBhZGRpbmcuCj4KPiBU
aGUgZGVzdGluYXRpb24gYnVmZmVyIGlzIFBBR0VfU0laRSBieXRlcywgd2hpY2ggaXMgc3VmZmlj
aWVudAo+IHRvIGhvbGQgc21fYXR0ci0+ZGF0YSB3aXRob3V0IHRydW5jYXRpb24uIFRoZSByZXR1
cm4gdmFsdWUKPiBvZiBzdHJzY3B5KCkgbWF0Y2hlcyB0aGUgZXhwZWN0ZWQgYmVoYXZpb3Igb2Yg
c21fYXR0cl9zaG93KCkuCj4KPiBSZXBsYWNlIHRoZSBzdHJuY3B5KCkgY2FsbCB3aXRoOgo+Cj4g
ICAgIHJldHVybiBzdHJzY3B5KGJ1Ziwgc21fYXR0ci0+ZGF0YSwgUEFHRV9TSVpFKTsKPgo+IFNp
Z25lZC1vZmYtYnk6IERoYXJhbml0aGFyYW4gUiA8ZGhhcmFuaXRoYXJhbjcyNUBnbWFpbC5jb20+
CgpUaGlzIGNvbW1pdCB3b24ndCBhcHBseSwgcGxlYXNlIHJlc2VuZCBiYXNlZCBvbiB2Ni4xOS1y
YzEuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
