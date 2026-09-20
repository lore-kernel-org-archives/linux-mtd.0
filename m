Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400DBC982D8
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hh0IDjAPN+SCfpXb77SkB4ZouR49Qo4Eb0VTf8hGaLA=; b=IUh39AudBy7Fdf
	n+uFhPNNN/AJJXHrayL5o34h/oWPNh0j2gcM1EouIvhC0tax0fuQu18OsUobH9yk0f46nN7tDkewd
	c6PrmtQDRsxiQZ+PGrRz0grjpXRPhdGH9q0j8cR2IBV2vpwRaGcy6JkaTnq0WJ1AvGq5hYm0JIQGo
	Fl7BbC6Qd5ic4+c+7SJbbi2g9e2CORpXBSM7t5NldH++14rXhCK5EmRXl/V37EMBZmg4kIyauPDF2
	alN1zQKq5E+lPy386YIbQfOema+F6j0FKNgaFWXfmGWeQdiBGuu+SsTH9w/5RWOathkT7ldmiJsz0
	9qPX2o0HlsnyzJoub6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Hdf-0000000HVaB-0iju;
	Sun, 20 Sep 2026 13:31:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Hdc-0000000HVZb-2cmM
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 13:31:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4818F1A08D2;
	Sun, 20 Sep 2026 13:31:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A0DD6033F;
	Sun, 20 Sep 2026 13:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47A1D103286A4;
	Sun, 20 Sep 2026 15:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789911080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ho9/kBr5mGqAXjmGooVocBDGGuNMsJ4mtwVDchOaC2M=;
	b=PFgPAumRabTL8Iyrnlvve5CL8iMdhTJ0Nx912AK+Zew0jr0pD/+RUw9+V9hLUr22Qyc4ZQ
	0y0Nrxd1sKRSVS/FP2/PYXTBXw8OVVWhC8aCNTGK4MFhzWMw6C8i5RSWjkj6BeSjZCcoKW
	PIg/iQfLPyT7GKA5bm+Fsxqufy6H6g0gZEre5yBqh/vE4e8sgUc0tW6d4HuxJ+lDsKofpY
	xXYgQ/Qzia0mQe3im+Wjyc6nwrbdD5MR900Ax6svSSZQzbQozcjtnSq6vwNwQPYBtv2OeP
	RI5K5c2OfHbhVsTubQ1cIKTt0FWpfjJK8eQpQq8QFcT0+xJVNQNlKpvtfObIbw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Only touch the QE bit on chips that have one
In-Reply-To: <20260910155355.3534491-1-naseefkm@gmail.com> (Ahmed Naseef's
	message of "Thu, 10 Sep 2026 19:53:55 +0400")
References: <20260910155355.3534491-1-naseefkm@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:30:45 +0200
Message-ID: <87tsnk82yi.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_063124_805319_E5505632 
X-CRM114-Status: UNSURE (   8.84  )
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

SGkgQWhtZWQsCgpPbiAxMC8wOS8yMDI2IGF0IDE5OjUzOjU1ICswNCwgQWhtZWQgTmFzZWVmIDxu
YXNlZWZrbUBnbWFpbC5jb20+IHdyb3RlOgoKPiBTaW5jZSBjb21taXQgYmUwYjg2YzY0OGJmICgi
bXRkOiBzcGluYW5kOiBHYXRoZXIgYWxsIHRoZSBidXMgaW50ZXJmYWNlCj4gc3RlcHMgaW4gb25l
IHNpbmdsZSBmdW5jdGlvbiIpIHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJsZSgpIGlzIGNhbGxlZAo+
IHVuY29uZGl0aW9uYWxseSBhbmQgY2xlYXJzIGJpdCAwIG9mIHRoZSBjb25maWd1cmF0aW9uIHJl
Z2lzdGVyIGV2ZW4gb24KPiBjaGlwcyB3aXRob3V0IFNQSU5BTkRfSEFTX1FFX0JJVC4gT24gc3Vj
aCBjaGlwcyB0aGF0IGJpdCBjYW4gaGF2ZSBhbm90aGVyCj4gbWVhbmluZzogb24gdGhlIFdpbmJv
bmQgVzI1TjAyS1YgaXQgaXMgSC1ESVMgKEhvbGQgRGlzYWJsZSwgZGVmYXVsdCAxKSwKPiBhbmQg
Y2xlYXJpbmcgaXQgZW5hYmxlcyB0aGUgL0hPTEQgZnVuY3Rpb24sIGFmdGVyIHdoaWNoIGVyYXNl
IGFuZCBwcm9ncmFtCj4gb3BlcmF0aW9ucyBzaWxlbnRseSBzdG9wIHRha2luZyBlZmZlY3Qgb24g
TVQ3OTg2IGJvYXJkcy4KPgo+IE9ubHkgcHJvZ3JhbSB0aGUgUUUgYml0IHdoZW4gdGhlIGNoaXAg
ZGVjbGFyZXMgU1BJTkFORF9IQVNfUUVfQklULCBhcwo+IGJlZm9yZS4KClNvcnJ5IGZvciB0aGUg
YnJlYWthZ2UgYW5kIHRoYW5rcyBmb3IgdGhlIGZpeCwgdW5mb3J0dW5hdGVseSBpdCBhcnJpdmVk
Cmp1c3QgYWZ0ZXIgYW5vdGhlciBjb21taXQgLXdoaWNoIEkgYW0gYWJvdXQgdG8gYXBwbHkgbm93
LSwgdGhlcmVmb3JlIEkKbXVzdCB0YWtlIHRoZSBmaXJzdCBwYXRjaCBzZW50IHZpc2libGUgdGhl
cmU6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMDEwNzAxYTA4ZDdlMTYzOC03
OWFhZjFlYS1jYzhjLTQ5ZTgtYmE3NC1jYmEwMjhhYWExODMtMDAwMDAwQGV1LWNlbnRyYWwtMS5h
bWF6b25zZXMuY29tLwoKSXMgaXMgdmVyeSBjbG9zZSB0byB5b3VyIHByb3Bvc2FsLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
