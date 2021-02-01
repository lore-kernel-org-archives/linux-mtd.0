Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB0CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:19:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9307464EA3
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9307464EA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BlFArvLqB6PObXqZ+Fz2fCaY621oY0YoBJq1pJxd/xY=; b=FYO8U4KCOBWnvdBuChsdqKTq0
	Kj3mFRPwRINEsmaD6FlFCi7fVGzVQAMlcfy5Q6qNHl6d3UuPoO2wOgPcbLULL/TLGOtwlSraBYaBm
	vBq2wWIDkQaHcfjUiep6fApElNCyz21XjVbPWCSaDTzR3ldQNRUk0QDCEIPBKLOJmWQw02Wz00QTe
	YzpJKGtPchXMZ/wl5DKF0B1Krm7RtDmaXZ7vndbb6v0RIbJZHppuOXAAMNKm3/uMB1+0C5Nz5yW8N
	Sn+B4o4b7N40iOnQFkwXLWCrNdq9aEJNLCHpS1Xjuuff1bVrWUBOWtL/chP/X0BxhMNsB+pmWrvnY
	q1j0c4EAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6a2D-0004v2-Mw; Mon, 01 Feb 2021 14:18:33 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6a2B-0004uN-1a
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 14:18:31 +0000
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 90F55200008;
 Mon,  1 Feb 2021 14:18:25 +0000 (UTC)
Date: Mon, 1 Feb 2021 15:18:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210201151824.5a9dca4a@xps13>
In-Reply-To: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_091831_208771_BDA8451B 
X-CRM114-Status: GOOD (  19.52  )
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
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFNhdCwKMzAgSmFuIDIwMjEgMDk6MjQ6MTIgKzA1MzA6
Cgo+IFRoZSBiYnQgcG9pbnRlciB3aWxsIGJlIHVuYXZhaWxhYmxlIHdoZW4gTkFORF9TS0lQX0JC
VFNDQU4gb3B0aW9uIGlzCj4gc2V0IGZvciBhIE5BTkQgY2hpcC4gVGhlIGludGVudGlvbiBpcyB0
byBza2lwIHNjYW5uaW5nIGZvciB0aGUgYmFkCj4gYmxvY2tzIGR1cmluZyBib290IHRpbWUuCgpJ
IGRvbid0IGhhdmUgdGhlIHNhbWUgdW5kZXJzdGFuZGluZzogdGhpcyBmbGFnIHNraXBzIHRoZSBi
YWQgYmxvY2sKdGFibGUgc2Nhbiwgbm90IHRoZSBiYWQgYmxvY2sgc2Nhbi4gV2UgZG8gd2FudCB0
byBzY2FuIGFsbCB0aGUgZGV2aWNlcwppbiBvcmRlciB0byBjb25zdHJ1Y3QgYSBSQU0gYmFzZWQg
dGFibGUuCgo+IEhvd2V2ZXIsIHRoZSBNVEQgY29yZSB3aWxsIGNhbGwKPiBfYmxvY2tfaXNyZXNl
cnZlZCgpIGFuZCBfYmxvY2tfaXNiYWQoKSBjYWxsYmFja3MgdW5jb25kaXRpb25hbGx5IGZvcgo+
IHRoZSByYXduYW5kIGRldmljZXMgZHVlIHRvIHRoZSBjYWxsYmFja3MgYWx3YXlzIHByZXNlbnQg
d2hpbGUgY29sbGVjdGluZwo+IHRoZSBlY2Mgc3RhdHMuCj4gCj4gVGhlIF9ibG9ja19pc3Jlc2Vy
dmVkKCkgY2FsbGJhY2sgZm9yIHJhd25hbmQgd2lsbCBiYWlsIG91dCBpZiBiYnQKPiBwb2ludGVy
IGlzIG5vdCBhdmFpbGFibGUuIEJ1dCBfYmxvY2tfaXNiYWQoKSB3aWxsIGNvbnRpbnVlIHdpdGhv
dXQKPiBjaGVja2luZyBmb3IgaXQuIFNvIHRoaXMgY29udHJhZGljdHMgd2l0aCB0aGUgTkFORF9T
S0lQX0JCVFNDQU4gb3B0aW9uCj4gc2luY2UgdGhlIGJhZCBibG9jayBjaGVjayB3aWxsIGhhcHBl
biBhbnl3YXlzIChpZS4sIG5vdCBtdWNoIGRpZmZlcmVuY2UKPiBiZXR3ZWVuIHNjYW5uaW5nIGZv
ciBiYWQgYmxvY2tzIGFuZCBjaGVja2luZyBlYWNoIGJsb2NrIGZvciBiYWQgb25lcykuCj4gCj4g
SGVuY2UsIGRvIG5vdCBjaGVjayBmb3IgdGhlIGJhZCBibG9jayBpZiBiYnQgcG9pbnRlciBpcyB1
bmF2YWlsYWJsZS4KCk5vdCBjaGVja2luZyBmb3IgYmFkIGJsb2NrcyBhdCBhbGwgZmVlbHMgaW5z
YW5lLiBJIGRvbid0IHJlYWxseSBnZXQgdGhlCnNjb3BlIGFuZCBnb2FsIG9mIHN1Y2ggY2hhbmdl
PwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4u
c2FkaGFzaXZhbUBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IGMzM2ZhMWIxODQ3Zi4uZjE4Y2QxZGI3OWE5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtNDI4Niw2ICs0Mjg2LDkgQEAg
c3RhdGljIGludCBuYW5kX2Jsb2NrX2lzYmFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qg
b2ZmcykKPiAgCWludCBjaGlwbnIgPSAoaW50KShvZmZzID4+IGNoaXAtPmNoaXBfc2hpZnQpOwo+
ICAJaW50IHJldDsKPiAgCj4gKwlpZiAoIWNoaXAtPmJidCkKPiArCQlyZXR1cm4gMDsKPiArCj4g
IAkvKiBTZWxlY3QgdGhlIE5BTkQgZGV2aWNlICovCj4gIAlyZXQgPSBuYW5kX2dldF9kZXZpY2Uo
Y2hpcCk7Cj4gIAlpZiAocmV0KQoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
