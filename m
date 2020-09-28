Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96B5C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 14:26:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 494122076A
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 14:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4Dfy1rE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 494122076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u/DzQajULqhgXodPcoJaAeHYMuWrqyHbN1iDH/MQ85U=; b=s4Dfy1rE2EPYUYK++XWl1g0Aj
	eC4re/aVCz3jRkKWuG+dy6z29opMyrXAfG0txrlMPORjF4cCxmg7d3UtXIYszKXMNB8jQWvMdlsDa
	tEBM98rjLLxl+WZY913/D+AOvLuFKPM1t4H71qOYBr+w1efgsMIpNVDisEMT11q9KwjzafONj6XYu
	7v8I3VU+YnmsV6MPo4eFah9exJzdEy4xk/5q+8/bXt+f6ul6lkX0ftXA2BVivfdma2Nyd3mKUDpBD
	2LdjR5mD7GbK/z86pWAz/eOHG1z6ufWcNQCtVD7I8v7jwLbEpO6M27iolRZOwszN6+EWURnSAsSln
	8A8QHPjPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMu6N-00039H-CO; Mon, 28 Sep 2020 14:26:03 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMu6L-00038P-80
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 14:26:02 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B25BF100005;
 Mon, 28 Sep 2020 14:25:51 +0000 (UTC)
Date: Mon, 28 Sep 2020 16:25:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v14 0/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200928162550.30bbce71@xps13>
In-Reply-To: <20200924084842.41741-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200924084842.41741-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_102601_374733_CB6C9F7A 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, christophe.kerello@st.com, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mips@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, qi-ming.wu@intel.com,
 robert.jarzmik@free.fr, piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgoiUmFtdXRoZXZhcixWYWRpdmVsIE11cnVnYW5YIgo8dmFkaXZlbC5tdXJ1Z2FueC5y
YW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3JvdGUgb24gVGh1LCAyNCBTZXAgMjAyMAoxNjo0
ODo0MCArMDgwMDoKCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBuZXcgSVAgb2YgTmFuZCBGbGFzaCBD
b250cm9sbGVyKE5GQykgc3VwcG9ydAo+IG9uIEludGVsJ3MgTGlnaHRuaW5nIE1vdW50YWluKExH
TSkgU29DLgo+IAo+IERNQSBpcyB1c2VkIGZvciBidXJzdCBkYXRhIHRyYW5zZmVyIG9wZXJhdGlv
biwgYWxzbyBETUEgSFcgc3VwcG9ydHMKPiBhbGlnbmVkIDMyYml0IG1lbW9yeSBhZGRyZXNzIGFu
ZCBhbGlnbmVkIGRhdGEgYWNjZXNzIGJ5IGRlZmF1bHQuCj4gRE1BIGJ1cnN0IG9mIDggc3VwcG9y
dGVkLiBEYXRhIHJlZ2lzdGVyIHVzZWQgdG8gc3VwcG9ydCB0aGUgcmVhZC93cml0ZQo+IG9wZXJh
dGlvbiBmcm9tL3RvIGRldmljZS4KPiAKPiBOQU5EIGNvbnRyb2xsZXIgYWxzbyBzdXBwb3J0cyBp
bi1idWlsdCBIVyBFQ0MgZW5naW5lLgo+IAo+IE5BTkQgY29udHJvbGxlciBkcml2ZXIgaW1wbGVt
ZW50cyAtPmV4ZWNfb3AoKSB0byByZXBsYWNlIGxlZ2FjeSBob29rcywKPiB0aGVzZSBzcGVjaWZp
YyBjYWxsLWJhY2sgbWV0aG9kIHRvIGV4ZWN1dGUgTkFORCBvcGVyYXRpb25zLgo+IAo+IFRoYW5r
cyBNaXF1ZWwsIEJvcmlzLCBBbmR5LCBBcm5kIGFuZCBSb2IgZm9yIHRoZSByZXZpZXcgY29tbWVu
dHMgYW5kIHN1Z2dlc3Rpb25zLgo+IC0tLQo+IHYxNDoKPiAgIC0gQWRkcmVzcyBBbmR5J3MgcmV2
aWV3IGNvbW1lbnRzCj4gICAtIGFsaWduIHRoZSBoZWFkZXJzIGFuZCByZXZvbWUgRHVwbGljYXRl
cyAKPiAgIC0gcmVwbGNhY2UgbnVtZXJpY2FsIGNvbnN0IHZhbHVlcyBieSBIWl9QRVJfTUhaIGFu
ZCBVU0VDX1BFUl9TRUMKPiAgICAgZGVmaW5lZCBtYWNyb3MKPiAgIC0gYWRkIGRldl9lcnJfcHJv
YmUoKSBhcGkgaW5zdGVhZCBvZiBsZWdhY3kgZXJyIGNoZWNrCj4gICAtIGFkZCBnZXRfdW5hbGln
bmVkX2xlMzIoKSBhcGkgaW5zdGVhZCBvZiBtYW51YWwgZW5kaW5lc3MKPiAgIC0gcmVtb3ZlIHJl
ZHVkZW50IGNoZWNrCj4gICAtIHNwbGl0IHRoZSBsaW5lcyBsb2dpY2FsbHkgaW4gYmV0d2VlbiBh
bmQgYWRkIHJlcXVpcmUgc3BhY2VzCj4gdjEzOgo+ICAgLSBBZGRyZXNzIE1pcXVlbCBSYXluYWwg
cmV2aWV3IGNvbW1lbnRzCj4gICAtIHVwZGF0ZSB0aGUgcmV0dXJuIHR5cGUgd2l0aCB2YXJpYWJs
ZSAncmV0Jwo+ICAgLSBoYW5kbGUgZXJyIGNoZWNrIHN0YXRlbWVudCBwcm9wZXJseQo+ICAgLSBj
aGFuZ2UgdGhlIG5hbWluZyBjb252ZW50aW9uIGFsaWduZWQgd2l0aCByZWNlbnRseSBjaGFuZ2Vk
IHRoZSBuYW1pbmcKPiAgICAgYXJvdW5kIHRoZSBkYXRhIGludGVyZmFjZQo+ICAgICBkYXRhIHN0
cnVjdHVyZSBhbmQgZnVuY3Rpb24gbmFtZXMKPiAgIC0gcmVwbGFjZSBieSBkaXYgOCBpbnN0ZWFk
IG9mIDw8NCBpbiBlY2MgY2FsY3VsYXRpb24gYmV0dGVyIGNvZGUgcmVhZGFiaWxpdHkKPiAgIC0g
aGFuZGxlIGNoZWNrX29ubHkgcHJvcGVybHkgbGlrZSBleGlzdGluZyBkcml2ZXJzCgpJIGFtIHNv
cnJ5IGJ1dCB0aGVyZSBhcmUgdHdvIHRvIHRocmVlIGNvbW1lbnRzIHdoaWNoIHlvdSBkaWQgbm90
CmFkZHJlc3Mgb3IgYWRkcmVzc2VkIHBhcnRpYWxseSB3aGlsZSBub3Qgc28gaW1wYWN0aW5nIG9u
IHRoZSBsb2dpYywKY2FuIHlvdSBwbGVhc2UgcmV2aWV3IGFuZCBhZGRyZXNzIHRoZW0gYWxsPyAo
cGxlYXNlIG5vdGUgdGhhdCBJIGNoZWNrZWQKdGhlIHBhdGNoIGFkZGluZyB0aGUgZHJpdmVyIGJl
Zm9yZSB0ZWxsaW5nIHlvdSB0aGF0KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
