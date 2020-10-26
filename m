Return-Path: <SRS0=RTUQ=EB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E8BC4363A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:50:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9635522265
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 17:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJ7zZxUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9635522265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uXVkZCGbipGliUiXtYy4wOGTlkUYpJ9VfxcMUVQMNAo=; b=UJ7zZxUcLR8wHdH1q9L3bw+Qk
	Lgnf2AlyDP8Zap2YyVoSsfrK7ZCC51hah9pLNg+GOMT3SvedVPwH7k8kGMAHX3VYbghd/DGp23ieV
	6WcXeNVGjP3do1vdXzl3HxyL6JliA9g+a2YBy4yQqBsT6BLX4czPUnVM7TMLI22dSvvnl8lCfZEto
	BGAlB9OdMXPoqiIZgyMpE2UIDqchKE00GccEY9Kx21r5I+rsN9S7zRviSPiUwRdiIXE/iZHeC4IaT
	CQMX+s+efbtT1SayP9cxE8ZIDjAhG6De80gZ/h+msYnjz5C55Ex2DC6ipHeXdMP4c49OqbWddfp9J
	6yhVYY1jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6bl-0006Fh-Cy; Mon, 26 Oct 2020 17:48:37 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6bh-0006F4-Vc
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2020 17:48:34 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D7ADE200002;
 Mon, 26 Oct 2020 17:48:31 +0000 (UTC)
Date: Mon, 26 Oct 2020 18:48:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2] mtd: rawnand: ifc: Move the ECC engine
 initialization to the right place
Message-ID: <20201026184830.338fd9f7@xps13>
In-Reply-To: <20201026174525.6027-1-miquel.raynal@bootlin.com>
References: <20201016132626.30112-1-festevam@gmail.com>
 <20201026174525.6027-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_134834_123944_65E14AD6 
X-CRM114-Status: GOOD (  13.76  )
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
biBNb24sIDI2IE9jdCAyMDIwCjE4OjQ1OjI1ICswMTAwOgoKPiBPbiBGcmksIDIwMjAtMTAtMTYg
YXQgMTM6MjY6MjYgVVRDLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+ID4gTm8gRUNDIGluaXRpYWxp
emF0aW9uIHNob3VsZCBoYXBwZW4gZHVyaW5nIHRoZSBob3N0IGNvbnRyb2xsZXIgcHJvYmUuCj4g
PiAKPiA+IEluIGZhY3QsIHdlIG5lZWQgdGhlIHByb2JlIGZ1bmN0aW9uIHRvIGNhbGwgbmFuZF9z
Y2FuKCkgaW4gb3JkZXIgdG86Cj4gPiAtIGlkZW50aWZ5IHRoZSBkZXZpY2UsIGl0cyBjYXBhYmls
aXRpZXMgYW5kIGNvbnN0cmFpbnRzIChuYW5kX3NjYW5faWRlbnQoKSkKPiA+IC0gY29uZmlndXJl
IHRoZSBFQ0MgZW5naW5lIGFjY29yZGluZ2x5ICgtPmF0dGFjaF9jaGlwKCkpCj4gPiAtIHNjYW4g
aXRzIGNvbnRlbnQgYW5kIHByZXBhcmUgdGhlIGNvcmUgKG5hbmRfc2Nhbl90YWlsKCkpCj4gPiAK
PiA+IE1vdmluZyB0aGVzZSBsaW5lcyB0byBmc2xfaWZjX2F0dGFjaF9jaGlwKCkgZml4ZXMgYSBy
ZWdyZXNzaW9uIGNhdXNlZCBieQo+ID4gYSBwcmV2aW91cyBjb21taXQgc3VwcG9zZWQgdG8gY2xh
cmlmeSB0aGVzZSBzdGVwcy4KPiA+IAo+ID4gQmFzZWQgb24gYSBmaXggZG9uZSBmb3IgdGhlIG14
Y19uYW5kIGRyaXZlciBieSBNaXF1ZWwgUmF5bmFsLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTogSGFu
IFh1IDx4aG5qdXB0QGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4KPiA+IFRlc3RlZC1ieTogSGFuIFh1IDx4aG5qdXB0QGdtYWls
LmNvbT4gIAo+IAo+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvZml4ZXMsIHRoYW5rcy4KCkZZSSBJJ3Zl
IGFkZGVkIGEgRml4ZXMgdGFnLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
