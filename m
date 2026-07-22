Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E3AC44536
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK3LtdZlawBhVKUG7cZeRr68bBLk88f1BTySz7Oa7xs=; b=3lk8Gv2abihG2L
	cKa3XQJlt4hrnPQYBLnx0XAj7aa5Syu4zQIR70YCOijhCIsoftvDEwaEGljvWCdmcy7ji7jLLkFDK
	v+K8hyWBObFQtJKbNzUFU0g55FDQycRTsacAVC1xq54UeOGpKms5fg3bM1+u5w3Jy5weKZygtupss
	U5+X9R+9Wep0Nq+J1lDEGjdQebCWwHiF4wTJKn7mAZhzva2js/gbxYwvB3t0yCjqjmOZeeB6iVZTq
	91H2TlN0rTOU4Uk/tCHHMP/GQtKeuwy+exaP07tw2GFdYwKbd5H2PgxWTqWPMxNu95a8IXHYjZ+ar
	TO1y3ycP9SQAHwLjg7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWaH-0000000Bp81-26P2;
	Wed, 22 Jul 2026 13:02:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWaF-0000000Bp7h-2YNm
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 13:02:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA4434E40ECE;
	Wed, 22 Jul 2026 13:01:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B90F60388;
	Wed, 22 Jul 2026 13:01:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB5DD11BD2234;
	Wed, 22 Jul 2026 15:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFOm7gKCF7wbVnmzuK16nq6m2ZerW0woFmr6Ol4kc20=;
	b=rXN+HtvnCEj6wzEu03473qEXRJgGDnGh7sal0tRHe/ValxxqMRj1OtKcVbiClT25/z3rZk
	mvz+PyjZiPsZ8jtcLSUs1A7p8vLZdAmBSYa9mT/LMgVDuuOv9m6vIzf12lsigsCllvOroz
	MRa5KqqYLhpUnXJ7l/+UQ6b4K5MzoMzXf8U0iQsY/lNUY7XAksyKKLeKp64zczx54x+I/a
	j4hxCe5z4840LB/cj2gC5zfUJhlbsP9UcWE5FFgzCzHnNVu25m2QiDBD9YifdMlw04s8GD
	MNCQUW+RmDPvBVTgnKlV6DVCvbIhPRCB+2Pg21DQ8Z/zvfvu2UQQRuN3w/i1gw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/30] mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad
 page program capability
In-Reply-To: <DJRJWAM9BCOB.2NBILEFO5EBTJ@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 16:16:50 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-8-87e5d3122244@bootlin.com>
	<DJRJWAM9BCOB.2NBILEFO5EBTJ@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 15:01:55 +0200
Message-ID: <87qzkvi3ek.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_060159_812760_61A9EB02 
X-CRM114-Status: UNSURE (   9.87  )
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

Cj4+IFRoZSBiZW5lZml0IGlzIG5vdCBtYXNzaXZlIEAyNU1IeiwgeWV0IGl0IGlzIGEgc3VwcG9y
dGVkIGZlYXR1cmUKPj4gb2YgdGhlIGNoaXAgd2hpY2ggaXMgYWxyZWFkeSBoYW5kbGVkIGJ5IGEg
ZmxhZywgc28gbGV0J3MgZW5hYmxlIGl0IGFuZAo+PiBlYXJuIHRoYXQgbGl0dGxlIDElIHdyaXRl
IHRocm91Z2hwdXQuCj4KPiBJZiB3ZSByZWFsbHkgZ28gdGhlIGRyb3AgYW55IHN1cHBvcnQgZm9y
IG5vbi1TRkRQIGZsYXNoZXMgYW5kIEknbQo+IHN0aWxsIG5vdCBzdXJlIGFib3V0IHRoYXQuIEkn
ZCBhcmd1ZSB0aGF0IHRoZSBlbnRyeSBzaG91bGQgaGF2ZSBiZWVuCj4gZHJvcHBlZCBlbnRpcmVs
eS4gQ2xlYW51cCB1cCB0aGUgdGhhdCB0YWJsZSBpbnN0ZWFkIG9mIGFkZGluZyBhCj4gZmVhdHVy
ZSB5b3UgYWxyZWFkeSBzYXkgaXNuJ3QgdGhhdCB1c2VmdWwsIG5vciBkbyBJIHRoaW5rIGlzIG9m
dGVuCj4gdXNlZCwgYXMgdGhlc2UgdGlueSBub3IgZmxhc2hlcyBhcmUgbW9zdGx5IHVzZWQgZm9y
IHJlYWQtb25seQo+IHN0b3JhZ2UgKG9yIGF0IGxlYXN0IG5vdCB3cml0aW5nIHRoYXQgbXVjaCku
CgpXZWxsLCBpdCdzIGFsd2F5cyBhIGxpdHRsZSBwbHVzLCBidXQgTGludXggaGFzIHRvIGJlIGdl
bmVyaWMgYW5kIHNpbmNlCndlIGFyZSBnb2luZyB0byB0YWtlIHRoZSBwYXRoIG9mIGtlZXAgc3Vw
cG9ydGluZyB0aGUgb2xkZXN0IGNoaXBzLCBJCndpbGwgZHJvcCB0aG9zZSBwYXRjaGVzIGFzIHdl
bGwuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
