Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF51AC44507
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 17:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4WJuKycfbbveUXiMsZN7L8mwR7zm/yJAzdZEcq+PyU=; b=TeDs6gnJKxfvUf
	2hGTyLl+xtUKtNm8IAe76zeP7hIzMbckB2EzWIWh8RS9isppENTzmYzd2bnYcA9gcKiEbTYgqQ4rT
	jqvQ5iMTFFt1tRpa+/4p3qS6Jo6oeLOKnwgVBbZEv1fXxRlwHT9NMW7YTe0QK6UwiLCmRfTZjfDFC
	Gve+ylmGN+cRFPFdaQ2bogA425ElA+8Qn6/YiHRP8Pl9EHhlaae3PnbatMivvpjkh4xKU6os2617g
	l/s5SEV2BMRbLTLKEy9bOdvMQNfPGtgOa9QmucFNpjwubyIevYRqGYyqFFjHolVFLAtZjcYd/VL9Q
	BqIM5Ai205ron7DPkbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK3r-0000000A3Ls-29QL;
	Mon, 13 Jul 2026 17:03:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK3o-0000000A3Jx-27dD
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 17:03:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F7C24E40D91;
	Mon, 13 Jul 2026 17:03:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4506F60345;
	Mon, 13 Jul 2026 17:03:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E486611BD3A78;
	Mon, 13 Jul 2026 19:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783962190; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9wlhgsYFVANXrsGvOVk1u9rJqFRS9TBMyUf0j+PmU7g=;
	b=WLT19dGn+cJ1Dzz6CQFTzyLAjIxLnhZTgLz+fx4GVHml6BKaoTs4zVApWN6wo4V3WZc85Z
	vYOkkYCAKZj2RnttPRYJH+OmESurFg7IOFl02rf0qKTF09ccv9Z+wvyypwOcoMwPSe59E8
	Uk9v7Gx9K6lMifmPn2dcUL0w1gf/maEa+q7awGBgIaXgEEbV9DfuAs3YEcx05SVLWrP4cY
	cy8zRMpGUrOAFlLRu4rsKMyxjJ2OZjB4od6pNWOboDUda5d0AFFzL353NBcsF24Aqf6fHf
	hrI5nI8ZgoceyqRCYMo5czob5qGiIHlLiI5cUBu/o98b+QSrco18SBfFQ1/77A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Liviu Dudau
 <liviu.dudau@arm.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] mtd: afs: validate v2 image info bounds
In-Reply-To: <CAD++jL=APPmdAg1y6igZ5qxihUAMkjvRUZ26gmCBGdoA-N5edg@mail.gmail.com>
	(Linus Walleij's message of "Thu, 9 Jul 2026 23:48:11 +0200")
References: <20260708014906.1463-1-pengpeng@iscas.ac.cn>
	<CAD++jL=APPmdAg1y6igZ5qxihUAMkjvRUZ26gmCBGdoA-N5edg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 13 Jul 2026 19:03:07 +0200
Message-ID: <87bjcag6us.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_100316_688719_C72CE2A9 
X-CRM114-Status: UNSURE (   7.46  )
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

SGkgTGludXMsCgo+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIHN0YWJsZSBtYXRlcmlhbC4gTm8t
b25lIGlzIHJ1bm5pbmcgaW50byBhbnkKPiByZWdyZXNzaW9ucywgSSB0aGluayB0aGlzIHdhcyBk
aXNjb3ZlcmVkIGJ5IGNvZGUgYW5hbHlzaXMgYW5kCj4gaXMgbW9zdGx5IHRoZW9yZXRpY2FsIHBy
b2JsZW1zLgoKVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgYW5hbHlzaXMsIEkgYWxzbyBmZWVsIGxp
a2UgbWFueSBvZiB0aGVzZSBwYXRjaGVzCmRvIG5vdCBmaXggYWN0dWFsIHJlZ3Jlc3Npb24sIGJ1
dCBJIGFtIGluY2xpbmVkIHRvIHRha2UgdGhlbSBhcyBsb25nIGFzCnRoZXkgZG8gbm90IGRhcmtl
biB0b28gbXVjaCB0aGUgY29kZS4gSW4gdGhpcyBjYXNlLCBleGNlcHQgdGhlIHZlcnkgbGFzdApj
aGFuZ2UsIEkgYW0gaGVzaXRhdGluZy4KClNoYWxsIFBlbmdlbmcgZXh0cmFjdCB0aGUgbGFzdCBi
aXQgKHdoaWNoIGlzIHVzZWZ1bCkgYW5kIGRyb3AgdGhlIHJlc3Q/CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
