Return-Path: <SRS0=nxGi=F3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7706CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 23:08:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3545223E0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 23:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3545223E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=crqjUDehIOSkmFxGWYFcj7O+XUl0eXW0IE0ih24Vryk=; b=wKgOF10K59+FUJGf/JGFXUOom
	sEBlsNozWfEo5eVbp9RyqfUs72YuUBy2kvVq6uZJ6FzXV06x0nNHKe7ygvt60BMt4mKeB4Iwprx9p
	1isb+I0HcQeOBWo1s8ofiSg/tHz/juadRZDwSKWHuaWW48FKoaa/NOJA5OZ6HOiLSj3/J9SxlSC/Q
	L0HvDWILBKnQ0/BHoa0xyHs72DwoAQMot9qhmeOZcI84oFRGD8DZWSV99foIldlKbENpN661oGV0O
	Xx9BhFoUj1bVSB8z2pNfTnueWDQjMmbKIlGAjqkQv4bREaUUYRyUcmCLuxFybNOh1Viyh9asNUxSh
	kYNmTrkJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksDE7-0001SN-A7; Wed, 23 Dec 2020 23:07:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksDE4-0001Ru-Rf
 for linux-mtd@lists.infradead.org; Wed, 23 Dec 2020 23:07:26 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CAD8A627AFD1;
 Thu, 24 Dec 2020 00:07:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SGMQu-kVD2FX; Thu, 24 Dec 2020 00:07:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 350BF6074003;
 Thu, 24 Dec 2020 00:07:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TI0iMxNtLuLf; Thu, 24 Dec 2020 00:07:21 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 05DAD627AFD1;
 Thu, 24 Dec 2020 00:07:21 +0100 (CET)
Date: Thu, 24 Dec 2020 00:07:20 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Chengsong Ke <kechengsong@huawei.com>
Message-ID: <244303467.160590.1608764840819.JavaMail.zimbra@nod.at>
In-Reply-To: <20201223121536.6244-1-kechengsong@huawei.com>
References: <20201223121536.6244-1-kechengsong@huawei.com>
Subject: Re: [PATCH v2] ubifs: Fix read out-of-bounds in
 ubifs_jnl_write_inode()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix read out-of-bounds in ubifs_jnl_write_inode()
Thread-Index: 0xc6wfczRyckhgf1Nz6eomypQ1IBQg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_180725_024026_4AC82910 
X-CRM114-Status: GOOD (  10.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: chengzhihao1 <chengzhihao1@huawei.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 wangfangpeng1 <wangfangpeng1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q2hlbmdzb25nIEtlLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFRoZSBtZW1v
cnkgYXJlYSBhbGxvY2F0ZWQgaW4gdWJpZnNfam5sX3dyaXRlX2lub2RlKCkgaXMgbm90IGFsaWdu
ZWQgd2l0aCA4Cj4gYnl0ZXM6Cj4gaW5vX3N0YXJ0ID0gaW5vID0ga21hbGxvYyh3cml0ZV9sZW4s
IEdGUF9OT0ZTKTsKPiAKPiBXaGVuIGlub19zdGFydCBwYXNzZWQgaW50byB3cml0ZV9oZWFkIC0+
IHViaWZzX3didWZfd3JpdGVfbm9sb2NrOgo+ICAgIG4gPSBhbGlnbmVkX2xlbiA+PiBjLT5tYXhf
d3JpdGVfc2hpZnQ7Cj4gICAgaWYgKG4pIHsKPiAgICAgIG4gPDw9IGMtPm1heF93cml0ZV9zaGlm
dDsKPiAgICAgIGVyciA9IHViaWZzX2xlYl93cml0ZShjLCB3YnVmLT5sbnVtLCBidWYgKyB3cml0
dGVuLCB3YnVmLT5vZmZzLCBuKTsKPiAgICAgIC8vIFJlYWQgb29iIG9jY3VycyBoZXJlLCByZWFk
IG4gYnl0ZXMgZnJvbSBidWYsIGFuZCBidWYgaXMgcGFzc2VkIGZyb20KPiAgICAgIEBpbm9fc3Rh
cnQgd2hpY2ggaXMKPiAgICAgIC8vIG5vdCA4IGJ5dGVzIGFsaWduZWQod3JpdGVfbGVuIDwgbiku
IFByb2dyYW0gcmVhZCAobiAtIHdyaXRlX2xlbikgbW9yZSBieXRlcy4KPiAgICB9Cj4gCj4gUmVw
cm9kdWNlcjoKPiAwLiBjb25maWcgS0FTQU4gJiYgYXBwbHkgcHJpbnQucGF0Y2gKPiAxLiBtb3Vu
dCB1YmlmcyBvbiAvcm9vdC90ZW1wCj4gMi4gcnVuIHRlc3Quc2gKCldoYXQgZG9lcyB0ZXN0LnNo
IGRvPwoKPiAzLiBjZCAvcm9vdC90ZW1wICYmIGxzIC8vIGNoYW5nZSBhdGltZSBmb3IgbGlua19m
aWxlCj4gNC4gd2FpdCAxfjIgbWludXRlcwo+IAo+IEluIG9yZGVyIHRvIHNvbHZlIHRoZSByZWFk
IG9vYiBwcm9ibGVtIGluIHViaWZzX3didWZfd3JpdGVfbm9sb2NrLCBqdXN0IGFsaWduCj4gdGhl
IHdyaXRlX2xlbiB0bwo+IDggYnl0ZXMgd2hlbiBhbGxvYyB0aGUgbWVtb3J5LiBTbyB0aGF0IHRo
aXMgcGF0Y2ggd2lsbCBub3QgYWZmZWN0IHRoZSB1c2Ugb2YKPiB3cml0ZV9sZW4gaW4gb3RoZXIK
PiBmdW5jdGlvbnMsIHN1Y2ggYXMgdWJpZnNfam5sX3dyaXRlX2lub2RlLT5tYWtlX3Jlc2VydmF0
aW9uIGFuZAo+IHViaWZzX2pubF93cml0ZV9pbm9kZS0+dWJpZnNfbm9kZV9jYWxjX2hhc2guCgpJ
IGdhdmUgdGhpcyBhIHNlY29uZCB0aG91Z2h0IGFuZCBJJ20gbm90IHNvIHN1cmUgYW55bW9yZSB3
aGF0IGV4YWN0bHkgaXMgZ29pbmcgb24uClRoZSBwcm9ibGVtIGlzIHJlYWwsIEkgZnVsbHkgYWdy
ZWUgd2l0aCB5b3UgYnV0IEkgbmVlZCB0byBkaWcgZGVlcGVyIGludG8KdGhlIGpvdXJuYWwgYW5k
IHdidWYgY29kZSB0byBkb3VibGUgY2hlY2sgdGhhdCB3ZSByZWFsbHkgZml4IHRoZSByaWdodCB0
aGluZwphbmQgbm90IGp1c3QgcGFwZXIgb3RoZXIgc29tZXRoaW5nLgoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
