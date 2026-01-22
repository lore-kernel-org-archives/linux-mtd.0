Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAE7D3EE6A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbLc5+MDiqyehoDLVe8saQANRR4F5NeUPZJQ10+pnmY=; b=L0B3NTXlo1dtzd
	pfpfzU5iN2FFXBuR4MFpnOhLWwgNcSRXQIUMv6tOMAuNQjyZ2zLa/r9ezgTuXp3ygYYYXQfNOQwoO
	gkBWXwfKVHPPnq9Bsnn8xfQvuHWfKessN3CelmvjeLk9i2xw8q4AeB4jLJK1EvilUxaz3bxRdv+Yi
	5z3vBhhGwgGRZqNILRKOb6k+OBORgHHTG03Pb4hE1cx77hS++yuzNIifM+g0dYotn5MdVKMNZP7jH
	Xx7CaUkthqo+QLOdnXNWy43xOI/aq1jV0SedOHtfMvsOoQx1p0oS9T1JxaojaDu5mMAuw6Z7p4LZP
	LPaRIyjZF/D3Da+eM0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivRK-00000007DCd-3UcX;
	Thu, 22 Jan 2026 14:13:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivRJ-00000007DCL-0pHR
	for linux-mtd@bombadil.infradead.org;
	Thu, 22 Jan 2026 14:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QOdEk8tMzp73TF6qEswsTx99HzaW/mTz9VPQktmQcWM=; b=TkcvEASh42eauKEut1FAOmLT1Y
	IqY5Iy7xhruDAoD+zKQz50zJC+ijjW8Ff/PK8lj5JrGcFvKCwqvRRV5yYadXxg+1Z+Xhw7UK+Le6W
	JwKenUd9UEhDRJh6QJjRgFGxOkozBuPnj8GbhjZbSZNXWFGdsIOqpAJBfAI7/HJnjRnEyIJcw/55g
	teT/L8pdqk/KFvTBt5YCvmf2GqlTixWPYBjvgnZ7tF6Sh1QrttzNH8AAo3bKVCJqZw5GqzgG3ERJM
	sxdM2ObJAR8NmX+t15Zfdz6Pg/SyEOcdSmyh9GLLcf1CaaVfo40xzVfmaMleZZgg8D0vCzTMrTFy8
	O68xjMaw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivRD-00000000V2S-2Xe6
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 14:13:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DE854C21AA4;
	Thu, 22 Jan 2026 14:07:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D66E606B6;
	Thu, 22 Jan 2026 14:07:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD990119B8245;
	Thu, 22 Jan 2026 15:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769090827; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QOdEk8tMzp73TF6qEswsTx99HzaW/mTz9VPQktmQcWM=;
	b=o34Ja+Av+3EcsQVJ3lNUiluGS2aovyw6u0Dw3oAnlWp3sNJAMce6ZeLDwOfF5hdR99WCms
	3MqWYJhIPHdTNiIwarhzmNrAbq0MZhvhkkVIXiS+VlHl2kMlolt4cmHJXuOTI7nZZQOZXU
	T+ytfJ8MXMo91pIfXPUWLpUDzK7BNk1Wlymoe5lTbAHFdcHVR/SoPMofGWiAd/E9L0VozX
	Mm2RPEK/kyHOdtlwMYTwrENxrLfKcup2ecTrG8DMYY5ZXADvC5WKm9o8qrE3ZEaYRb06ci
	rxisn8AbBFrWnChCqX4PFsREay4K7C0HCsngG/Kfxjes0XMy9QOYK5GJFFVtGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Richard Genoud <richard.genoud@bootlin.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] mtd: rawnand: sunxi: Convert to common
 field_{get,prep}() helpers
In-Reply-To: <c5e1377b7a9b5cd6f08296ada5520e19951fe002.1768487070.git.geert+renesas@glider.be>
	(Geert Uytterhoeven's message of "Thu, 15 Jan 2026 15:26:22 +0100")
References: <c5e1377b7a9b5cd6f08296ada5520e19951fe002.1768487070.git.geert+renesas@glider.be>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 22 Jan 2026 15:07:04 +0100
Message-ID: <87fr7xpwqf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_141331_944056_C2E51C5B 
X-CRM114-Status: UNSURE (   7.45  )
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

SGkgR2VlcnQsCgpPbiAxNS8wMS8yMDI2IGF0IDE1OjI2OjIyICswMSwgR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6Cgo+IERyb3AgdGhlIGRyaXZlci1z
cGVjaWZpYyBmaWVsZF9nZXQoKSBhbmQgZmllbGRfcHJlcCgpIG1hY3JvcywgaW4gZmF2b3IKPiBv
ZiB0aGUgZ2xvYmFsbHkgYXZhaWxhYmxlIHZhcmlhbnRzIGZyb20gPGxpbnV4L2JpdGZpZWxkLmg+
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4KPiBBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KCkkgdGhpbmsgYjQgZGlkbid0IGNhdGNoIHVwIHRoYXQgSSBhcHBsaWVkIHRoaXMgcGF0
Y2ggKGluIHRoZSB3cm9uZwpicmFuY2gsIHRoZW4gbW92ZWQgaXQgbWFudWFsbHkpLCBzbyBpbiBj
YXNlIEkgaW5kZWVkIGRpZCBub3Qgc2VuZCBhCmZvcm1hbCAiYXBwbGllZCB0byB0aGUgTVREIHRy
ZWUiIHlldCwgaGVyZSBpdCBpcyA6LSkKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
