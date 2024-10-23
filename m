Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AD6D2E01E
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2024 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPCuVwe2jtkH70tduWGYM0WNI4PYLEi1FZSbztTXH+0=; b=kIFB6y40o5UtpS
	Zf+giKWosW+0PVHjusRUV9MWVAvajXj8SyQ6RAqrOnj11qEOfypecby5bff1X/jadP7QUjwtY5O7T
	02wheDTp4AsSnuxUnDxIAr2yiJZhSitIT3Gh6BLryBDVCgtR4Cmz9qg5lRF8IqbdrKiiwMkAODh4J
	E6eqCjCUcqRb18IreERgf8nMGqPOLGRieh7LRAAQV7fcHTN/2RiDTMj95/p/X215+WOt1THcTnmiV
	iumL1wfdm8zg5TbwNxy2pCn2v2YEwpe/iiFyEtnZKDIRE3pfbmxnsqFQPJiAhLhYXVQGcUhGuIBy8
	ANOmuZIqOhMR94LuurVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WcL-0000000DXqB-2RjO;
	Wed, 23 Oct 2024 08:21:21 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WTQ-0000000DVox-2IzS
	for linux-mtd@lists.infradead.org;
	Wed, 23 Oct 2024 08:12:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0323760005;
	Wed, 23 Oct 2024 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729671125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urYXz5XRimeHvnrKXZRB4OC+pYrVKes1qqj1xeRpeis=;
	b=A5ZqCkM9S3+1vtSP+5HgQd+gleo1W0TeLthtL8p+KcCdpI60i2OvKpxqULc18gm0asrh8f
	AjOqlfUH1r9UyGzs8LaMovgCdzJQOdhT1MaoRDfwQXSyl8JlEEQZyiqwZAK2qJbnWKlHjx
	IDkZTC70NGqZ5+m/Y2v9wzVXn7D1Z14wdb6a52lKhmv1RdP9nf2LHlaHPJ4knCv2XGgSYf
	TmjvNVlohrLrciGvpijGW3xlQXmKttLOsxjY3MAIkbKcSH2gpiCOxRW8ts3vbqNoOxYpAF
	YJYvkugkvZJ5oreGIyw4/mRjFtrsv7ck0+QR3wjZk2wRPbjWRwhlPCSBZOmMKQ==
Date: Wed, 23 Oct 2024 10:12:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zichen Xie <zichenxie0106@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, dinghao.liu@zju.edu.cn, arnd@arndb.de,
 scott.bauer@intel.com, kbusch@kernel.org, heinzm@redhat.com,
 snitzer@redhat.com, linux-mtd@lists.infradead.org, zzjas98@gmail.com,
 chenyuan0y@gmail.com
Subject: Re: [PATCH v2] mtd: diskonchip: Cast an operand to uint64_t to
 prevent potential uint32_t overflow in inftl_partscan()
Message-ID: <20241023101200.779c805e@xps-13>
In-Reply-To: <ef69b21f-bf0f-4dba-84fa-c78cff729606@gmail.com>
References: <20241021192753.8582-1-zichenxie0106@gmail.com>
	<20241022104138.3f9de009@xps-13>
	<ef69b21f-bf0f-4dba-84fa-c78cff729606@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_011208_742438_95F2CD4D 
X-CRM114-Status: GOOD (  19.33  )
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

SGkgWmljaGVuLAoKemljaGVueGllMDEwNkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAyMiBPY3Qg
MjAyNCAxMDo0OTo0NSAtMDUwMDoKCj4gT24gMjAyNC8xMC8yMiAzOjQxLCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gemljaGVueGllMDEwNkBnbWFpbC5jb20gd3JvdGUgb24g
TW9uLCAyMSBPY3QgMjAyNCAxNDoyNzo1NCAtMDUwMDoKPiA+ICAKPiA+PiBGcm9tOiBaaWNoZW4g
WGllIDx6aWNoZW54aWUwMTA2QGdtYWlsLmNvbT4KPiA+Pgo+ID4+IFRoaXMgd2FzIGZvdW5kIGJ5
IGEgc3RhdGljIGFuYWx5emVyLiAgCj4gPiBUaGlzIHNob3VsZCBiZSB0aGUgbGFzdCBzZW50ZW5j
ZSwgbm90IHRoZSBmaXJzdCwgbWF5YmU/ICAKPiBJIHNhdyBhIGxvdCBwYXRjaGVzIG1ha2luZyBp
dCBhcyB0aGUgZmlyc3Qgc2VudGVuY2UuIFNvLCBJIGRpZCBpdCB0b28uCgpXZWxsLCB0aGV5IGFy
ZSBsaWtlbHkgd3JvbmcuCgpBbHNvLCBwbGVhc2Ugc2hvcnRlbiB5b3VyIGNvbW1pdCB0aXRsZQoK
IkNhc3QgYW4gb3BlcmFuZCB0byBwcmV2ZW50IHBvdGVudGlhbCBvdmVyZmxvdyIgd291bGQgYmUg
ZW5vdWdoLiBZb3UnbGwKZ2l2ZSB0aGUgZGV0YWlscyBpbiB0aGUgY29tbWl0IGxvZyBhbnl3YXku
Cgo+ID4gIAo+ID4+IFRoZXJlIG1heSBiZSBhIHBvdGVudGlhbCBpbnRlZ2VyIG92ZXJmbG93IGlz
c3VlIGluCj4gPj4gaW5mdGxfcGFydHNjYW4oKS4gcGFydHNbMF0uc2l6ZSBpcyBkZWZpbmVkIGFz
ICJ1aW50NjRfdCIKPiA+PiB3aGlsZSBtdGQtPmVyYXNlc2l6ZSBhbmQgaXAtPmZpcnN0VW5pdCBh
cmUgZGVmaW5lZCBhcyAzMi1iaXQKPiA+PiB1bnNpZ25lZCBpbnRlZ2VyLiBUaGUgcmVzdWx0IG9m
IHRoZSBjYWxjdWxhdGlvbiB3aWxsIGJlIGxpbWl0ZWQKPiA+PiB0byAzMiBiaXRzIHdpdGhvdXQg
Y29ycmVjdCBjYXN0aW5nLgo+ID4+IFNvLCB3ZSByZWNvbW1lbmQgYWRkaW5nIGFuIGV4dHJhIGNh
c3QgdG8gcHJldmVudCBwb3RlbnRpYWwKPiA+PiBpbnRlZ2VyIG92ZXJmbG93LiAgCj4gPiBUaGUg
d3JhcHBpbmcgaXMgb2RkLiAgCj4gU29ycnksIGJ1dCBjb3VsZCB5b3UgcGxlYXNlIHBvaW50IG91
dCB3aGVyZSdzIG9kZCBzbyBJIGNhbiBmaXggaXQuCgpZb3VyIGNvbW1pdCBsb2cgaXMgd3JhcHBl
ZCBhdCA2MC1jaGFyLgoKPiA+ICAKPiA+PiBGaXhlczogMWRhMTc3ZTRjM2Y0ICgiTGludXgtMi42
LjEyLXJjMiIpCj4gPj4gU2lnbmVkLW9mZi1ieTogWmljaGVuIFhpZSA8emljaGVueGllMDEwNkBn
bWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gdjI6IGNvcnJlY3QgIkZpeGVzIiB0YWcuICAKPiA+IElm
IHlvdSB3YW50IHRvIHByb3ZpZGUgYSBmaXgsIHlvdSBwcm9iYWJseSB3YW50IHRvIENjOiBzdGFi
bGUgYXMgd2VsbC4gIAo+IAo+IFllYWgsIEkgd2lsbCBhZGQgdGhhdCB0byB0aGUgbmV4dCB2ZXJz
aW9uLgo+IAo+IAo+IEJlc3QsCj4gCj4gWmljaGVuCj4gCj4gPgo+ID4gVGhhbmtzLAo+ID4gTWlx
dcOobCAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
