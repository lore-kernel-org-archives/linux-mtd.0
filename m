Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C4606A321
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1yReolsE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FaJl/n5C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S25+uSrHJ0yxm5IZLRpUMxZRqUuAPTM2BWp5DUivkqM=; b=1yReolsEAYM3wjM4KXZLE9bFHj
	2KiUgDa40A9Ni/cGWfq5ExgZfUKG+9zuOjHuGT5Yw5aR9ODObxJCklfzbmGLdHP4X3NCHEUy6Z7AO
	hGrbVnZ3zribXexDwlbCTQOUWw+1l5cv16j5EWx4Slv/W+5oOJSCPURYt+SOK3ZpUgH5PAo8o1w4m
	yjQfH0m17BBjYFD1e7uSeEvT4qB8LAXt2x2/6Ta0/ecU4pCR0W2oQkiJ27aLTGLq3f60U2M3mjA6Q
	yU9ECfP/zu8DC4q46BzhOh0MjxBsMfhqa1lITi3oVDcL/OM3PM8mzoCrr2JBPe9tyweosQ8qEjiy9
	r6CN3v1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQASu-0000000GjZc-3DUN;
	Sun, 08 Nov 2026 21:30:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQASt-0000000GjZK-2INx
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F83C43DCE;
	Sun,  8 Nov 2026 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47CA1F0089F;
	Sun,  8 Nov 2026 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794173415;
	bh=3jn5pkZgvPagIdqth3LqnFSzG3n+vtuZxfeYuHFtGeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FaJl/n5ChXfgNt1CKccpcPg5KaBMsaFU/aTMGhzb8XrrNfx65psUA1YPks4NCbWSO
	 Yj38F+JmJbUW2zoKXA2vQ925XZg+0RDrqy0asRUioDERvWUXFtkDWJsizuvz7CgNc1
	 SzHyfQ7bzmCKPQlw8rDV49+w0IiSP5wbr0V7HSVN+WBIF7GHAnD5VYI+luywiKPHXj
	 Hz7owVL5J2ZLvzWPzpvSlhv+yKm4ppxFh/b7UGgEdHkNmays0MfYq0CLraQBj8I3/Y
	 IO47KifyhU4XjCO9k0TJ8aPfANRTrvRfJgSnXf2iTfcixptT+EKNtXDcI61HexO3RL
	 CWjotOprfvJXg==
Message-ID: <sashiko-outbox-204077@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: leave the device type unset when naming fails
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Jens
 Axboe" <axboe@kernel.dk>, "Jan Kara" <jack@suse.cz>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261108-submit-mtd-devname-retry-v1-v1-1-a67f332c54dd@gmail.com>
References: <20261108-submit-mtd-devname-retry-v1-v1-1-a67f332c54dd@gmail.com>
Date: Sun, 08 Nov 2026 21:30:14 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiBpbmFjY3VyYXRlIEZp
eGVzIHRhZyBpbiBjb21taXQgbWVzc2FnZSBmb3IgYWRkX210ZF9kZXZpY2UoKQotLQoKY29tbWl0
IGU3NmJiZWJiM2M1NGFjNDViY2NjZmNmOWZmNGE5MDIxYzNhYzBlYWMKQXV0aG9yOiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCj4gbXRkOiBsZWF2ZSB0aGUgZGV2
aWNlIHR5cGUgdW5zZXQgd2hlbiBuYW1pbmcgZmFpbHMKPgo+IGFkZF9tdGRfZGV2aWNlKCkgdXNl
cyBkZXYudHlwZSB0byByZWplY3QgYSBzZWNvbmQgcmVnaXN0cmF0aW9uIG9mIHRoZQo+IHNhbWUg
TVRELiBJdCBzZXRzIHRoYXQgZmllbGQgYmVmb3JlIGRldl9zZXRfbmFtZSgpLCBidXQgdGhlIGZh
aWx1cmUgcGF0aAo+IGZvciB0aGUgbmFtZSBhbGxvY2F0aW9uIGxlYXZlcyBpdCBzZXQgZXZlbiB0
aG91Z2ggbm8gZGV2aWNlIHdhcwo+IHJlZ2lzdGVyZWQuIFJldHJ5aW5nIHJlZ2lzdHJhdGlvbiB0
aGVuIHdhcm5zIGFuZCBmYWlscyB3aXRoIC1FRVhJU1QuCj4KPiBTZXQgdGhlIHR5cGUgb25seSBh
ZnRlciBuYW1pbmcgc3VjY2VlZHMuIFRoZSBsYXRlciByZWdpc3RyYXRpb24gZXJyb3IKPiBwYXRo
cyBhbHJlYWR5IGNsZWFyIGl0IGJlZm9yZSByZWxlYXNpbmcgdGhlIGRldmljZS4KPgo+IEZpeGVz
OiBmYTA2MDUyZDYzN2IgKCJtdGQ6IENvbnZlcnQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGVkIGJk
aSBpbmZyYXN0cnVjdHVyZSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCltTZXZl
cml0eTogTG93XQpTaG91bGQgdGhlIEZpeGVzIHRhZyByZWZlcmVuY2UgNjY5N2RhZTFlMmRhICgi
bXRkOiBjYXB0dXJlIGRldmljZSBuYW1lCnNldHRpbmcgZmFpbHVyZSB3aGVuIGFkZGluZyBtdGQi
KSBpbnN0ZWFkPwoKV2hpbGUgZmEwNjA1MmQ2MzdiICgibXRkOiBDb252ZXJ0IHRvIGR5bmFtaWNh
bGx5IGFsbG9jYXRlZCBiZGkKaW5mcmFzdHJ1Y3R1cmUiKSBjaGFuZ2VkIHRoZSBkdXBsaWNhdGUg
cmVnaXN0cmF0aW9uIGd1YXJkIGluCmFkZF9tdGRfZGV2aWNlKCkgdG8gY2hlY2sgbXRkLT5kZXYu
dHlwZSwgZGV2X3NldF9uYW1lKCkgd2FzIG5vdCBjaGVja2VkCmZvciBlcnJvcnMgYXQgdGhhdCBw
b2ludC4gIFRoZSBmYWlsX2Rldm5hbWUgZXJyb3IgcGF0aCB0aGF0IHJldHVybnMgYmVmb3JlCmRl
dmljZV9yZWdpc3RlcigpIHdpdGggbXRkLT5kZXYudHlwZSBzdGlsbCBzZXQgd2FzIGludHJvZHVj
ZWQgaW4KNjY5N2RhZTFlMmRhICgibXRkOiBjYXB0dXJlIGRldmljZSBuYW1lIHNldHRpbmcgZmFp
bHVyZSB3aGVuIGFkZGluZyBtdGQiKSwKYW5kIGNsZWFyaW5nIG10ZC0+ZGV2LnR5cGUgb24gdGhl
IGZhaWxfYWRkZWQgcGF0aCB3YXMgYWRkZWQgaW4KOWQ0YWY3NDZhZjhjICgibXRkOiBmaXggZG91
YmxlIGZyZWUgYW5kIFdBUk5fT04gaW4gYWRkX210ZF9kZXZpY2UoKSBlcnJvcgpwYXRocyIpLgoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MTEwOC1zdWJtaXQtbXRkLWRldm5hbWUtcmV0cnktdjEtdjEtMS1hNjdmMzMyYzU0ZGRAZ21h
aWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
