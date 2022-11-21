Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C95C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRrBarJwE+nNIjFJddagEbIKnADI1se0GzE0EWmsbqs=; b=x+d/moir7plq8w
	uASJ1X53WsygZYCgvT0pxQPtDUOBfz6Grj9fJCKmzb7mrHAkQyy+D1EJhxr9XrTDHJkzrQw51Y7My
	nylR7ft2bzL0kL/dLf4UvOfaTeVI3FhPw0sAsOCpBdKKSDQhcAkZz9W2D0A7Y+WywceZtekJQt26J
	X0V1Sr1MIS25KVnDP0mKXavItp9EgxvzOQVr6LIshanXLtrW/UR7YHyWYsEFhjq/3zZHe+WiOwo84
	H4LtbmTDske+NaY7cSsMtL90RTJMIrclnsmP8TU1BxMLmdAib6C4gxeNHEaQRgVuqZT5M0mCHuDdV
	nE4f8dqwe/qACoLRHHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7Fv-00E8SK-0E; Mon, 21 Nov 2022 13:54:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7Fo-00E8RO-UC
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 13:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669038874; x=1700574874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=61pbH5JHMe/ZX6fjwi4xYBFiQ9bqofl3472cjyN55V4=;
  b=wBejcdjv3Gjm+4hzLXvdhWc4m0OYdlbdLb0aMQwvEPeXU9mXyFva+YvO
   uqH5/wYis1rFlVwsjDVetTkRh6Bmze/AtbszdPocUSshcZEQBW8Hvc3QV
   5mHPOFbj80X3DJoTuchzLvjefXrhqVFeip3mOBU9zUfQAxDTWzimv9NPe
   w5rh1H13Q1AKzUkKxyTScdCS9jk2BoA4AMCc6gT5fQQ9WW/Wb4BMkqPCL
   4uGTzGRDfDXbZm8rXmZr4vnOV+Xp2sCqqtqmU0KwY6eIqq6K0dXKiIkYQ
   daSOpW1uLZafdjpIRV4lOK5Blsj4IzPDFfTIRUqjvuok4prhAvUTRTTpC
   A==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="184485482"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 06:54:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 06:54:27 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 06:54:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <j.neuschaefer@gmx.net>, <linux-kernel@vger.kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
	<linux-mtd@lists.infradead.org>, <vigneshr@ti.com>, <pratyush@kernel.org>,
	<richard@nod.at>, <miquel.raynal@bootlin.com>, <michael@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: Fix formatting in spi_nor_read_raw() kerneldoc comment
Date: Mon, 21 Nov 2022 15:54:24 +0200
Message-ID: <166903885771.86637.15775253700273937900.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101162906.990125-1-j.neuschaefer@gmx.net>
References: <20221101162906.990125-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_055433_049149_59640FBE 
X-CRM114-Status: UNSURE (   5.88  )
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

T24gVHVlLCAxIE5vdiAyMDIyIDE3OjI5OjA2ICswMTAwLCBKb25hdGhhbiBOZXVzY2jDpGZlciB3
cm90ZToKPiBJdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gcHV0ICJzZXQiIG9uIGl0cyBvd24gbGlu
ZSBsaWtlIHRoYXQuCj4gCj4gCgpBcHBsaWVkIHRvIHNwaS1ub3IvbmV4dCwgdGhhbmtzIQoKWzEv
MV0gbXRkOiBzcGktbm9yOiBGaXggZm9ybWF0dGluZyBpbiBzcGlfbm9yX3JlYWRfcmF3KCkga2Vy
bmVsZG9jIGNvbW1lbnQKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9tdGQvYy8yNzA0NTBh
MWI2ZDgKCkJlc3QgcmVnYXJkcywKLS0gClR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWlj
cm9jaGlwLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
