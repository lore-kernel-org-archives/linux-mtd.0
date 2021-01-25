Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031C0C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:54:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 852EA22D04
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 852EA22D04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gJxD6wOFpoti/BO00Wf5dOcyQva2iTclqd/Zoy5VTyw=; b=AiVwLOk6L0Ftf1w1qD2RuyZ1F
	SB8AsRsFpVBejkncoOKlny4D9UtCZ83o/liRcUis75xsdCxap2O8zGAjXAPe+k3IxmAdlgHgPJLCP
	hglubLSZ+JK0PXp1KR1RUGl9MiGt0wScYuI/QZo60OQZgqZ6RIeYWEhYg4rGIOUukWGbEOhqSExqj
	m3oitaovZqply0IIyFmGlUJu5nbDR8OcNX/cGm7RUNBGFAQ44f5FuNQK+ctVSoNuxln65+w7MOKVe
	YSvVK3jAQG13obMsRV4+4iPRCvAJ/I9QdqhjOZoGoXvm9/1ppavLs2Uz72PRxLR0EbQ0mCR2xyzsY
	duGb2Arww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3xcv-00051k-4z; Mon, 25 Jan 2021 08:53:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3xcs-00051M-K3
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 08:53:35 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 486B3C0013;
 Mon, 25 Jan 2021 08:53:31 +0000 (UTC)
Date: Mon, 25 Jan 2021 09:53:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: yangerkun <yangerkun@huawei.com>
Subject: Re: [PATCH] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
Message-ID: <20210125095331.2abf626e@xps13>
In-Reply-To: <527f4357-16a6-2561-81c2-20127eabd68c@huawei.com>
References: <20210104101830.3036-1-miquel.raynal@bootlin.com>
 <01746715-84dc-cd7a-508a-52ba3172e339@huawei.com>
 <20210125092852.504f082f@xps13>
 <527f4357-16a6-2561-81c2-20127eabd68c@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_035334_791485_E089EC1A 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: patrick@baymotion.com, zhongguohua1@huawei.com, joern@lazybastard.org,
 linux-mtd@lists.infradead.org, richard@nod.at
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp5YW5nZXJrdW4gPHlhbmdlcmt1bkBodWF3ZWkuY29tPiB3cm90ZSBvbiBNb24sIDI1
IEphbiAyMDIxIDE2OjM2OjUwCiswODAwOgoKPiDlnKggMjAyMS8xLzI1IDE2OjI4LCBNaXF1ZWwg
UmF5bmFsIOWGmemBkzoKPiA+IEhpIHlhbmdlcmt1biwKPiA+IAo+ID4geWFuZ2Vya3VuIDx5YW5n
ZXJrdW5AaHVhd2VpLmNvbT4gd3JvdGUgb24gTW9uLCAyNSBKYW4gMjAyMSAxMzo0ODozMgo+ID4g
KzA4MDA6Cj4gPiAgIAo+ID4+IEhpLAo+ID4+Cj4gPj4gUmVjaGVjayB0aGUgcGF0Y2gsIGFuZCBp
dCBzZWVtcyB3ZSBuZWVkIGNoZWNrIGVyYXNlc2l6ZSB0byBwcmV2ZW50IERJVi8wLi4uICAKPiA+
IAo+ID4gQ2FuIHlvdSBlbGFib3JhdGUgYSBsaXR0bGUgYml0Pwo+ID4gCj4gPiBUaGUgZG9fZGl2
KCkgIT0gMCBoYXMgYmVlbiByZXBsYWNlZCBieSB0aGUgJ3JlbScgY29uZGl0aW9uIGFuZCBpdCBz
ZWVtcwo+ID4gZ29vZCB0byBtZS4gU28gcGxlYXNlIHRlbGwgbWUgd2hhdCBkaXZpc2lvbiBieSB6
ZXJvIHlvdSBhcmUgdGFsa2luZwo+ID4gYWJvdXQgYmVjYXVzZSB0aGUgYmVnaW5uaW5nIG9mIHRo
ZSBpZiBjb25kaXRpb24gaXMgImxlbiA9PSAwIHx8Cj4gPiBlcmFzZXNpemUgPT0gMCB8fCBlcmFz
ZXNpemUgPiBsZW4iLCBzbyBpdCBkb2VzIGFscmVhZHkgdGFrZSBjYXJlIG9mCj4gPiB0aGlzIHNp
dHVhdGlvbi4gIAo+IAo+IFRoZSBwYXRjaCBJIHNlbmQgc2hvdyBhcyBmb2xsb3c6Cj4gCj4gLS0t
IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNl
cy9waHJhbS5jCj4gQEAgLTIyMiw2ICsyMjIsNyBAQCBzdGF0aWMgaW50IHBocmFtX3NldHVwKGNv
bnN0IGNoYXIgKnZhbCkKPiAgIAl1aW50NjRfdCBzdGFydDsKPiAgIAl1aW50NjRfdCBsZW47Cj4g
ICAJdWludDY0X3QgZXJhc2VzaXplID0gUEFHRV9TSVpFOwo+ICsJdWludDMyX3QgcmVtOwo+ICAg
CWludCBpLCByZXQ7Cj4gCj4gICAJaWYgKHN0cm5sZW4odmFsLCBzaXplb2YoYnVmKSkgPj0gc2l6
ZW9mKGJ1ZikpCj4gQEAgLTI2Myw4ICsyNjQsOSBAQCBzdGF0aWMgaW50IHBocmFtX3NldHVwKGNv
bnN0IGNoYXIgKnZhbCkKPiAgIAkJfQo+ICAgCX0KPiAKPiArCWRpdl91NjRfcmVtKGxlbiwgKHVp
bnQzMl90KWVyYXNlc2l6ZSwgJnJlbSk7Cj4gICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KCk9oIHJpZ2h0IHRoaXMgaGFzIGJlZW4gbW92ZWQgYmVm
b3JlIHRoZSBjaGVja3MsIHBsZWFzZSBzZW5kIGEgdjIgdGhlbi4KCj4gCU9uY2UgdXNlciBzZXQg
ZXJhc2VzaXplID09IDAsIHRoZSBkaXZfdTY0X3JlbSB3aWxsIHRyaWdnZXIgdGhlCj4gRElWLzAu
Li4KPiAKPiAgIAlpZiAobGVuID09IDAgfHwgZXJhc2VzaXplID09IDAgfHwgZXJhc2VzaXplID4g
bGVuCj4gLQkgICAgfHwgZXJhc2VzaXplID4gVUlOVF9NQVggfHwgZG9fZGl2KGxlbiwgKHVpbnQz
Ml90KWVyYXNlc2l6ZSkgIT0gMCkgewo+ICsJICAgIHx8IGVyYXNlc2l6ZSA+IFVJTlRfTUFYIHx8
IHJlbSkgewo+ICAgCQlwYXJzZV9lcnIoImlsbGVnYWwgZXJhc2VzaXplIG9yIGxlblxuIik7Cj4g
ICAJCWdvdG8gZXJyb3I7Cj4gICAJfQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
