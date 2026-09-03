Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE25C624A4
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQIWv6icykfrAHw1mzftL0o1d1gsxSLHyKW4x9ZUHBw=; b=E44TYXZ7Y52Hgt
	P5Fq8kCtwWRv0VcJvjS5oPyAhuY85aEUlPH7HqhHc7UgR/ueRCiUujZ3kyTcIa1oZXHBvyhmm1Ve3
	pnuqODB1CbfhRRkvXLxX+SGruW6LVB78RBE9Z6IT00W1C4tDpBR/G2uaQh9Qs97xMcqjncuWuo2ZI
	Jw0ieP7l6DdLZkhXZxcqKHNgVFSjbfCkRGacLO6Wowcy/vF0KPaVvn4tyM0qUxOF8jPMXssBf8tA+
	18osb1xLWGoYJ8iJwEjojKJrqYosFJjqCcN9pqeCwA/EpUL4spAi4ya10e01pLfz7Q00P2cmtutw+
	V7jRZxjMTYA6VWexZepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23SF-0000000Gtyu-3fyT;
	Thu, 03 Sep 2026 09:09:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23SC-0000000Gty6-35OI
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 09:09:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D93071A197A;
	Thu,  3 Sep 2026 09:09:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A4B52602B8;
	Thu,  3 Sep 2026 09:09:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A3A111C79B6F;
	Thu,  3 Sep 2026 11:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788426589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kCxdZ8TxYxfYohs1q/X+KJ2DFpNlq8lP+M+t7AuvahY=;
	b=Dl+bRrPqzV/D/AxyGc6MhUMTqD+b0Jj4RJbPZOPW658ZvY1Bzm5ztTo0+F4ItSaBzEwOcj
	BX+uyNxXFdZaycLtzh1Xm8b0O9qQ0VrC4k5ke96bJJIQ5Su7X+SjDy2U3Ec4UEpZ6UElh7
	OZLElwuPQ6MbhF+6KoCwO4oWu4NL6BlCXrBFgcKXyMzrGQ9/gXx3Iku1UjbbaSzZxn9aCF
	n0EGguSkFhPB31eeDas6COWwBPPqIysv/nwOURXlM0e31M35caM430THTDSS/5YZWwMbjl
	RRJ5zm4MRELF6A9DMWjIhQH1mYMMyPqYYsh2lrh8inkBI3FvoIjYRWgDiCLrCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <michael@walle.cc>,  <mwalle@kernel.org>,  <pratyush@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: Sashiko to track linux-mtd
In-Reply-To: <e2acce09375046f8afdddc3693ccd7eb@infineon.com> (Takahiro
	Kuwano's message of "Fri, 28 Aug 2026 05:59:16 +0000")
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
	<87pl19s7ng.fsf@bootlin.com>
	<0fe3140096bc48a8e71838362220d9f8@kernel.org>
	<b224c6938e084763b017c63e0aa3fa3f@infineon.com>
	<8733xikmb9.fsf@bootlin.com> <8733xhiqyn.fsf@bootlin.com>
	<87v78yimb1.fsf@bootlin.com>
	<10CE8F35-D4FC-4CE8-B687-1154DF9915CF@walle.cc>
	<e2acce09375046f8afdddc3693ccd7eb@infineon.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 11:09:46 +0200
Message-ID: <87tso666qt.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020952_910590_2CF1C071 
X-CRM114-Status: UNSURE (   6.19  )
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

SGVsbG8sCgo+PiA+SW4gdGhlIGVuZCBJIHdvdWxkIGxpa2UgdG8gbW9kaWZ5IHRoZSBjdXJyZW50
IGNvbmZpZ3VyYXRpb24gaW4gb3JkZXIgZm9yCj4+ID5TYXNoaWtvIHRvIGFjdCBhcyBhIHJlZ3Vs
YXIgcmV2aWV3ZXIsIGllLiBqdXN0IGFuc3dlciB0byBhbGwgcmVjaXBpZW50cywKPj4gPmluY2x1
ZGluZyB0aGUgYXV0aG9yOgo+PiA+Cj4+ID4tIGNjID0gLi4uCj4+ID4rIHJlcGx5X2FsbCA9IHRy
dWUKPj4gPisgcmVwbHlfdG9fYXV0aG9yID0gdHJ1ZQo+PiAKPj4gSSdtIGZpbmUgd2l0aCB0aGUg
Y2hhbmdlLiBMZXQncyBzZWUgaG93IHBhdGNoIHN1Ym1pdHRlcnMgd2lsbCByZWFjdC4KPj4gCj4+
IC1taWNoYWVsCj4KPiBJJ20gZmluZSB0b28uCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2ssIEkg
bWFkZSB0aGUgcmVxdWVzdC4KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9zYXNoaWtvLWRldi9z
YXNoaWtvL3B1bGwvNDc4CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
