Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6078C25B74
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNmDvod9sLbCRYrYLQSttcr4RE/R3MM+x0IM7IhuHyo=; b=zOUYEaWtyMZw0n
	DSaaRqBhoXF/CIxzPcbJAfZ/YkX47gM1oAz+QYRXeEozfKksO3TyOtHCeMIx5iWqDxboQB3VHLjvC
	eDLuup5XkJ4Xk+5jAR9RJFjUb2VE26KJiC9zXeTS5OCZ+DswxuShkXkIOZENliaxVX9rWadfdmxhA
	2v9XtuLo0BpsiLZpv6COI5uhatOGY51LM0FczFc1kla7b7KZY88C01hEM7Z7LFkfA/BvQ7Askup6V
	OB/L1Io9/nSGsD2iqU9Od5CcdAjQ8a9O8Ee9NSNmXjkJnTi2mWiHSr3IrTfrARt5meIlgcbATzwZo
	42HnG08UDYX/tIpQ0UHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Lcz-0000000GsAB-1yJu;
	Tue, 21 May 2024 09:17:49 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Lcs-0000000Gs7r-2GXK;
	Tue, 21 May 2024 09:17:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CE276000A;
	Tue, 21 May 2024 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716283056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IOfFdRjlnQNXbjs952mPqz0TKEhiPYLyL4JdcQuyDd4=;
	b=PKHnP1N0ne4gLK/u0UUoxvvrwaceXoY/Y1wVqI1fY6d2DfGcSDDjScgD7mBCBcIJ85sJou
	3dRJPRpdUppW+rFUHrzvuU7AVaJgtWIdKtNvuMaAU8NgxdiklOUns6yRHzimfQ7HHBoGbG
	S62NB7srQB8oELp3Yt+Nq0IqRStDUZAucx4IFwefZxcWe6noZeXdNjFWc73NMpbBXlqrG+
	bywiv3Q9wvMBmnpAasdB38ZvCvEJdoJ48PFAA+EJRniqEneJoR+wFnhbgoXIesDm/3bCqQ
	f8NfYl5bvhSfp9XTXeE3GEYU7W7/C4Mzfr6R7NyfpWeqT2pPCoRXCtAzWr0Z+A==
Date: Tue, 21 May 2024 11:17:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Han Xu
 <han.xu@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/6] mtd: rawnand: gpmi: add 'support_edo_timing' in
 gpmi_devdata
Message-ID: <20240521111734.6002db7a@xps-13>
In-Reply-To: <20240520-gpmi_nand-v2-3-e3017e4c9da5@nxp.com>
References: <20240520-gpmi_nand-v2-0-e3017e4c9da5@nxp.com>
	<20240520-gpmi_nand-v2-3-e3017e4c9da5@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_021742_870574_F570B26A 
X-CRM114-Status: UNSURE (   7.82  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMjAgTWF5IDIwMjQgMTI6
MDk6MTQgLTA0MDA6Cgo+IEludHJvZHVjZSBhIGJvb2xlYW4gZmxhZywgJ3N1cHBvcnRfZWRvX3Rp
bWluZycsIHdpdGhpbiBncG1pX2RldmRhdGEgdG8KPiBzaW1wbGlmeSB0aGUgbG9naWMgY2hlY2sg
aW4gZ3BtaV9zZXR1cF9pbnRlcmZhY2UoKS4gVGhpcyBpcyBtYWRlIGluCj4gcHJlcGFyYXRpb24g
Zm9yIGFkZGluZyBzdXBwb3J0IGZvciBpbXg4cXhwIGdwbWkuCgpFeGNlbGxlbnQgaWRlYS4gSSBy
ZWFsbHkgcHJlZmVyIGl0IGNvbXBhcmVkIHRvIHRoZSBmb3JtZXIKaW1wbGVtZW50YXRpb24uCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
