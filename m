Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811E9C001E0
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Oct 2023 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r+DKyd7V+lPv8GLT3jJPXL/LIhO83oXWfbHZUsGpUw4=; b=QrrVS13IHfSI4Tbc9TY2sOp6Gr
	m2zUP3i+V5PsPbYg8LNgRAOueD7SMqk/lpV793kz9ubhk+6oWGo4Gl97wVD3CdqT8xNfz7PdV7jtu
	ytMWeHga0liZMGgF0FdsIRgeSDdkgKS/yr61iUqg+JFTMstQoG4g8XsnJffYX6MmbOGrB5llbs9eV
	dM+DbiFqUlfHjAt3KIePZAg59J2BDRz7dWsd0bpViBKDOaejoD4ybqnGbAc/PlWT0m+WTU+p6Zudm
	ncVADcn2Or/sHn5Qa5Jy0H0AAaqahDMu6FiBJy8O3238ULkqroqxC6saUIuPURK91v0KOkbdGanTm
	wsVURrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quEY2-004Dd1-22;
	Sat, 21 Oct 2023 16:09:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quEXz-004DbS-00
	for linux-mtd@lists.infradead.org;
	Sat, 21 Oct 2023 16:09:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F355A6343CAC;
	Sat, 21 Oct 2023 18:09:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Vsuiu3WwRoDH; Sat, 21 Oct 2023 18:09:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8149C6343CBC;
	Sat, 21 Oct 2023 18:09:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id seXA32NShRV0; Sat, 21 Oct 2023 18:09:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 58A186343CAF;
	Sat, 21 Oct 2023 18:09:40 +0200 (CEST)
Date: Sat, 21 Oct 2023 18:09:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <441107100.23734.1697904580252.JavaMail.zimbra@nod.at>
In-Reply-To: <891e554b-c133-6378-3a65-836fc9147e54@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com> <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at> <891e554b-c133-6378-3a65-836fc9147e54@huawei.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: 2PTLgou/05+/uw7nwcEWecaps0pTog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_090955_395429_8E445319 
X-CRM114-Status: GOOD (  14.31  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+Pj4gU3VjaCBhIG1vZGlmaWNhdGlvbiBjdXJyZW50bHkg
d29ya3MgYmVjYXVzZSB0aGUgbXV0ZXggIm10ZF90YWJsZV9tdXRleCIKPj4+IGlzIGhlbGQgb24g
YWxsIG5lY2Vzc2FyeSBwYXRocywgaW5jbHVkaW5nIHRoZSBmdGxfYWRkX210ZCgpIGNhbGwgcGF0
aCwKPj4+IG9wZW4gYW5kIGNsb3NlIHBhdGhzLiBUaGVyZWZvcmUsIG1hbnkgcmFjZSBjb25kaXRp
b24gY2FuIGJlIGF2b2lkZWQuCj4+IAo+PiBJIHNlZSB0aGUgcHJvYmxlbSwgYnV0IEknbSBub3Qg
cmVhbGx5IHNhdGlzZmllZCBieSB0aGUgc29sdXRpb24uCj4+IEFkZGluZyB0aGlzIGhhY2sgdG8g
Z2x1ZWJpX3JlYWQoKSBpcyBub3QgbmljZSBhdCBhbGwuCj4gCj4gWWVzLCBpdCdzIGpzdXQgYSB3
b3JrYXJvdW5kLiBBdCB0aGUgYmVnaW5pbmcsIEkgcHJlZmVyIHRoYXQgaW5jcmVhc2luZwo+IHZv
bHVtZSByZWZjbnQgKGJ5IHViaV9vcGVuX3ZvbHVtZSkgaW4gZ2x1ZWJpX2NyZWF0ZSBhbmQgcmVs
ZWFzaW5nIHZvbHVtZQo+IHJlZmNudCBpbiBnbHVlYmlfcmVtb3ZlLiBJdCBsb29rcyBtb3JlIHJl
YXNvbmFibGUgdGhhdCBob2xkaW5nIGEgcmVmY250Cj4gb2YgVUJJIHZvbHVtZSB3aGVuIGdsdWVi
aSBpcyBhbGl2ZS4gQWZ0ZXIgbG9va2luZyB0aHJvdWdoIHRoZSBjb2RlLCB0aGUKPiBjcmVhdGlv
bi9kZXN0cm95aW5nIG9mIGdsdWViaSBpcyB0cmlnZ2VyZWQgYnkgdm9sdW1lCj4gYWN0aW9ucyhV
QklfVk9MVU1FX0FEREVEL1VCSV9WT0xVTUVfUkVNT1ZFRCksIHdoaWNoIG1lYW5zIHRoYXQ6Cj4g
MS4gZ2x1ZWJpX3JlbW92ZSBpcyBkZXBlbmRlZCBvbiBVQklfVk9MVU1FX1JFTU9WRUQodHJpZ2dl
cmVkIGJ5Cj4gdWJpX3JlbW92ZV92b2x1bWUpCj4gMi4gdWJpX3JlbW92ZV92b2x1bWUgd29uJ3Qg
YmUgZXhlY3V0ZWQgdW50aWwgdGhlIHJlZmNudCBvZiB2b2x1bWUKPiBiZWNvbWVzIDAocmVsZWFz
ZWQgYnkgZ2x1ZWJpX3JlbW92ZSkKPiAKPiBJZiB3ZSBhZGQgbmV3IGlvY3RscyB0byBjb250cm9s
IGNyZWF0aW9uL2Rlc3Ryb3lpbmcgb2YgZ2x1ZWJpLCB0aGVuCj4gZ2x1ZWJpIG10ZCB3b24ndCBi
ZSBhdXRvbWF0aWNhbGx5IGNyZWF0ZWQgd2hlbiBVQkkgdm9sdW1lIGlzIGFkZGVkLiBJJ20KPiBu
b3QgY2VydGFpbiB3aGV0aGVyIHRoaXMgY2hhbmdlIHdpbGwgZWZmZWN0IGV4aXN0aW5nIHN0YXJ0
dXAgcHJvY2Vzcwo+IHRoYXQgZGVwZW5kcyBvbiBnbHVlYmkuCgpMZXQncyB0YWtlIGEgc3RhY2sg
YmFjay4gVGhlIHNvbGUgcHVycG9zZSBvZiBnbHVlYmkgaXMgcHJvdmlkaW5nCmEgd2F5IHRvIHJ1
biBKRkZTMiBvbiB0b3Agb2YgVUJJLgpJTUhPIHRoZXJlIGlzIG5vIG5lZWQgdG8gcnVuIGFuIEZU
TCBvbiB0b3Agb2YgVUJJIG9yIGV2ZW4gbXRkYmxvY2suClRoaXMga2luZCBvZiBzdGFja2luZyBk
b2VzIG5vdCBtYWtlIHNlbnNlLgoKU28sIEknZCBnbyBzbyBmYXIgYW5kIHByb3Bvc2UgdGhlIGZv
bGxvd2luZzoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgYi9kcml2ZXJz
L210ZC9tdGRfYmxrZGV2cy5jCmluZGV4IGZmMTg2MzZlMDg4OTcuLmIzNjJhNjQ0MTFlYmQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKKysrIGIvZHJpdmVycy9tdGQvbXRk
X2Jsa2RldnMuYwpAQCAtNDYzLDcgKzQ2Myw3IEBAIHN0YXRpYyB2b2lkIGJsa3RyYW5zX25vdGlm
eV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCiB7CiAgICAgICAgc3RydWN0IG10ZF9ibGt0cmFu
c19vcHMgKnRyOwogCi0gICAgICAgaWYgKG10ZC0+dHlwZSA9PSBNVERfQUJTRU5UKQorICAgICAg
IGlmIChtdGQtPnR5cGUgPT0gTVREX0FCU0VOVCB8fCBtdGQtPnR5cGUgPT0gTVREX1VCSVZPTFVN
RSkKICAgICAgICAgICAgICAgIHJldHVybjsKIAogICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnko
dHIsICZibGt0cmFuc19tYWpvcnMsIGxpc3QpCgpJT1csIG5vIG10ZGJsb2NrIChoZW5jZSwgYWxz
byBubyBGVExzKSBvbiB0b3Agb2YgZ2x1ZWJpLgoKV2hhdCBkbyB5b3UgZ3V5cyB0aGluaz8KClRo
YW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
