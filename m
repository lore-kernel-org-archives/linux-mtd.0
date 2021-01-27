Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91406C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 19:13:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE1460C40
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 19:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE1460C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ufzUzVeJeNlGM7gTYt++Jr3xwPF/oy+bqPR8HS0LCA4=; b=AKHypQz3pe0BEzuSgR34KCwYf
	wnwSwllWmDiwdO+qGXtNa6Fe/a0UuKhyHVcTEh+6xqciiAX9tDkG9eCF6EXepV9c1XDmISvHW+otl
	DSKnVodtWleCH0wtf/Mq42aYAoGy+wX98zZuSBy4wrG5VYggbl4zFGANAprggAE0sCoiKZ9DvSGvj
	kkv1B82l0B1PpOPtvOZTSNb0YKr+kaXax8GGLNWXqbZBagIuhO/l7Jf5SFkNCah3ZO/imI6DT7aNo
	h6B4YnUklBLcqEu8PBsctw3YJFbSR/GdOG7pjnMlMwUIUkoNhKNvtx7O08H/JZ2w73ET/NFKcT+5n
	7M/jRKMDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qF0-0000Jf-6c; Wed, 27 Jan 2021 19:12:34 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qEx-0000Iy-9B
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 19:12:32 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B7A5D40007;
 Wed, 27 Jan 2021 19:12:26 +0000 (UTC)
Date: Wed, 27 Jan 2021 20:12:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: FIX Re: GPMI IMX6ull timeout on dma
Message-ID: <20210127201225.68209646@xps13>
In-Reply-To: <CAOf5uwnSyRF7zTjbsNbJAWu+iabMofthx+gTOL+4wVOPDURJRw@mail.gmail.com>
References: <CAOf5uwku9Nx5-5h77yCtYwNxKHfZSfD+Dk3Fe41Ry45Lf+MdNw@mail.gmail.com>
 <CAOf5uwmZkjF1Xp8vekBYnuBZZJhYk+n+=K7QW_8MAJJ6gw5xWw@mail.gmail.com>
 <CAOf5uwnPnh3ZP932BGJkb_u10-WHwmq5srKaLdKbcFqs4A6mXg@mail.gmail.com>
 <20181029104057.30428a2a@xps13>
 <CAOf5uwmETDH2wz9vGfmETi=as4VtidOPT34-C8ndJiP_sooAZw@mail.gmail.com>
 <20181029105312.1a62628c@xps13>
 <CAOf5uwnSyRF7zTjbsNbJAWu+iabMofthx+gTOL+4wVOPDURJRw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_141231_477124_66869B8E 
X-CRM114-Status: GOOD (  26.28  )
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
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGUgb24KV2VkLCAyNyBKYW4gMjAyMSAxODowMTowMSArMDEwMDoK
Cj4gSGkgYWxsCj4gCj4gT24gTW9uLCBPY3QgMjksIDIwMTggYXQgMTA6NTMgQU0gTWlxdWVsIFJh
eW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBNaWNo
YWVsLAo+ID4KPiA+IE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGUgb24KPiA+IE1vbiwgMjkgT2N0IDIwMTggMTA6NDM6MDUgKzAx
MDA6Cj4gPiAgCj4gPiA+IEhpCj4gPiA+Cj4gPiA+IE9uIE1vbiwgT2N0IDI5LCAyMDE4IGF0IDEw
OjQxIEFNIE1pcXVlbCBSYXluYWwKPiA+ID4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdy
b3RlOiAgCj4gPiA+ID4KPiA+ID4gPiBIaSBNaWNoYWVsLAo+ID4gPiA+Cj4gPiA+ID4gTWljaGFl
bCBOYXp6YXJlbm8gVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90
ZSBvbgo+ID4gPiA+IEZyaSwgNSBPY3QgMjAxOCAxMjozMjoxOCArMDIwMDoKPiA+ID4gPiAgCj4g
PiA+ID4gPiBIaSBCb3Jpcwo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgaGF2ZSByZXZlcnRlZCBmb3Ig
bm93Cj4gPiA+ID4gPgo+ID4gPiA+ID4gUmV2ZXJ0ICJtdGQ6IHJhd25hbmQ6IGdwbWk6IHN1cHBv
cnQgLT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpIgo+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1p
dCA3NmUxYTAwODZhMGMzMjc2YjM4NGY3NzkwNTM0NWUwZmNjODg2ZmRkLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFJldmVydCAibXRkOiByYXduYW5kOiBncG1pOiB1c2UgY29yZSB0aW1pbmdzIGluc3Rl
YWQgb2YgYW4gZW1waXJpY2FsCj4gPiA+ID4gPiBkZXJpdmF0aW9uIgo+ID4gPiA+ID4gVGhpcyBy
ZXZlcnRzIGNvbW1pdCBiMTIwNjEyMjA2OWFhZGFiZTFhOGM1MDc4OTI3N2E5NzhhYWE0ZGY3LiAg
Cj4gPiA+ID4KPiA+ID4gPiBTb3JyeSBmb3IgdGhlIGRlbGF5LCBJJ3ZlIGJlZW4gdmVyeSBidXN5
IGxhdGVseS4KPiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBhbHNvIENjOiBtZSBpbiB5b3VyIGUtbWFp
bHMgdG8gdGhlIE1URCBNTC4KPiA+ID4gPgo+ID4gPiA+IEFGQUlSIEknbSB0aGUgYXV0aG9yIG9m
IHRoZXNlIHBhdGNoZXMgc28gSSB3b3VsZCBsaWtlIHRvIHVuZGVyc3RhbmQgYW5kCj4gPiA+ID4g
Zml4IHdoYXQncyB3cm9uZyB0aGVyZS4gQXMgYSBzdGFydCwgY2FuIHlvdSBkaXNjcmltaW5hdGUg
d2hpY2ggcGF0Y2gKPiA+ID4gPiBhY3R1YWxseSBtYWtlcyB0aGUgdGltaW5ncyBpbmNvbnNpc3Rl
bnQ/IEFyZSB5b3UgcmVhZHkgdG8gZG8gbW9yZQo+ID4gPiA+IHRlc3RpbmcgdG8gZmluZCB3aGF0
J3Mgd3Jvbmc/ICAKPiA+ID4KPiA+ID4gWWVzIGl0J3Mgb24gbXkgcGxhbi4gTm93IGZvciBmaWVs
ZCBJIG5lZWQgdG8gcmV2ZXJ0IHRoZW0gYnV0IEkgaGF2ZQo+ID4gPiB0aGVtIGluIHJvYWRtYXAu
Cj4gPiA+IFdlIGFyZSB0ZXN0aW5nIG5vdyBhbiBpbXg2ZGwuIEl0IGNhbiBiZSBhIGNvbWJpbmF0
aW9uIHdpdGggdGhlIG1pY3Jvbgo+ID4gPiBwYXJ0IG51bWJlciB0b28uICAKPiA+Cj4gPiBTdXJl
LCBsZXQgdXMga25vdyBhYm91dCB5b3VyIGRpc2NvdmVyaWVzLCBJIHJlYWxseSB3YW50IHRoZSBH
UE1JIGRyaXZlcgo+ID4gdG8gdXNlIGNvcmUgdGltaW5ncyBhbmQgLT5zZXR1cF9kYXRhX2ludGVy
ZmFjZSgpIHNvIGlmIHRoZXJlIGlzCj4gPiBzb21ldGhpbmcgd3JvbmcgdGhlcmUgaXQgc2hvdWxk
IGJlIGZpeGVkLgo+ID4gIAo+IAo+IE5lZWQgdG8gbW92ZSBvbiBsdHMga2VybmVsIGFuZCAgSSBo
YXZlIHRpbWUgdG8gd29yayBhbmQgSSBtdXN0IHdvcmsgb24KPiB0aGlzIHRvcGljLiBJIGRvbid0
IHNlZSBhbnkgdXBkYXRlIGJ1dAo+IGFub3RoZXIgcmVwb3J0LiBJcyB0aGlzIHN1cHBvc2VkIHRv
IGJlIGZpeGVkPwoKTm90IGF0IGFsbCwgdGhpcyBoYXNuJ3QgbW92ZWQgZm9yd2FyZC4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
