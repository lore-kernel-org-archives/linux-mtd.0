Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D123DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPy5VhTVrzD36nukPRcjeaekwQHaCwAWi1HU8y+vLIA=; b=X3JsA/zjDsvI47
	lPiFI6ZTOdYczAxRHp5gdZVxq2UYwmc3gvTUpwjqezKvwxifBXGh+Cgqiz8NOLVql8MPIOseC3lka
	HiJostc7I+/0KlUjAumr7KT1LSit+aF2htZ0fdDWbEIJuofL4DHWpPxXRGj+zowHJvozM2jReRpgZ
	WxR9ko754aLPcUEMU9TCtwVhiAYHVTBDk5BJ8+GrYBL2yxU5plknqhGVD6tM6s87glDPrTUVLBgN5
	V85b22o3SXeiwWa9ccrCYLmrTM3h9JQr8X2Jrs6IZvd3HQXPstIL55mY/0ROfgQJfwFqKMhXqITVx
	Bb10jtlpVFTcTJNZBkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitRF-008f1H-GO; Mon, 25 Apr 2022 07:47:17 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitRB-008ezX-V2
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 07:47:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F2C260009;
 Mon, 25 Apr 2022 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650872826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yol92uYBYu5c5ADYJPECESSMs16zXfz4k/koZ3ocm6Q=;
 b=Yy92DEql1uyL2BDtVEAjk3oki/kgZ5bfq1+ArgerhnCsoEI4LZyM5ZFKh/Ad2IHa2GgB6l
 6OZV0n3axgIyzwnstDvkXR/KKWFEbfq8YHWYk0b6Y+kBxXxuTq78H28itMzc2tyl/+yzI4
 Cxreoe7wAsDSnafjnfAP7t0/AICcnhTdnwqLjG+inw8KDYmSQ9RJj27EWuktLS7s0wHGvd
 66qUZQ27C0dXCxE5vI7quCTz7v1NhdRTTvbAW0Ak4i6+2Z87FOCVLeTtg3N7WmkvKg+oMl
 p7Ylte63OCQ+jK1r6FvXa+lWqZhvYztfe5/K3gLW/X9DwAP+knCzMwrFon7tbg==
Date: Mon, 25 Apr 2022 09:47:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop empty and unreferenced binding .txt
 files
Message-ID: <20220425094702.5cdf4f2b@xps13>
In-Reply-To: <20220422191958.2589318-1-robh@kernel.org>
References: <20220422191958.2589318-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_004714_410671_012D6976 
X-CRM114-Status: UNSURE (   7.70  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMjIgQXByIDIwMjIgMTQ6MTk6
NTcgLTA1MDA6Cgo+IERyb3AgYSBjb3VwbGUgb2Ygb2xkLCBlbXB0eSAudHh0IGJpbmRpbmcgZmls
ZXMgd2hpY2ggYXJlIG5vIGxvbmdlcgo+IHJlZmVyZW5jZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCkZvciB0aGUgTVREIGZpbGU6CgpBY2tlZC1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
