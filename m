Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEF8C4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNLB8D5Dh/Y55ocZ/kYwI+HAUqlFl+emhbHpjXNBBd8=; b=DG0woFy7ThaKdQ
	cbek63eUzSsfg73+FgE4alM/jbUK7XwgZxigFdCM2+CCr+N1omxZd4frxeJgrAPZdiDSWdA7xyS8y
	KsbnBnF5h9yPw87lzSTYc9ti3HgiR6G9XxyEQqKI16dnd0euV9AY15AEeoNmelVnjs5o8CpSUWCvV
	Xi8wiZ620b0pFw+PSS0TUnuOSS04KN4iKbmgq6uF/h27lVPRB2cn5y/OcWC2H7Eljl0SvUX7Kt6p5
	9+thXa6VjedGv4llhly73G14hBrBYqFxNPOWkNJvHIXOzqyaAnTnlXPP0iXZvBJVw1wBFz2bOSfqr
	+/UEpnksFQMV5pzFqqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX08f-00000003e1P-1ptw;
	Mon, 05 Feb 2024 14:40:01 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX08b-00000003dy8-3ZRj
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:39:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8CC36000E;
	Mon,  5 Feb 2024 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=URtlvilCKZIja+wEIGAtzdCBNORCDc/ZUlUfuI6MA0E=;
	b=JZ5KTrPKCgnXa1FhR9uDobg6lmSJWT8m2zK7XK4W0ysjEnhkBHf+8la653i2W82z15KFPQ
	TNSgW+xwxrWFnG4hCUEVGK0lxHNc6ALcNp8APqJvL3PbDTlE3hF11+V6K5m0Wl+4CnJVJG
	npSUnjVh1aHGSHRef2hIqJKcnGZJ/YQuJdjN9T4qABXHbyF9aV+fGTjVdK3vLOSzzxTr6s
	dOMphh+QVDp7fpVwKjiaDAQKlQmjDkfOGNuSZPGwSaSNpevvAYXa+l7EMGSBUztPRdnPnd
	m38IDEKT1SWMBtdKJyMKdYx2bajQO9VDRPg1ks9wUAeegNU7s5FaTlYXxmrBqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH v2] mtd: Fix possible refcounting issue when going through partition nodes
Date: Mon,  5 Feb 2024 15:39:51 +0100
Message-Id: <20240205143951.543727-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104081446.126540-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5ab9bbf6c678444dd99afabd44665e7f04047cc5'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_063958_065797_F06BAD2B 
X-CRM114-Status: UNSURE (   8.70  )
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

T24gVGh1LCAyMDI0LTAxLTA0IGF0IDA4OjE0OjQ2IFVUQywgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBVbmRlciBub3JtYWwgY29uZGl0aW9ucywgdGhlIGxvb3AgZ29lcyBvdmVyIGFsbCBjaGlsZCBw
YXJ0aXRpb25zLCBhbmQKPiAnYnJlYWtzJyB3aGVuIHRoZSByZWxldmFudCBwYXJ0aXRpb24gaXMg
Zm91bmQuIEluIHRoaXMgY2FzZSB3ZSBnZXQgYQo+IHJlZmVyZW5jZSB0byB0aGUgcGFydGl0aW9u
IG5vZGUgd2l0aG91dCBldmVyIHJlbGVhc2luZyBpdC4gSW5kZWVkLCByaWdodAo+IGFmdGVyIHRo
ZSBtdGRfY2hlY2tfb2Zfbm9kZSgpIGZ1bmN0aW9uIHJldHVybnMsIHdlIGNhbGwgb2Zfbm9kZV9n
ZXQoKQo+IGFnYWluIG92ZXIgdGhpcyB2ZXJ5IHNhbWUgbm9kZS4gSXQgaXMgcHJvYmFibHkgc2Fm
ZXIgdG8ga2VlcCB0aGUKPiBjb3VudGVycyBldmVuIGluIHRoaXMgaGVscGVyIGFuZCBjYWxsIG9m
X25vZGVfcHV0KCkgYmVmb3JlIGJyZWFrLWluZy4KPiAKPiBSZXBvcnRlZC1ieToga2VybmVsIHRl
c3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IEp1bGlhIExhd2FsbCA8anVs
aWEubGF3YWxsQGlucmlhLmZyPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIzMTIyNTA1NDYuSVN6Z2x2TTItbGtwQGludGVsLmNvbS8KPiBDYzogQ2hyaXN0aWFuIE1hcmFu
Z2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IENjOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+Cj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvZml4ZXMuCgpNaXF1ZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
