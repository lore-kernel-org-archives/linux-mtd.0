Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3166CC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 16:38:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7303564EBA
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 16:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7303564EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gw1wMNyZX8aaGvDatA5ydlBlDpZhPqb0WdUEe4oC1Uo=; b=TGGsGSTqeQZ9xGNf9G06t9xjo
	Sl9vFggfTm2MPPVCuNk6bji2bJR2U9GUVZqzUuG90ECnWRG2NZoFsoVujsl5S3KAv9ppPY7ws0l/x
	GVrm8LJg6zqnzIy3Ua51JgBhgr86zsNOlZk9qiNHs7Fw9977mzEC4bCsQ9ixHp2MyLj9AiUJZim6M
	cxp1SBbgrVz8D2yO62+rOvD3GtI7Fn/Du5Z5Tp1PxgA6zW0Xt/HYYUBkQNUEX38sM6xOFNq2DQ/Nh
	y1Fz3/dNi7CzlczhUCbwH2lvEpV9z1VB7X8nJPmwI61X5D/j4b3yFF5yNROwhzkLU3OHw+WrI659I
	iMwvyGvyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEx9j-0004kP-3V; Wed, 24 Feb 2021 16:36:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEx9f-0004jD-K5
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 16:36:53 +0000
X-Originating-IP: 86.250.253.134
Received: from xps13 (lfbn-tou-1-813-134.w86-250.abo.wanadoo.fr
 [86.250.253.134]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B6DADFF815;
 Wed, 24 Feb 2021 16:36:45 +0000 (UTC)
Date: Wed, 24 Feb 2021 17:36:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: update last code word register
Message-ID: <20210224173644.592e73dc@xps13>
In-Reply-To: <e0f0282b8552b0225f15a4c45a6894cd@codeaurora.org>
References: <1614024267-12529-1-git-send-email-mdalam@codeaurora.org>
 <20210223173449.1a55df1e@xps13>
 <a5650f33b493b987d45525ea57fdfd8a@codeaurora.org>
 <38da9d1d4a96f1b42ba0b194da265e6b@codeaurora.org>
 <20210224074850.0c74154d@xps13>
 <e0f0282b8552b0225f15a4c45a6894cd@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_113651_885777_71B1CC84 
X-CRM114-Status: GOOD (  25.33  )
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
Cc: mani@kernel.org, linux-kernel@vger.kernel.org,
 mdalam=codeaurora.org@codeaurora.org, linux-mtd@lists.infradead.org,
 boris.brezillon@collabora.com, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gV2VkLCAyNCBGZWIgMjAyMSAy
MjowMDowNSArMDUzMDoKCj4gT24gMjAyMS0wMi0yNCAxMjoxOCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBtZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gV2Vk
LCAyNCBGZWIgMjAyMSAxMDowOTo0OCArMDUzMDoKPiA+ICAgCj4gPj4gT24gMjAyMS0wMi0yNCAw
MToxMywgbWRhbGFtQGNvZGVhdXJvcmEub3JnIHdyb3RlOiAgCj4gPj4gPiBPbiAyMDIxLTAyLTIz
IDIyOjA0LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4gPj4gSGVsbG8sICAKPiA+PiA+PiA+
PiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFR1ZSwgMjMg
RmViIDIwMjEgIAo+ID4+ID4+IDAxOjM0OjI3ICswNTMwOiAgCj4gPj4gPj4gPj4+IEZyb20gUVBJ
QyB2ZXJzaW9uIDIuMCBvbndhcmRzIG5ldyByZWdpc3RlciBnb3QgYWRkZWQgdG8gcmVhZCBsYXN0
ICAKPiA+PiA+PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYSBuZXcgIAo+ID4+
ID4+ID4+PiBjb2Rld29yZC4gVGhpcyBjaGFuZ2Ugd2lsbCBhZGQgdGhlIFJFQURfTE9DQVRJT05f
TEFTVF9DV19uIHJlZ2lzdGVyLiAgCj4gPj4gPj4gPj4gICAgICAgICAgICAgQWRkIHN1cHBvcnQg
Zm9yIHRoaXMgUkVBRF9MT0NBVElPTl9MQVNUX0NXX24gcmVnaXN0ZXIuICAKPiA+PiA+PiA+Pj4g
Pj4+IEZvciBmaXJzdCB0aHJlZSBjb2RlIHdvcmQgUkVBRF9MT0NBVElPTl9uIHJlZ2lzdGVyIHdp
bGwgYmUgIAo+ID4+ID4+PiB1c2UuRm9yIGxhc3QgY29kZSB3b3JkIFJFQURfTE9DQVRJT05fTEFT
VF9DV19uIHJlZ2lzdGVyIHdpbGwgYmUKPiA+PiA+Pj4gdXNlLiAgCj4gPj4gPj4gPj4gIiAgCj4g
Pj4gPj4gSW4gdGhlIGNhc2Ugb2YgUVBJQyB2MiwgY29kZXdvcmRzIDAsIDEgYW5kIDIgd2lsbCBi
ZSBhY2Nlc3NlZCB0aHJvdWdoCj4gPj4gPj4gUkVBRF9MT0NBVElPTl9uLCB3aGlsZSBjb2Rld29y
ZCAzIHdpbGwgYmUgYWNjZXNzZWQgdGhyb3VnaAo+ID4+ID4+IFJFQURfTE9DQVRJT05fTEFTVF9D
V19uLgo+ID4+ID4+ICIgIAo+ID4+ID4+ID4+IFdoZW4gSSByZWFkIG15IG93biBzZW50ZW5jZSwg
SSBmZWVsIHRoYXQgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nLiAgCj4gPj4gPj4gSWYgdGhlcmUg
YXJlIG9ubHkgNCBjb2Rld29yZHMsIEkgZ3Vlc3MgYSBRUElDIHYyIGlzIGFibGUgdG8gdXNlCj4g
Pj4gPj4gUkVBRF9MT0NBVElPTl8zIG9yIFJFQURfTE9DQVRJT05fTEFTVF9DV18wIGludGVyY2hh
bmdlYWJseS4gSXNuJ3QgaXQ/ICAKPiA+PiA+PiA+PiBJIGd1ZXNzIHRoZSBwb2ludCBvZiBoYXZp
bmcgdGhlc2UgImxhc3RfY3dfbiIgcmVnaXN0ZXJzIGlzIHRvIHN1cHBvcnQgIAo+ID4+ID4+IHVw
IHRvIDggY29kZXdvcmRzLCBhbSBJIHdyb25nPyBJZiB0aGlzIHRoZSBjYXNlLCB0aGUgY3VycmVu
dCBwYXRjaAo+ID4+ID4+IGNvbXBsZXRlbHkgZmFpbHMgZG9pbmcgdGhhdCBJIGRvbid0IGdldCB0
aGUgcG9pbnQgb2Ygc3VjaCBjaGFuZ2UuICAKPiA+PiA+Cj4gPj4gPiBUaGlzIHJlZ2lzdGVyIGlz
IG9ubHkgdXNlIHRvIHJlYWQgbGFzdCBjb2RlIHdvcmQuCj4gPj4gPgo+ID4+ID4gSSBoYXZlIGFk
ZHJlc3MgYWxsIHRoZSBjb21tZW50cyBmcm9tIGFsbCB0aGUgcHJldmlvdXMgc3ViIHNlcXVlbnQK
PiA+PiA+IHBhdGNoZXMgYW5kIHB1c2hlZAo+ID4+ID4gYWxsIHBhdGNoZXMgaW4gb25seSBvbmUg
c2VyaWVzLgo+ID4+ID4KPiA+PiA+IFBsZWFzZSBjaGVjay4gIAo+ID4+ID4+ICAgVGhlIHJlZ2lz
dGVycyBSRUFEX0xPQ0FUSU9OICYgUkVBRF9MT0NBVElPTl9MQVNUIGFyZSBub3QgYXNzb2NpYXRl
ZCA+PiB3aXRoIG51bWJlciBvZiBjb2RlIHdvcmRzLiAgCj4gPj4gICBUaGVzZSB0d28gcmVnaXN0
ZXJzIGFyZSB1c2VkIHRvIGFjY2VzcyB0aGUgbG9jYXRpb24gaW5zaWRlIGEgY29kZSA+PiB3b3Jk
LiAgCj4gPiAKPiA+IE9rLiBDYW4geW91IHBsZWFzZSBleHBsYWluIHdoYXQgaXMgYSBsb2NhdGlv
biB0aGVuPyBPciBwb2ludCBtZSB0byBhCj4gPiBkYXRhc2hlZXQgdGhhdCBleHBsYWlucyBpdC4g
IAo+IAo+ICAgIFRoZSBsb2NhdGlvbiBpcyB0aGUgcG9zaXRpb24gaW5zaWRlIGEgY29kZSB3b3Jk
Lgo+IAo+ID4gCj4gPiBCb3R0b20gbGluZSBxdWVzdGlvbjogd2h5IGhhdmluZyBSRUFEX0xPQ0FU
SU9OXzAsIF8xLC4uLiBhbgo+ID4gUkVBRF9MT0NBVElPTl9MQVNUXzAsIF8xLCBldGM/ICAKPiAK
PiAgIFJFQURfTE9DQVRJT05fMCwgXzEsLi4uIGFyZSB1c2VkIHRvIGV4dHJhY3QgbXVsdGlwbGUg
Y2h1bmtzIGZyb20gYSBjb2RlIHdvcmQuCj4gCj4gICBlLmcgSWYgd2Ugd2FudGVkIHRvIGV4dHJh
Y3QgZmlyc3QgMTAwIGJ5dGVzIGZyb20gYSBjb2RlIHdvcmQgdGhlbiAoMC4uLjk5KSBSRUFEX0xP
Q0FUSU9OXzAgd2lsbCBiZSBjb25maWd1cmVkLgo+ICAgICAgIGlmIHdlIHdhbnRlZCB0byBleHRy
YWN0IG5leHQgMTAwIGJ5dGVzICgxMDAuLi4xOTkpIHRoZW4gUkVBRF9MT0NBVElPTl8xIHdpbGwg
YmUgY29uZmlndXJlZC4KPiAKPiAgICAgICBzYW1lIHdheSBmb3IgbGFzdCBjb2RlIHdvcmQgUkVB
RF9MT0NBVElPTl9MQVNUXzAsIF8xLCB3aWxsIGJlIHVzZWQuCj4gCgpOaWNlIGV4cGxhbmF0aW9u
LCBhbmQgdGhhbmtzIGZvciB0aGUgYmVsb3cgZmlndXJlcy4gU28gSSBndWVzcyB0aGVyZSBpcyBz
b21lIGtpbmQgb2YgInNtYWxsIFNSQU0iIHRoYXQgaXMKZGlyZWN0bHkgYWRkcmVzc2FibGUgcGVy
aGFwcz8KCkkgdGhpbmsgSSdtIGZpbmUgd2l0aCB5b3VyIHNlcmllcyBub3cuIEp1c3QgYSBzbWFs
bCBuaXQ6IG5leHQgdGltZSB5b3Ugc2VuZCBhIHNlcmllcywgcGxlYXNlIHVwZGF0ZSB0aGUgdmVy
c2lvbiBudW1iZXIgIltQQVRDSCB2Nl0iIChhdXRvbWF0aWNhbGx5IGFkZGVkIHdpdGggdGhlIC12
NiBwYXJhbWV0ZXIgaW4gZ2l0LWZvcm1hdC1wYXRjaCkuIEJ1dCBubyBuZWVkIHRvIHJlc2VuZCBq
dXN0IGZvciB0aGF0LgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
