Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D489CED252
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 08:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNAKX3NOpn1KMftgtGwGe98B+5Qhw1bntRGIXyfoJ54=; b=mzGUEEarggMUoI
	ZDSfkg3ok7/WquAibgDt8OqYM1RdLdhhenI6uG6QeaQDvZ/4D6eSwkO5usIbJIrqvMzh7jEOnvNMf
	JrPCIXPTSPJNXtHt41oT0lOEoKSwcaLmsqG84IBiBPUwM+IQQOb/h1NfrvVgT4ALAiN/NPh4pjFwx
	dkE50j1X98W1NV0fZxXCLtcfwIpY3tYUkkiarCSh7LGx3NWq8MtlFR6eQCnstqe9l7u5khE1auX4l
	sUuVh/cffFlCm8J8wpNKiqjpwGtqz7T1VL1R37W/d9r0Ldb/zbVoh73mPm0INGr5xsikrPkMSi03N
	FGYk3NN8y40zhsX1surw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5IV-00000004xBG-27n7;
	Tue, 08 Oct 2024 08:10:23 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5IT-00000004x9V-0aCi
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 08:10:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 541EC20003;
	Tue,  8 Oct 2024 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728375017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZ85QRx9iGUXXRrMC3iHfNP9kJrXIacbmMz+7wwj4Dw=;
	b=fFO5P2bKRSZf5vJrA1j6XjV3ctThPJ4FXtWjXHz2lLBEn+UGyhxQFDN4MmYram/EbuTEaM
	jodp6V+jvTa0pjmTEkDFG6JW4f8FAK1dAZiNP42FIxQyAJyQsFWKPwGWDjilMlRvCLJ1xV
	As7iyL53/Oz9EJgt43TKe3fc65kBtwWqEJCNCt6M/InBsMSyL5zuRnUFvYAcZariQVPzQe
	wdqOK3OvUK1m6Z5jMPag1ykC5s48w7WB3Ynaw6ZWflWl2dRMN1C+OHRunOpvoa/U+at2R1
	szXtLkC87VVBWtsp1+SQnpRdsUunsrx6pPy8mtnj1H166/ZGWHi+suj/drtFKg==
Date: Tue, 8 Oct 2024 10:10:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <20241008101015.0b136acd@xps-13>
In-Reply-To: <20241008-ondie-v5-2-041ca4ccc5ee@gmail.com>
References: <20241008-ondie-v5-0-041ca4ccc5ee@gmail.com>
	<20241008-ondie-v5-2-041ca4ccc5ee@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_011021_694667_76AD03FD 
X-CRM114-Status: UNSURE (   6.19  )
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

SGkgTWFyY3VzLAoKbWFyY3VzLmZvbGtlc3NvbkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAwOCBP
Y3QgMjAyNCAwOTowMjo0NSArMDIwMDoKCj4gQ29udmVydCB0aGUgYmluZGluZ3MgdG8geWFtbCBm
b3JtYXQuCgpJbXByZXNzaXZlIGhvdyBsZWdhY3kgdGhlc2UgZGVzY3JpcHRpb25zIGFyZS4gQW55
d2F5LCB0aGUgY29udmVyc2lvbgpsZ3RtLCBzbyBsZXQncyBzZWUgd2hhdCB0aGUgYmluZGluZyBt
YWludGFpbmVycyB0aGluayBvZiBpdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
