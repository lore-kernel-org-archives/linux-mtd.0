Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045E6CD6E7C
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwyOSQcVerzCc5EehlEemH35rGnXUtj+wLQcQinzG3o=; b=FRi7SHAOUBiZnx
	7UC3GhyYun5r4GJAJpI2JbBifzrZeUanDnS5Uk4KWAHpBsxwXfIQahQUpE8al/CGQNNou2m3BY/58
	6XCYp54Fevl7VYFFrZNoE0pCy76JCTxsTMA3OyIVH3QEr1g92AssWwF1bUgTPG0OJV0NhWt07+ZzG
	Se5/FChK7tumLeidK3NmaJt7Iib+vmjcDZK+4BUVI1yk25BJwI15TwEW3Dy1a2y0sf11l5wWL7KNw
	2nwyhqvp4WeMMej5i/kFaq/ZkETEUe0kQMs80t18DV1vS+qcRT3vHz3mRc/ufCAt7pw8RN7PwfWU6
	Z3sGOn8a4HGtS+g0+UXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXpG-00000000wUr-0I9L;
	Fri, 05 Jun 2026 16:55:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXpC-00000000wUV-3iNu
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 16:55:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7042C1A0929;
	Fri,  5 Jun 2026 16:55:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 395A95FED1;
	Fri,  5 Jun 2026 16:55:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3DDD106A24CC;
	Fri,  5 Jun 2026 18:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780678510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VQDg/ysUOsAcr851JW4UFD0Y9MDkfUj1C77vlusmwlk=;
	b=yrLBi1mi2rwe8UgnCWTg14FCs8780F9FMaLXfP1zYXCjMQ1NBsVuti5VsF9mon/aK7Bd/g
	GmhlElgErRw82XIOuuXDgIbVgIZav5GeLscixodanfzGxczQnvdQhdo68Tfwd1ckascxyP
	J0i2aZH0XqeFV4lWm8d8KUX2LxJAFHDLOMO+6RemMeTL8NUw23tSbq6OrmJdtPmZFlo3+Y
	Uvs3jkatYJNBCG2IULrVCTlHgYiSxMJqolyeA/pJfmJFBmYOLhRvAC+n+b9yJSivwSpqKY
	S2EpGjrH6VkdJVl7GpBlCLrYAVFCRxs41fndMK6MOTznIelYrcUDz50SztR4OQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,  Santhosh Kumar K
 <s-k6@ti.com>,  broonie@kernel.org,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  richard@nod.at,  vigneshr@ti.com,
  pratyush@kernel.org,  mwalle@kernel.org,  takahiro.kuwano@infineon.com,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  praneeth@ti.com,  u-kumar1@ti.com,  a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <20260605-cane-duct-a5c740fae417@spud> (Conor Dooley's message of
	"Fri, 5 Jun 2026 16:20:59 +0100")
References: <20260602-aptly-bunkbed-1bd3a8d63d54@spud>
	<875x3zzkji.fsf@bootlin.com> <20260603-neatly-twine-e89b923f5cb6@spud>
	<87o6hry4d4.fsf@bootlin.com>
	<20260603-balance-encounter-94f69e1577f3@spud>
	<87ik7yydyv.fsf@bootlin.com>
	<20260604-shrunk-acclaim-25368d7ad63e@spud>
	<87a4t9wl7r.fsf@bootlin.com>
	<20260605-regulate-crawling-253c6d6bd971@wendy>
	<87tsrh4fe2.fsf@bootlin.com> <20260605-cane-duct-a5c740fae417@spud>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 05 Jun 2026 18:55:04 +0200
Message-ID: <87o6hp3p1z.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_095515_081721_AFCFFD3B 
X-CRM114-Status: UNSURE (   5.51  )
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

Cj4+ID4gSSBhbS93YXMgdHJ5aW5nIHRvIGNvbWUgdXAgd2l0aCBhIHNjZW5hcmlvIHRoYXQgd291
bGQganVzdGlmeSB0aGUgcGF0Y2gKPj4gPiBtYW4sIHN0b3AgdHJ5aW5nIHRvIGludGVycHJldCBp
dCBhcyB3aGF0IEkgd2FudCBkb25lLgo+PiAKPj4gQWggOi0pIFNvcnJ5IHRoZSBpbnRlbnRpb24g
d2FzIHVuY2xlYXIgdG8gbWUuIFNvIHdoYXQgaXMgeW91ciBwcmVmZXJyZWQKPj4gdGFrZSBpbiB0
aGUgZW5kPwo+Cj4gSSB0aGluayB0aGUgZ2VuZXJpYyBkZWRpY2F0ZWQgcHJvcGVydHkgbWFrZXMg
dGhlIG1vc3Qgc2Vuc2UgdG8gbWUuCgpPaywgbGV0J3MgZ28gZm9yIGl0IHRoZW4uIFRoYW5rcyBm
b3IgdGhlIGZlZWRiYWNrIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
