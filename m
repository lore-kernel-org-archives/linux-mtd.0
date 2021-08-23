Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A248C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 08:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14F5E6103D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 08:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14F5E6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qgzjw15TiNn5qPfwYCTq7P7YGk0CTN6vc90ZXnSpIWE=; b=x1UZ2PMACxIrW5
	LLPlUPOAiFRXYCe9vzFzvE/3mfRIKO6y5rkrA0irDeTJt9wCtFyfY6V3WguJW0y0Do32L7ASxceKZ
	8okTzO+8RwPsHqs1YZ6h0LWCAkf0L9rYF9/Ynnd4k4SbfC4cLeZPW9Ki38aPOK/bDea+LYA6yB8/K
	Og3aZGvPokL28X9n7HEofy4c9JoH10nGnveGagtTLQQpB8iFgyxY078XJ7RvCEy3P4MboHR08d7sc
	kOyj9DclA9vqTTEgzkBM4GZ0uOgq6QNBUE5BKChd9v5mF0aNvB03+9fVK42kDQzLoAGqMApk+FEEA
	wQCPpcH2+d/N7YjOFhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI5Lm-00FvM8-9u; Mon, 23 Aug 2021 08:30:34 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI5Lj-00FvKy-2l
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 08:30:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 68C1810000E;
 Mon, 23 Aug 2021 08:30:27 +0000 (UTC)
Date: Mon, 23 Aug 2021 10:30:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-mtd@lists.infradead.org
Subject: Re: mtd locking fix and cleanups
Message-ID: <20210823103026.0ec7dbb1@xps13>
In-Reply-To: <20210823073359.705281-1-hch@lst.de>
References: <20210823073359.705281-1-hch@lst.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_013031_302849_40B1F074 
X-CRM114-Status: GOOD (  13.83  )
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

SGkgQ2hyaXN0b3BoLAoKQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlIG9uIE1v
biwgMjMgQXVnIDIwMjEgMDk6MzM6NTEgKzAyMDA6Cgo+IEhpIG10ZCBtYWludGFpbmVycywKPiAK
PiB0aGUgZmlyc3Qgc2VyaWVzIGluIHRoaXMgcGF0Y2ggZml4ZXMgYSBsb2NrIG9yZGVyIHJldmVy
c2FsIHJlcG9ydGVkIGJ5Cj4gR3VlbnRlciBiYXNlZCBvbiBhIHJlY2VudCBjb21taXQsIGFsdGhv
dWdoIGZyb20gY29kZSBpbnNwZWN0aW9uIGl0IHNob3VsZAo+IGhhdmUgYmVlbiBhcm91bmQgZm9y
IG11Y2ggbG9uZ2VyLgo+IAo+IFRoZSByZXN0IGlzIGRyaXZlLWJ5IGNsZWFudXBzIGluIHRoZSBh
cmVhIHRoYXQgSSBub3RpY2VkIHdoaWxlIHRyeWluZyB0bwo+IHVuZGVyc3RhbmQgdGhlIGxvY2tp
bmcgY2hhbmdlcy4gIFRoZXNlIGFyZSB1bnRlc3RlZCBhbmQgbmVlZCB0byBiZSBoYW5kbGVkCj4g
d2l0aCBjYXJlIQoKVGhhbmtzIGZvciB0aGUgZml4IGFuZCB0aGUgdmFyaW91cyBjbGVhbnVwcywg
dGhleSBsb29rIGdvb2QgdG8gbWUuIEkKZG9uJ3Qga25vdyBob3cgaW1wb3J0YW50IHRoZXNlIGRy
aXZlcnMgYXJlIG5vciBpZiB0aGV5IGFyZSBzdGlsbAphY3R1YWxseSB1c2VkLCBpdCB3b3VsZCBi
ZSBnb29kIHRvIGhhdmUgc29tZSBmZWVkYmFjayBmcm9tIHBlb3BsZSBzdGlsbApmb2xsb3dpbmcu
IEluIHRoZSBtZWFuIHRpbWUgSSdsbCBhcHBseSB0aGUgc2VyaWVzIHJpZ2h0IGF3YXksIEkgZG9u
J3QKd2FudCB0byB3YWl0IGFuIGFkZGl0aW9uYWwgbW9udGggb3Igc28gYmVjYXVzZSBvZiB0aGUg
bWVyZ2Ugd2luZG93LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
