Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB012C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yAguDjdpY/Z+K/9B0BFR6dOVY2J8s7ikz+dIopt5k2w=; b=tDWVZJAj+shQa1zpi/cecP7Qt2
	Rc6AjuWOmwQipQ0qBreH72Ej3RPHlDX7rZ1DPkhZmW5zrWRGigIN2Y7BjA/bLkVnbJqwN8logpKD8
	2d7IyW1OFj+kYRvWW0mQtXq3h2nt/iOOnSJDPQtDRzYeW/uerVyLT7EbOiL1Mi54m039Pfi9rJz2Z
	rTApc9ltGxFiW3sWSqddHTjrQDYAy6KKbRxCecDQVB2a1gkRHATs0z9QGkVVLpXih+pZBW10qRY6e
	XEX1rtxDqCrqAvy53MbbMw1QQEqgsP4xvghEPbA2xcsEpDSyC0GVkW2Vm57DgI7T60MRKeQ1WXylb
	1L5PVSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1n0N-00GWO5-J0; Mon, 27 Dec 2021 10:13:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1n0J-00GWNK-P1
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 10:13:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 87DDE614E2CD;
 Mon, 27 Dec 2021 11:13:08 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ysNS8lgvNeiu; Mon, 27 Dec 2021 11:13:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B5DDC614E2D5;
 Mon, 27 Dec 2021 11:13:07 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Re93ILpuHEY9; Mon, 27 Dec 2021 11:13:07 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8FFB3614E2CD;
 Mon, 27 Dec 2021 11:13:07 +0100 (CET)
Date: Mon, 27 Dec 2021 11:13:07 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1020444725.206730.1640599987424.JavaMail.zimbra@nod.at>
In-Reply-To: <20211227032246.2886878-1-chengzhihao1@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
Subject: Re: [PATCH v6 00/15] Some bugfixs for ubi/ubifs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: Some bugfixs for ubi/ubifs
Thread-Index: AQ1RdLNSe9iocMwMdcHAv1rGWr/ndw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_021320_163529_FB859BB3 
X-CRM114-Status: GOOD (  10.50  )
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
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
Ik1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFn
aGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJtY29xdWVsaW4gc3RtMzIiIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPiwgImtpcmlsbCBzaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBs
aW51eC5pbnRlbC5jb20+LCAiU2FzY2hhIEhhdWVyIgo+IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRl
Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogTW9u
dGFnLCAyNy4gRGV6ZW1iZXIgMjAyMSAwNDoyMjozMQo+IEJldHJlZmY6IFtQQVRDSCB2NiAwMC8x
NV0gU29tZSBidWdmaXhzIGZvciB1YmkvdWJpZnMKCj4gdjEtPnYyOgo+ICAxLiBBZGQgbmV3IGZp
eCBmb3IgdWJpZnMsICJ1YmlmczogRml4IHRvIGFkZCByZWZjb3VudCBvbmNlIHBhZ2UgaXMgc2V0
Cj4gIHByaXZhdGUiCj4gIDIuIFVwZGF0ZSAidWJpZnM6IFJlbmFtZSB3aGl0ZW91dCBhdG9taWNh
bGx5IjoKPiAgICAgMSkgTW92ZSBpbm9kZSBtb2RlIGluIGNyZWF0ZV93aGl0ZW91dCgpCj4gICAg
IDIpIERvbid0IGNoZWNrIE9fU1lOQyBmb3Igd2hpdGVvdXQsIGJlY2F1c2UgaXQgaW5oZXJpdHMg
ZnJvbSB0aGUgb2xkX2Rpcgo+ICAgICAzKSBSZW1vdmUgdXNlbGVzcyAnc3luY2VkX2lfc2l6ZSAn
IGFzc2lnbm1lbnQgZm9yIHdoaXRlb3V0LCBiZWNhdXNlCj4JaXQncyBhbHdheXMgYmUgemVyby4K
PiAgICAgNCkgUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAndWknIGluIGNyZWF0ZV93aGl0ZW91dCgp
Cj4gIDMuIFVwZGF0ZSAidWJpZnM6IHNldGZsYWdzOiBNYWtlIGRpcnRpZWRfaW5vX2QgOCBieXRl
cyBhbGlnbmVkIjoKPiAgICAgMSkgQWxpZ24gZGlydGllZF9pbm9fZCB3aXRoIDggYnl0ZXMuCj4g
Cj4gdjItPnYzOgo+ICAxLiBVcGRhdGUgInViaWZzOiBSZW5hbWUgd2hpdGVvdXQgYXRvbWljYWxs
eSI6Cj4gICAgIDEpIEZpeCBtaXNzcGVsbGluZyAnaGF2ZSBhbHJlYWR5IGNoZWNrIHRoZSBvbGQg
ZGlyIGlub2RlJyAtPgo+ICAgICAgICAnaGF2ZSBhbHJlYWR5IGNoZWNrZWQgdGhlIG9sZCBkaXIg
aW5vZGUnCj4gICAgIDIpIEZpeCBtaXNzcGVsbGluZyAiV2hpdGVvdXQgZG9uJ3QgaGF2ZSBub24t
emVybyBzaXplIiAtPgo+ICAgICAgICAiV2hpdGVvdXQgIGhhdmUgbm9uLXplcm8gc2l6ZSIKPiAg
Mi4gVXBkYXRlICJ1YmlmczogRml4IHRvIGFkZCByZWZjb3VudCBvbmNlIHBhZ2UgaXMgc2V0IHBy
aXZhdGUiCj4gICAgIDEpIEZpeCBjb21taXQgbWVzc2FnZSB0byBleHBsYWluIHRoZSByb290IGNh
dXNlLgo+ICAzLiBVcGRhdGUgInViaTogZmFzdG1hcDogQWRkIGFsbCBmYXN0bWFwIHBlYnMgaW50
byAnYWktPmZhc3RtYXAnIHdoZW4KPiAgICAgZm0tPnVzZWRfYmxvY2tzPj0yIgo+ICAgICAxKSBB
ZGQgZmFzdG1hcCB1c2VkIHBlYnMgaW50byAnYWknIGluIGZvci1sb29wLCByYXRoZXIgdGhhbiBp
bgo+ICAgICAgICB0d28tc3RlcHMoQWRkIHBlYnMgW3BudW08VUJJX0ZNX01BWF9TVEFSVF0gdGhl
biBhZGQgcGVicwo+CVtwbnVtPj1VQklfRk1fTUFYX1NUQVJUXSBpbnRvICdhaScpLgo+IAo+IHYz
LT52NDoKPiAgMS4gVXBkYXRlICJ1YmlmczogQWRkIG1pc3NpbmcgaXB1dCBpZiBkb190bXBmaWxl
KCkgZmFpbGVkIGluIHJlbmFtZSB3aGl0ZW91dCI6Cj4gICAgIDEpIE1vdmUgd2hpdGVvdXQgY2xl
YW51cCBpbnRvIGRvX3RtcGZpbGUoKSBhY2NvcmRpbmcgdG8gU2FzY2hhJ3MgYWR2aWNlCj4gIDIu
IEFkZCBuZXcgZml4IGZvciB1YmlmcywgInViaWZzOiB1Ymlmc193cml0ZXBhZ2U6IE1hcmsgcGFn
ZSBkaXJ0eSBhZnRlcgo+ICAgICB3cml0aW5nIGlub2RlIGZhaWxlZCIKPiAKPiB2NC0+djU6Cj4g
IDEuIEFkZCBuZXcgZml4IGZvciB1YmlmcywgInViaWZzOiB1Ymlmc19yZWxlYXNlcGFnZTogUmVt
b3ZlIHViaWZzX2Fzc2VydCgwKQo+ICAgICB0byB2YWxpZCB0aGlzIHByb2Nlc3MiCj4gCj4gdjUt
PnY2Ogo+ICAxLiBBZGQgbmV3IGZpeCBmb3IgdWJpOiAidWJpOiBmYXN0bWFwOiBGaXggaGlnaCBj
cHUgdXNhZ2Ugb2YgdWJpX2JndCBieQo+ICAgICBtYWtpbmcgc3VyZSB3bF9wb29sIG5vdCBlbXB0
eSIKPiAKPiBaaGloYW8gQ2hlbmcgKDE1KToKPiAgdWJpZnM6IHJlbmFtZV93aGl0ZW91dDogRml4
IGRvdWJsZSBmcmVlIGZvciB3aGl0ZW91dF91aS0+ZGF0YQo+ICB1YmlmczogRml4IGRlYWRsb2Nr
IGluIGNvbmN1cnJlbnQgcmVuYW1lIHdoaXRlb3V0IGFuZCBpbm9kZSB3cml0ZWJhY2sKPiAgdWJp
ZnM6IEZpeCB3cm9uZyBudW1iZXIgb2YgaW5vZGVzIGxvY2tlZCBieSB1aV9tdXRleCBpbiB1Ymlm
c19pbm9kZQo+ICAgIGNvbW1lbnQKPiAgdWJpZnM6IEFkZCBtaXNzaW5nIGlwdXQgaWYgZG9fdG1w
ZmlsZSgpIGZhaWxlZCBpbiByZW5hbWUgd2hpdGVvdXQKPiAgdWJpZnM6IFJlbmFtZSB3aGl0ZW91
dCBhdG9taWNhbGx5Cj4gIHViaWZzOiBGaXggJ3VpLT5kaXJ0eScgcmFjZSBiZXR3ZWVuIGRvX3Rt
cGZpbGUoKSBhbmQgd3JpdGViYWNrIHdvcmsKPiAgdWJpZnM6IFJlY3RpZnkgc3BhY2UgYW1vdW50
IGJ1ZGdldCBmb3IgbWtkaXIvdG1wZmlsZSBvcGVyYXRpb25zCj4gIHViaWZzOiBzZXRmbGFnczog
TWFrZSBkaXJ0aWVkX2lub19kIDggYnl0ZXMgYWxpZ25lZAo+ICB1YmlmczogRml4IHJlYWQgb3V0
LW9mLWJvdW5kcyBpbiB1Ymlmc193YnVmX3dyaXRlX25vbG9jaygpCj4gIHViaWZzOiBGaXggdG8g
YWRkIHJlZmNvdW50IG9uY2UgcGFnZSBpcyBzZXQgcHJpdmF0ZQo+ICB1Ymk6IGZhc3RtYXA6IFJl
dHVybiBlcnJvciBjb2RlIGlmIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWxzIGluCj4gICAgYWRkX2Fl
YigpCj4gIHViaTogZmFzdG1hcDogQWRkIGFsbCBmYXN0bWFwIHBlYnMgaW50byAnYWktPmZhc3Rt
YXAnIHdoZW4KPiAgICBmbS0+dXNlZF9ibG9ja3M+PTIKPiAgdWJpZnM6IHViaWZzX3dyaXRlcGFn
ZTogTWFyayBwYWdlIGRpcnR5IGFmdGVyIHdyaXRpbmcgaW5vZGUgZmFpbGVkCj4gIHViaWZzOiB1
Ymlmc19yZWxlYXNlcGFnZTogUmVtb3ZlIHViaWZzX2Fzc2VydCgwKSB0byB2YWxpZCB0aGlzIHBy
b2Nlc3MKPiAgdWJpOiBmYXN0bWFwOiBGaXggaGlnaCBjcHUgdXNhZ2Ugb2YgdWJpX2JndCBieSBt
YWtpbmcgc3VyZSB3bF9wb29sIG5vdAo+ICAgIGVtcHR5CgpUaGFua3MgYSBsb3QgZm9yIGFsbCB0
aGlzIGZpeGVzISBJIHdpbGwgc3RhcnQgcmV2aWV3aW5nL3BpY2tpbmcgdGhlbSBhbgphcyBzb29u
IHRoZSBzZXJpZXMgaXMgc3RhYmxlLgpTbyBwbGVhc2UgZG9uJ3QgcmVzZW5kIGV2ZXJ5dGhpbmcg
aWYgeW91IG9ubHkgYWRkIGEgbmV3IHBhdGNoLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
