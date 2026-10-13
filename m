Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F69ECC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGU8/4u5X8XhBzrG/cyRG2mE09Xcr1IW7uEG9CuxOqo=; b=XbfFSH+9BLF90l
	vhEzwsqTOdmSduzCoOpb/fDrnPXlGFLKz1lm9RRaI2r2dRjAbu8pBFPD3PjC9Tl9H38ZIEyM29cJ0
	CQ/gKvuWjiBoEe018Elny9937lpCpQ27RJTC462RqFmMoWXCv0vofiQzQ7LpB0PJlfMOghpskeMEX
	DcQEQdVMjjPRVOJRNC2pwccJrqW91BY4W7GxM7S9R7WylD5vv7XJJu4QeACq282U395lgcA1JKrB+
	D3gs7sdw4XhdK/rnew1A4RgHnecuJpqM+aMw70En+Rf4La+b+woxyCEGaOjlUj7ADyMM107C2YTrj
	h2Xls98Buiu8YA/5o0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlPT-0000000ECka-0exf;
	Tue, 13 Oct 2026 22:55:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlPR-0000000ECkR-4B1z
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:55:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 285986021D;
	Tue, 13 Oct 2026 22:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019671F000FF;
	Tue, 13 Oct 2026 22:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791932148;
	bh=Mgw6S7BFVDaugmxdNTM256SbmYf9a70BUAxB48lOJ/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lJObhqColcPgEY2H8Th9G9LxhxIYltREgfuk9waruuPlbiJATIUCo4GeaGU6v+MXp
	 pRkM+M9/scGFGTN5gwMDQbFlL0j1+ME4mYCTJF+T/JofoFoi/n1TAgTsjvCE4gDYUn
	 4jID4Xvk48/om5aA1KSYaovwlYWvulz9y8SU/Ye++FNtmBZpddiHd/uaPAfGyBdQGz
	 +8DTVzLA9rWzE8aQ68GMIZNU8PRJUCTL+iPSe42WiSAdcvRSh9Z+SXjXTVT+bVUZB5
	 DFWE0AWXYo3Ar3wmIZDoI8iI7MSGcmFNihq840DI8bSthINFE5hIz/f3k5roWbzYb4
	 AaZ9ECWysAqAA==
Message-ID: <sashiko-outbox-170609@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] dlm: Free dlm_ls in kobject release callback
To: "Ian Rogers" <irogers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael
 J . Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Kees Cook" <kees@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy" <chleroy@kernel.org>, "Nayna
 Jain" <nayna@linux.ibm.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Rich
 Felker" <dalias@libc.org>, "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "David Teigland" <teigland@redhat.com>, "Alexander
 Aring" <aahringo@redhat.com>, "Juergen Gross" <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, "Richard Weinberger" <richard@nod.at>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, "Felix Kuehling" <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261013223946.1836757-7-irogers@google.com>
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-7-irogers@google.com>
Date: Tue, 13 Oct 2026 22:55:46 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRsbTogc3lzZnMgVUFG
IG9mIGxzX3JlY292ZXJkX3Rhc2sgZHVyaW5nIGxvY2tzcGFjZSB0ZWFyZG93bgotIFtIaWdoXSBk
bG06IG1vZHVsZSB1bmxvYWQgVUFGIGluIGRsbV9sc19yZWxlYXNlIHVuZGVyIERFQlVHX0tPQkpF
Q1RfUkVMRUFTRQotLQoKY29tbWl0IDVkY2UxODgyODE5NTRmOTUxNDcyNTU1Y2Y3Mjg0Y2RhODMx
YjIwYTcKQXV0aG9yOiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+CgpkbG06IEZyZWUg
ZGxtX2xzIGluIGtvYmplY3QgcmVsZWFzZSBjYWxsYmFjawoKVGhpcyBjb21taXQgYWRkcyBhIGtv
YmplY3QgcmVsZWFzZSBjYWxsYmFjaywgZGxtX2xzX3JlbGVhc2UoKSwgdG8gcHJvcGVybHkKZnJl
ZSB0aGUgZGxtX2xzIHN0cnVjdHVyZSB3aGVuIHRoZSBsYXN0IGtvYmplY3QgcmVmZXJlbmNlIGlz
IGRyb3BwZWQuIFRoaXMKZml4ZXMgYSB1c2UtYWZ0ZXItZnJlZSBpc3N1ZSB3aGVuIENPTkZJR19E
RUJVR19LT0JKRUNUX1JFTEVBU0UgaXMgZW5hYmxlZC4KCj4gZGlmZiAtLWdpdCBhL2ZzL2RsbS9s
b2Nrc3BhY2UuYyBiL2ZzL2RsbS9sb2Nrc3BhY2UuYwo+IGluZGV4IGE5Yzk4YjRmMzc4ZjMuLjFk
MjI2YjI3ZDhlNjEgMTAwNjQ0Cj4gLS0tIGEvZnMvZGxtL2xvY2tzcGFjZS5jCj4gKysrIGIvZnMv
ZGxtL2xvY2tzcGFjZS5jCgpbIC4uLiBdCgo+IEBAIC0xNzksNyArMTc5LDE1IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3lzZnNfb3BzIGRsbV9hdHRyX29wcyA9IHsKPiAgCS5zaG93ICA9IGRsbV9h
dHRyX3Nob3csCj4gIAkuc3RvcmUgPSBkbG1fYXR0cl9zdG9yZSwKPiAgfTsKPiAgCj4gK3N0YXRp
YyB2b2lkIGRsbV9sc19yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQo+ICt7Cj4gKwlzdHJ1
Y3QgZGxtX2xzICpscyA9IGNvbnRhaW5lcl9vZihrb2JqLCBzdHJ1Y3QgZGxtX2xzLCBsc19rb2Jq
KTsKPiArCj4gKwlrZnJlZShscyk7Cj4gK30KCltTZXZlcml0eTogSGlnaF0KQ2FuIHRoaXMgY2Fs
bGJhY2sgdHJpZ2dlciBhbiBpbnN0cnVjdGlvbiBwYWdlIGZhdWx0IGlmIHRoZSBtb2R1bGUgaXMg
dW5sb2FkZWQ/CgpVbmRlciBDT05GSUdfREVCVUdfS09CSkVDVF9SRUxFQVNFPXksIGtvYmplY3Qg
cmVsZWFzZSBpcyBkZWxheWVkIGJ5IDEtNApzZWNvbmRzLiBJZiB0aGUgZGxtIG1vZHVsZSBpcyB1
bmxvYWRlZCBkdXJpbmcgdGhpcyB3aW5kb3csIHRoaXMgY2FsbGJhY2sKd2lsbCBwb2ludCB0byB1
bm1hcHBlZCBtZW1vcnkgd2hlbiB0aGUgZGVsYXllZCB3b3JrIGV4ZWN1dGVzLgoKWyAuLi4gXQoK
PiBAQCAtNjE1LDcgKzYyMyw2IEBAIHN0YXRpYyBpbnQgbmV3X2xvY2tzcGFjZShjb25zdCBjaGFy
ICpuYW1lLCBjb25zdCBjaGFyICpjbHVzdGVyLAo+ICAJcmhhc2h0YWJsZV9kZXN0cm95KCZscy0+
bHNfcnNidGJsKTsKPiAgIG91dF9sc2ZyZWU6Cj4gIAlrb2JqZWN0X3B1dCgmbHMtPmxzX2tvYmop
Owo+IC0Ja2ZyZWUobHMpOwo+ICAgb3V0Ogo+ICAJbW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cj4g
IAlyZXR1cm4gZXJyb3I7CgpbU2V2ZXJpdHk6IEhpZ2hdCkluIHRoZSBlcnJvciBwYXRoIG9mIG5l
d19sb2Nrc3BhY2UoKSwgd2UgZHJvcCB0aGUga29iamVjdCByZWZlcmVuY2UgYW5kIHRoZW4KaW1t
ZWRpYXRlbHkgZHJvcCB0aGUgbW9kdWxlIHJlZmVyZW5jZSB2aWEgbW9kdWxlX3B1dCgpLiBEb2Vz
bid0IHRoaXMgYWxsb3cKdGhlIG1vZHVsZSB0byBiZSB1bmxvYWRlZCB3aGlsZSB0aGUgZGVsYXll
ZCBrb2JqZWN0IHJlbGVhc2UgaXMgc3RpbGwgcGVuZGluZz8KCkFkZGl0aW9uYWxseSwgY291bGQg
dGhpcyBzZXF1ZW5jZSBvcGVuIGEgdXNlLWFmdGVyLWZyZWUgcmFjZSB3aW5kb3c/CgpFYXJsaWVy
IGluIHRoZSBlcnJvciBwYXRoIG9mIG5ld19sb2Nrc3BhY2UoKSwgd2UgY2FsbCBkbG1fcmVjb3Zl
cmRfc3RvcCgpOgoKb3V0X3JlY292ZXJkOgogICAgICAgIGRsbV9yZWNvdmVyZF9zdG9wKGxzKTsK
b3V0X2NhbGxiYWNrOgogICAgICAgIC4uLgpvdXRfbHNmcmVlOgogICAgICAgIGtvYmplY3RfcHV0
KCZscy0+bHNfa29iaik7CgpUaGUgcmVjb3ZlcnkgdGFzayBpcyBzdG9wcGVkIGFuZCBmcmVlZCBp
biBkbG1fcmVjb3ZlcmRfc3RvcCgpLCBidXQgdGhlIHN5c2ZzCmVudHJpZXMgYXJlbid0IHJlbW92
ZWQgdW50aWwga29iamVjdF9wdXQoKSBpcyBjYWxsZWQgbXVjaCBsYXRlci4gQSBjb25jdXJyZW50
CnN5c2ZzIHdyaXRlIHRvIHRoZSBjb250cm9sIGZpbGUgY291bGQgaW52b2tlIGRsbV9sc19zdGFy
dCgpIGluIGZzL2RsbS9tZW1iZXIuYwphbmQgd2FrZSB1cCB0aGUgZnJlZWQgbHMtPmxzX3JlY292
ZXJkX3Rhc2suCgpbIC4uLiBdCgo+IEBAIC03NTksNyArNzY2LDcgQEAgc3RhdGljIGludCByZWxl
YXNlX2xvY2tzcGFjZShzdHJ1Y3QgZGxtX2xzICpscywgdW5zaWduZWQgaW50IHJlbGVhc2Vfb3B0
aW9uKQo+ICAKPiAgCWRsbV9kZWxldGVfZGVidWdfZmlsZShscyk7Cj4gIAo+IC0Ja29iamVjdF9w
dXQoJmxzLT5sc19rb2JqKTsKPiArCWtvYmplY3RfZGVsKCZscy0+bHNfa29iaik7Cj4gIAo+ICAJ
eGFfZGVzdHJveSgmbHMtPmxzX3JlY292ZXJfeGEpOwo+ICAJa2ZyZWUobHMtPmxzX3JlY292ZXJf
YnVmKTsKCltTZXZlcml0eTogSGlnaF0KSXMgdGhlcmUgYSBzaW1pbGFyIHVzZS1hZnRlci1mcmVl
IHJpc2sgaW52b2x2aW5nIHRoZSByZWNvdmVyeSB0aHJlYWQgaGVyZT8KCkxvb2tpbmcgYXQgdGhl
IGNvbnRleHQgaW4gcmVsZWFzZV9sb2Nrc3BhY2UoKSwgd2Ugc3RvcCB0aGUgcmVjb3ZlcnkgdGhy
ZWFkCmVhcmxpZXI6CgpyZWxlYXNlX2xvY2tzcGFjZSgpIHsKICAgIC4uLgogICAgZGxtX3JlY292
ZXJkX3N0b3AobHMpOwogICAgLi4uCiAgICBjbGVhcl9iaXQoTFNGTF9SVU5OSU5HLCAmbHMtPmxz
X2ZsYWdzKTsKICAgIC4uLgogICAga29iamVjdF9kZWwoJmxzLT5sc19rb2JqKTsKICAgIC4uLgog
ICAgbW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cn0KClNpbmNlIHRoZSBzeXNmcyBrb2JqZWN0IGlz
bid0IGRlbGV0ZWQgdW50aWwgYWZ0ZXIgdGhlIHJlY292ZXJ5IHRocmVhZCBpcwpzdG9wcGVkIGFu
ZCBpdHMgdGFza19zdHJ1Y3QgaXMgZnJlZWQsIHRoZSBzeXNmcyBlbnRyaWVzIHJlbWFpbiBhY3Rp
dmUgaW4gdGhlCmludGVyaW0uIEEgY29uY3VycmVudCBzeXNmcyB3cml0ZSB0byB0aGUgY29udHJv
bCBmaWxlIGNvdWxkIGludm9rZQpkbG1fbHNfc3RhcnQoKSB3aGljaCBjYWxscyB3YWtlX3VwX3By
b2Nlc3MobHMtPmxzX3JlY292ZXJkX3Rhc2spIG9uIHRoZSBmcmVlZAp0YXNrX3N0cnVjdC4KCkFs
c28sIG1vZHVsZV9wdXQoKSBpcyBjYWxsZWQgYXQgdGhlIGVuZCBvZiByZWxlYXNlX2xvY2tzcGFj
ZSgpIHdoaWxlIHRoZQprb2JqZWN0IGRlbGF5ZWQgcmVsZWFzZSBpcyBwZW5kaW5nLCByZXBlYXRp
bmcgdGhlIG1vZHVsZSB1bmxvYWQgcmFjZSBtZW50aW9uZWQKYWJvdmUuCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDEzMjIzOTQ2
LjE4MzY3NTctMS1pcm9nZXJzQGdvb2dsZS5jb20/cGFydD02CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
