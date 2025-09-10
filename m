Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4835CA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pk3NXKP0RC9YlEFxlu41bF5jtY+tUyBaw+hU2Uk1gD8=; b=hunIMdefDbFYQU
	Q5u1gbUbtm/byaO2SQCHRM9yP2KEFDJRcLO5Iw3pmAbM1ShOGxVfLShiCqDm99QBql19GOskVmutf
	+A0/JxEj2Yc4KEoV6CvVsSru0+KxumHNUAmI4RR87nsJ3F6wRa/2nlBXGGpGxgkjxkUjnxNs7ztmY
	L2TzzwbLg+C85cvuXwH5C6KC02ptXImDpc0UwnDilf9APi9/GIWNx9dzsYm+AyRKrlt4v3VRrY+Dh
	WfJLl+Dbor/GShvZozNx51jmTM5WadwSoc9HPONCTDQ5rJsanPc823NcN5N1gbEAKRgIXtrQ20sU5
	1t/Ri3A0Ch6H8Qpqf2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGcI-0000000D4We-3QMt;
	Wed, 10 Sep 2025 08:55:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGcF-0000000D4UP-3miY
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 08:55:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9F667C6B3AC;
	Wed, 10 Sep 2025 08:55:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 561B7606D4;
	Wed, 10 Sep 2025 08:55:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 493A8102F28B2;
	Wed, 10 Sep 2025 10:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757494539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xa9auGg8cwqhPNG0DFih02jn1l20IbvqO550FrgoUcU=;
	b=naov1dQzy5RX8zG17asjtec42pCCqEJSVEwtsIoyuSWmnS/CkepAtfPQR80S6a5tmqfXJP
	doOWqlr3m2PvJHGcALeZI2rXQGYBaYyf4SRnpPYFhHdDirDtnc/3ANrpoJtMYZcsEbk7qn
	MS9PGc+bD9HHMgEFMXUNL2Qa5kYUTrG7LRgbRxBYksPAR0ODNv1JOd/2BIrycZtH3JvdgK
	1ydED6axMydA4qf4cH/Lic8I8rsxOV44Rm6SUiSpbg2E0tBnNImoBz3QsF8pIk6KEo6di5
	s9F2SaCfrxzuTQm4+6ywJb7ZPcz/6spumNInJM+yRS8eIejLSq3UPWBqcohn5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,  Huacai Chen
 <chenhuacai@loongson.cn>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Keguang Zhang <keguang.zhang@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Huacai Chen
 <chenhuacai@kernel.org>,  Xuerui Wang <kernel@xen0n.name>,
  loongarch@lists.linux.dev,  devicetree@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 1/7] mtd: rawnand: loongson1: Rename the prefix from
 ls1x to loongson
In-Reply-To: <87bjnielsa.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 10
	Sep 2025 10:47:49 +0200")
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
	<8c804abb75277f0ff389151c1cd58c94f2b258ca.1756991031.git.zhoubinbin@loongson.cn>
	<87bjnielsa.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 10:55:36 +0200
Message-ID: <87348uelfb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_015548_138449_E58F3DC3 
X-CRM114-Status: UNSURE (   8.68  )
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

T24gMTAvMDkvMjAyNSBhdCAxMDo0Nzo0OSArMDIsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBCaW5iaW4sCj4KPiBPbiAwNC8wOS8yMDI1IGF0
IDIxOjA2OjMzICswOCwgQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+IHdyb3Rl
Ogo+Cj4+IEkgYW0gZ29pbmcgdG8gaW50cm9kdWNlIHRoZSBOQU5EIGNvbnRyb2xsZXJzIG9mIHRo
ZSBMb29uZ3Nvbi0ySyBzZXJpZXMKPgo+IFBsZWFzZSBhZG9wdCBhIG1vcmUgZ2xvYmFsIHBocmFz
aW5nLCBsaWtlICJJbiBvcmRlciB0byBpbnRyb2R1Y2UiIHJhdGhlcgo+IHRoYW4gdGhlIGZpcnN0
IHNpbmd1bGFyIHBlcnNvbi4KClRoaXMgd2lsbCBiZSBhIGhpbnQgZm9yIG5leHQgc3VibWlzc2lv
biwgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBsb29rcwpnb29kLCBzbyBJJ20gdGFraW5nIGl0IGFu
eXdheSwgbm8gbmVlZCB0byByZXN1Ym1pdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
