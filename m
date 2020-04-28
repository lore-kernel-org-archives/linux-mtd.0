Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19689C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 14:20:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD320206D7
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 14:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dVP4FiUC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD320206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGmP/afqj153Bci1XdkEr6Gf9bJqyumBdp1+YFkaXG4=; b=dVP4FiUCnSa9nj
	jzKikcbXZXlL7ov6ykB+AfhI+MNnIdmOzJ3/naBM0I843Fl+D577igY5JaXXMwwCPEngBf4tf0tGg
	Yz0wzC7pV5EKh31qMuOXOLRb6LYXlflv3YGdf/LqpdPnzwHGr+tIV4wUHXftYUuXvpfA8DOHUZlga
	MNbLgN5ULf+xen3/4pr/zZ2lYA+qLNNsp+BK9lbV5+Ly56HZGg4Uw6p19jKqMu/7E3/UldRhkQtxD
	aPerT49A30EbTKV8cZn2Kp0z5fzJfmfE/nsvBa34BgddkcgrdfebGV3AgdrksOePWo6QHBC0wf/WQ
	DkYAzEOKbXGEzbEo9gqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTR60-0004iW-Pm; Tue, 28 Apr 2020 14:20:24 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTR5x-0004hN-Lb
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 14:20:23 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 84EF0C000B;
 Tue, 28 Apr 2020 14:20:15 +0000 (UTC)
Date: Tue, 28 Apr 2020 16:20:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] mtd: physmap_of_gemini: remove defined but not used
 symbol 'syscon_match'
Message-ID: <20200428162013.6ac67b15@xps13>
In-Reply-To: <CACRpkdY06GvLRcfD0pjhJ6woHUY8rxi5hqKPmyS7nrhJ_BXrQA@mail.gmail.com>
References: <20200403081544.37061-1-yanaijie@huawei.com>
 <20200427155313.43847da8@xps13>
 <CACRpkdY06GvLRcfD0pjhJ6woHUY8rxi5hqKPmyS7nrhJ_BXrQA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_072021_842406_7BC2A240 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>,
 linux-mtd@lists.infradead.org, Vignesh R <vigneshr@ti.com>,
 Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3Rl
IG9uIFR1ZSwgMjggQXByIDIwMjAKMTY6MTY6NTUgKzAyMDA6Cgo+IE9uIE1vbiwgQXByIDI3LCAy
MDIwIGF0IDM6NTMgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g
d3JvdGU6Cj4gPiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+IHdyb3RlIG9uIEZyaSwg
MyBBcHIgMjAyMCAxNjoxNTo0NCArMDgwMDoKPiA+ICAKPiA+ID4gSXQncyBub3QgdXNlZCBieSBh
bnlvbmUgbm93LCByZW1vdmUgaXQuIEZpeCB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nOgo+ID4g
Pgo+ID4gPiBkcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtZ2VtaW5pLmM6NDk6MzQ6IHdhcm5pbmc6
IOKAmHN5c2Nvbl9tYXRjaOKAmSBkZWZpbmVkCj4gPiA+IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
Y29uc3QtdmFyaWFibGU9XQo+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
c3lzY29uX21hdGNoW10gPSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn4KPiA+ID4KPiA+ID4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtj
aUBodWF3ZWkuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1
YXdlaS5jb20+Cj4gPiA+IC0tLSAgCj4gPgo+ID4gSSBhbSBub3Qgc3VyZSB0aGlzIGlzIHRoZSBy
aWdodCBzb2x1dGlvbi4gVGhpcyBjb21wYXRpYmxlIGhhcyBiZWVuCj4gPiBhZGRlZCBpbiB0aGlz
IGRyaXZlciBieSBMaW51cyBpbiA5ZDNiNTA4NmY2ZDQgKCJtdGQ6IHBoeXNtYXBfb2ZfZ2VtaW5p
Ogo+ID4gSGFuZGxlIHBpbiBjb250cm9sIikuIEkgYmVsaWV2ZSBoZSBoYWQgYSBnb29kIHJlYXNv
biB0byBkbyBzbyBidXQgeW91Cj4gPiBhcmUgcmlnaHQgdGhhdCBpdCBpcyBub3QgdXNlZC4gTGlu
dXMsIGFueSBpbnB1dD8gIAo+IAo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+Cj4gCj4gSXQncyBwcm9iYWJseSBqdXN0IGEgcmVtbmFudCBvZiBl
YXJsaWVyIGRldmVsb3BtZW50LCBzb3JyeSBmb3IgdGhhdC4KPiBXZSBub3cgbG9jYXRlIHRoZSBz
eXNjb24gYnkgcGhhbmRsZToKPiBybWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRs
ZShucCwgInN5c2NvbiIpOwoKTm8gcHJvYmxlbSwgdGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9u
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
