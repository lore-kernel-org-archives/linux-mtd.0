Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5726DCAC582
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Sep 2025 07:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRt57DByLBB5Mv6ITq5GQtrcGg3puSjvSfyXRJ9zor4=; b=WJQ+9A1CODNyxq
	eB8Ay5nqr5EdwguAoUrVrcxslGLsvP6QAdEbrCYzR6bzjPUxz3saAD6D5SmR77zLNh2qPC4whRlrk
	fDtXCk4t4nDDOweyVQYf3YHMpQ9JKN3nYMoYR9p9JvjPHpUrLFQ8xjGuo1YxdNMiBOVy88jYQ7uuv
	ngF4us9i90CiUhYsp1/pHqnIVacuM2tkS/zchcc08JXQOS5caBIKKe0g6tMmIOZasLq8acRK/WT2P
	Yh3F6Ih5a0cWju2Ym/gK/veZrEZOyMa+RQKztSIxvKbF3Dz8ykJGGVr1uJFeqROPzwredTS9EvsZQ
	FmIZuF9OVUMrRsWgctjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWHb-0000000FHfs-1jGA;
	Mon, 08 Sep 2025 07:27:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWCA-0000000FFIY-2Xd3
	for linux-mtd@lists.infradead.org;
	Mon, 08 Sep 2025 07:21:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C7B901A0E10;
	Mon,  8 Sep 2025 07:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EC9D6061A;
	Mon,  8 Sep 2025 07:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76E3C102F287D;
	Mon,  8 Sep 2025 09:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757316102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UFbPuS3hzmJpKbl+CTamAVLKJpGuiE0FtQwoUF1Gh3w=;
	b=D8vJzJvK/ysAMWSjxGWa9z6JX7mFlll9Uz4aqe3ECq93Uz1wfREJetUHBUPZgBJ55RCS/J
	x2/BIH86UACVHflCaFFjAFD3YBiEsiL4qPUi8twaBN71IIyq3WDkjfXv7/T5nspGnD8MEE
	5qaxbanDwnOgANriZH9eyCXzGQUuVS8gt4+A9Z/EerZcfXfLJ1jOnC+iV0e/Yn18qg3+29
	TjV1P/VwtNItRr5VZyKTa2kgCkN2A014Tic010poaiPBnJpO+sULpEvyr1QFxOdVsp7vIW
	55vlm/Y1W5PtJ5t/mfJ8aOWDwLkeBtK1PyuM2THdDgPzvq2aKo/rxFUctvddXA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-kernel-mentees@lists.linux.dev,
  skhan@linuxfoundation.org,  Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
In-Reply-To: <20250908070124.2647038-1-rk0006818@gmail.com> (Rahul Kumar's
	message of "Mon, 8 Sep 2025 12:31:24 +0530")
References: <20250908070124.2647038-1-rk0006818@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 08 Sep 2025 09:21:22 +0200
Message-ID: <87tt1djtot.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_002146_967550_5300C231 
X-CRM114-Status: GOOD (  15.69  )
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

SGkgUmFodWwsCgpPbiAwOC8wOS8yMDI1IGF0IDEyOjMxOjI0ICswNTMwLCBSYWh1bCBLdW1hciA8
cmswMDA2ODE4QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFJlcGxhY2Ugc3RybmNweSB3aXRoIG1lbWNw
eSBpbiBzbV9hdHRyX3Nob3cgYW5kIGV4cGxpY2l0bHkgYWRkIGEgTlVMCj4gdGVybWluYXRvciBh
ZnRlciB0aGUgY29weS4gQWxzbyB1cGRhdGUgdGhlIHJldHVybiB2YWx1ZSB0byByZWZsZWN0IHRo
ZQo+IGV4dHJhIGJ5dGUgd3JpdHRlbiBmb3IgdGhlIHRlcm1pbmF0b3IuIFRoaXMgYWxpZ25zIHdp
dGggY3VycmVudCBrZXJuZWwKPiBiZXN0IHByYWN0aWNlcyBhcyBzdHJuY3B5IGlzIGRlcHJlY2F0
ZWQgZm9yIHN1Y2ggdXNlLCBhcyBleHBsYWluZWQgaW4KPiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
ZGVwcmVjYXRlZC5yc3QuCgpUaGUgZG9jIHN0YXRlcyAic3Ryc2NweSIgYXMgYSByZXBsYWNlbWVu
dCwgbm90IG1lbWNweS4KCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UsIG9ubHkgY2xlYW51cCBmb3Ig
Y29uc2lzdGVuY3kuCj4KPiBTdWdnZXN0ZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBr
ZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIEt1bWFyIDxyazAwMDY4MThAZ21haWwu
Y29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjE6Cj4gLSBVcGRhdGUgcmV0dXJuIHZhbHVlIHRvIG1h
dGNoIHRoZSBleHRyYSBOVUwgd3JpdHRlbi4KPiBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvbWFmczBtczdidmNkMi5mc2ZAa2VybmVsLm9yZy9ULyN0Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL3NtX2Z0bC5jIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NtX2Z0
bC5jIGIvZHJpdmVycy9tdGQvc21fZnRsLmMKPiBpbmRleCBkMjhkNGYxNzkwZjUuLjNjNWQ2ZDBj
NzI4ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zbV9mdGwuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL3NtX2Z0bC5jCj4gQEAgLTQ0LDggKzQ0LDkgQEAgc3RhdGljIHNzaXplX3Qgc21fYXR0cl9z
aG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCj4g
IAlzdHJ1Y3Qgc21fc3lzZnNfYXR0cmlidXRlICpzbV9hdHRyID0KPiAgCQljb250YWluZXJfb2Yo
YXR0ciwgc3RydWN0IHNtX3N5c2ZzX2F0dHJpYnV0ZSwgZGV2X2F0dHIpOwo+ICAKPiAtCXN0cm5j
cHkoYnVmLCBzbV9hdHRyLT5kYXRhLCBzbV9hdHRyLT5sZW4pOwo+IC0JcmV0dXJuIHNtX2F0dHIt
PmxlbjsKPiArCW1lbWNweShidWYsIHNtX2F0dHItPmRhdGEsIHNtX2F0dHItPmxlbik7Cj4gKwli
dWZbc21fYXR0ci0+bGVuXSA9ICdcMCc7Cj4gKwlyZXR1cm4gc21fYXR0ci0+bGVuICsgMTsKCkFy
ZSB3ZSBzdXJlIHRoZSBidWZmZXIgaXMgYWx3YXlzIHNtX2F0dHItPmxlbiArIDEgbG9uZz8KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
