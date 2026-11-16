Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC6606A31C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kLj0p2CW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a5ORgj1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hu3XZ0Y85UrGBvroyCSTzRQLTlrlfyG8K4OHdcR2NQg=; b=kLj0p2CWckaIjN6WPZcqpX6RDJ
	3ExN1Oh3IB88M+LbP1BYCQfEPNeIeFBV4+4A9rWDl56mjwd57x+zLkbyumjQTONYlmeipvBCTp/dL
	2+Ww/71V1G2URkoe16fq+2rVUKN3VVgx0tEezZ7QI80zreJie1YU+GNgx/TcmEZwBCUJ5ZcaGCoSi
	oo+P3faFi5btOI7M9TlIDSPVXfQahfnX45PzrbVxWFEFBmk7GC0THP3MSzyc+JcZwJ+OFWYI9vIr0
	7oMFikmG/3l28hAUmE3N+ybeOrYvWNIkg+eH/n41m5eA+0WTDtfW/xDmtUqzdDqXiXd8XUKoziJ16
	VOcetdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0AJ-00000003MZ5-27bU;
	Mon, 16 Nov 2026 17:06:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0AF-00000003MYj-1JxH
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 17:06:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 07B2FC4EFDD;
	Mon, 16 Nov 2026 17:06:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9C226023F;
	Mon, 16 Nov 2026 17:06:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A36E11BC0870;
	Mon, 16 Nov 2026 18:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794848795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rTrpfe0/Ho6gwSbR93fpkaq+6QWwt36pGp47oud6ak=;
	b=a5ORgj1amuq6POasQBkp1fP4QeSNIkHbk7rIccltiJA/iQkZU4WRjSFmhDU5cH0cPzbIve
	9ZzbpHP1PtdSAcH5/eXen38Gh9JCiIX1rhQQuczCh7XG8OsYOTM9JFyKi8niSFOJfD96hu
	mGqMuvG+GC3EsOF45kOuQV92NAWl+btrEysHIAx/FqfgeH7XxGjEcgVAYuuhrXbRYqz0q2
	SlhmA44K5n2ob+MKVoPGI0uzfyHaug0Zip4Boq6rny5em+6i4bJeWlbFhyHtiPwqDpIjqu
	kxBqUn8nLi1UXNMYa8/BzolJ5tqDajSNzU6VBjXTiipLUPhGqMS9LIwIeDrwDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Guanglei Zhu <zhugl3@xiaopeng.com>,  Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mips@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Weibin Liu
 <liuwb@xiaopeng.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4725b_correct()
In-Reply-To: <91b7fc2fd16f1089449701c002dd33e191894871.camel@crapouillou.net>
	(Paul Cercueil's message of "Fri, 06 Nov 2026 15:37:47 +0100")
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
	<20261105042405.71352-1-zhugl3@xiaopeng.com>
	<91b7fc2fd16f1089449701c002dd33e191894871.camel@crapouillou.net>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 18:06:30 +0100
Message-ID: <87h5hgpuy1.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_090643_522825_0A3E607A 
X-CRM114-Status: GOOD (  16.98  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDYvMTEvMjAyNiBhdCAxNTozNzo0NyArMDEsIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PiB3cm90ZToKCj4gSGksCj4KPiBMZSBqZXVkaSAwNSBub3ZlbWJyZSAyMDI2IMOg
IDEyOjI0ICswODAwLCBHdWFuZ2xlaSBaaHUgYSDDqWNyaXTCoDoKPj4gRnJvbTogV2VpYmluIExp
dSA8bGl1d2JAeGlhb3BlbmcuY29tPgo+PiAKPj4gVGhlIEpaNDcyNUIgQkNIIGNvbnRyb2xsZXIg
cmVwb3J0cyBlYWNoIGNvcnJlY3RlZCBiaXQgZXJyb3IgYXMgYW4KPj4gaW5kZXggaW50byB0aGUg
Y29kZXdvcmQgaXQgd2FzIGFza2VkIHRvIGRlY29kZSwgaW4gdGhlIElOREVYMC9JTkRFWDEKPj4g
ZmllbGRzIG9mIHRoZSBCQ0hfQkhFUlIgcmVnaXN0ZXJzLiBUaGVzZSBmaWVsZHMgYXJlIDEzIGJp
dHMgd2lkZSwgYnV0Cj4+IG5vdGhpbmcgaW4gano0NzI1Yl9jb3JyZWN0KCkgY2hlY2tzIHRoZSBy
ZXBvcnRlZCBpbmRleCBhZ2FpbnN0IHRoZQo+PiBzaXplIG9mIHRoZSBkYXRhIGJ1ZmZlciBiZWlu
ZyBjb3JyZWN0ZWQ6Cj4+IAo+PiDCoMKgwqAgYnVmWyhiaXQgPj4gMyldIF49IEJJVChiaXQgJiAw
eDcpOwo+PiAKPj4gV2l0aCBkYXRhIG9yIEVDQyBjb21pbmcgZnJvbSBhbiB1bnRydXN0ZWQgZmxh
c2gsIHRoZSBkZWNvZGVyIGNhbgo+PiByZXBvcnQgYW4gaW5kZXggdGhhdCBwb2ludHMgcGFzdCB0
aGUgZW5kIG9mIHRoZSBkYXRhIGJ1ZmZlciwgYW5kIHRoZQo+PiBhYm92ZSBzdGF0ZW1lbnQgdGhl
biBmbGlwcyBhIGJpdCBvdXRzaWRlIHRoZSBidWZmZXIuCj4+IAo+PiBTa2lwIHRoZSBjb3JyZWN0
aW9uIHdoZW4gdGhlIHJlcG9ydGVkIGluZGV4IGRvZXMgbm90IHBvaW50IGludG8KPj4gdGhlIGRh
dGEgYXJlYS7CoCBBIGJpdGZsaXAgaW4gdGhlIHBhcml0eSBieXRlcyBkb2VzIG5vdCBhZmZlY3Qg
dGhlCj4+IGRhdGEsIHNvIHJlamVjdGluZyB0aGUgcGFnZSBmb3IgaXQgd291bGQgZmFpbCByZWFk
cyB0aGF0IGFyZQo+PiBwZXJmZWN0bHkgY29ycmVjdGFibGUsIGFuZCBhbiBpbmRleCBiZXlvbmQg
dGhlIGNvZGV3b3JkIGhhcyBubwo+PiBidWZmZXIgdG8gdXBkYXRlIGluIHRoZSBmaXJzdCBwbGFj
ZS4KPj4gCj4+IEZpeGVzOiAzZTZhYzJhZDkwYjMgKCJtdGQ6IHJhd25hbmQ6IGluZ2VuaWM6IEFk
ZCBzdXBwb3J0IGZvciB0aGUgSlo0NzI1QiIpCj4+IFNpZ25lZC1vZmYtYnk6IFdlaWJpbiBMaXUg
PGxpdXdiQHhpYW9wZW5nLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6IHNraXAgdGhlIGNv
cnJlY3Rpb24gZm9yIGFuIGluZGV4IHRoYXQgZG9lcyBub3QgcG9pbnQKPj4gaW50byB0aGUgZGF0
YSBhcmVhIGluc3RlYWQgb2YgZmFpbGluZyB0aGUgcGFnZSB3aXRoIC1FQkFETVNHLsKgIEEKPj4g
Y29ycmVjdGFibGUgYml0ZmxpcCBpbiB0aGUgRUNDIGJ5dGVzIGxlYXZlcyB0aGUgZGF0YSB2YWxp
ZCwgYW5kIHRoZQo+PiBlYXJseSBleGl0IGFsc28gZHJvcHBlZCB0aGUgZXJyb3IgZW50cmllcyB0
aGF0IGZvbGxvd2VkIGl0LsKgIFRoaXMKPj4gbWF0Y2hlcyBob3cgano0NzQwX2VjY19jb3JyZWN0
KCkgdHJlYXRzIGl0cyBpbmRleGVzLgo+PiAKPj4gVmVyaWZpZWQgd2l0aCBhIHVzZXJzcGFjZSBy
ZXBsaWNhIG9mIHRoZSBjb3JyZWN0aW9uIGxvb3A6IHdpdGgKPj4gcGFyYW1zLT5zaXplID0gNTEy
LCBhbiBpbmRleCBvZiA0MDk5IChwYXJpdHkgYXJlYSkgZm9sbG93ZWQgYnkgYQo+PiBkYXRhLWFy
ZWEgaW5kZXggb2YgMTAwIGluIHRoZSBzYW1lIEJIRVJSIHJlZ2lzdGVyIGlzIG5vdyBjb3JyZWN0
ZWQKPj4gKHYxIHJldHVybmVkIC1FQkFETVNHIGFuZCBsZWZ0IHRoZSBkYXRhIGVycm9yIHVuZml4
ZWQpLCB0aGUgZmllbGQKPj4gbWF4aW11bSAoMHgxZmZmKSBwcm9kdWNlcyBubyB3cml0ZSBvdXRz
aWRlIHRoZSBidWZmZXIsIGFuZCBpbi1yYW5nZQo+PiBpbmRleGVzIGtlZXAgY29ycmVjdGluZyBh
cyBiZWZvcmUuCj4KPiBXaGF0IGJvdGhlcnMgbWUsIGFuZCBtYXliZSBpdCdzIGp1c3QgbWUgbm90
IGtub3dpbmcgTkFORCB0aGF0IHdlbGw6IHdvdWxkbid0IGEKPiBiaXQtZmxpcCBpbiB0aGUgcGFy
aXR5IGFyZWEgY2F1c2UgYSBjYXNjYWRlIG9mIGZhbHNlLXBvc2l0aXZlcyBpbiB0aGUKPiBkYXRh
IHRvbywKCk5vLCBiZWNhdXNlIHRoZSBkYXRhIHZzLiBwYXJpdHkgc3BsaXQgb25seSBleGlzdCBi
ZWNhdXNlIG91ciBodW1hbgpicmFpbnMgcHJlZmVyIHdoZW4gdGhlIHJvb20gaXMgdGlkeSwgZGF0
YSB3aXRoIGRhdGEsIHBhcml0eSB3aXRoCnBhcml0eS4gQnV0IGluIHByYWN0aWNlIGJpdGZsaXBz
IGNhbiBoYXBwZW4gYW55d2hlcmUgaW4gdGhlIGRhdGEgb3IgaW4KdGhlIHNvIGNhbGxlZCBwYXJp
dHkgYXJlYSwgaXQncyB0aGUgc2FtZSBwb29sIG9mIGJpdHMgZm9yIHRoZQphbGdvcml0aG0uIEl0
IGRvZXMgbm90IG1hdHRlciB3aGVyZSBiaXRmbGlwcyBhcmUgYXMgbG9uZyBhcyB0aGUKdGhyZXNo
b2xkIGlzIG5vdCBleGNlZWRlZC4KCklmIEkgcmVtZW1iZXIgd2VsbCwgaW4gdGhlIGhhbW1pbmcg
c29mdHdhcmUgRUNDIGltcGxlbWVudGF0aW9uICh1bmRlcgpsaWIvKSwgd2UgZG8gbm90IGV2ZW4g
Ym90aGVyIGZpeGluZyB0aGUgYml0ZmxpcHMgaW4gdGhlIHBhcml0eSBhcmVhLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
