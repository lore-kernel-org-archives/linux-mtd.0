Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F7CAC597
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Sep 2025 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hn7UYBZtLYo0BicGDVAo65/ENIz3ig1EThE1G6PX8kI=; b=YP2tUVV7rCNxzu
	Y6z7JPQKz4yFlph6iK8Bv+mzNA6A3hlxUttng4BsMTw+t3i94PJ82EXymai9fSZxwzCvMtMdmZBqx
	9d66kraKd3G3nizuK+Ra2LyeMZh2tJJLFSqkl7/gc5enMyzxwbG3Y+Nr+7cXEtvP9UAHHQrNLE+fJ
	rrQRWu4eacal/Rzt2W2h2FJTrXdyy5ZqLYt2vzAN1YehPtCqqr0RVXgJ4dvggjoriiNJYdZ0NabaQ
	seL133AcwQrqY1a+Ottq0Y2qqWFwbYUAiVXNJoW5EjZbPdaXpM3QJIiQmzjZh1zrpfDushwmFo6jl
	ezhg0aF3oxP1D8jQlHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9Z4-0000000GcqB-2Exr;
	Thu, 18 Sep 2025 08:00:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9Z0-0000000GcmN-3ig9
	for linux-mtd@lists.infradead.org;
	Thu, 18 Sep 2025 08:00:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FC7C1A0EAD
	for <linux-mtd@lists.infradead.org>; Thu, 18 Sep 2025 08:00:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 554926062C;
	Thu, 18 Sep 2025 08:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52B24102F1C69;
	Thu, 18 Sep 2025 10:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758182412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1TpZIpxewTEGvwbOL91PnSmINUioshGqWbVPDnf+U40=;
	b=022T7HKt+2qinqYOaDizow480shpHp8OL18cq9qyR7MgSpxOBSDg3EIk+Id/u/9DXSS4kn
	2fg/vksY5L7hJKVR5tmfzOkJnm3eNgc0Zy3c3pdNv7ySIbOylLRREOGSsl/ULQv//Ru6TF
	aslk8nZmSvOxu91ZQVOCi4ocLS9v1FABYPVmmOZ1aLBJAWvGdCg8y4kFARKyU5Fb2O0YUP
	w3OqVPV7C3zt62ronXWPsBf5XU4Ojzfh7XqTNwPd+yk7A2dUN4iEqfsjPng1ZtbeI2zG+j
	W/uYQECNWl5J7jSJafA43Serq0HMt1uL24u4epRR4zqRsdA604F+cHbWQp2heQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Default to autodetect buswidth
In-Reply-To: <CACRpkdb-BxHb_xiyLf8Gx8PNTQ5nZEd8geJwb+PH+pd+SKpubQ@mail.gmail.com>
	(Linus Walleij's message of "Tue, 16 Sep 2025 20:49:25 +0200")
References: <20250914-fsmc-v1-1-6d86d8b48552@linaro.org>
	<87h5x27ned.fsf@bootlin.com>
	<CACRpkdb-BxHb_xiyLf8Gx8PNTQ5nZEd8geJwb+PH+pd+SKpubQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 18 Sep 2025 10:00:06 +0200
Message-ID: <874it02nsp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_010023_062662_C0BB9534 
X-CRM114-Status: GOOD (  18.63  )
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

T24gMTYvMDkvMjAyNSBhdCAyMDo0OToyNSArMDIsIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIFR1ZSwgU2VwIDE2LCAyMDI1IGF0IDExOjMz4oCv
QU0gTWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPj4g
T24gMTQvMDkvMjAyNSBhdCAwMDozNTozNyArMDIsIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPj4gPiBJIGRvbid0IGtub3cgd2hlcmUgb3IgaG93IHRo
aXMgaGFwcGVuZWQsIEkgdGhpbmsgc29tZSBjaGFuZ2UKPj4gPiBpbiB0aGUgbmFuZCBjb3JlLgo+
Pgo+PiBJIGhhZCBhIGxvb2sgYW5kIGhvbm5lc3RseSBjb3VsZCBub3QgZmluZCB3aGVyZSB3ZSBi
cm9rZSB0aGlzLiBDb3VsZCBpdAo+PiBiZSBwb3NzaWJsZSB0aGF0IGl0IG5ldmVyIHdvcmtlZCB3
aXRoIERUIHByb2JpbmcgYW5kIG9ubHkgd2l0aCBwbGF0Zm9ybQo+PiBkYXRhPyBBbnkgaWRlYSBv
ZiB3aGF0IHdhcyB0aGUgcHJldmlvdXNseSB3b3JraW5nIGJhc2U/Cj4KPiBJIHRlc3RlZCBvbGQg
a2VybmVscyBiYWNrIHRvIDQuMjAgYW5kIGl0IGRpZG4ndCB3b3JrLgo+IFByb2JhYmx5IGl0IG5l
dmVyIHdvcmtlZD8KCkFoIDotKSBNaWdodCBtYWtlIHNlbnNlIQoKPiBJIHRyaWVkIHRvIHJlY29t
cGlsZSBzb21ldGhpbmcgZnVydGhlciBiYWNrIGJ1dCBJIGRvbid0Cj4gaGF2ZSB0aGUgcmVxdWly
ZWQgb2xkIHRvb2xjaGFpbnMgYXJvdW5kIDpQCgpZZWFoLCBubyBwYi4gQXMgeW91IHNhaWQsIHdl
IHByb2JhYmx5IG5ldmVyIGZhY2VkIHRoZSBpc3N1ZSBldmVuIHRob3VnaAppdCB3YXMgbGF0ZW50
LgoKPj4gQW55aG93LCB0aGlzIGlzIGp1c3QgY3VyaW9zaXR5LCBwYXRjaCBpcyByZWxldmFudCAo
anVzdCBhIGxpdHRsZSBuaXQKPj4gYmVsb3c/KS4KPj4gPiArICAgICAgICAgICAgIH07Cj4+Cj4+
ICAgICAgICAgICAgICAgICAgXgo+PiBUaGVyZSBpcyBhIHNwdXJpb3VzICc7JyBoZXJlLCBubz8K
Pgo+IEZpeGVkIGluIHYyLCBhbHNvIG1hZGUgYSBtb3JlIGVsYWJvcmF0ZSBoYW5kbGluZyBpZiBz
b21lb25lCj4gd291bGQgZXhwbGljaXRseSBzZXQgdGhlIHdpZHRoIHRvIDIuCj4KPiBJIHRoaW5r
IHRoZSBTUEVBciB0aGF0IGlzIHRoZSBwcmltYXJ5IHVzZXIgYWx3YXlzIHNldHMgdGhlIHdpZHRo
Cj4gdG8gMiBzbyB0aGV5IG5ldmVyIHNhdyB0aGlzIGJ1Zy4KCkNlcnRhaW5seS4KClRoYW5rcyEK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
