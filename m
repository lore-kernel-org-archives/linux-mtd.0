Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B08C54EBC
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jan 2023 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNV4vXYuO5CfqFealRf0/IyjkZVKlgbyYVgznG7IvhI=; b=CzCUOZbY3wQ+o6
	sgCHFVgq0diwMuCfqvI7NOeaj8x5kV55arzA6R7WTWGi++DKnxyZkc2uaKZcQyx83XtrnrdxOK/bF
	yE4BuoSqeWBSpCrOwo2joWSjRIC3tAogy/hxZj7Bl4PmscE6oqcyQ4GDqP94ptTeBqinOCgxwC29j
	qDS27fKqlxKW32zZVF71X0AdWaQxe2agFuFNuM3kJk2qBLJ3mL+Ljv/qBo7KiFK8JFexY4QQ+Zlpr
	qZjdAopRI3WyMhfrMYX2CFwG9xIRQ7Ljn1I67uGwhS7g6ae0Kopfkagsk2s+y53Z+0L7TjqHTU4Mv
	CnuC2amuvewvWjKu8cTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBHY-007X1b-UL; Sat, 07 Jan 2023 15:38:53 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBHP-007Wxp-5A
	for linux-mtd@lists.infradead.org; Sat, 07 Jan 2023 15:38:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A5081100002;
	Sat,  7 Jan 2023 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673105920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j93uGk3MTIbLdUMVHbiqCiNVLeIJ4pidbcpDiY3+76c=;
	b=CTXCVgwoRWYlhUx1OoWOq3e66ukaHdIPcD9CrtmUaRzpVzMzKdF8YTgyt5k4D/SxMyU2mC
	LNyDfUWb8FVbTR6kPxhX6iu+9AIGLkSm3uQyU6he5Wpv5CHhji533KX/UGJKStZodrGIib
	GxT5q4IYdQn4K8bDWWPuiUL81Vqidtl/knVl6Sqo73kGaIMfF/yINT4OIe64zKlL0sM6y/
	EIc+RfhILuCU+53JEHmEJ/IAU179+ee901+zGpBey6R2vrXgWRnuFjpHGQhBbjVAc5t6ph
	Flbn+nPqGWRkeHyKeu62hVy0QgatY7M1Z3YWaFzJshlU1uNyJPT2ezqb+1sl+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Egor Martovetsky <egor@pasemi.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: rawnand: pasemi: Don't use static data to track per-device state
Date: Sat,  7 Jan 2023 16:38:37 +0100
Message-Id: <20230107153838.895587-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230102124051.1508424-1-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'718004a5972c83cbcc4b649ec34ff314de373650'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_073843_355641_7F5D6800 
X-CRM114-Status: GOOD (  13.54  )
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

T24gTW9uLCAyMDIzLTAxLTAyIGF0IDEyOjQwOjUxIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFVwIHRvIG5vdyB0aGUgcGFzZW1pIG5hbmQgZHJpdmVyIG9u
bHkgc3VwcG9ydGVkIGEgc2luZ2xlIGRldmljZQo+IGluc3RhbmNlLiBIb3dldmVyIHRoZSBjaGVj
ayBmb3IgdGhhdCB3YXMgcmFjeSBiZWNhdXNlIHR3byBwYXJhbGxlbCBjYWxscwo+IG9mIHBhc2Vt
aV9uYW5kX3Byb2JlKCkgY291bGQgcGFzcyB0aGUgY2hlY2sKPiAKPiAJaWYgKHBhc2VtaV9uYW5k
X210ZCkKPiAJCXJldHVybiAtRU5PREVWOwo+IAo+IGJlZm9yZSBhbnkgb2YgdGhlbSBhc3NpZ25z
IGEgbm9uLU5VTEwgdmFsdWUgdG8gaXQuCj4gCj4gU28gcmV3b3JrIHRoZSBkcml2ZXIgdG8gbWFr
ZSB1c2Ugb2YgcGVyLWRldmljZSBkcml2ZXIgZGF0YS4KPiAKPiBBcyBhbiBpbnRlbmRlZCBzaWRl
IGVmZmVjdCB0aGUgZHJpdmVyIGNhbiBiaW5kIG1vcmUgdGhhbiBvbmUgZGV2aWNlIGFuZAo+IGFs
c28gZ2V0cyByaWQgb2YgdGhlIGNoZWNrCj4gCj4gCWlmICghcGFzZW1pX25hbmRfbXRkKQo+IAkJ
cmV0dXJuIDA7Cj4gCj4gaW4gdGhlIHJlbW92ZSBjYWxsYmFjayB0aGF0IGNvdWxkIG9ubHkgZXZl
ciB0cmlnZ2VyIGFmdGVyIHRoZSBhYm92ZSByYWNlCj4gaGFwcGVuZWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
CkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
