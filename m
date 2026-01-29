Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF3AD73E84
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SYt6bfZWl6M2MWwBcNhRwP7yQ5PGCDE5xOttc5w2UA=; b=D7XRA2QnTUp2gb
	DwnKDhBHfXlb0v1oTdvTDxOkqP5aGxIgikEYJWsxMo7LgqVCtVJ3VcctdrMU5wudvDq8d3Vqyh0h7
	fiqSDdvE33if6/aPoOj5GVH3BvplIXZ+Si/1gZQyeLw16sjt3ndQlDud9BaQGk5V+0Y05YVyPD4E1
	nlIr+iqf2rCu/YsMuihNwQ+4oku2yAk3Pgw3XVnsmaQSjpsTH/eDW6ni/MATljAI5Or+omjKcuGCE
	Tbl1CrZREmkZSDj7sbUykO/RGcLOJGFv+9JD9hQFarUYmKz8EwZEEjr0AdrKpT2amXW3uJybQlai3
	EIAcQwecaLFH1MU6OqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXcb-00000000Z1B-25gl;
	Thu, 29 Jan 2026 19:24:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXcY-00000000Z0G-1ij0
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:24:03 +0000
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EF4DEC22F4E;
	Thu, 29 Jan 2026 19:23:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D821560746;
	Thu, 29 Jan 2026 19:23:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00B50119A880F;
	Thu, 29 Jan 2026 20:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769714626; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1e532CXCB1KDFJRUzFreXxGsndF37iwCvWfL3kBxrns=;
	b=PI2i+8YC14iu64qY8xrhR44SSRCi30qeISdDwE3ErUbLNZf7MILY06/VY61dU12GOUBU9k
	wY2AmQwr/hEPMrUj9AJK4Vn4ZPZXnGyOlb4WZ1KqBYtbUQiWMceExG/oibYQBbDqEhCDLl
	jgzmZaFXKeEKutREjdwC8Gyvd44+hPrQMl47C5M6TcBHEW6c7byeF6KeI4dXm/em6tZxuD
	yOH+SsCgiE6ZaeaYIHD/FvWo3S7vouR4amxm4rgIHkY4Fg5IRIp2rSllitGcZ+oIqtyEwP
	17UWw0xmzo6PCpBRJXsdDX4qo6Mazn/lCoGhoyMqoCF9+k0qw/fKAwCN8HGOyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260119040237.775649-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260119040237.775649-1-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH] mtd: spinand: add Foresee F35SQB002G flash support
Message-Id: <176971462475.266909.3291324963416388553.b4-ty@bootlin.com>
Date: Thu, 29 Jan 2026 20:23:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_112402_591504_53E17600 
X-CRM114-Status: UNSURE (   5.37  )
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

T24gTW9uLCAxOSBKYW4gMjAyNiAwNzowMjozNyArMDMwMCwgTWlraGFpbCBLc2hldmV0c2tpeSB3
cm90ZToKPiBBZGQgc3VwcG9ydCBvZiBGb3Jlc2VlIEYzNVNRQjAwMkcgc3BpbmFuZCBmbGFzaAo+
IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDog
YWRkIEZvcmVzZWUgRjM1U1FCMDAyRyBmbGFzaCBzdXBwb3J0CiAgICAgIGNvbW1pdDogMWQ5ZDVm
NWE1MDQwZmY5YzhiN2IyMmQ1NDg0NWIzYTQ2NDI4NjQzNQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
