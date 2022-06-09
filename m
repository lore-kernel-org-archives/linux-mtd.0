Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD733C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg1VP5Xa8I0ATtQNl5QtgunonrA7XBlXTnTbF4RBoxE=; b=04sLnAAzycII/R
	UXJDO7UAZ4DT7esLnvfnY/fQ5YREncqffa+VQdIXSJrAzIQ807zatnNi8E7QudnUBhq0GUyO2lkLY
	EGqSI4LjX/FdT5q5GuSHaGau6AaIYxc9IxfWocXYfm2uBRHgfYw1OGDxWYxD3YE2tQ3CvkHAFVDGy
	f8JCh/bK5lBJdbd4oD3Sbvl+r/9lQTmlHy3Tq7o+I8wwQK3OXA4hatWiK++kFA/xZN4a9zoabhCTD
	HNd1IvoLaoElLZZETKGitNyjozsz3wBqdmDL/4TEj9+iaNqY70CoQeikW6x1pqyNWQDHMJdI7SSKS
	3z52HH/W4w7My09lFcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHyu-00232z-0U; Thu, 09 Jun 2022 13:13:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvB-0020f1-0k
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1CFFD20002;
	Thu,  9 Jun 2022 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLgQ7oYoLF0TCJwAZWUe/uPZc+8Mcb5PI2UJ0+wR1H8=;
	b=jALUrFB+Ev/0PTioyNoNHldAnsUTQhHwj2knc49Y2mXU8sf70p1Jqs7M3WsyJX3SmzPcz+
	vqeqSWKddtD8+2iN8lUKAaE+o454/bpj4iiGG2USjYp/QxmBQlnPYm43WHWH53QpvHzCYd
	5VHT7XTIuXPjnj+SbSKkwt3HT6YqB7xLILbZUwexXD5PGMfKYpxtHXzMXsPePgWg2FjdHc
	S6Se7SvdbyIU3izyZfcsXM39dNpPRXUGfs5jN+KpBQdi4kJdenfQ1RywwL7Hzd8TVNCGCD
	habnzF4bS2aqSVKpS3mpnPV1OnLsuXzP+NlD3Bh7PN3I6e6JqRhPYFy30Qp08g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 05/14] mtd: lpddr2_nvm: Warn about failure to unregister mtd device
Date: Thu,  9 Jun 2022 15:09:54 +0200
Message-Id: <20220609130954.293371-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-6-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0aaa0b5f84a0908fb2de30e8fea10811b154bf56'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060957_251109_FF857EF2 
X-CRM114-Status: UNSURE (   8.72  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjQ5IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIHNob3VsZG4ndCBm
YWlsLiBXYWlsIGxvdWRseSBpZiBpdCBkb2VzIGFueWhvdy4KPiAKPiBUaGlzIG1hdGNoZXMgaG93
IG90aGVyIGRyaXZlcnMgKGUuZy4gbmFuZC9yYXcvbmFuZHNpbS5jKSB1c2UKPiBtdGRfZGV2aWNl
X3VucmVnaXN0ZXIoKS4KPiAKPiBCeSByZXR1cm5pbmcgMCBpbiB0aGUgcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIGEgZ2VuZXJpYyBlcnJvciBtZXNzYWdlCj4gYnkgdGhlIGRldmljZSBjb3JlIGlz
IHN1cHByZXNzZWQsIG5vdGhpbmcgZWxzZSBjaGFuZ2VzLgo+IAo+IFRoaXMgaXMgYSBwcmVwYXJh
dGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgcmV0dXJuIHZvaWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
