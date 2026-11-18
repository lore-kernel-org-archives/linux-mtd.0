Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A24606A32A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lETeKgbw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vEwZlfsg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6YhcpKVru2AJPvNw+5USZ9zROQ0ypdqu7YOOG1GSLRc=; b=lETeKgbwjPPUlujZKdGZor/E9Q
	6Usa6ocIo3yhYGWUIv79585gEuBSZm7Dnmyjf0Badn2P7igeHGuHa3UNTKh6lxZ2oQpVfPO0t6mwZ
	656n9usxWCH0k1OWrIZ0pNd/rSPYhorFpkERS2tmn8tb8Qd7/3zYibpDcYGOXH74OYgS5gOxsnmdA
	c9GvGYo2qf0v32P2fgqutNLbvHHNPxXgnJ8HdDGj0HQXqwSkGL8X2fp2AUpj6JmPt0EOrPBwGGbF1
	37E2hS/IEU8I2Et6ZGkM/TqvVTHVQjbTlwGFU+tVkmIYa66HfMxZDNlC/bgN5eF1YfS0pAZXM/B/H
	YQPjvlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcSV-00000008Tcv-202b;
	Wed, 18 Nov 2026 10:00:07 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcSS-00000008Tae-0L2S
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 10:00:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93BBDC4CBDF;
	Wed, 18 Nov 2026 10:00:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C955FE9B;
	Wed, 18 Nov 2026 09:59:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 163BA11BC0EE3;
	Wed, 18 Nov 2026 10:59:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794995999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lhcfRT8eI0DM+C2zEBL/75QjU+nlkIKJUJYGmyhthQM=;
	b=vEwZlfsg6wAWVqVcdn+L5GqquVth4TzV1ntiNPJadhsPjzACTPY71X8lO5sbluY0+vq3jx
	LvXsCGi0pdwL2+Du7599YQs4V7oVw3HdH/dh5ncImJkfB/CiCKYWTCoxzUoDkq27RXxZBH
	rYxtaJjBePejsEV+/2foYbS0K+f2SgUYstNa9RbcKnaCkZ6HS0grC+5IF65DIUOCejQOhq
	cRKfT3WoPOOJzDYDgnRXgpTTxSJw7re8UHb9+INQvkj3Iz+rsRd064zVbOvl7C0VH0iqoc
	VM+uGRjg9IvERbwHY9rNn3ke4y+1pkNHN6KJa+2LadAOnRbxYBx8IGMQ41qieg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: propagate BBT read transport errors
In-Reply-To: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
	(James Hilliard's message of "Tue, 03 Nov 2026 23:03:39 -0700")
References: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 10:59:57 +0100
Message-ID: <87a4n6jw82.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_020004_289157_41BCA378 
X-CRM114-Status: GOOD (  10.39  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDMvMTEvMjAyNiBhdCAyMzowMzozOSAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gY2hlY2tfY3JlYXRlKCkgaGFuZGxlcyB1bmNvcnJl
Y3RhYmxlIEVDQyBlcnJvcnMgYnkgaW52YWxpZGF0aW5nIHRoZQo+IGFmZmVjdGVkIEJCVCBjb3B5
IGFuZCBoYW5kbGVzIGNvcnJlY3RlZCBlcnJvcnMgYnkgc2NoZWR1bGluZyBhIHJld3JpdGUuCj4g
T3RoZXIgcmVhZF9hYnNfYmJ0KCkgZmFpbHVyZXMgYXJlIGlnbm9yZWQsIGFsbG93aW5nIGluaXRp
YWxpemF0aW9uIHRvCj4gc3VjY2VlZCB3aXRoIG1pc3NpbmcgZW50cmllcyBpbiB0aGUgUkFNIHRh
YmxlIG9yIHRvIHJld3JpdGUgYSB0YWJsZSB0aGF0Cj4gd2FzIG5vdCBjb21wbGV0ZWx5IHJlYWQu
Cj4KPiBSZXR1cm4gbm9uLUVDQyByZWFkIGVycm9ycyBmcm9tIGJvdGggdGhlIHNlbGVjdGVkIHRh
YmxlIGFuZCB0aGUgc2Vjb25kCj4gdW52ZXJzaW9uZWQgY29weSBiZWZvcmUgdXBkYXRpbmcgdmVy
c2lvbnMgb3Igd3JpdGluZyB0YWJsZXMuIEEgdHJhbnNwb3J0Cj4gZmFpbHVyZSBkb2VzIG5vdCBl
c3RhYmxpc2ggdGhhdCB0aGUgc2VsZWN0ZWQgdGFibGUgaXMgY29ycnVwdCBvciB0aGF0IGFuCj4g
b2xkZXIgbWlycm9yIGNvbnRhaW5zIGFsbCBvZiBpdHMgYmFkLWJsb2NrIGluZm9ybWF0aW9uLiBQ
cmVzZXJ2ZSB0aGUKPiBleGlzdGluZyBFQ0Mtc3BlY2lmaWMgcmVjb3ZlcnkgcGF0aHMuCgpCZSBo
b25lc3QsIHlvdSBkaWQgbm90IHJlYWQgdGhhdCBiYWNrLiBJIGRvbid0IHRoaW5rIG9uZSB3b3Vs
ZCBndWVzcyB0aGUKYmlnIHBpY3R1cmUgYnkgcmVhZGluZyB0aGlzLiBIZXJlIGlzIGEgcHJvcG9z
YWw6CgpgYGAKRUNDIGZhaWx1cmVzIGhhdmUgZGVkaWNhdGVkIHJlY292ZXJ5IHBhdGhzOiAtRUJB
RE1TRyBpbnZhbGlkYXRlcyB0aGUKYWZmZWN0ZWQgY29weSBhbmQgLUVVQ0xFQU4gc2NoZWR1bGVz
IGEgc2NydWIuIEFueSBvdGhlciByZWFkIGVycm9yCih0eXBpY2FsbHkgYW4gSS9PIGVycm9yKSB3
b3VsZCBiZSB1bmhhbmRsZWQgYW5kIGxlYXZlIHRoZSBSQU0gdGFibGUKaW5jb21wbGV0ZS4KCk1h
a2Ugc3VyZSB0aG9zZSBlcnJvcnMgYXJlIHByb3BhZ2F0ZWQuCmBgYAoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
