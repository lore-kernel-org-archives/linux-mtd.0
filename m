Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB75C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo6bDa44J7qkMqp2qCJfflbdIlDU2YDgm4Qi1WRfAP4=; b=uSCYOzQqg22vsh
	GN++GD15i9Rzdtgy/l1MHPhafMs93Piz6k2nMOSnb6qH9XEGxeFW1m9KgxZM1HtCo507420C9zid2
	WLioe8la38ZfnJgBduM6rIKx5AJznbK+wJOIZfI1YgbuQ9ww8JrxsCEoq7DyUESTr9/TEu+/Z9Wye
	jpRA6yacBJ6Z6Udj1FZCxtDc3Mpxu7ME7KmH/6ZGAd3vaFC5hk+e/SDx1Sx5umxPGI7ZkQJKhqumo
	zhwqd6vwH0hs6Xs97tBSlTARE5b4ewIf3wG/WGEmWDpEYU8khQR8K4ofQzYBCQOTIe7m9CL3kVHs6
	62Grcedne3WaHg01kWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8vh-0000000Ct1p-3bEC;
	Wed, 15 Jan 2025 19:19:53 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8vf-0000000Ct1U-2lKt
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 19:19:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90337FF803;
	Wed, 15 Jan 2025 19:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736968788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGxe68+OYiU88VLdXsC3OZx40ILWPbVyn8LgJMnizvg=;
	b=gwtULTIVh9tFF1/u95Lxx1mYXOXMX7fbXsGrAqQHstSmM8Qx37kxdry6ofss07cai7xD2q
	Ny+Hfy42BfOA0wKGUZJzGxuKIi/BWadHD7w8oMUyq47oBCJy7jUZ+5TdPav7haYhocxAf0
	1MJppOGs7Zx1H3MyJr3xxBtXIp9lTpUaHB+GIcjGLErFCgzya3rOfUd4secCBvIupGmP6J
	SDdJ2fYczHTpslsn5/25XH+4Z+fWXsde316XrRPeMfCDOVVRD+bBAvl+ZcAGrnc6ZOSD3n
	GqS9GhV0BmfEfwpyqQIP1KrFwNoagKGLlFRAHupQBkN60vaD2W/mEqxgAOm3/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <quic_sridsn@quicinc.com>,
  <quic_mdalam@quicinc.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <p-mantena@ti.com>
Subject: Re: [PATCH 1/3] mtd: spinand: Define OctalIO ops
In-Reply-To: <20250102115110.1402440-2-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 2 Jan 2025 17:21:08 +0530")
References: <20250102115110.1402440-1-s-k6@ti.com>
	<20250102115110.1402440-2-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 20:19:48 +0100
Message-ID: <87a5brlwa3.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_111951_836826_13B08496 
X-CRM114-Status: UNSURE (   8.05  )
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

SGVsbG8gU2FudGhvc2gsCgpPbiAwMi8wMS8yMDI1IGF0IDE3OjIxOjA4ICswNTMwLCBTYW50aG9z
aCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IERlZmluZSB0aGUgbWFjcm9zIGZvciBP
Y3RhbC1iYXNlZCByZWFkIGFuZCBsb2FkIG9wZXJhdGlvbnMgb24gT1NQSQo+IE5BTkQgZmxhc2hl
cy4KCkZvbGxvd2luZyBhIHJlY2VudCBkaXNjdXNzaW9uIHdpdGggdGhlIFNQSS1OT1IgbWFpbnRh
aW5lcnMsIEkgcGxhbiBvbgpyZW5hbWluZyBzb21lIG9mIHRoZXNlIG1hY3JvcyB0byBtYWtlIHRo
ZW0gbW9yZSBjbGVhciByZWdhcmRpbmcgd2hhdAp0aGV5IGRvLiBUaGVyZSBhcmUgbWFueSB3YXlz
IHRvIGRvIG9jdGFsIHRyYW5zZmVycyAoZGF0YSBvbmx5LCBhZGRyZXNzCmFuZCBkYXRhLCBhbGwg
Y3ljbGVzLCBzZHIgdnMgZHRyLi4uKSBhbmQgd2Ugd2FudCB0byBjbGFyaWZ5IHRoYXQuCgpBbHNv
LCBJIGJlbGlldmUgdGhlcmUgYXJlIGZyZXF1ZW5jeSBsaW1pdGF0aW9ucyB3aGljaCBhcmUgbm90
IGNvcnJlY3RseQpkZWNsYXJlZCBhbmQgcG9zc2libHkgc29tZSBpc3N1ZXMgd2l0aCB0aGUgZHVt
bXkgY3ljbGVzIHdoaWNoIG5lZWQgdG8gYmUKY2xhcmlmaWVkLCBlc3BlY2lhbGx5IGluIHRoZSBX
aW5ib25kIGRyaXZlci4KCkkgcGxhbiBvbiB3b3JraW5nIG9uIHRoaXMgaW4gdGhlIG5leHQgd2Vl
a3MsIG9uY2UgbXkgaGVhZCBpcyBjbGVhciBhYm91dAp0aGUgc3BlY2lmaWNpdGllcyB3aXRoIHRo
ZXNlIGNoaXBzLiBJIHdpbGwgYWRkIHlvdSBpbiBDYy4KCkNoZWVycywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
