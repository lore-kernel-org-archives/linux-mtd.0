Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CABC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlQNHpUS2AAcJrazryD8BKTsPwCvLyJOoVqDSlj14Qk=; b=UifiKkoKL1uY1K
	uvA17agEEHXZzhafjWOKMpcjLM5DoqvKm/LIt9pdpBA0SYeNYqa4bYS3RqV6Z4g5sKy/fVaAcK5tl
	VQoEQyGvK5cMIl+FsVCadKoXDI7vWKoq9mr5BJ0zeN81DC8QPtT8n26vHbLoalpvtqIP2PYBMFt24
	3luG4zDN0oyh5TR+ZfvcoaKxBuAo28w/LLVqjpi9rQPpZ4xdt54IFfKAqoLVuPFU0qMmXuoKWHXZm
	sNQO03rkX+smdfe1vXNMb9+xdJkq0c1soTCJR63VtiDBVp5D1fYPp3l/HKt+nzeDrvNKKAgVsuvyd
	6zawKy74qYKOANGCcYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBfDv-001DkE-83; Sun, 23 Jan 2022 15:56:11 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBf2t-0019pB-50
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:44:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 53F29100004;
 Sun, 23 Jan 2022 15:44:42 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:44:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: kyungmin.park@samsung.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: onenand: Check for error irq
Message-ID: <20220123164441.4ac98b08@xps13>
In-Reply-To: <20220104162658.1988142-1-jiasheng@iscas.ac.cn>
References: <20220104162658.1988142-1-jiasheng@iscas.ac.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_074447_396357_F7076693 
X-CRM114-Status: UNSURE (   9.95  )
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

SGkgSmlhc2hlbmcsCgpqaWFzaGVuZ0Bpc2Nhcy5hYy5jbiB3cm90ZSBvbiBXZWQsICA1IEphbiAy
MDIyIDAwOjI2OjU4ICswODAwOgoKPiBGb3IgdGhlIHBvc3NpYmxlIGZhaWx1cmUgb2YgdGhlIHBs
YXRmb3JtX2dldF9pcnEoKSwgdGhlIHJldHVybmVkIGlycQo+IGNvdWxkIGJlIGVycm9yIG51bWJl
ciBhbmQgd2lsbCBmaW5hbGx5IGNhdXNlIHRoZSBmYWlsdXJlIG9mIHRoZQo+IHJlcXVlc3RfaXJx
KCkuCj4gQ29uc2lkZXIgdGhhdCBwbGF0Zm9ybV9nZXRfaXJxKCkgY2FuIG5vdyBpbiBjZXJ0YWlu
IGNhc2VzIHJldHVybgo+IC1FUFJPQkVfREVGRVIsIGFuZCB0aGUgY29uc2VxdWVuY2VzIG9mIGxl
dHRpbmcgcmVxdWVzdF9pcnEoKSBlZmZlY3RpdmVseQo+IGNvbnZlcnQgdGhhdCBpbnRvIC1FSU5W
QUwsIGV2ZW4gYXQgcHJvYmUgdGltZSByYXRoZXIgdGhhbiBsYXRlciBvbi4KPiBTbyBpdCBtaWdo
dCBiZSBiZXR0ZXIgdG8gY2hlY2sganVzdCBub3cuCj4gCj4gRml4ZXM6IDJjMjIxMjBmYmQwMSAo
Ik1URDogT25lTkFORDogaW50ZXJydXB0IGJhc2VkIHdhaXQgc3VwcG9ydCIpCj4gU2lnbmVkLW9m
Zi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5nQGlzY2FzLmFjLmNuPgo+IC0tLQoKQXBwbGll
ZCB0byBuYW5kL25leHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
