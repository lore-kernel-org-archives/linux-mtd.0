Return-Path: <SRS0=4NdN=HE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3371CC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 08:16:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C995564E8F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 08:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C995564E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tOGws1kpDjUGmCKXQVWJee5JB4OoPGYxIwjfwFHxoKo=; b=GLcKCqCMiITH+QXsC7gGkpmE/
	L3KZt7TvoUPZvmy/SXWScQddK12IR7CknVqb0sakNS/J09N2u5YNciK+mCyUlXlxptcayMQO/mTnR
	Ac2iv/8Z9G2pGmIq7Kp/ufQhUueZTzC2+RBcuUpLtWH8AdqcLezEeRngKKU4giUyMDu2kLhF1IWuZ
	0PUvcVFkBtzPZTLgImoGKCG8KK1r0Ve2Nacv3nD6uYIc4qThbFV13NZQ0EJyEzYHtNykzIWyyPkjo
	N5AQAUzMpg7UgthpjpfJpiddLBaY7RQqm64Mqb8qcITR68jkL+8ceD/tHy5OxQiZMEj/M1nLcvTIA
	e0s+goJMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qq9-0001hV-Cc; Tue, 02 Feb 2021 08:15:13 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qq5-0001dF-QE
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2021 08:15:10 +0000
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 77FF924000E;
 Tue,  2 Feb 2021 08:15:00 +0000 (UTC)
Date: Tue, 2 Feb 2021 09:14:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210202091459.0c41a769@xps13>
In-Reply-To: <20210202041614.GA840@work>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_031510_005337_A1A5D699 
X-CRM114-Status: GOOD (  25.40  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFR1ZSwKMiBGZWIgMjAyMSAwOTo0NjoxNCArMDUzMDoK
Cj4gSGksCj4gCj4gT24gTW9uLCBGZWIgMDEsIDIwMjEgYXQgMDM6MTg6MjRQTSArMDEwMCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIE1hbml2YW5uYW4sCj4gPiAKPiA+IE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFNh
dCwKPiA+IDMwIEphbiAyMDIxIDA5OjI0OjEyICswNTMwOgo+ID4gICAKPiA+ID4gVGhlIGJidCBw
b2ludGVyIHdpbGwgYmUgdW5hdmFpbGFibGUgd2hlbiBOQU5EX1NLSVBfQkJUU0NBTiBvcHRpb24g
aXMKPiA+ID4gc2V0IGZvciBhIE5BTkQgY2hpcC4gVGhlIGludGVudGlvbiBpcyB0byBza2lwIHNj
YW5uaW5nIGZvciB0aGUgYmFkCj4gPiA+IGJsb2NrcyBkdXJpbmcgYm9vdCB0aW1lLiAgCj4gPiAK
PiA+IEkgZG9uJ3QgaGF2ZSB0aGUgc2FtZSB1bmRlcnN0YW5kaW5nOiB0aGlzIGZsYWcgc2tpcHMg
dGhlIGJhZCBibG9jawo+ID4gdGFibGUgc2Nhbiwgbm90IHRoZSBiYWQgYmxvY2sgc2Nhbi4gV2Ug
ZG8gd2FudCB0byBzY2FuIGFsbCB0aGUgZGV2aWNlcwo+ID4gaW4gb3JkZXIgdG8gY29uc3RydWN0
IGEgUkFNIGJhc2VkIHRhYmxlLgo+ID4gICAKPiA+ID4gSG93ZXZlciwgdGhlIE1URCBjb3JlIHdp
bGwgY2FsbAo+ID4gPiBfYmxvY2tfaXNyZXNlcnZlZCgpIGFuZCBfYmxvY2tfaXNiYWQoKSBjYWxs
YmFja3MgdW5jb25kaXRpb25hbGx5IGZvcgo+ID4gPiB0aGUgcmF3bmFuZCBkZXZpY2VzIGR1ZSB0
byB0aGUgY2FsbGJhY2tzIGFsd2F5cyBwcmVzZW50IHdoaWxlIGNvbGxlY3RpbmcKPiA+ID4gdGhl
IGVjYyBzdGF0cy4KPiA+ID4gCj4gPiA+IFRoZSBfYmxvY2tfaXNyZXNlcnZlZCgpIGNhbGxiYWNr
IGZvciByYXduYW5kIHdpbGwgYmFpbCBvdXQgaWYgYmJ0Cj4gPiA+IHBvaW50ZXIgaXMgbm90IGF2
YWlsYWJsZS4gQnV0IF9ibG9ja19pc2JhZCgpIHdpbGwgY29udGludWUgd2l0aG91dAo+ID4gPiBj
aGVja2luZyBmb3IgaXQuIFNvIHRoaXMgY29udHJhZGljdHMgd2l0aCB0aGUgTkFORF9TS0lQX0JC
VFNDQU4gb3B0aW9uCj4gPiA+IHNpbmNlIHRoZSBiYWQgYmxvY2sgY2hlY2sgd2lsbCBoYXBwZW4g
YW55d2F5cyAoaWUuLCBub3QgbXVjaCBkaWZmZXJlbmNlCj4gPiA+IGJldHdlZW4gc2Nhbm5pbmcg
Zm9yIGJhZCBibG9ja3MgYW5kIGNoZWNraW5nIGVhY2ggYmxvY2sgZm9yIGJhZCBvbmVzKS4KPiA+
ID4gCj4gPiA+IEhlbmNlLCBkbyBub3QgY2hlY2sgZm9yIHRoZSBiYWQgYmxvY2sgaWYgYmJ0IHBv
aW50ZXIgaXMgdW5hdmFpbGFibGUuICAKPiA+IAo+ID4gTm90IGNoZWNraW5nIGZvciBiYWQgYmxv
Y2tzIGF0IGFsbCBmZWVscyBpbnNhbmUuIEkgZG9uJ3QgcmVhbGx5IGdldCB0aGUKPiA+IHNjb3Bl
IGFuZCBnb2FsIG9mIHN1Y2ggY2hhbmdlPwo+ID4gICAKPiAKPiBUaGUgaXNzdWUgSSBlbmNvdW50
ZXJlZCBpcywgb24gdGhlIFRlbGl0IEZOOTgwIGRldmljZSBvbmUgb2YgdGhlCj4gcGFydGl0aW9u
IHNlZW1zIHRvIGJlIHByb3RlY3RlZC4gU28gdHJ5aW5nIHRvIHJlYWQgdGhlIGJhZCBibG9ja3Mg
aW4KPiB0aGF0IHBhcnRpdGlvbiBtYWtlcyB0aGUgZGV2aWNlIHRvIHJlYm9vdCBkdXJpbmcgYm9v
dC4KCm9fTwoKUmVhZGluZyBhIHByb3RlY3RlZCBibG9jayBtYWtlcyB0aGUgZGV2aWNlIHRvIHJl
Ym9vdD8KCldoYXQgaXMgdGhlIGV4YWN0IGRldmljZT8gQ2FuIHlvdSBzaGFyZSB0aGUgZGF0YXNo
ZWV0PyBJcyB0aGlzIGJlaGF2aW9yCmV4cGVjdGVkPyBCZWNhdXNlIGl0IHNlZW1zIHJlYWxseSBi
cm9rZW4gdG8gbWUsIGEgcmVhZCBzaG91bGQgbm90CnRyaWdnZXIgKmFueXRoaW5nKiB0aGF0IGJh
ZC4KCj4gVGhlcmUgc2VlbXMgdG8gYmUgbm8gZmxhZyBwYXNzZWQgYnkgdGhlIHBhcnNlciBmb3Ig
dGhpcyBwYXJ0aXRpb24uIFNvCj4gdGhlIG9ubHkgd2F5IEkgY291bGQgbGV0IHRoZSBkZXZpY2Ug
dG8gYm9vdCBpcyB0byBjb21wbGV0ZWx5IHNraXAgdGhlCj4gYmFkIGJsb2NrIGNoZWNrLgoKV2Ug
ZG8gaGF2ZSBhICJsb2NrIiBwcm9wZXJ0eSB3aGljaCBpbmZvcm1zIHRoZSBob3N0IHRvIGZpcnN0
IHVubG9jayB0aGUKZGV2aWNlLCB3b3VsZCB0aGlzIGhlbHA/IElzIHRoaXMgbG9ja2luZyByZXZl
cnNpYmxlPwoKPiBBRkFJSywgTVREIGNvcmUgb25seSBzdXBwb3J0cyBjaGVja2luZyBmb3IgdGhl
IHJlc2VydmVkIGJsb2NrcyB0byBiZQo+IHVzZWQgZm9yIEJCTSBhbmQgdGhlcmUgaXMgbm8gd2F5
IHRvIGNoZWNrIGZvciBhIHJlc2VydmVkIHBhcnRpdGlvbiBsaWtlCj4gdGhpcy4KCkl0IHNvdW5k
cyBsaWtlIGEgY2hpcCBzcGVjaWZpY2l0eS9idWcsIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gYWRk
IGEKc3BlY2lmaWMgdmVuZG9yIGltcGxlbWVudGF0aW9uIGZvciB0aGF0PwoKPiBJIGFncmVlIHRo
YXQgc2tpcHBpbmcgYmFkIGJsb2NrIGNoZWNrIGlzIG5vdCBhIHNhbmUgd2F5IGJ1dCBJIGRvbid0
IGtub3cKPiBhbnkgb3RoZXIgd2F5IHRvIGhhbmRsZSB0aGlzIHByb2JsZW0uCj4gCj4gVGhhbmtz
LAo+IE1hbmkKPiAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
