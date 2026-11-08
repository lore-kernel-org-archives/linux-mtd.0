Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE9606A320
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DQ7x56wG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uk3vcV63
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Is7mKSbSvXUjMXFVNU0P90d5aPubjHFW3L4uijkneiM=; b=DQ7x56wGdRDO8QGwp61Tx0iwak
	gOqnPfTDymW6qwmQsS6ZhgUMg0arDGtCjT5MpvSfecyK7QC5KbVYJMhxbCfid9kwt+PkRc+3tNQWE
	CTRVshueWnTeAzmSEFQWGNzyTGyuVJD5v8e8Hi6PamBWO3pyC3QhnFmQ8+tnoKMmkMKCMGZQWuOa3
	mBcnyp01IG8lNNThqbKufD13cHvyxpY5X57yH6T4eI13TnGAeE80KkmWc8S79sShHT81rN0a2QHn4
	cLKfIHKeU8kMYWBN/bKf+QPz/jG6yGjAN2pg7KLF1Ix9Ak/Rk/4UIktS6XKQqqgIAqVvWGHsZnwxC
	m6wSGZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQByS-0000000GsTG-3LRq;
	Sun, 08 Nov 2026 23:06:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQByQ-0000000GsT5-3Wap
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:06:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 236D161826;
	Sun,  8 Nov 2026 23:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F47C1F0089F;
	Sun,  8 Nov 2026 23:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794179212;
	bh=+hmt8D//cWlFZIK2gd8XAWnqPSRmuN+AV7WN05g2ZKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uk3vcV63rJrfwcgVsOd67WdpIIzLM6aI1T6mxDWcVeAp89KEIrK1qs1Jo/0CXbfVr
	 fcB5OfUYm6A1ofkxHDIimthku5D6up2AwfJclwou/xfssTEksmoTFCPh6qRYO822DJ
	 EhRnEjLYzoTsnLBGoMmRlIqxXhO3J0qU3a9xkOUBKZ62/7E7gXpM0Y1/YVI0vshtSY
	 52prOE5oxeqq+KikhS0twOVm/jLDvQ4iNuV2r0zebHqOHd4g3oUQfCNUivQzCX6XdT
	 UZFL6joCHzaV6LEr0rX1ZFk73a5tAndxwCDhfrV5IIcrXvBmWzHu1pyVC9JiNPnJot
	 j+Mjz2sYtcMPA==
Message-ID: <sashiko-outbox-204150@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/9] dlm: Free dlm_ls in kobject release callback
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
In-Reply-To: <20261108223913.3624571-6-irogers@google.com>
References: <20261108223913.3624571-1-irogers@google.com>
 <20261108223913.3624571-6-irogers@google.com>
Date: Sun, 08 Nov 2026 23:06:49 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gZGxtOiB3cm9uZyBGaXhlcyBj
b21taXQgYW5kIG1pc2xlYWRpbmcgc3ViamVjdCBmb3IKICBkbG1fbHNfcmVsZWFzZSgpCi0tCgpj
b21taXQgY2ViZjFiZjZmNWQ0YjY3NDIzZWFkYTk4MGU1YTI5NGFiZTQ5MWNjNgpBdXRob3I6IElh
biBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KCj4gZGxtOiBGcmVlIGRsbV9scyBpbiBrb2Jq
ZWN0IHJlbGVhc2UgY2FsbGJhY2sKPgo+IHN0cnVjdCBkbG1fbHMgZW1iZWRzIGEgc3RydWN0IGtv
YmplY3QgKGxzX2tvYmopLCBidXQgZGxtX2t0eXBlIGxhY2tlZCBhCj4gLnJlbGVhc2UgY2FsbGJh
Y2sgYW5kIGRsbSBmcmVlZCB0aGUgbG9ja3NwYWNlIHN0cnVjdHVyZSBkaXJlY3RseSB2aWEKPiBr
ZnJlZShscykuIFdpdGggQ09ORklHX0RFQlVHX0tPQkpFQ1RfUkVMRUFTRT15LCBmcmVlaW5nIGxz
IGJlZm9yZSB0aGUKPiBkZWxheWVkIGtvYmplY3QgcmVsZWFzZSBydW5zIGNhdXNlcyBhIHVzZS1h
ZnRlci1mcmVlLCBhbmQgdW5sb2FkaW5nIHRoZQo+IG1vZHVsZSB3aGlsZSB0aGUgZGVsYXllZCBy
ZWxlYXNlIGlzIHBlbmRpbmcgcmVzdWx0cyBpbiBhbiBpbnN0cnVjdGlvbgo+IHBhZ2UgZmF1bHQu
Cj4KPiBBZGQgYSBjb21wbGV0aW9uIGxzX2tvYmpfZG9uZSBhbmQgZGxtX2xzX3JlbGVhc2UoKSB0
byBjb21wbGV0ZSBpdCB3aGVuCj4gdGhlIGxhc3Qga29iamVjdCByZWZlcmVuY2UgaXMgZHJvcHBl
ZCwgd2FpdGluZyBmb3IgaXQgaW4gZnJlZV9sb2Nrc3BhY2UoKQo+IGJlZm9yZSBrZnJlZShscykg
YW5kIGluIHRoZSBuZXdfbG9ja3NwYWNlKCkgZXJyb3IgcGF0aCBiZWZvcmUgbW9kdWxlX3B1dCgp
Lgo+IEFsc28gZGVsZXRlIHRoZSBrb2JqZWN0IHZpYSBrb2JqZWN0X2RlbCgpIGJlZm9yZSBzdG9w
cGluZyBkbG1fcmVjb3ZlcmQKPiB0byBjbG9zZSB0aGUgd2luZG93IHdoZXJlIGNvbmN1cnJlbnQg
c3lzZnMgd3JpdGVzIGNvdWxkIHdha2UgdGhlIHN0b3BwZWQKPiByZWNvdmVyeSB0YXNrLgo+Cj4g
Rml4ZXM6IDM1MTRmYWNhMTlhNiAoImtvYmplY3Q6IHJlbW92ZSBzdHJ1Y3Qga29ial90eXBlIGZy
b20gc3RydWN0IGtzZXQiKQo+IEFja2VkLWJ5OiBBbGV4YW5kZXIgQXJpbmcgPGFhaHJpbmdvQHJl
ZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29t
PgoKW1NldmVyaXR5OiBMb3ddCjM1MTRmYWNhMTlhNiAoImtvYmplY3Q6IHJlbW92ZSBzdHJ1Y3Qg
a29ial90eXBlIGZyb20gc3RydWN0IGtzZXQiKSBvbmx5CnJlbW92ZWQgdGhlIC5rdHlwZSBwb2lu
dGVyIGZyb20gZGxtX2tzZXQgd2hpbGUgbGVhdmluZyBkbG1fa3R5cGUucmVsZWFzZQpzZXQgdG8g
bG9ja3NwYWNlX2tvYmpfcmVsZWFzZSgpLiAgVGhlIGNvbW1pdCB0aGF0IGRyb3BwZWQgdGhlIHJl
bGVhc2UKY2FsbGJhY2sgZnJvbSBkbG1fa3R5cGUgYW5kIHN0YXJ0ZWQgY2FsbGluZyBrZnJlZShs
cykgZGlyZWN0bHkgYWZ0ZXIKa29iamVjdF9wdXQoJmxzLT5sc19rb2JqKSBpcyA4YTRjZjUwMGYx
ZGQgKCJkbG06IGRyb3Aga29iamVjdCByZWxlYXNlCmNhbGxiYWNrIGhhbmRsaW5nIikuICBTaG91
bGQgdGhlIEZpeGVzOiB0YWcgcG9pbnQgdG8gdGhhdCBjb21taXQgaW5zdGVhZDoKCiAgRml4ZXM6
IDhhNGNmNTAwZjFkZCAoImRsbTogZHJvcCBrb2JqZWN0IHJlbGVhc2UgY2FsbGJhY2sgaGFuZGxp
bmciKQoKQWxzbywgdGhlIHN1YmplY3QgbGluZSBzYXlzIGRsbV9scyBpcyBmcmVlZCBpbiB0aGUg
a29iamVjdCByZWxlYXNlCmNhbGxiYWNrLCB3aGVyZWFzIGRsbV9sc19yZWxlYXNlKCkgb25seSBz
aWduYWxzIGxzX2tvYmpfZG9uZSBhbmQga2ZyZWUobHMpClN0aWxsIGhhcHBlbnMgaW4gZnJlZV9s
b2Nrc3BhY2UoKSBhbmQgbmV3X2xvY2tzcGFjZSgpLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwODIyMzkxMy4zNjI0NTcxLTEt
aXJvZ2Vyc0Bnb29nbGUuY29tP3BhcnQ9NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
