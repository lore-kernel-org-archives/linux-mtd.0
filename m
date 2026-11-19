Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED66606A330
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qLX9zdja;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vQsBHKnH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5dVlY8phoBU8+grpMpN0m7YLFcX+ZunJ93VaSm7JatI=; b=qLX9zdja66OIQRx73n84BIcaaa
	UdDveKAgiG2xnCjaKZ8wwvQUs3naGY830fZzmmXwoQwHCyEn7OCt8q7MAxFImySu+NeAYGfP+2F9s
	P31EEd77lRlAmwBGVmKFGcsQHJL8K+LvEf120rinFH2R98UYIQkNMr1SQB9oJSI1T08cOmQfoWJnc
	T86UZwVu8Rg2lucZWx97qeCSKUvjkIVb14t7ZyeRInVl87QiwtSWILgortj0XxZ19wJuNx/tq5NeG
	JTdkromN4W7VaO/XoqUems7a4CpYndwIwXrwFQWtEe8t5wXJTcZafYE2mirlmDLb7vtf8kg1ADqr6
	9TIegK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OR-0000000BrU1-2kbc;
	Thu, 19 Nov 2026 12:37:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OG-0000000BrMk-3eOp
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88B76C4CBF3;
	Thu, 19 Nov 2026 12:37:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43DE560237;
	Thu, 19 Nov 2026 12:37:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E78A11BC05F4;
	Thu, 19 Nov 2026 13:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RewlOcbB01O0OqmI8Z6D5CN2IGi7PIPdjkslLrrCe4o=;
	b=vQsBHKnH2F+3BD3ii1LWJduaNBNkvghEEFdq/7M/Y2U37Q6O7ORJovBxUs4vfUutmGXF2L
	tzDqOn+e2cnR176XbqxznKmZALEXkp00vVJ5woW1AXm3WgjNj76DoKmo/zRaNlFRZl2bZu
	+rI1cIC7tQmAP71eCDWT3ChsSaFQ+Sbm3Fa+PCakeBRNH63tVU7Mwywgxma9C+MjBhpuOj
	diHeQGY7pVyF2CM2iG7nBiuV+ivnqJtnpuub+XZzKkPwrQhhG1LG1ooh0Hnq/qa+LXwX4D
	UBlo2OCy0dC82Pt9SI2ohtB/NWDx9Bht1ctzD0GZOk0h7dqUO4UWVVJ8FjZ4mQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, 
 Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Cc: richard@nod.at, michal.simek@amd.com, linux-kernel@vger.kernel.org
In-Reply-To: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: fix GPIO CS descriptor leaks
Message-Id: <179509184137.2889394.1523547791130557130.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043727_395179_1684F1AA 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAwOSBOb3YgMjAyNiAxMzoyNzoyMiArMDgwMCwgWmhhbyBGZW5nIHdyb3RlOgo+IFR3
byByZWxhdGVkIGZpeGVzIGZvciBHUElPIGNoaXAtc2VsZWN0IGRlc2NyaXB0b3IgbGVha3MgaW4g
dGhlIHJhdwo+IE5BTkQgY29yZSBoZWxwZXIgYW5kIGl0cyBpbi10cmVlIHVzZXIsIHRoZSBBcmFz
YW4gY29udHJvbGxlciBkcml2ZXI6Cj4gCj4gLSBwYXRjaCAxIHJvbGxzIGJhY2sgdGhlIGFscmVh
ZHktYWNxdWlyZWQgR1BJTyBkZXNjcmlwdG9ycyB3aGVuCj4gICByYXduYW5kX2R0X3BhcnNlX2dw
aW9fY3MoKSBmYWlscyBtaWR3YXkgdGhyb3VnaCB0aGUgY3MtZ3Bpb3MgYXJyYXk7Cj4gLSBwYXRj
aCAyIHJlbGVhc2VzIHRoZSBwYXJzZWQgQ1MgYXJyYXkgb24gdGhlIGFyYXNhbiBwcm9iZSBlcnJv
cgo+ICAgcGF0aHMgKGludmFsaWQgRFQgbGF5b3V0IGFuZCBhbmZjX2NoaXBzX2luaXQoKSBmYWls
dXJlKSwgZmFjdG9yaW5nCj4gICB0aGUgcmVtb3ZlLXRpbWUgZ3Bpb2RfcHV0KCkgbG9vcCBpbnRv
IGEgc2hhcmVkIGhlbHBlci4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5r
cyEKClsxLzJdIG10ZDogcmF3bmFuZDogcGFyc2UgR1BJTyBDUyB3aXRoIGRldm1fZ3Bpb2RfZ2V0
X2luZGV4X29wdGlvbmFsKCkKICAgICAgY29tbWl0OiA4YWJjMjQ2YzFmZjFmNGJjZmM2YTQ1MmM0
NTU0ZjU1NmUyMGIxMTE1ClsyLzJdIG10ZDogcmF3bmFuZDogYXJhc2FuOiBkcm9wIG1hbnVhbCBH
UElPIENTIHJlbGVhc2UKICAgICAgY29tbWl0OiBhNjFjYjJlYmEyMWI4OTdjYjVlYTJlYTQ2NzAx
ZmNiNWI3NjU0YWQ4CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
