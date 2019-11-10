Return-Path: <SRS0=dr70=ZC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE47C43331
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 11:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C8520818
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 11:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XlcvouW6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C8520818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8BNmRMXtVoXRlUbUMTcfhFvxGU34K+lQjdIx21ferM=; b=XlcvouW6S+SGEp
	ieO4vsCrRcCWdtRz13+0lqsOrrDZFji+rTr0q0FthrNxDnsyND14fjMhkp7DAnbI0/GFFXZE5cJL5
	4Gj4vRacPRG/qNUIC/SMK5tMDs26EEL2R31iDUEEuE40hicbCsWEElNErCSWBoPxBeQKRn3CziYoV
	MDcWUOuVNbw+oDdbvRkYJTdvetQSOofpvcxxXksgAGVmelLGaq/vpVf5hyRlODHSbi564j3m1dS3x
	IUXJb+LUSy4befC223LMlqkE36TKXeULcYdYS0AbXTyrB3BfMyXf2A4tMMGj4maqorBEaN8C7vn5c
	3H/J4p0R0eJYjUAIdz6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTlVT-0004Ef-Ak; Sun, 10 Nov 2019 11:35:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTlVN-0004D9-CE; Sun, 10 Nov 2019 11:35:43 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E02CE28A10C;
 Sun, 10 Nov 2019 11:35:34 +0000 (GMT)
Date: Sun, 10 Nov 2019 12:35:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH] mtd: rawnand: driver for Mediatek MT7621 SoC NAND flash
 controller
Message-ID: <20191110123531.5a27206a@collabora.com>
In-Reply-To: <20191107092053.Horde.i3MVcW9RqZDOQBMADZX9fuc@www.vdorst.com>
References: <20191107073521.11413-1-gerg@kernel.org>
 <20191107092053.Horde.i3MVcW9RqZDOQBMADZX9fuc@www.vdorst.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_033541_673552_5688ADE3 
X-CRM114-Status: GOOD (  26.42  )
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
Cc: devel@driverdev.osuosl.org, Weijie Gao <hackpascal@gmail.com>,
 gregkh@linuxfoundation.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, neil@brown.name, gerg@kernel.org,
 linux-mediatek@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 DENG Qingfang <dengqf6@mail2.sysu.edu.cn>, linux-mtd@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>, blogic@openwrt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

K1JpY2hhcmQgYW5kIE1pcXVlbAoKT24gVGh1LCAwNyBOb3YgMjAxOSAwOToyMDo1MyArMDAwMApS
ZW7DqSB2YW4gRG9yc3QgPG9wZW5zb3VyY2VAdmRvcnN0LmNvbT4gd3JvdGU6Cgo+IFF1b3Rpbmcg
Z2VyZ0BrZXJuZWwub3JnOgo+IAo+ID4gRnJvbTogR3JlZyBVbmdlcmVyIDxnZXJnQGtlcm5lbC5v
cmc+Cj4gPgo+ID4gQWRkIGEgZHJpdmVyIHRvIHN1cHBvcnQgdGhlIE5BTkQgZmxhc2ggY29udHJv
bGxlciBvZiB0aGUgTWVkaWFUZWsgTVQ3NjIxCj4gPiBTeXN0ZW0tb24tQ2hpcCBkZXZpY2UuIChU
aGlzIG9uZSBpcyB0aGUgTUlQUyBiYXNlZCBwYXJ0cyBmcm9tIE1lZGlhdGVrKS4KPiA+Cj4gPiBU
aGlzIGNvZGUgaXMgYSByZS13b3JraW5nIG9mIHRoZSBlYXJsaWVyIHBhdGNoZXMgZm9yIHRoaXMg
aGFyZHdhcmUgdGhhdAo+ID4gaGF2ZSBiZWVuIGZsb2F0aW5nIGFyb3VuZCB0aGUgaW50ZXJuZXQg
Zm9yIHllYXJzOgo+ID4KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9SZWNsYWltWW91clByaXZhY3kv
Y2xvYWsvYmxvYi9tYXN0ZXIvdGFyZ2V0L2xpbnV4L3JhbWlwcy9wYXRjaGVzLTMuMTgvMDA0NS1t
dGQtYWRkLW10NzYyMS1uYW5kLXN1cHBvcnQucGF0Y2gKPiA+Cj4gPiBUaGlzIGlzIGEgbXVjaCBj
bGVhbmVkIHVwIHZlcnNpb24sIHB1dCBpbiBzdGFnaW5nIHRvIHN0YXJ0IHdpdGguCj4gPiBJdCBk
b2VzIHN0aWxsIGhhdmUgc29tZSBwcm9ibGVtcywgbWFpbmx5IHRoYXQgaXQgc3RpbGwgdXNlcyBh
IGxvdCBvZiB0aGUKPiA+IG10ZCByYXcgbmFuZCBsZWdhY3kgc3VwcG9ydC4KPiA+Cj4gPiBUaGUg
ZHJpdmVyIG5vdCBvbmx5IGNvbXBpbGVzLCBidXQgaXQgd29ya3Mgd2VsbCBvbiB0aGUgc21hbGwg
cmFuZ2Ugb2YKPiA+IGhhcmR3YXJlIHBsYXRmb3JtcyB0aGF0IGl0IGhhcyBiZWVuIHVzZWQgb24g
c28gZmFyLiBJIGhhdmUgYmVlbiB1c2luZwo+ID4gZm9yIHF1aXRlIGEgd2hpbGUgbm93LCBjbGVh
bmluZyB1cCBhcyBJIGdldCB0aW1lLgo+ID4KPiA+IFNvLi4uIEkgYW0gbG9va2luZyBmb3IgY29t
bWVudHMgb24gdGhlIGJlc3QgYXBwcm9hY2ggZm9yd2FyZCB3aXRoIHRoaXMuCj4gPiBBdCBsZWFz
dCBpbiBzdGFnaW5nIGl0IGNhbiBnZXQgc29tZSBtb3JlIGV5ZWJhbGxzIGdvaW5nIG92ZXIgaXQu
Cj4gPgo+ID4gVGhlcmUgaXMgYSBtZWRpYXRlayBuYW5kIGRyaXZlciBhbHJlYWR5LCBtdGtfbmFu
ZC5jLCBmb3IgdGhlaXIgQVJNIGJhc2VkCj4gPiBTeXN0ZW0tb24tQ2hpcCBkZXZpY2VzLiBUaGF0
IGhhcmR3YXJlIG1vZHVsZSBsb29rcyB0byBoYXZlIHNvbWUgaGFyZHdhcmUKPiA+IHNpbWlsYXJp
dGllcyB3aXRoIHRoaXMgb25lLiBBdCB0aGlzIHBvaW50IEkgZG9uJ3Qga25vdyBpZiB0aGF0IGNh
biBiZQo+ID4gdXNlZCBvbiB0aGUgNzYyMSBiYXNlZCBkZXZpY2VzLiAoSSB0cmllZCBhIHF1aWNr
IGFuZCBkaXJ0eSBzZXR1cCBhbmQgaGFkCj4gPiBubyBzdWNjZXNzIHVzaW5nIGl0IG9uIHRoZSA3
NjIxKS4KPiA+Cj4gPiBUaG91Z2h0cz8gIAo+IAo+ICtDQyBERU5HIFFpbmdmYW5nLCBDaHVhbmhv
bmcgR3VvLCBXZWlqaWUgR2FvIHRvIHRoZSBsaXN0Lgo+IAo+IEhpIEdyZWcsCj4gCj4gVGhhbmtz
IGZvciBwb3N0aW5nIHRoaXMgZHJpdmVyLgo+IAo+IEJ1dCBJIHdvdWxkIGxpa2UgdG8gbWVudGlv
biB0aGF0IHRoZSBvcGVud3J0IGNvbW11bml0eSBpcyBjdXJyZW50bHkgIAo+IHdvcmtpbmcgb24g
YQo+IG5ldyB2ZXJzaW9uIHdoaWNoIGlzIGJhc2VkIGEgbmV3ZXIgdmVyc2lvbiBvZiB0aGUgTWVk
aWFUZWsgdmVuZG9yIGRyaXZlci4KPiBUaGF0IHZlcnNpb24gaXMgY3VycmVudGx5IHRhcmdldGVk
IGZvciB0aGUgb3BlbndydCA0LjE5IGtlcm5lbC4KPiBTZWUgZnVsbCBwdWxsIHJlcXVlc3QgWzFd
IGFuZCBOQU5EIGRyaXZlciBwYXRjaCBbMl0KPiAKPiBJdCB3b3VsZCBiZSBhIHNoYW1lIGlmIGR1
cGxpY2F0ZSB3b3JrIGhhcyBiZWVuIGRvbmUuCgpTb3JyeSwgYnV0IGlmIHRoZXJlJ3MgZHVwbGlj
YXRlIGVmZm9ydCB0aGF0J3Mga2luZGEgeW91ciAoT3BlbldSVCBmb2xrcykKZmF1bHQ6IHNpbmNl
IHdoZW4gT3BlbldSVCBpcyB0aGUgY2VudHJhbCBwb2ludCBmb3Iga2VybmVsIGRyaXZlcnM/CkNv
cnJlY3QgbWUgaWYgSSdtIHdyb25nLCBidXQgSSBkb24ndCByZW1lbWJlciBzZWVpbmcgdGhpcyBk
cml2ZXIgcG9zdGVkCnRvIHRoZSBNVEQgTUwuIFBsdXMsIHRoZSBkcml2ZXIgeW91J3JlIHBvaW50
aW5nIHRvIHN0aWxsIGltcGxlbWVudHMgdGhlCmxlZ2FjeSBob29rcyBhbmQgaXMgYmFzZWQgb24g
NC4xOSwgYW5kIGl0IGhhcyBiZWVuIGRlY2lkZWQgdGhhdCBhbGwgbmV3Ck5BTkQgY29udHJvbGxl
ciBkcml2ZXJzIHNob3VsZCBpbXBsZW1lbnQgdGhlIG5ldyAtPmV4ZWNfb3AoKSBob29rCmluc3Rl
YWQuCgo+IAo+IEdyZWF0cywKPiAKPiBSZW7DqQo+IAo+IFsxXTogaHR0cHM6Ly9naXRodWIuY29t
L29wZW53cnQvb3BlbndydC9wdWxsLzIzODUKPiBbMl06ICAKPiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbndydC9vcGVud3J0L3B1bGwvMjM4NS9jb21taXRzL2IyNTY5YzBhNTk0M2ZlOGY5NGJhMDdj
OTU0MGVjZDE0MDA2ZDcyOWEKPiAKPiA8c25pcD4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
