Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD6CCF2DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sc22DlsrP+P2EBrAtpFcG1h2t0xxTzxjP6cxmzHhusU=; b=pGRrIJ1ADe62aq
	PsSHAy64ISyOPHQ+uE6EQonzzZf+N+P5GSRN5pcaUl16aFDVtzy82ymhk7xQaHIgczX2WZHa4RaaK
	O/k08wrYO4CcTwGVMisH1f2LnlqWGHYAEThKVTk9Z/mTBvG0hWA1zy5whYBC/If+fTnezDdLTsvJC
	ECBCq6uJzB3ZzqcwzQch2Uj54Bh59QvBB4nomdAPA4K+N0WFW3db02t42LZCd83q/aLCx9uNl3pGC
	ulXePPCzPxESUHlVSjZOffVqQV9poc72f7Du8WfEZXrgzN+zwQg1rVCAH2m3SR0JiwaRujbWYjLgl
	UoTL7/QMXryzs5wdKTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmPU-00000001lHN-1trU;
	Mon, 19 Jan 2026 10:23:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmPP-00000001lGi-1zEq
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:22:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD6AE1A2941;
	Mon, 19 Jan 2026 10:22:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B004E60731;
	Mon, 19 Jan 2026 10:22:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63CA910B6AE4D;
	Mon, 19 Jan 2026 11:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768818173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uEDoUoozLjfjt5t9KOCLyNTAT0rrA6448282ApOfd0Y=;
	b=1A1btftql7gevm6uwERTmgJrkW/fDX+Wt8OoSx63UtpQke2oXfVu3ETn79bkRtoMK5s06M
	TgtFIkqJNRPObt/cWub3V7aKyAylV59Mv86gtTEpB0DRPuXZ19EZozy35w7jxHi/YI5Ey2
	coQxyoQHRpbqTlSLqlW7WMGpq4g54bpkSslO2r/PB1/GsP/2g32hZsj9cfEla7SgPja+F+
	V1e/z8f79pqO0YCPCwzvFzQjWyECiqbhLlpqrenJ41vCONPi5T8MsJ0UE9W4aEJb2ZK6ms
	md5+nj76RbqORiaWSFJ8NMMgW2ESh3j9/q4qybqzXQJbkbXIs1rqyEFSDFb70Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Angus Clark <angus.clark@st.com>, 
 Akhila YS <akhilayalmati@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260106-st-fsm-v2-1-7e0a2e18127a@gmail.com>
References: <20260106-st-fsm-v2-1-7e0a2e18127a@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mtd: st,spi-fsm: convert to DT schema
Message-Id: <176881817026.2448784.8568722678066926802.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:22:50 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_022255_640869_A3E9074B 
X-CRM114-Status: UNSURE (   5.90  )
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

T24gVHVlLCAwNiBKYW4gMjAyNiAxNToyNTo0MyArMDAwMCwgQWtoaWxhIFlTIHdyb3RlOgo+IENv
bnZlcnQgU1RNaWNyb2VsZWN0cm9uaWNzIFNQSSBGU00gU2VyaWFsIE5PUiBGbGFzaCBDb250cm9s
bGVyIGJpbmRpbmcKPiB0byBEVCBTY2hlbWEuCj4gCj4gCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0
aGFua3MhCgpbMS8xXSBkdC1iaW5kaW5nczogbXRkOiBzdCxzcGktZnNtOiBjb252ZXJ0IHRvIERU
IHNjaGVtYQogICAgICBjb21taXQ6IDkwNTQxMjcwOTY3ODM3Yzk5NjYzMWZhYTk0ZTQzZDQ2NWUy
YTIwYzcKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5k
IHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21w
bGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
