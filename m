Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D15F417EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKAFB6tyI7puwNj/fxd9dLZxT8DBDjymFKLUwQTGnUQ=; b=AwGB7Lip2O/qiU
	6Zk4JeumOM/qOf+pIdC5W6ATzQYPwFE9xKiCXAScfvd0Q6UTzT/60FwGKmXW7bfj9+MjUq2vSAi9H
	U1w3YTamaUpYrBbXRpt+wPakB+T2khHrPiORL0hLHaHMwjZybtB0rL0w3zFslxnE7VzcVBh4AdHCJ
	eBelvKbtXpYdX0eK1QMZ1yr4aINuAjqwTyN9ex2hhMhAkXrJUJW2OnE3tkdIDLph8Vf9zWv1uMriY
	pBuFzdxmdGX/B455kJ1ZfVfMffUOOQhYNeo7nCPuDgY9cnz2dRmjHdCfflAgygCwzz9dMliLcVfcn
	U14d4gbOWAQGip+nnS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbxY-00000007WMR-1RDl;
	Mon, 09 Mar 2026 14:51:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbxW-00000007WLv-0r3Y
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 14:51:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 774B34E425DC;
	Mon,  9 Mar 2026 14:51:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44E9F5FFB8;
	Mon,  9 Mar 2026 14:51:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9D2910369B2D;
	Mon,  9 Mar 2026 15:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773067905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hd7IdzAoha2La4O5/dbJJ9/gh71YS868BVfPkqeW6Kg=;
	b=OpllWE4kCUoe/+gc/UG815cKyabprHKi/57hvEdP7SO6k5dmgGKdC0PcuvpNtoayAoe8mi
	0GwA2B2YY+4BT+yryjRyNWiSi/q30KH2Pb5Mu+hhJbKyZUDeEQJKMwYUwPLX+LJloUfjb4
	n5qYOdvlBxqBTUqxUThAGA8b9lwKndRglF9svGovPSa3uZQR1F9nT7kiJzXAjOPcs5Mbp4
	0a8RhiMnlkYKVoH2utdBTGTtiKIt7iVbyMBsBAXjKh7OioFmSoejLJmEWcbHR0ZFmt2MUG
	OtWp90+3fKOKOv+UKw8w5Qth4H6ravVwGhr7sAt76ltOxMG2HeyOmPeorJCNLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: st,spear600-smi: convert to DT schema
In-Reply-To: <20260225-spear-v2-1-021bcb670601@gmail.com> (Akhila YS's message
	of "Wed, 25 Feb 2026 15:02:50 +0000")
References: <20260225-spear-v2-1-021bcb670601@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 15:51:42 +0100
Message-ID: <87bjgxoy2p.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_075150_372889_2D781D6A 
X-CRM114-Status: GOOD (  13.19  )
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

SGVsbG8gQWtoaWxhLAoKT24gMjUvMDIvMjAyNiBhdCAxNTowMjo1MCBHTVQsIEFraGlsYSBZUyA8
YWtoaWxheWFsbWF0aUBnbWFpbC5jb20+IHdyb3RlOgoKPiBDb252ZXJ0IFNUTWljcm9lbGVjdHJv
bmljcyBTUEVBcjYwMCBTZXJpYWwgTWVtb3J5IEludGVyZmFjZSAoU01JKQo+IENvbnRyb2xsZXIg
YmluZGluZyB0byBZQU1MIGZvcm1hdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFraGlsYSBZUyA8YWto
aWxheWFsbWF0aUBnbWFpbC5jb20+CgpHYXNwIDotKSBHb29kIHRvIHNlZSB0aGF0IHlvdSBhY3R1
YWxseSBkaWQgZml4IHRoZSBpc3N1ZXMuIFRoYW5rcyBmb3IKZG9pbmcgdGhhdC4gQnV0IHlvdSd2
ZSBiZWVuIHNlbmRpbmcgYSB2MiBmb3IgYSBwYXRjaCB0aGF0IGhhcyBhbHJlYWR5CmxhbmRlZCBp
biBUb3J2YWxkcycgdHJlZS4gSW4gdGhpcyBjYXNlLCB0aGVyZSBhcmUgb25seSAyIHBvc3NpYmls
aXRpZXM6Ci0gc2VuZGluZyBhIHJldmVydCBvZiB0aGUgZm9ybWVyIHBhdGNoIGFuZCB0aGVuIHRo
aXMgb25lCi0gc2VuZGluZyBmaXhlcyBsaWtlIEkgZGlkCkluIG5vIGNhc2Ugd2UgY2FuIGp1c3Qg
YXBwbHkgdGhpcyBvbmUgYXMtaXMuCgpBcyBpdCdzIGJlZW4gcmV2aWV3ZWQgYWxyZWFkeSBieSBS
b2IsIEknbGwgdGFrZSB0aGUgMyBmaXhlcyB0aGF0IEkKcHJvcG9zZWQuCgpbLi4uXQoKPiArICBj
bG9jay1yYXRlOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyCj4gKyAgICBkZXNjcmlwdGlvbjogRnVuY3Rpb25hbCBjbG9jayByYXRlIG9mIHRoZSBT
TUkgY29udHJvbGxlciBpbiBIei4KClRoaXMgY2xvY2sgcHJvcGVydHkgKHdoaWNoIEkgZGlkIG5v
dCBhZGRyZXNzIGluIG15IHNlcmllcykgaXMgYXBwYXJlbnRseQpub3QgdXNlZCBhbnl3aGVyZSB1
cHN0cmVhbS4gVGhpcyBpcyBhIHZlcnkgbGVnYWN5IHByb3BlcnR5LCBhbmQgbXkKZmVlbGluZyBp
cyB0aGF0IGl0IGhhcyBub3QgYmVlbiB1c2VmdWwgZm9yIHF1aXRlIHNvbWUgdGltZSBhbHJlYWR5
IChkdWUKdG8gdGhlIENDRiBiZWluZyBhYmxlIHRvIHByb3ZpZGUgYSBwcm9wZXIgY2xvY2sgdHJl
ZSBub3cpLiBIZW5jZSB3ZSBoYXZlCnR3byBjaG9pY2VzOiBjb25zaWRlcmluZyB0aGF0IGl0IGRv
ZXMgbm90IG5lZWQgdG8gYmUgZGVzY3JpYmVkIGF0IGFsbCBpbgp0aGUgeWFtbCBiaW5kaW5ncyBi
ZWNhdXNlIGl0IGlzICh2ZXJ5KSBkZXByZWNhdGVkIHByb3BlcnR5LCB3ZSBtaWdodAp3YW50IHRv
IGp1c3QgZHJvcCBpdCBvZmYuIE90aGVyd2lzZSB5b3UgbWF5IHNlbmQgYSBwYXRjaCBzcGVjaWZp
Y2FsbHkKZm9yIHRoaXMgYWRkaXRpb24sIGhvd2V2ZXIgaW4gdGhpcyBjYXNlIHlvdSBuZWVkIHRv
IGZsYWcgaXQgZGVwcmVjYXRlZCwKSSBiZWxpZXZlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
