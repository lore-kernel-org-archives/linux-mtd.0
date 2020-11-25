Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1CCC56201
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 23:15:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A14782083E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 23:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3GgVWkt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A14782083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Na526cGJzCp7ahuqGmQRbfNoaSR1JHRfuK8WWVbp9uk=; b=N3GgVWktYFUxPJ4ZNyT+M9XcC
	7CidEEJxTTxTh1r9QvwqrWuaRdWt8osKJ9jgdK5lWvF0xMEiJgnxzcHT/VIb6lnF1wI/Q1Jp6H9Qz
	FRyi1INUpqYmfzvDo5I1Ubm4IZrSYVZRRLSCUZSjFBXaqYBpCUhocpiJZtoyjMTzygp4VFEOd699w
	MQrcdMw3FlTSEHxGzU0iScF9mIcRRQ6IejGhTyJMWmKBI5MC5fedhXc5+G651aR6Ww33sRzbolsUw
	DC58IrqL0hlK1MC6eSk1C8GSm25GEx0wBK0WETBzHCW1EEeRdeSlnW+XXuZogtZm92KozNGHXeQ+V
	2jxEG3gfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki3z3-0000EV-SW; Wed, 25 Nov 2020 23:13:57 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki3z1-0000DY-IE
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 23:13:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E8872625DE19;
 Thu, 26 Nov 2020 00:13:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3D5H4cUW0l9S; Thu, 26 Nov 2020 00:13:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7ADB5608311C;
 Thu, 26 Nov 2020 00:13:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id C_ZoIjg1vfYi; Thu, 26 Nov 2020 00:13:45 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4F817625DE19;
 Thu, 26 Nov 2020 00:13:45 +0100 (CET)
Date: Thu, 26 Nov 2020 00:13:45 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <728548959.34116.1606346025135.JavaMail.zimbra@nod.at>
In-Reply-To: <20201119141659.26176-1-richard@nod.at>
References: <20201119141659.26176-1-richard@nod.at>
Subject: Re: [PATCH 0/5] [RFC] MUSE: Userspace backed MTD
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD
Thread-Index: S9/hp4kqudiaTtGCb/4FWtfAvw5CXg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_181355_728679_F8F6A842 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFdoZW4gd29ya2luZyB3aXRoIGZsYXNo
IGRldmljZXMgYSBjb21tb24gdGFzayBpcyBlbXVsYXRpbmcgdGhlbSB0byBydW4gdmFyaW91cwo+
IHRlc3RzIG9yIGluc3BlY3QgZHVtcHMgZnJvbSByZWFsIGhhcmR3YXJlLiBUbyBhY2hpZXZlIHRo
YXQgd2UgaGF2ZSBwbGVudHkgb2YKPiBlbXVsYXRvcnMgaW4gdGhlIG10ZCBzdWJzeXN0ZW06IG10
ZHJhbSwgYmxvY2sybXRkLCBuYW5kc2ltLgo+IAo+IEVhY2ggb2YgdGhlbSBpbXBsZW1lbnRzIGEg
YWRob2MgTVREIGFuZCBoYXZlIHZhcmlvdXMgZHJhd2JhY2tzLgo+IE92ZXIgdGhlIGxhc3QgeWVh
cnMgc29tZSBkZXZlbG9wZXJzIHRyaWVkIHRvIGV4dGVuZCB0aGVtIGJ1dCB0aGVzZSBhdHRlbXB0
cwo+IG9mdGVuIGdvdCByZWplY3RlZCBiZWNhdXNlIHRoZXkgYWRkZWQganVzdCBtb3JlIGFkaG9j
IGZlYXR1cmUgaW5zdGVhZCBvZgo+IGFkZHJlc3Npbmcgb3ZlcmFsbCBwcm9ibGVtcy4KPiAKPiBN
VVNFIGlzIGEgbm92ZWwgYXBwcm9hY2ggdG8gYWRkcmVzcyB0aGUgbmVlZCBvZiBhZHZhbmNlZCBN
VEQgZW11bGF0b3JzLgo+IEFkdmFuY2VkIG1lYW5zIGluIHRoaXMgY29udGV4dCBzdXBwb3J0aW5n
IGRpZmZlcmVudCAodmVuZG9yIHNwZWNpZmljKSBpbWFnZQo+IGZvcm1hdHMsIGRpZmZlcmVudCB3
YXlzIGZvciBmYXVsdCBpbmplY3Rpb24gKGZ1enppbmcpIGFuZCByZWNvZGluZy9yZXBsYXlpbmcK
PiBJT3MgdG8gZW11bGF0ZSBwb3dlciBjdXRzLgo+IAo+IFRoZSBjb3JlIGdvYWwgb2YgTVVTRSBp
cyBoYXZpbmcgdGhlIGNvbXBsZXhpdHkgb24gdGhlIHVzZXJzcGFjZSBzaWRlIGFuZAo+IG9ubHkg
YSBzbWFsbCBNVEQgZHJpdmVyIGluIGtlcm5lbHNwYWNlLgo+IFdoaWxlIHBsYXlpbmcgd2l0aCBk
aWZmZXJlbnQgYXBwcm9hY2hlcyBJIHJlYWxpemVkIHRoYXQgRlVTRSBvZmZlcnMgZXZlcnl0aGlu
Zwo+IHdlIG5lZWQuIFNvIE1VU0UgaXMgYSBsaXR0bGUgbGlrZSBDVVNFIGV4Y2VwdCB0aGF0IGl0
IGRvZXMgbm90IGltcGxlbWVudCBhCj4gYmFyZSBjaGFyYWN0ZXIgZGV2aWNlIGJ1dCBhbiBNVEQu
Cj4gCj4gVG8gZ2V0IGVhcmx5IGZlZWRiYWNrIEknbSBzZW5kaW5nIHRoaXMgc2VyaWVzIGFzIFJG
Qywgc28gZG9uJ3QgY29uc2lkZXIgaXQgYXMKPiByZWFkeSB0byBtZXJnZSB5ZXQuCj4gCj4gT3Bl
biBpc3N1ZXMgYXJlOgo+IAo+IDEuIER1bW15IGZpbGUgb2JqZWN0Cj4gVGhlIGxvZ2ljIGFyb3Vu
ZCBmdXNlX2RpcmVjdF9pbygpIGV4cGVjdHMgYSBmaWxlIG9iamVjdC4KPiBVbmxpa2UgRlVTRSBv
ciBDVVNFIHdlIGRvbid0IGhhdmUgc3VjaCBhbiBvYmplY3QgaW4gTVVTRSBiZWNhdXNlIHVzdWFs
bHkgYW4KPiBNVEQgaXMgbm90IG9wZW5lZCBieSB1c2Vyc3BhY2UuIFRoZSBrZXJuZWwgdXNlcyB0
aGUgTVREIGFuZCBtYWtlcyBpdCBhdmFpbGFibGUKPiB0byBmaWxlc3lzdGVtcyBvciBvdGhlciBs
YXllcnMgc3VjaCBhcyBtdGRibG9jaywgbXRkY2hhciBvciBVQkkuCj4gQ3VycmVudGx5IGEgYW5v
biBpbm9kZSBpcyAoYWIpdXNlZCBmb3IgdGhhdC4KPiBNYXliZSB0aGVyZSBpcyBhIGJldHRlciB3
YXk/CgpGWUksIEknbGwgc2VuZCBhbiB1cGRhdGVkIHNlcmllcyBzb29uLiBJIHJld3JvdGUgdGhl
IE1VU0UgSU8gcGF0aCB0byBub3QgdXNlIGZ1c2VfZGlyZWN0X2lvKCkKd2hpY2ggbWFkZSB0aGlu
Z3MgbXVjaCBzaW1wbGVyIGFuZCBhbGwgaGFja3MgZ28gYXdheS4KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
