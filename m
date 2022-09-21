Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A7AECAAD8
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Sep 2022 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sqc1PhkNWt4p4viTrxsmn1L7FMGWqnrUyZJ8n0dWXkA=; b=uk5RtF6ko6YgI/
	sEGtHndBQx0j7MaC7CwJReypH/m087fx5o3HMkejLayAz/27sIAdhw9FUpz60R7u0AgcNecTxN8G2
	wqo80d/UX8JYrkmMW49HEBayvNHX9mnkKOhqojxa85QSEJbPfN6cxBa1IvsqzWurUpYk59Nr0UFP/
	aZlBwBCH4XFJVdxU4WGbacGhrDyBUH6cW6lQmDqCK7WnmdqpWHxhD4xXZPzuN0Sfzb/YQWB8B3hps
	Gw9X45qZiWSOoq3C+DSU8XKZeezS7hpUj/G+EFjazvhzE7liDjcr4iJew1axpaEXP9bovrdpPVD1Y
	2nW2C7P0f5Fw7EjYW8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavLv-00A4lZ-MQ; Wed, 21 Sep 2022 08:45:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavII-00A2rS-D2
	for linux-mtd@bombadil.infradead.org; Wed, 21 Sep 2022 08:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+FYPd921wCb3Hw0Gw1AMiPwfquvJ657TAicyT/amlsM=; b=DQERYRm5y+xA0xPRbg3AmUVWsS
	GQeJ+9ngQ1o8kAKkCDvX7yIVMVgPVPttbwk46AB8LSg6oF4LjhUSC+aRtDlr/wVUoJP8vEF8aFZAF
	gjms3LMsavur7qfay5afXI9LDdsT6Fi3GImje2/9nEHtHxxthpCEsx91JiuMtNj4ZTPprRlnFTYdi
	i+zMIYvzGNBinFXPJ1QK5DRAS335JD/EDe/3o6p4vOBi/1QuZAxYuJH/Sy+zDyCWujYbd7zhw+2kq
	bZtGwN4y/eZcq3plDt9LHnPAr7OMATumhTWPD/ZgOYQXBW8+/S+qKKQR9jFupmt52DCH21vsfTKdu
	CWuMDndQ==;
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavI3-00EZBT-LQ
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2022 08:41:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AC06560005;
	Wed, 21 Sep 2022 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663749662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FYPd921wCb3Hw0Gw1AMiPwfquvJ657TAicyT/amlsM=;
	b=V5ajdX3t9nScn5SLkWX2VQarBba4dA3IC5uxkeGCspmBqi23+lPs053yKBZTkjoFKOfEBa
	MDlNEQLrhKtvRhMU5ONaspeUXTRUxgIKH8ELvgc3HgxTfLIEo37Wc0A+/Mw91o071xhWgw
	vCeS8h19IqUhpXQPP+9FksrBRCNFI/pGeq+trVC/VZEka7mLgnX1Iw0icrZ/LQopNBCrWo
	0IOpMi9AnbWH8v/2/Y6DIKfQmsXn4THgNF2cvzb2hzzmoMuDVgtvttWWJyWrecctxjLyU4
	O2nWIkwTloEnDcrc6EELlHOtrFbc8Bff6ZtAAV0tVq4cA6OTJEtbh+eX34PiRQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] mtd: add ECC error accounting for each read request
Date: Wed, 21 Sep 2022 10:40:57 +0200
Message-Id: <20220921084057.733270-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629125737.14418-4-kernel@kempniu.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7bea6056927727f98f4efdd338f112f7517f05b5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094108_484360_09F777EC 
X-CRM114-Status: GOOD (  13.10  )
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

T24gV2VkLCAyMDIyLTA2LTI5IGF0IDEyOjU3OjM2IFVUQywgPT91dGYtOD9iP1RXbGphR0hGZ2lC
THhKbHdhV1hGaEE9PT89IHdyb3RlOgo+IEV4dGVuZCBzdHJ1Y3QgbXRkX3JlcV9zdGF0cyB3aXRo
IHR3byBuZXcgZmllbGRzIGhvbGRpbmcgdGhlIG51bWJlciBvZgo+IGNvcnJlY3RlZCBiaXRmbGlw
cyBhbmQgdW5jb3JyZWN0YWJsZSBlcnJvcnMgZGV0ZWN0ZWQgZHVyaW5nIGEgcmVhZAo+IG9wZXJh
dGlvbi4gIFRoaXMgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIHVsdGltYXRlbHkgcGFzc2luZyB0aG9z
ZSBjb3VudGVycwo+IHRvIHVzZXIgc3BhY2UsIHdoZXJlIHRoZXkgY2FuIGJlIHVzZWZ1bCB0byBh
cHBsaWNhdGlvbnMgZm9yIG1ha2luZwo+IGJldHRlci1pbmZvcm1lZCBjaG9pY2VzIGFib3V0IG1v
dmluZyBkYXRhIGFyb3VuZC4KPiAKPiBVbmxpa2UgJ21heF9iaXRmbGlwcycgKHdoaWNoIGlzIHNl
dCAtIGluIGEgY29tbW9uIGNvZGUgcGF0aCAtIHRvIHRoZQo+IHJldHVybiB2YWx1ZSBvZiBhIGZ1
bmN0aW9uIGNhbGxlZCB3aGlsZSB0aGUgTVREIGRldmljZSdzIG11dGV4IGlzIGhlbGQpLAo+IHRo
ZXNlIGNvdW50ZXJzIGhhdmUgdG8gYmUgbWFpbnRhaW5lZCBpbiBlYWNoIE1URCBkcml2ZXIgd2hp
Y2ggZGVmaW5lcwo+IHRoZSAnX3JlYWRfb29iJyBjYWxsYmFjayBiZWNhdXNlIHRoZSBzdGF0aXN0
aWNzIG5lZWQgdG8gYmUgY2FsY3VsYXRlZAo+IHdoaWxlIHRoZSBNVEQgZGV2aWNlJ3MgbXV0ZXgg
aXMgaGVsZC4KPiAKPiBTdWdnZXN0ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBLxJlwaWXFhCA8a2Vy
bmVsQGtlbXBuaXUucGw+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
