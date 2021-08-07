Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9363C4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:29:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FAFF610CB
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FAFF610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zSz6oNtgRdFAnU7w7ko+bDqd7eCQ9emJ+ZHeULxuws=; b=n1H6frwfvwGOOA
	s2XQ/EWS2/EVQItU5a8C70h+HcGEbrE+7Ls1pG3mKn77POQw0K/tZqimyescVgn0QXF/9KxbKs+e8
	YSULiWXgFaKXiWwEpruF3NSiE1Ud/XKWTvlAIEEUly65HSISUmHIuwRVIwFczUy3CXD5b/3BuHKPc
	3IrzZ9vQJKUs2N3IQT9gWzqSrfVjFdoKWNOJDtcdkgHkakaXnvfqG4HtOQ/doelWymhyuB8o8CZRj
	cRiyT+zofvL03YTjaZYnus5o0dcjFN+FIF4aWszUND4ROnSbCgI9yx0tzrJ5V1d06+9FZE0ArOzzz
	VAAOljBRtChQtKb1EGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCJZ8-00EYwC-7Q; Sat, 07 Aug 2021 10:28:30 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCJZ5-00EYuG-1w
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 10:28:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B41F9C0004;
 Sat,  7 Aug 2021 10:28:15 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:28:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>
Subject: Re: [PATCH 2/2] mtd: mtdconcat: Remove concat_{read|write}_oob
Message-ID: <20210807122814.109ec082@xps13>
In-Reply-To: <83cb21c4-0140-40d5-e0f8-7f2a7e781a5f@huawei.com>
References: <20210731023243.3977104-1-chengzhihao1@huawei.com>
 <20210731023243.3977104-3-chengzhihao1@huawei.com>
 <20210806212655.16e4d03d@xps13>
 <83cb21c4-0140-40d5-e0f8-7f2a7e781a5f@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_032827_288510_1B9CA759 
X-CRM114-Status: GOOD (  13.06  )
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

SGkgWmhpaGFvLAoKWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGUg
b24gU2F0LCA3IEF1ZyAyMDIxCjEwOjU5OjMyICswODAwOgoKPiDlnKggMjAyMS84LzcgMzoyNiwg
TWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gSGkgTWlxdWVsLAo+ID4+ICAgc3RhdGljIGludCBjb25j
YXRfZXJhc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICppbnN0cikK
PiA+PiAgIHsKPiA+PiAgIAlzdHJ1Y3QgbXRkX2NvbmNhdCAqY29uY2F0ID0gQ09OQ0FUKG10ZCk7
Cj4gPj4gQEAgLTY4NCwxMCArNTgwLDYgQEAgc3RydWN0IG10ZF9pbmZvICptdGRfY29uY2F0X2Ny
ZWF0ZShzdHJ1Y3QgbXRkX2luZm8gKnN1YmRldltdLAkvKiBzdWJkZXZpY2VzIHRvIGMKPiA+PiAg
IAlzdWJkZXZfbWFzdGVyID0gbXRkX2dldF9tYXN0ZXIoc3ViZGV2WzBdKTsKPiA+PiAgIAlpZiAo
c3ViZGV2X21hc3Rlci0+X3dyaXRldikKPiA+PiAgIAkJY29uY2F0LT5tdGQuX3dyaXRldiA9IGNv
bmNhdF93cml0ZXY7Cj4gPj4gLQlpZiAoc3ViZGV2X21hc3Rlci0+X3JlYWRfb29iKQo+ID4+IC0J
CWNvbmNhdC0+bXRkLl9yZWFkX29vYiA9IGNvbmNhdF9yZWFkX29vYjsKPiA+PiAtCWlmIChzdWJk
ZXZfbWFzdGVyLT5fd3JpdGVfb29iKQo+ID4+IC0JCWNvbmNhdC0+bXRkLl93cml0ZV9vb2IgPSBj
b25jYXRfd3JpdGVfb29iOyAgCj4gPiBBY3R1YWxseSBJIGFtIG5vdCBzdXJlIF9yZWFkfHdyaXRl
X29vYigpIGlzIHRoZSByaWdodCBjYWxsYmFjayB0bwo+ID4gcmVtb3ZlLgo+ID4KPiA+IFJpY2hh
cmQsIHdoYXQgaXMgeW91ciBpbnB1dCBvbiB0aGlzPyBTaGFsbCB3ZSByZW1vdmUgX3JlYWR8d3Jp
dGUoKQo+ID4gaW5zdGVhZD8gSSBkb24ndCByZW1lbWJlciB0aGUgZXhhY3QgcmF0aW9uYWxlIGJl
aGluZCB0aGVzZSB0d28gaGVscGVycy4gIAo+IAo+IE9oLCBJIGd1ZXNzIEkgbWFkZSBhIG1pc3Rh
a2UuIEl0IGxvb2tzIGxpa2UgdGhhdCByZXNlcnZpbmcgX3tyZWFkfHdyaXRlfV9vb2IgaXMgYSBi
ZXR0ZXIgbWV0aG9kIGluIG15IGxpbWl0ZWQga25vd2xlZGdlIHRvIG5hbmQgZHJpdmVyLiBGb3Ig
ZXhhbXBsZSwgbmFuZF9kb19yZWFkX29vYigpIGJlaGF2ZXMgZGlmZmVyZW50IGZyb20gbmFuZF9k
b19yZWFkX29wcygpLCBhbmQgY2FsbGluZyB3aGljaCBmdW5jdGlvbiBpcyBkZWNpZGVkIGJ5IG10
ZF9vb2Jfb3BzLmRhdGFidWYuCj4gQ2FsbGJhY2sgX3JlYWRfb29icygpIGNhbiBzdXBwb3J0IGJv
dGggZnVuY3Rpb25zLCBidXQgY2FsbGJhY2sgX3JlYWQoKSBkb24ndCBzdXBwb3J0IG5hbmRfZG9f
cmVhZF9vb2IoKS4gU28gbXRkX3JlYWRfb29icygpIGNvdmVycyBtdGRfcmVhZCgpPwo+IElzIG15
IHVuZGVyc3RhbmQgcmlnaHQ/Cj4gCgpZZXMgcGxlYXNlIGxldCdzIGRyb3AgX3JlYWR8d3JpdGUo
KSBpbnN0ZWFkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
