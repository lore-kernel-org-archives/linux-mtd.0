Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FA0C4320A
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 16:58:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5D6603E7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 16:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D5D6603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/QwFGdQNObgcB345WJTLCKUh8l6V3pkMMQGs39iE+04=; b=gCPlmXXUfJbmpf
	gwtKE1CSAT/BWqCBKu7R2nicZ0JL+pHLRitbidK+k2eGbTO3L7Y6eBQtEeyeX0cBF3Jy1Dw+rGmEo
	J6m75WTqwu0iu6ocyK00zfJcpjpcsoTMfBODCRWJE0CBFYEywtsVoHWSIy/LYMqFx/y/rBxs9Ue1S
	1QuBcQQnBB+nwGI4kcWrGngUSkdiw3QqaTrxvrzVaumXQd0hcIspFiluKFLM1FPNRMTQhTnZbmekw
	+F4yk22bNk6JVz/qigjEZkcCDtEJO9sDUYvsrmHWBVQf7OuqkGQqVxF593XKrRXE6sz1wg9HkkUR+
	+gGfVWhDlsxmAmP0gxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC39g-00CzDZ-AO; Fri, 06 Aug 2021 16:57:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC39d-00CzD2-Fd
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 16:57:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C23B4C0003;
 Fri,  6 Aug 2021 16:56:59 +0000 (UTC)
Date: Fri, 6 Aug 2021 18:56:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Kestrel <kestrelseventyfour@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: xway: No hardcoded ECC engine for Micron
 Chips
Message-ID: <20210806185658.5b4772a7@xps13>
In-Reply-To: <20210803143256.GA5209@ubuntu>
References: <20210803143256.GA5209@ubuntu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_095705_702437_9D12D75A 
X-CRM114-Status: GOOD (  27.05  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIEtlc3RyZWwgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+
IHdyb3RlIG9uIFR1ZSwgMyBBdWcgMjAyMQoxNjozMjo1NiArMDIwMDoKCj4gU29tZSBsYW50aXEg
eHdheSBkZXZpY2VzIHVzZSBNaWNyb24gTkFORCBjaGlwcywgd2hpY2ggdXNlIG9uLWRpZSBFQ0Mu
Cj4gVGhlIGhhcmRjb2RlZCBzZXR0aW5nIG9mIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQgbWFr
ZXMgdGhlbSB1bnVzYWJsZSwKPiBiZWNhdXNlIHRoZSBzb2Z0d2FyZSBFQ0Mgb24gdG9wIG9mIHRo
ZSBoYXJkd2FyZSBFQ0MgcHJvZHVjZXMgZXJyb3JzIGZvcgo+IGV2ZXJ5IHJlYWQgYW5kIHdyaXRl
IGFjY2Vzcywgbm90IHRvIG1lbnRpb24gdGhhdCBib290aW5nIGRvZXMgbm90IHdvcmssCj4gYmVj
YXVzZSB0aGUgYm9vdCBsb2FkZXIgdXNlcyB0aGUgY29ycmVjdCBFQ0Mgd2hlbiB0cnlpbmcgdG8g
bG9hZCB0aGUKPiBrZXJuZWwgYW5kIHN0b3BzIGxvYWRpbmcgb24gc2V2ZXJlIEVDQyBlcnJvcnMu
Cj4gUmVtb3ZpbmcgdGhlIGhhcmRjb2RlZCBzZXR0aW5ncyB3b3VsZCBicmVhayBhIG51bWJlciBv
ZiBkZXZpY2VzIHRoYXQKPiB3b3JrIHdpdGggdGhvc2Ugc2V0dGluZ3MuCj4gQWRkaW5nIGEgRFRC
IHByb3BlcnR5IHdhcyBjb25zaWRlcmVkLCBidXQgZGlkIG5vdCB3b3JrLCBiZWNhdXNlIGRldmlj
ZXMKPiBvZiB0aGUgc2FtZSB0eXBlIGJ1dCBmcm9tIGRpZmZlcmVudCBtYW51ZmFjdHVyZSBkYXRl
cyBoYXZlIGRpZmZlcmVudAo+IE5BTkQgY2hpcHMgYW5kIGFzIHN1Y2ggaXQgaXMgbm90IHBvc3Np
YmxlIHRvIGRldGVybWluZSB0aGUgTkFORCBjaGlwCj4gaW4gYWR2YW5jZSBvciBkZXZpY2Ugc3Bl
Y2lmaWMuCgpJIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0gYW5kIGl0IGlzIGEgdmVyeSBjcmFwcHkg
c2l0dWF0aW9uLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2VzdHJlbCA8a2VzdHJlbHNl
dmVudHlmb3VyQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9u
YW5kLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jCj4gaW5kZXggMjY3NTE5NzZlNTAy
Li4yMGNiNWNlMmYzYjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9u
YW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYwo+IEBAIC0xMCw2
ICsxMCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+ICAKPiAgI2luY2x1
ZGUgPGxhbnRpcV9zb2MuaD4KPiArI2luY2x1ZGUgImludGVybmFscy5oIgo+ICAKPiAgLyogbmFu
ZCByZWdpc3RlcnMgKi8KPiAgI2RlZmluZSBFQlVfQUREU0VMMQkJMHgyNAo+IEBAIC0xNDgsNyAr
MTQ5LDggQEAgc3RhdGljIHZvaWQgeHdheV93cml0ZV9idWYoc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwgY29uc3QgdV9jaGFyICpidWYsIGludCBsZW4pCj4gIAo+ICBzdGF0aWMgaW50IHh3YXlfYXR0
YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgewo+IC0JY2hpcC0+ZWNjLmVuZ2lu
ZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09GVDsKPiArCWlmIChjaGlwLT5tYW51ZmFj
dHVyZXIuZGVzYy0+aWQgIT0gTkFORF9NRlJfTUlDUk9OKQo+ICsJCWNoaXAtPmVjYy5lbmdpbmVf
dHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7CgpDb3VsZCB3ZSBtYWtlIHRoaXMgYSBs
aXR0bGUgYml0IGNsZXZlciB3aXRoIHNvbWV0aGluZyBsaWtlIHRoaXM6Cmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEzLXJjNy9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9taWNyb24uYyNMNDM0CgpUaGlzIGlzIGZhciBmcm9tIGlkZWFsLCB0aGVyZSBzaG91bGQg
ZGVmaW5pdGVseSBiZSBhIGNoYW5nZSBpbiB0aGUgRFQuCkJ1dCBnaXZlbiB5b3VyIGluaXRpYWwg
Y29tbWVudHMgSSBndWVzcyBpdCBpcyBub3QgcG9zc2libGUuCgpBbnl3YXkgSSBkb24ndCBmaW5k
IGEgYmV0dGVyIHdheSBhcywgZHVyaW5nIHRoZSBhdHRhY2goKSBjYWxsLCB3ZSBkb24ndAp5ZXQg
cmFuIHRoZSBtYW51ZmFjdHVyZXIgY29kZSwgaGVuY2Ugd2UgZG9uJ3Qga25vdyBpZiBvbi1kaWUg
RUNDIGlzCmFjdHVhbGx5IGF2YWlsYWJsZSBvciBub3QuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
