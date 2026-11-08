Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30171606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KlI2ymOS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UgbqD2XS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WEnerjKoRs+m6SKFsZhnyE7v4am2kMm/i22vz5pzCok=; b=KlI2ymOSNs+licQCybWlAPSM8G
	NB15voe9ZUFCppJTE4erTaBJOj1hl9F4qgNBpq0GNWnW61Z+eiciKFqQSuwmmqSJD42Rzy9bGhZ/2
	lII1r6k0C8eE1p3z5IXazY2QH7Xcdk7ZLJJQeRtDqargjhp2NWjRnlwKkRGQIqyxJcO4XCdeMMi/+
	sjS0DuYR3+e5tdtLz5Ko75gFSz6dIOCbsWZLu4wJ/Mdq/g9FXEr9m83LeuiXY+vQ6Xu34PUC0NoJn
	Ie9XwckPt00gA92gp8DP3nI8BiE/LiiaJUhf2RguAKLvpgPvqS8AlJncUwLENG6PUgD2dtVEX01lo
	6xsgdrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQC2B-0000000Gsat-1PYI;
	Sun, 08 Nov 2026 23:10:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQC29-0000000Gsan-2vU3
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:10:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C92D461826;
	Sun,  8 Nov 2026 23:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0561F0089F;
	Sun,  8 Nov 2026 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794179444;
	bh=SJrTRZvefBM+D9+/dd7LygrzgO1jMHec9WFWbzhuafs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UgbqD2XSdyGktVJEJhI8+QvVyWG+cq/0XfiKL6PYXQjacoO71WmQpzpgK3T9NEgyL
	 MCW+PU/nk2t29laNSG6YPzxo1waBrUXmR3iybjEjV7laQEBl1mK9n4vocFBccU1F8x
	 j5tfv+nVhTD9ayYbH3pP9d7ml5VNKgv86aTSnvuVPM24VoRdKG/Sh9EV2xMnMzesbI
	 Un8OivitWJrCoqvBYuaXCIeM+Q7+RExpdXNOupt3EphzCBK7sK1wOsnoAGf8P2Qkug
	 oTppSKhkwSZAregyJkTePZWKDOFT/ho+EHYl2EIR7zmYMenPpJddSOjHCFBoz2qAfD
	 McA00Yi8UNxNQ==
Message-ID: <sashiko-outbox-204152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] ubifs: sysfs: Use kset_create_and_add() for
 ubifs_kset
To: "Ian Rogers" <irogers@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Kees Cook" <kees@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy" <chleroy@kernel.org>, "Nayna
 Jain" <nayna@linux.ibm.com>, "Srish Srinivasan" <ssrish@linux.ibm.com>, "Mimi
 Zohar" <zohar@linux.ibm.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Rich
 Felker" <dalias@libc.org>, "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "Juergen
 Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Zhongqiu
 Han" <zhongqiu.han@oss.qualcomm.com>, "Alexander Aring" <aahringo@redhat.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, "Sumanth Korikkar" <sumanthk@linux.ibm.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <20261108223913.3624571-8-irogers@google.com>
References: <20261108223913.3624571-1-irogers@google.com>
 <20261108223913.3624571-8-irogers@google.com>
Date: Sun, 08 Nov 2026 23:10:42 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gdWJpZnM6IHN5c2ZzOiBpbmFj
Y3VyYXRlIEZpeGVzIHRyYWlsZXIgaW4gY29tbWl0IG1lc3NhZ2UKLS0KCmNvbW1pdCAwNWFkNTcz
ZmE0NzE5YTdhNmUzNmJiOGRjZjNjOTA2MGI1YzE5NGIwCkF1dGhvcjogSWFuIFJvZ2VycyA8aXJv
Z2Vyc0Bnb29nbGUuY29tPgoKPiB1Ymlmczogc3lzZnM6IFVzZSBrc2V0X2NyZWF0ZV9hbmRfYWRk
KCkgZm9yIHViaWZzX2tzZXQKPgo+IHViaWZzX2tzZXQgd2FzIGEgc3RhdGljIHN0cnVjdCBrc2V0
IHVzaW5nIGEgY3VzdG9tIHViaWZzX2t0eXBlIHRoYXQKPiBoYWQgbm8gZGVmYXVsdF9ncm91cHMg
YW5kIG5vIC5yZWxlYXNlIGNhbGxiYWNrLiBXaXRoCj4gQ09ORklHX0RFQlVHX0tPQkpFQ1RfUkVM
RUFTRT15LCB1bmxvYWRpbmcgdGhlIHViaWZzIG1vZHVsZSB3aGlsZSBkZWxheWVkCj4ga29iamVj
dCByZWxlYXNlIGlzIHBlbmRpbmcgY2F1c2VzIGEgdXNlLWFmdGVyLWZyZWUgb24gdGhlIHN0YXRp
YyBrc2V0Lgo+Cj4gUmVwbGFjZSB0aGUgc3RhdGljIHViaWZzX2tzZXQgYW5kIGVtcHR5IHViaWZz
X2t0eXBlIHdpdGggYSBkeW5hbWljYWxseQo+IGFsbG9jYXRlZCBrc2V0IHZpYSBrc2V0X2NyZWF0
ZV9hbmRfYWRkKCkuCj4KPiBGaXhlczogMjAzYTU1ZjA0ZjY2ICgidWJpZnM6IEZpeCBtZW1vcnkg
bGVhayBpbiB1Ymlmc19zeXNmc19pbml0KCkiKQo+IFRlc3RlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJz
QGdvb2dsZS5jb20+CgpbU2V2ZXJpdHk6IExvd10KMjAzYTU1ZjA0ZjY2ICgidWJpZnM6IEZpeCBt
ZW1vcnkgbGVhayBpbiB1Ymlmc19zeXNmc19pbml0KCkiKSBvbmx5IGFkZGVkCmFuIGVycm9yLXBh
dGgga3NldF9wdXQoKSB3aGVuIGtzZXRfcmVnaXN0ZXIoKSBmYWlscy4gIFRoZSBzdGF0aWMKdWJp
ZnNfa3NldCwgdWJpZnNfa3R5cGUgd2l0aG91dCBhIHJlbGVhc2UgY2FsbGJhY2ssIGFuZCBrc2V0
X3VucmVnaXN0ZXIoKQpvbiBtb2R1bGUgZXhpdCB3ZXJlIGludHJvZHVjZWQgaW4gMmUzY2JmNDI1
ODA0ICgidWJpZnM6IEV4cG9ydCBmaWxlc3lzdGVtCmVycm9yIGNvdW50ZXJzIikuCgpTaG91bGQg
dGhlIEZpeGVzIHRhZyBpbnN0ZWFkIGJlOgoKICBGaXhlczogMmUzY2JmNDI1ODA0ICgidWJpZnM6
IEV4cG9ydCBmaWxlc3lzdGVtIGVycm9yIGNvdW50ZXJzIikKCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDgyMjM5MTMuMzYyNDU3
MS0xLWlyb2dlcnNAZ29vZ2xlLmNvbT9wYXJ0PTcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
