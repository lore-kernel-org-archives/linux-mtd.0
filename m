Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA63FCF3966
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 17:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcT6EOhHtYL5oiwPAonq5khua4nyWkv5W6AKZveMjSo=; b=Vh6zj5bY31bPCX
	PWUjjg3p+gb6b3T/48lusg0mWs2AxmpvgKhiAV3KMoCjtjliniH0CO892ry47U6VFik4q3SApa21a
	8i60xc+7h8HclQzKJ4oeNXZnApYJDUJAwy5jr61qeep4R7hZx8wKjO70bO3RxOup7Mi8eLunis7Tn
	lo4vZLLu+lA4xpKzZFlZQ/ICn8Z7525EzS+iE6EUWUGEilNdoVeX7kUaDBlgrV/rk2DX2BW9Y/Vz8
	YrCDL2SsgVZZsmPogxBeGDNO6sexbW//9rYns3z48BBLyx8OiIuqD39Ga6cf4zygtJKWXJz1l4ZmH
	un2hhrU2dd9H8FPjmSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLluA-000000043RN-2BNY;
	Wed, 19 Nov 2025 17:23:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlu7-000000043Nr-0kgb
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 17:23:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F184DC1118E;
	Wed, 19 Nov 2025 17:23:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32F4860699;
	Wed, 19 Nov 2025 17:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0634010371739;
	Wed, 19 Nov 2025 18:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763573016; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ap5JC1XuMG5qWhNHsUmg784wgr5oepd+e+ozuOEXcvo=;
	b=P4ptOHLo9QWH2oNTPhAJNyhbw7BX+0d/Qm6C27Ot5p9YdjAAMnku2ICzPEINmJw0WnH6sR
	4IOC6+9cFx5iZe3IZx0v7VhBUCYWADYSSNt6lZ6e9yNF/60oE6jHQRBp+lAamKb+8k9Lfj
	sijXUkA1H8EdJ4JNVnRhO58HZlVqXnPDehDxA9HxdNwr3sXi/YxSwazAuZC1AXVUtCRIlj
	xpFuOrE4n9bixVNsMAXP8JmrlNTOuEeO0Jp71Pj+myeoA7bg/5Tvui3aKhhDG8UaokDmhC
	f/qsxHeXSeqZlbVlpNgv8XpyDpOUUanT/r0ePfOueOJ2XpHSuCVmdHxALgGnIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K <s-k6@ti.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/28] mtd: spinand: Make use of the operation templates
 through SPINAND_OP()
In-Reply-To: <5680a2a8-aeb3-4274-a264-4ff658cc9246@linaro.org> (Tudor
	Ambarus's message of "Wed, 5 Nov 2025 17:28:29 +0100")
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
	<20251031-winbond-v6-17-rc1-oddr-v1-10-be42de23ebf1@bootlin.com>
	<5680a2a8-aeb3-4274-a264-4ff658cc9246@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 18:23:33 +0100
Message-ID: <87jyzmaqcq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_092339_389161_5B55B007 
X-CRM114-Status: UNSURE (   9.35  )
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

T24gMDUvMTEvMjAyNSBhdCAxNzoyODoyOSArMDEsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDEwLzMxLzI1IDY6MjYgUE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4+IGluZGV4IDRhZmViYWY1ZjAxOTViOWJjNjE3ZWExZjEyNWY2MzdmNzZmZmY5
ZjguLmE4ZmQwNGE2N2NmYTk5MjViZDY4YzU3NTM5ZDg2ZTA4MTZiNzYyNzQgMTAwNjQ0Cj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L210
ZC9zcGluYW5kLmgKPj4gQEAgLTcwMSw2ICs3MDEsOTMgQEAgc3RydWN0IHNwaW5hbmRfZGV2aWNl
IHsKPj4gIAkJCSAgICAgdW5zaWduZWQgaW50IHJldHJ5X21vZGUpOwo+PiAgfTsKPj4gIAo+PiAr
c3RhdGljIGlubGluZSBzdHJ1Y3Qgc3BpX21lbV9vcAo+Cj4gRG8gd2Ugc3RpbGwgZG8gaW5saW5l
cz8KCkRlZmluaW5nIGZ1bmN0aW9ucyBpbiBoZWFkZXJzIGxpa2UgdGhhdCwgSSB0aGluayB5ZXM/
IChzdGF0aWMgaW5saW5lLApub3QganVzdCBpbmxpbmUpLiBUaGUgZnVsbCBsaW5lIGlzIHNvbWV0
aGluZyBsaWtlOgoKK3N0YXRpYyBpbmxpbmUgc3RydWN0IHNwaV9tZW1fb3AKK3NwaW5hbmRfZmls
bF9yZXNldF9vcChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCit7CgpTbyBpdCdzIG5v
dCBhbiBpbmxpbmUgZGVjbGFyYXRpb24gb2YgYSB2YXJpYWJsZSwgYnV0IHRoZSBkZWZpbml0aW9u
IG9mIGEKZnVuY3Rpb24gKGp1c3Qgc2F5aW5nLCBpbiBjYXNlIHRoZSBkaWZmIG1pc2xlYWQgeW91
KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
