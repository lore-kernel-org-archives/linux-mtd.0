Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B20EC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FOcdWx+YCZLowUsQrlGUqSC34JNdJQ4tSFrfMpwtj8=; b=UHvUbfmE8slw+H
	NoBXNMNeBzA5jmDj4lrC+AgeK6m8Qhep2QqaVFItvQyO7gpW8Y9vxlKeFJSjoSVQrjwYgHiOrNfJk
	mzI2wS+4FQV/4aluSMPeO68rbcV5uPnmE6PMmcRt6ENXpoBL0Xa5f2xpVUg1nTvEqnSaQJouIIUrv
	Pym1GmfpeW0cvLk0t97HnStQz3aHLaOJWvh9ibcZ3PkxZBGkqCPkPiDTFGg8S740g5QHN269HIuwl
	4Mo/TTV8isUBnaGTtxrsKn7XtQ/3P6Xr/VTUM4AVoulBgT21a04tVsRxcE2FxF3uc/n0w3YGeqxp3
	N5asdDBRDP21db7sBFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7X4Y-00000004Fo8-46DW;
	Thu, 16 May 2024 09:06:46 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7X4V-00000004FnC-04ds
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 09:06:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D99F14000D;
	Thu, 16 May 2024 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715850400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=to0ko1iXUNdtqkP76ox8uQ/THkUlxr/rRqSZ17eEf/c=;
	b=RFZnvVjj/ohr5PvC3msQp3MlaiQ5GTqOVryqyJfXgFOCDRHVJTicFyNdAe8UXNmdj0scTE
	VrxRUDmO14UwwhcKbGd3K4gbvMlEaN+rmd9h9djBDikWu0QjM35jmYFtU99Bxbv3HIOW/T
	IZi7q4gNT+iBCN8jc7/NVtzCjmtiJFotivYOHs0A6M13E8q/1BUGpErky6ddtDseotnncu
	fq0eoOSvEE3K+w3VNE6z1UaGDnICIFGy/jz0dhhSDDWp5Ct8k5qh/hmRThhGWWBDYrCP3B
	PQ+nJn6iwbX2XbsC0ZAh7wu5RnS5SYj9ntPIuu5ryP30SaAoPkH/MdqbUfpA/Q==
Date: Thu, 16 May 2024 11:06:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.10
Message-ID: <20240516110638.34f89bfa@xps-13>
In-Reply-To: <mafs0msp89vx5.fsf@kernel.org>
References: <mafs0msp89vx5.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_020643_285224_82D5749B 
X-CRM114-Status: UNSURE (   5.59  )
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

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIFRodSwgMDIgTWF5IDIw
MjQgMTU6Mzc6NDIgKzAyMDA6Cgo+IEhpLAo+IAo+IEhlcmUgYXJlIHRoZSBTUEkgTk9SIGNoYW5n
ZXMgZm9yIHY2LjEwLgoKUHVsbGVkIGludG8gbXRkL25leHQuCgpUaGFua3MhCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
