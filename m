Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA93CD6E5D
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 05:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMPR98rgrnXwB1eclL1TPCWYnnrNhEcKbSYm7PoY808=; b=T62AQFFPJeOw9V
	V73Kpm74ESXE6l4rqE3qND22NUESB5josn4h75XJpuBF4VN3NKW4amFv8pMERCCJ58x06b5G0b4kf
	o10nvMY/Hiu57pfDdPXumUQwLRM5uyqMfJKcKV9onp2v0lrSK6wATGDn0KmlW2m0xNFfMP/ZmB6C/
	o2UbgEzmnurZL2nDs/qi4rYxldEM5ojtOuzS8jAk8QUD56fwfcfJr+L5Qh61LlcVdGrCDKiHGWYwO
	jYyIRTaiQyl65YCmS403Y95JIg8nkSlBUbOyIfE1BaOM/eiFjOtqqJQ7IPu+xkCrGIEJFiOtVHzDn
	JzIZ77bSVO7D+4hC2CuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMk8-000000005bo-1xHM;
	Fri, 05 Jun 2026 05:05:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMk5-000000005bO-1NHY
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 05:05:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 672CEC5846A;
	Fri,  5 Jun 2026 05:05:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEBFB5FED1;
	Fri,  5 Jun 2026 05:05:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E780C106A1EA5;
	Fri,  5 Jun 2026 07:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780635908; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0cAx5OVVaxm1B19LB6mVCJYySN/Wqh42M5HoVh9JnH0=;
	b=uAEdUkc6KzLPxYbcAKBkInHdL3ovpa9JXFbH+bFZ0m9t9/ZNyytqF6LJku/QRMI9CwyBpa
	RHQKLHWKVVIdaNok9fvRwX2SnxgnCtPN8jkTrduOPsRxv5TUX+slN6eh+Yv2jwp1MUts+L
	ocjKqNdc/w9La4731yIn1YdVfT0Qw65y4UmQrgMuBniIgo6DL2XB2OQCVsPUfafPnVwJi8
	ZZfnCqG4wSV8OUeyLGDJTZc0PNOHZjff7KZr+3ZEHKA68nlDVtE/0/mhz8YKEiqKvII2+5
	ouNmjTMMNVStINsts8VrVjI6xv3TxV5GG8rJnnKEmJopNvoa3Mz6HBwBYH/liQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: macronix: Restore fallback
 parameters for MX25L12805D
In-Reply-To: <20260605005720.1857413-3-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Fri, 5 Jun 2026 08:57:20 +0800")
References: <20260605005720.1857413-1-linchengming884@gmail.com>
	<20260605005720.1857413-3-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 05 Jun 2026 07:05:04 +0200
Message-ID: <87pl25wpa7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_220513_531506_FAC01F61 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgo+IEluIGEgcHJldmlvdXMgZWZmb3J0IHRvIGRyb3AgZmxhc2hfaW5mbyBmaWVsZHMg
YW5kIHJlbHkgb24gU0ZEUCwgdGhlCj4gc3RhdGljIHNpemUgYW5kIG5vX3NmZHBfZmxhZ3Mgd2Vy
ZSByZW1vdmVkIGZyb20gdGhlIE1YMjVMMTI4MDVEIGVudHJ5Cj4gKEpFREVDIElEIDB4YzIyMDE4
KS4KPgo+IEF0IHRoYXQgdGltZSwgdGhlIGxlZ2FjeSBNWDI1TDEyODA1RCB3YXMgYWxyZWFkeSBF
T0wgYW5kIHVuYXZhaWxhYmxlCj4gZm9yIHBoeXNpY2FsIHRlc3RpbmcuIFZlcmlmaWNhdGlvbiB3
YXMgaW5hZHZlcnRlbnRseSBwZXJmb3JtZWQgdXNpbmcKPiB0aGUgbmV3ZXIgTVgyNUwxMjgzM0Ys
IHdoaWNoIHNoYXJlcyB0aGUgc2FtZSBKRURFQyBJRCBidXQgc3VwcG9ydHMKPiBTRkRQLiBBcyBh
IHJlc3VsdCwgdGhlIHByb2JlIHN1Y2NlZWRlZCBkdXJpbmcgdGVzdGluZywgbGVhZGluZyB0bwo+
IHRoZSBtaXN0YWtlbiByZW1vdmFsIG9mIHRoZSBmYWxsYmFjayBwYXJhbWV0ZXJzLgo+Cj4gU2lu
Y2UgdGhlIGFjdHVhbCBNWDI1TDEyODA1RCBsYWNrcyBTRkRQIHN1cHBvcnQgZW50aXJlbHksIGl0
IHN0cmljdGx5Cj4gcmVxdWlyZXMgdGhlc2Ugc3RhdGljIHBhcmFtZXRlcnMuCj4KPiBSZXN0b3Jl
IC5zaXplID0gU1pfMTZNIGFuZCAubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEsgdG8gdGhpcyBlbnRy
eQo+IHRvIGZpeCB0aGUgcHJvYmUgZmFpbHVyZSBmb3IgdGhlIGxlZ2FjeSBwYXJ0Lgo+Cj4gRml4
ZXM6IDk0N2M4NmU0ODFhMCAoIm10ZDogc3BpLW5vcjogbWFjcm9uaXg6IERyb3AgdGhlIHJlZHVu
ZGFudCBmbGFzaCBpbmZvIGZpZWxkcyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3PgoK
UmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
