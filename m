Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302ABC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E707F61ACE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E707F61ACE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq1WO//PwQ2xO88iAADcdTNIpNcGpR+6hNHakB1JrIY=; b=PomVX5XplPQNH2
	TdDX/p1XTmXjDVYVKisZF3ry2Cy4IrdM28N9h1jWRJB+OmyKlVFNcfjT7cC1nkp1E/OEVkW1yFcOc
	JiSIv1tMclT1f766MgcvZfuUx/41+mIYg/opQjnXfP7oG41B5ZqpcACNaqlWkeCrG6CDA/kQsgTUt
	x061R/YzUkcz/LyLbFbUSabtGYXY/OBptJ/jT6Btx/hbxsFBDJviSDOi8XEJJvW66CCqNU6/wBSW3
	QQL2TNoUCbs5nZ+nPxasph5KMe3J3CvftwbFcuJ8s2xW5Q1MS5k8AFVKd9oDahAxh6kE2mM8oWV1q
	g5JaN/rQrPDJYt6tAw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFXGP-00GPUx-Ic; Mon, 16 Aug 2021 07:42:29 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFXGM-00GPUY-8b
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 07:42:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1EC241BF203;
 Mon, 16 Aug 2021 07:42:22 +0000 (UTC)
Date: Mon, 16 Aug 2021 09:42:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mtd: spinand: core: Properly fill the OOB area.
Message-ID: <20210816094221.28ad02ea@xps13>
In-Reply-To: <CAFr9PXm4FTw5U9pFNoqptZ28M21czDHrbipCOVRcn7uABkEKSQ@mail.gmail.com>
References: <20210617110842.2358461-1-daniel@0x0f.com>
 <20210806220242.4b83237d@xps13>
 <CAFr9PXm4FTw5U9pFNoqptZ28M21czDHrbipCOVRcn7uABkEKSQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_004226_485463_6FFFB929 
X-CRM114-Status: GOOD (  25.61  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBXZWQs
IDExIEF1ZyAyMDIxIDE2OjM3OjU1CiswOTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gU2F0LCA3
IEF1ZyAyMDIxIGF0IDA1OjAyLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPiB3cm90ZToKPiA+IFRoaXMgY2hhbmdlIGxvb2tzIGZpbmUsIEknbGwgdXNlIHNwaW5hbmQt
Pm9vYmJ1ZiBpbnN0ZWFkIG9mIGRhdGFidWYgKwo+ID4gb2Zmc2V0ICh3aWxsIHVwZGF0ZSB3aGVu
IGFwcGx5aW5nKS4gIAo+IAo+IFRoYW5rcyBmb3IgbG9va2luZyBhdCB0aGlzIGZvciBtZS4gT25l
IHRoaW5nIEkgd2FzIHdvcnJpZWQgYWJvdXQgaXMKPiB3aHkgdGhlIFNQSSBOQU5EIHN1YnN5c3Rl
bSB3b3JrZWQgYmVmb3JlIHRoaXMgY2hhbmdlIHdpdGggd2luYm9uZCBldGMKPiBwYXJ0cy4KCkkg
ZGlkbid0IGxvb2sgY2xvc2VseSB0byB0aGUgaGlzdG9yeSBidXQgaXQgaXMgcG9zc2libGUgdGhh
dCBkdXJpbmcgdGhlCkVDQyBlbmdpbmUgZnJhbWV3b3JrIGludHJvZHVjdGlvbiBhbmQgdGhlIHNw
bGl0IG9mIHRoZSBvbi1kaWUgRUNDIGNvZGUKdGhlIGJlaGF2aW9yIGNoYW5nZWQgKHdoaWNoLCBp
biB0aGlzIGNhc2UsIGlzIGEgcmVncmVzc2lvbikuCgo+IFlvdSBwcm9iYWJseSBkb24ndCByZW1l
bWJlciBub3cgYnV0IEkgc2VudCBhIHBhdGNoIHRvIGluY2x1ZGUgc3VwcG9ydAo+IGZvciB0aGUg
bG9uZ3N5cyBmb3Jlc2VlIHBhcnRzIHRoYXQgaGF2ZSB0aGUgd2VpcmQgcXVpcmsgb2YgaGF2aW5n
IG5vCj4gRUNDCj4gZGF0YSBpbiB0aGUgT09CIHNvIGl0J3MgYWxsIHVzYWJsZSBieSB0aGUgdXNl
ciBleGNlcHQgZm9yIHRoZSBiYWQKPiBibG9jayBtYXJrZXIgYW5kIHRoZSBFQ0Mgc3RhdHVzIGJp
dHMgYmVpbmcgbmV4dCB0byB1c2VsZXNzLgo+IEkgZm91bmQgdGhpcyBpc3N1ZSB3aGlsZSB0cnlp
bmcgdG8gdmFsaWRhdGUgdWJpICsgbXkgRUNDIHN0YXR1cwo+IGRlY29kaW5nIHdvcmtlZC4gWzBd
CgpZZXMgSSByZW1lbWJlciBub3chCgo+IFRoZSBTUEkgTkFORCBzdWJzeXN0ZW0gaW4gdS1ib290
IHdvcmtlZCBmaW5lIGFzIGl0IGNvdWxkIGNyZWF0ZSB0aGUKPiB1YmkgZm9ybWF0dGluZyBvbiB0
aGUgZmxhc2ggYW5kIHRoYXQgd291bGQgc3Vydml2ZSByZWJvb3RzIGJ1dCBhbnkKPiBibG9ja3Mg
d3JpdHRlbiBieSBMaW51eCB3b3VsZCBiZSBiYWQgb24gcmVib290Lgo+IFdoZW4gTGludXggY3Jl
YXRlZCB0aGUgdWJpIGZvcm1hdCBpdCB3b3VsZCB3b3JrIHVudGlsIGEgcmVib290IGFzIHRoZQo+
IGNvcnJlY3QgZGF0YSB3YXMgY2FjaGVkIGluIG1lbW9yeSB0aGVuIHUtYm9vdCB3b3VsZCBjb21w
bGFpbiBiZWNhdXNlCj4gYWxsIG9mIHRoZSBibG9ja3Mgd2VyZSBtYXJrZWQgYmFkLgo+IAo+IEJ1
dCB3aW5ib25kIHBhcnRzIG1vdW50ZWQgb24gdGhlIHNhbWUgYm9hcmQsIHNhbWUgY29kZSBldGMg
d29ya2VkIGp1c3QgZmluZS4KPiBJIGd1ZXNzIHRoZSBPT0IgaXMgZ2V0dGluZyBmaXhlZCBzb21l
d2hlcmUgZWxzZSBmb3Igb3RoZXIgcGFydHMuCgpJIHRoaW5rIHRoZSByZWFzb24gaXMgdGhhdCBt
b3N0IEVDQyBjb2RlcyBkbyBub3QgY292ZXIgdGhlIE9PQiBwYXJ0LApoZW5jZSB3cml0aW5nIGdh
cmJhZ2UgdGhlcmUgaXMgbm90IGFuIGlzc3VlICh3aGlsZSB3aXRoIHlvdXIgcGFydCwgdGhlCk9P
QiBhcmVhIHdhcyBhY3R1YWxseSBmdWxseSBwcm90ZWN0ZWQpLiBCdXQgaXQgaXMgY2VydGFpbmx5
IGJlc3QgdG8ga2VlcAp0aGlzIGFyZWEgdGlkeSBhbnl3YXkuCgo+IE1heWJlCj4gaXQgb25seSBo
YXBwZW5zIG9uIHRoZSBsb25nc3lzIHBhcnRzIGJlY2F1c2UgdGhlcmUgaXMgbm8gRUNDIGluIE9P
Qj8KPiAKPiBBbnlob3cgSSB3YXMgd29ycmllZCBteSBmaXggaGlkIHNvbWUgb3RoZXIgaXNzdWUv
YnJva2Ugb3RoZXIgcGFydHMuCgpJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgbGVnaXQsIEkgd2lsbCBr
ZWVwIGl0LgoKPiAKPiBDaGVlcnMsCj4gCj4gRGFuaWVsCj4gCj4gMCAtIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMTA0MDgxNzQ5MjIuNTVjMTE0OWZAeHBzMTMvCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
