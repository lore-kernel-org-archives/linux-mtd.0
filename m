Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEBD606A323
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nkpKO74g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fzTNkJ7N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cbi3vJ4wFTc3ic9F5YUsECNKefx8qKhGDQZACW4+VM4=; b=nkpKO74g1GBFVY+hkrcwHltBco
	SJjw4Fak4T0eaRXDop3c6vkw2K3wzDE1A60r4a6Fj+lNCJDCvn97B8D3ZTAJ3V4ows5j3O/8JVAsx
	7bMgef4ZmalLBVuEVQKx7QIKLz7WDQnk9uJf26UWZLriC9gCPAnsBF7MUIl19nLw9HQablsoYwioV
	DRZoEZv+I8QNBLNKUjEMVcxcgHLCJZW0M7lUj08NPyJoSG3dt/Gd8YKN12+Sdzwc2Y2hmCdFjTTeQ
	reQBDp075tLojuAR7DTvO8D/lLib2mkzb8Vy3Vjm689Ap+PDRjdaNZ40iyhNA/oFrPuxx/Hbu0S5J
	KWCMtleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJIb-00000005x5i-21WB;
	Tue, 17 Nov 2026 13:32:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJIW-00000005x48-3GQZ
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:32:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EDA8C1A162D
	for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:32:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B842C5FC81;
	Tue, 17 Nov 2026 13:32:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DD3811BC0008;
	Tue, 17 Nov 2026 14:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922350; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TNhUvt7V3+z9yILQyuOrF8o1BFxufpMkmYgFMT/d6gw=;
	b=fzTNkJ7NqGGVaO8SeLv/BKRL0kR/5brrbWW+BVdqpx8Hn6YGdn9SHkF4bhwy8y3nM0e2na
	8AkfGLOvB+VHHAWogLOJIz8hE2jNHpsWbigv51r+SoczEFM0XABBvlLtMBPTXS5JWmtD0I
	DvNo2m+VU3VtwSaSsHH2DFS6cAnoS0wXFoy1UuHYr75G278+2HU6q8MNaiUggZ/SYfyBV0
	eYaCxiFtUuGl0HreX36YTWgvN2h9Jt4TCzgyepWCIkr11Oh/Bzy0HwFKPTMtCFuOwDQ0A6
	M4xs7DjX4N9x77Gt5uyNjAPkDsFkUisFze4hOZm2WzFeFlbjesb8MqKb0vtYog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guo Zihao <guozh23@xiaopeng.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Yangtao Li <frank.li@vivo.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: lantiq-flash: Fix NULL pointer dereference in probe
In-Reply-To: <20261106014928.4126855-1-guozh23@xiaopeng.com> (Guo Zihao's
	message of "Fri, 6 Nov 2026 09:49:28 +0800")
References: <20261106014928.4126855-1-guozh23@xiaopeng.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 14:32:26 +0100
Message-ID: <87mrr7lh1x.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053232_959362_95A57DF1 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDYvMTEvMjAyNiBhdCAwOTo0OToyOCArMDgsIEd1byBaaWhhbyA8Z3VvemgyM0B4aWFvcGVu
Zy5jb20+IHdyb3RlOgoKPiBsdHFfbXRkX3Byb2JlKCkgZGVyZWZlcmVuY2VzIGx0cV9tdGQtPm1h
cC0+dmlydCBiZWZvcmUgdGhlIG1hcF9pbmZvCj4gc3RydWN0dXJlIGlzIGFsbG9jYXRlZDogdGhl
IG1hcCBwb2ludGVyIGl0c2VsZiBpcyBzdGlsbCBOVUxMIHdoZW4KPiBsdHFfbXRkLT5tYXAtPnZp
cnQgaXMgYXNzaWduZWQsIGJlY2F1c2UgdGhlIHN0cnVjdHVyZSBpcyBhbGxvY2F0ZWQgYQo+IGZl
dyBsaW5lcyBiZWxvdy4gQW55IGRldmljZSB3aXRoIGEgImxhbnRpcSxub3IiIGNvbXBhdGlibGUg
dGhlcmVmb3JlCj4gY3Jhc2hlcyB0aGUga2VybmVsIHdpdGggYSBOVUxMIHBvaW50ZXIgZGVyZWZl
cmVuY2UgZHVyaW5nIHByb2JlLgo+Cj4gQXNzaWduIHRoZSBtYXBwaW5nIGFmdGVyIHRoZSBtYXBf
aW5mbyBhbGxvY2F0aW9uIGluc3RlYWQuCj4KPiBGaXhlczogNjE0NWUwN2U5Yzc3ICgibXRkOiBs
YW50aXEtZmxhc2g6IFVzZSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp
IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEd1byBaaWhh
byA8Z3VvemgyM0B4aWFvcGVuZy5jb20+CgpIZWxsbywgdGhpcyBpcyBhIGR1cGxpY2F0ZSBvZiBh
IHdpZGVyIHNlcmllcyBmcm9tIFNpbW9uIFd1bmRlcmxpY2gsIEkKdG9vayBoaXMgc2luY2UgdGhl
cmUgYXJlIG1vcmUgYmVoYXZpb3JhbCBmaXhlcy4KClRoYW5rcyBmb3IgdGhlIGNvbnRyaWJ1dGlv
biBhbnl3YXkhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
