Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC452C5DF61
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:21:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ABD92166E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EuloN4Ne";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="DErSWDeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ABD92166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Subject:To:From:Message-ID:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=d42mvBb7JJKf9uYfNjv+GYojJ2QP2zpuacZZ8tqTOCM=; b=EuloN4NeP66uup4cETQ0A/TZp
	wAh4JSuxZz60CQhDvAE1Bj703SeR1MweVvGgNm15ZwetEMeOlL5tMA8KJLbX1H+1YBDcznw6HW+xF
	nGsDZbWc8k0EhUy1DoFdZem9YFcSE2SJETmL+l3Nnpz1+a+1mjgTS6iNKqMuyaZ8LVfA15Bjybums
	Lq3pE2RteWqjnG7Jj3Ke1n+6uDdJ2d5sT47Ycolmbwim7bmNCjp92GsowFfmoiZroHx+8yVpLOVRg
	vIE58hxuveR9PX5Y96hiSOSsl/huQVTFHBOdLqxHDsX9VAKMTyNPARFKbEU4ZylAow6ZkJhQIx7vn
	2ld48ItLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdyQ-0003vN-DJ; Thu, 07 Nov 2019 09:21:02 +0000
Received: from mx.0dd.nl ([2a04:52c0:101:921::25])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdyM-0003qV-TX; Thu, 07 Nov 2019 09:21:01 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id BDAB85FBCA;
 Thu,  7 Nov 2019 10:20:53 +0100 (CET)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="DErSWDeC"; 
 dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 70F7860E15;
 Thu,  7 Nov 2019 10:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 70F7860E15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1573118453;
 bh=VNI6ueMuAqg9JykHs42KWFyCu+oSfzrckVrJN6RHl1U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=DErSWDeCJGOpQRn/9IeUDgudR8wiBsZK/52Ly5Hj8qYOKx+kIISU/EDojjPAFMf7V
 1zeb2cvB6HtA/xtvbomGdctF0jRFYQU9IVwzqbYFiFmsReIXrlLMrRiIAELkhFFLyG
 B91UMdHXknKgc//LIaMXx/GqSwcHFeVPcU2PZskl7dRY6plX7q/TAqtdoMCZFb+4EI
 /uh6oQw209TxyItkPHW48wPRevFclqyUKUc3CdwgDDmpUCHxo62eij9bBO7dWk2QAg
 JyN/nBxqYW+29pPCkLLDnZITfxNPB1XGKWRR/lGloR7jFyWsntIS8dzndVjlaWdHjA
 aJN4eY5F4PpEw==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Thu, 07 Nov 2019 09:20:53 +0000
Date: Thu, 07 Nov 2019 09:20:53 +0000
Message-ID: <20191107092053.Horde.i3MVcW9RqZDOQBMADZX9fuc@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: gerg@kernel.org
Subject: Re: [PATCH] mtd: rawnand: driver for Mediatek MT7621 SoC NAND flash
 controller
In-Reply-To: <20191107073521.11413-1-gerg@kernel.org>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_012059_240630_008768FD 
X-CRM114-Status: GOOD (  19.24  )
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
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 DENG Qingfang <dengqf6@mail2.sysu.edu.cn>, linux-mediatek@lists.infradead.org,
 neil@brown.name, linux-mtd@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>, blogic@openwrt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBnZXJnQGtlcm5lbC5vcmc6Cgo+IEZyb206IEdyZWcgVW5nZXJlciA8Z2VyZ0BrZXJu
ZWwub3JnPgo+Cj4gQWRkIGEgZHJpdmVyIHRvIHN1cHBvcnQgdGhlIE5BTkQgZmxhc2ggY29udHJv
bGxlciBvZiB0aGUgTWVkaWFUZWsgTVQ3NjIxCj4gU3lzdGVtLW9uLUNoaXAgZGV2aWNlLiAoVGhp
cyBvbmUgaXMgdGhlIE1JUFMgYmFzZWQgcGFydHMgZnJvbSBNZWRpYXRlaykuCj4KPiBUaGlzIGNv
ZGUgaXMgYSByZS13b3JraW5nIG9mIHRoZSBlYXJsaWVyIHBhdGNoZXMgZm9yIHRoaXMgaGFyZHdh
cmUgdGhhdAo+IGhhdmUgYmVlbiBmbG9hdGluZyBhcm91bmQgdGhlIGludGVybmV0IGZvciB5ZWFy
czoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9SZWNsYWltWW91clByaXZhY3kvY2xvYWsvYmxvYi9t
YXN0ZXIvdGFyZ2V0L2xpbnV4L3JhbWlwcy9wYXRjaGVzLTMuMTgvMDA0NS1tdGQtYWRkLW10NzYy
MS1uYW5kLXN1cHBvcnQucGF0Y2gKPgo+IFRoaXMgaXMgYSBtdWNoIGNsZWFuZWQgdXAgdmVyc2lv
biwgcHV0IGluIHN0YWdpbmcgdG8gc3RhcnQgd2l0aC4KPiBJdCBkb2VzIHN0aWxsIGhhdmUgc29t
ZSBwcm9ibGVtcywgbWFpbmx5IHRoYXQgaXQgc3RpbGwgdXNlcyBhIGxvdCBvZiB0aGUKPiBtdGQg
cmF3IG5hbmQgbGVnYWN5IHN1cHBvcnQuCj4KPiBUaGUgZHJpdmVyIG5vdCBvbmx5IGNvbXBpbGVz
LCBidXQgaXQgd29ya3Mgd2VsbCBvbiB0aGUgc21hbGwgcmFuZ2Ugb2YKPiBoYXJkd2FyZSBwbGF0
Zm9ybXMgdGhhdCBpdCBoYXMgYmVlbiB1c2VkIG9uIHNvIGZhci4gSSBoYXZlIGJlZW4gdXNpbmcK
PiBmb3IgcXVpdGUgYSB3aGlsZSBub3csIGNsZWFuaW5nIHVwIGFzIEkgZ2V0IHRpbWUuCj4KPiBT
by4uLiBJIGFtIGxvb2tpbmcgZm9yIGNvbW1lbnRzIG9uIHRoZSBiZXN0IGFwcHJvYWNoIGZvcndh
cmQgd2l0aCB0aGlzLgo+IEF0IGxlYXN0IGluIHN0YWdpbmcgaXQgY2FuIGdldCBzb21lIG1vcmUg
ZXllYmFsbHMgZ29pbmcgb3ZlciBpdC4KPgo+IFRoZXJlIGlzIGEgbWVkaWF0ZWsgbmFuZCBkcml2
ZXIgYWxyZWFkeSwgbXRrX25hbmQuYywgZm9yIHRoZWlyIEFSTSBiYXNlZAo+IFN5c3RlbS1vbi1D
aGlwIGRldmljZXMuIFRoYXQgaGFyZHdhcmUgbW9kdWxlIGxvb2tzIHRvIGhhdmUgc29tZSBoYXJk
d2FyZQo+IHNpbWlsYXJpdGllcyB3aXRoIHRoaXMgb25lLiBBdCB0aGlzIHBvaW50IEkgZG9uJ3Qg
a25vdyBpZiB0aGF0IGNhbiBiZQo+IHVzZWQgb24gdGhlIDc2MjEgYmFzZWQgZGV2aWNlcy4gKEkg
dHJpZWQgYSBxdWljayBhbmQgZGlydHkgc2V0dXAgYW5kIGhhZAo+IG5vIHN1Y2Nlc3MgdXNpbmcg
aXQgb24gdGhlIDc2MjEpLgo+Cj4gVGhvdWdodHM/CgorQ0MgREVORyBRaW5nZmFuZywgQ2h1YW5o
b25nIEd1bywgV2VpamllIEdhbyB0byB0aGUgbGlzdC4KCkhpIEdyZWcsCgpUaGFua3MgZm9yIHBv
c3RpbmcgdGhpcyBkcml2ZXIuCgpCdXQgSSB3b3VsZCBsaWtlIHRvIG1lbnRpb24gdGhhdCB0aGUg
b3BlbndydCBjb21tdW5pdHkgaXMgY3VycmVudGx5ICAKd29ya2luZyBvbiBhCm5ldyB2ZXJzaW9u
IHdoaWNoIGlzIGJhc2VkIGEgbmV3ZXIgdmVyc2lvbiBvZiB0aGUgTWVkaWFUZWsgdmVuZG9yIGRy
aXZlci4KVGhhdCB2ZXJzaW9uIGlzIGN1cnJlbnRseSB0YXJnZXRlZCBmb3IgdGhlIG9wZW53cnQg
NC4xOSBrZXJuZWwuClNlZSBmdWxsIHB1bGwgcmVxdWVzdCBbMV0gYW5kIE5BTkQgZHJpdmVyIHBh
dGNoIFsyXQoKSXQgd291bGQgYmUgYSBzaGFtZSBpZiBkdXBsaWNhdGUgd29yayBoYXMgYmVlbiBk
b25lLgoKR3JlYXRzLAoKUmVuw6kKClsxXTogaHR0cHM6Ly9naXRodWIuY29tL29wZW53cnQvb3Bl
bndydC9wdWxsLzIzODUKWzJdOiAgCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQv
cHVsbC8yMzg1L2NvbW1pdHMvYjI1NjljMGE1OTQzZmU4Zjk0YmEwN2M5NTQwZWNkMTQwMDZkNzI5
YQoKPHNuaXA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
