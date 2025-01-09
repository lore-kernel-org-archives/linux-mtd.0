Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA32EE77197
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCst12CUCROFD6nugWxv3WIbk6GNBEkqIad6d1aAVMc=; b=idI1iZWepe1jRh
	hIHWu3D9dPc6oogD8SOrcwBg90BdonQp7Grhuw+I+lVuwH6kQLinjdPn47nOxCHTucWz7Hk5CHPtc
	Rfff+R2sbWVvofmuuIx6yJjzOXixg2Wc1gptc8360wUnYZLpK0y9W/usia+MJVmDe8yBzDV+D3W7J
	qWGxXn+Rw/0wY3/kaVlh/jGnb/1c61PDXB5/rW4/TI3b2xayGmZ/yeERHNaG0tjatyi1yLvJecx1Q
	x86y4Ii4DRRDCqMhTdoUeNDc5cBoOhj5u0NwvK90d9AxumtucluyyeuxeBz5cex/bAkOh6kF2iUs3
	KM0EXp1zE3WxVYFADyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvAi-0000000CdCA-1Sno;
	Thu, 09 Jan 2025 16:14:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvAf-0000000CdAU-1AzI
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 16:14:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20CBEC000A;
	Thu,  9 Jan 2025 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736439246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnt4UX2M6nzvjC+FTo0nNt82HePTxgIXL3fB0ZxpSVE=;
	b=PHKab5udr+JhXVrevTNJ5/J3+psBaYhSnnyXv1tmJFzCf2de2mlPIYNTFw15VRGyhccc7z
	uF13D9vMY/f3gJKbNDn+8uVzVaduYRkKxK18jVkU7XJZVMuFU083ZBMdABxWdrll46U9gg
	tmAqa4RbD+9MGueY6MZ6es/VxXlOH+cijJTjE3DbuKedrNvNhzElf0iQdcOKn6NDC2hRK3
	9AKLf5TqgtE52wBmETNbMADl0SmexlCclRkdfyvbOy731mCwS5l5dC0eJe4ezm/37RCUCL
	DEg82p7UZJh9X59b1LekuHtpsPMvWk069yKz/PbCgLiJMeSwPPVMRLWOU2q1MA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <mafs0zfkk7pfm.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	24 Dec 2024 21:15:41 +0000")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 17:14:03 +0100
Message-ID: <87ed1carsk.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081409_446256_14946134 
X-CRM114-Status: UNSURE (   8.06  )
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

SGVsbG8gUHJhdHl1c2gsCgo+PiArCX0sIHsKPj4gKwkJLmlkID0gU05PUl9JRCgweGVmLCAweDQw
LCAweDIxKSwKPj4gKwkJLm5hbWUgPSAidzI1cTAxanYiLAo+Cj4gV2Ugbm8gbG9uZ2VyIHNldCB0
aGUgbmFtZSBmb3IgbmV3IGZsYXNoIGVudHJpZXMuIEJ1dCBrbm93aW5nIHRoZSBmbGFzaAo+IG5h
bWUgZm9yIGFuIGVudHJ5IGlzIHN0aWxsIHVzZWZ1bCwgc28gbWFrZSB0aGlzIGEgY29tbWVudCBv
biB0b3Agb2YgdGhlCj4gZW50cnkuCgpJIGp1c3QgY29ubmVjdGVkIHRoZSBkb3RzIGFuZCB1bmRl
cnN0b29kIHlvdXIgcmVxdWVzdC4gSSB3aWxsIHJlc3BpbiBhCnNlcmllcyB3aWxsIGFsbCB5b3Vy
IGNvbW1lbnRzIGFkZHJlc3NlZC4gVGhhbmtzIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
