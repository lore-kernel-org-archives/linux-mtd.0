Return-Path: <SRS0=RTUQ=EB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7168EC4363A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:51:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 160932225C
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RrABDt9M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 160932225C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IUZYEbAu6ma7up6XoJcFabiOmYM3Su/92OtbsHo3mJA=; b=RrABDt9MLaDcsAak4RL8xURsf
	2W0AX5b64SuE39qBN/8Xf/+fZLrpeA5F95zwI3np9B249kspn1MM+ZjLQtMpySNyHTE2FPXOzaQHn
	GhFIO07h08sUZ+Dw80aCr0HFqZZGTdnZ8/qYbA9ZKEOS3gfiiiBoZ/r5QY0GeFVi6FLMZwYG3mm21
	Nk/DazBcnlynrxppspx0DfNCiu0AaKIGy+F3mT/vRqgyWqTb2Bmh836qTnfSyFMFlsAD7VqH/nROb
	033ClswykA0A7kw87pXj6ecaU3XbrO8RT0k72pfAg8HpzeTugvi0Wo0/ZJN73GNvPfzjIyDM4erPg
	qAkk286cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6ce-0006Tk-3d; Mon, 26 Oct 2020 17:49:32 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6ca-0006Rq-V6
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2020 17:49:29 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3AD0A200010;
 Mon, 26 Oct 2020 17:49:27 +0000 (UTC)
Date: Mon, 26 Oct 2020 18:49:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>, miquel.raynal@bootlin.com
Subject: Re: [PATCH v3] mtd: rawnand: mxc: Move the ECC engine
 initialization to the right place
Message-ID: <20201026184926.49d05feb@xps13>
In-Reply-To: <20201026174532.6090-1-miquel.raynal@bootlin.com>
References: <20201016213613.1450-1-festevam@gmail.com>
 <20201026174532.6090-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_134929_121521_F8FB96DE 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: vigneshr@ti.com, richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, han.xu@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBNb24sIDI2IE9jdCAyMDIwCjE4OjQ1OjMyICswMTAwOgoKPiBPbiBGcmksIDIwMjAtMTAtMTYg
YXQgMjE6MzY6MTMgVVRDLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+ID4gTm8gRUNDIGluaXRpYWxp
emF0aW9uIHNob3VsZCBoYXBwZW4gZHVyaW5nIHRoZSBob3N0IGNvbnRyb2xsZXIgcHJvYmUuCj4g
PiAKPiA+IEluIGZhY3QsIHdlIG5lZWQgdGhlIHByb2JlIGZ1bmN0aW9uIHRvIGNhbGwgbmFuZF9z
Y2FuKCkgaW4gb3JkZXIgdG86Cj4gPiAKPiA+IC0gaWRlbnRpZnkgdGhlIGRldmljZSwgaXRzIGNh
cGFiaWxpdGllcyBhbmQgY29uc3RyYWludHMgKG5hbmRfc2Nhbl9pZGVudCgpKQo+ID4gLSBjb25m
aWd1cmUgdGhlIEVDQyBlbmdpbmUgYWNjb3JkaW5nbHkgKC0+YXR0YWNoX2NoaXAoKSkKPiA+IC0g
c2NhbiBpdHMgY29udGVudCBhbmQgcHJlcGFyZSB0aGUgY29yZSAobmFuZF9zY2FuX3RhaWwoKSkK
PiA+IAo+ID4gTW92aW5nIHRoZXNlIGxpbmVzIHRvIG14Y25kX2F0dGFjaF9jaGlwKCkgZml4ZXMg
YSByZWdyZXNzaW9uIGNhdXNlZCBieQo+ID4gYSBwcmV2aW91cyBjb21taXQgc3VwcG9zZWQgdG8g
Y2xhcmlmeSB0aGVzZSBzdGVwcy4KPiA+IAo+ID4gV2hlbiBtb3ZpbmcgdGhlIEVDQyBpbml0aWFs
aXphdGlvbiBmcm9tIHByb2JlKCkgdG8gYXR0YWNoKCksIGdldCByaWQKPiA+IG9mIHRoZSBwZGF0
YSB1c2FnZSB0byBkZXRlcm1pbmUgdGhlIGVuZ2luZSB0eXBlIGFuZCBsZXQgdGhlIGNvcmUgZGVj
aWRlCj4gPiBpbnN0ZWFkLgo+ID4gCj4gPiBUZXN0ZWQgb24gYSBpbXgyNy1wZGsgYm9hcmQuCj4g
PiAKPiA+IFJlcG9ydGVkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4g
PiBDby1kZXZlbG9wZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwu
Y29tPgo+ID4gVGVzdGVkLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
Cj4gPiBUZXN0ZWQtYnk6IE1hcnRpbiBLYWlzZXIgPG1hcnRpbkBrYWlzZXIuY3g+ICAKClRoaXMg
cGF0Y2ggc2hvdWxkIGJlIGluIG5leHQgYnkgdG9tb3Jyb3crLgoKSSBtb3ZlZCBteSBTb0IgdG8g
dGhlIGJvdHRvbSBhcyBGYWJpbyBpcyBub3cgdGhlIGF1dGhvciBvZiB0aGUgcGF0Y2gKYW5kIGFk
ZGVkIHRoZSBGaXhlcyB0YWcuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
