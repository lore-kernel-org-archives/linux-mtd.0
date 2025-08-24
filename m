Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C785CA0EFC
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozADhdU3zoxxnroAXbX+xY+2VFWLH+qiCJC0V76KeLI=; b=N4QyRVPJFNqegf
	UtF0Q09DGdOcgFMZDjtr2V0T0jaLPtWKy2RBMx7MJmzJNihPpT/buMuEu9n3BGHIcdYzbF6oO+PZS
	sokrhUPf5ibVxso2CTxoO0B63j7fe/BhYUqtOj8FWU69lAPqKOqRvdqBl3GkoPKMrpRWMfK8kBbss
	11DwVnA84IeUt9MmNsq+QmMWc+brvv6FL2SQR/dWve2j4Ca/YqG9+YXbozx4NB+eIFkSPQzaaOv+W
	3A7TzH5eSurERnZz0q0SbGnjOHTfTafwX/yKAfoIzwSanmRmbOgI3xt89vWNDCY+rhvYNIa1A3aBf
	C6Abc9l0HL4QMdAFNbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDce-00000006LlZ-1kXr;
	Sun, 24 Aug 2025 16:31:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDcb-00000006LlF-2F0P
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 16:31:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E0A6FC6B38D;
	Sun, 24 Aug 2025 16:30:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEC49605F1;
	Sun, 24 Aug 2025 16:31:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7037F1C228A68;
	Sun, 24 Aug 2025 18:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756053063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gn7KbLvYVMKJjjXjrXuVd3D0X74qDKII9qi+DZSlr3Y=;
	b=GJUo5aHQQnmkLiRWxkYrY+HJGhs9t/dxJcmhFtp+22CfaWBiZ+7lpHesFzTPxanVsmttFC
	Yzx79I/6fG9X4+HKif7WubdzJj5mB7WMvVItMJBqraRQ3EWISz0R0KziM4fyyvWeXn/NEu
	7iDYvScbXsuSPQbMgJz5QG6XGKUL8/Q2/g1DI2HdNNH0dbHabsoxrC9Zywbxwx6rco9fS+
	tGB8/++Jc+eNisi9fnqy7+tuJk9WLQuLNf1KnyrsvUycoa1WhY4YcsBlXd1mGlf12Mzbz9
	jZVmGQ8+ssLYw1VX5119SyQ/V3AfPwQAc+4YrTjEN43XTMNGtOq/W9GO0HrpPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Teng Wu <gigadevice2025@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  teng.wu@gigadevice.com
Subject: Re: [PATCH] mtd: spinand: gigadevice: Add continuous read support
In-Reply-To: <20250818135227.2114-1-gigadevice2025@gmail.com> (Teng Wu's
	message of "Mon, 18 Aug 2025 21:52:27 +0800")
References: <20250818135227.2114-1-gigadevice2025@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 18:30:51 +0200
Message-ID: <87349gisw4.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_093109_747369_6F3C6B12 
X-CRM114-Status: UNSURE (   6.36  )
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

SGVsbG8gVGVuZywKCk9uIDE4LzA4LzIwMjUgYXQgMjE6NTI6MjcgKzA4LCBUZW5nIFd1IDxnaWdh
ZGV2aWNlMjAyNUBnbWFpbC5jb20+IHdyb3RlOgoKPiBHRDVGMUdNOSBzdXBwb3J0cyBhIGhpZ2gt
c3BlZWQgQ29udGludW91cyBSZWFkIChDUikgbW9kZSB3aGljaCBhbGxvd3MKPiB0aGUgZW50aXJl
IG1lbW9yeSBhcnJheSB0byBiZSByZWFkIG91dCBieSBhIHNpbmdsZSByZWFkIGNvbW1hbmQKPiB3
aXRob3V0IHJlLWlzc3VpbmcgdGhlIDEzaCDigJxQYWdlIFJlYWQgdG8gQ2FjaGXigJ0gY29tbWFu
ZCBmb3IgZXZlcnkgcGFnZS4KPgo+IERhdGFzaGVldCBzdW1tYXJ5Cj4gRmVhdHVyZSByZWdpc3Rl
ciBCMFszXSAoTlIgYml0KQo+IDEgPSBOb3JtYWwgUmVhZCAoZGVmYXVsdCkKPiAwID0gQ29udGlu
dW91cyBSZWFkIChDUikKPgo+IEVDQyBzdGF0dXMgcmVnaXN0ZXIgN0NoCj4gTm9ybWFsIHJlYWQ6
IGJpdHMgWzM6MF0g4oaSIEVDQyBzdGF0dXMgb2YgbGFzdCBwYWdlCj4gQ29udGludW91cyByZWFk
OiBiaXRzIFs3OjRdIOKGkiBhY2N1bXVsYXRlZCBtYXggYml0LWZsaXBzIG92ZXIgdGhlCj4gd2hv
bGUgc2VxdWVudGlhbCByZWFkIG9wZXJhdGlvbi4KPgo+IERhdGFzaGVldDoKPiBodHRwczovL2dp
dGh1Yi5jb20vV1QtODg2L0RBVEFTSEVFVC9ibG9iL21haW4vR0Q1RjFHTTktdjEuMC5wZGYKPgo+
IFNpZ25lZC1vZmYtYnk6IFRlbmcgV3UgPGdpZ2FkZXZpY2UyMDI1QGdtYWlsLmNvbT4KPiAtLS0K
CkkgYW0gaGFwcHkgdG8gc2VlIG1vcmUgZGVmaW5lcyBiZW5lZml0aW5nIGZyb20gdGhpcyBmZWF0
dXJlISBXb3VsZCB5b3UKbWluZCBzaGFyaW5nIHRoZSByZXN1bHQgb2YgYSBzcGVlZCB0ZXN0Pwpg
Zmxhc2hfc3BlZWQgLWMxMCAtZCAvZGV2L210ZHhgCgpUaGFua3MhCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
