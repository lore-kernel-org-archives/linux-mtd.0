Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C1CC6FA82
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 08:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOEp13682I5lgm9eeAKPmoZKyg19ZACxOa55YbPrUzQ=; b=SP5BOH1Pw0eglJ
	4AEjOp5plKPUWo08q2hCYEebvFx3gLzucX3D+W6H6wk0haeZ2CIoj8BomEfJQHu01Ml4tqK41bGWo
	9EhRBZXTKdVnjeW/xqho/3sou8I4JO4wwY76oVByjgjuZ4hHv/x1swAwNMiQapuKkShd7y283kvwE
	ETkAMaATbRNc524cKwvuiTqvVWbITaRqGPbWaGOgGlNQbSV7+UUXDzk3Sq7MHmYVBsXEM5YAzAI99
	8+MRStjmJzHOzWepCQNLAhc3NqzFrN0yHfHr27LQn8mOoR4cuw7pr+Lb86rObHnhImuVGZCmq/h35
	gFlaJ+MupNZpQDLvKaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obe5y-002xq5-3D; Fri, 23 Sep 2022 08:31:38 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obe5c-002xgs-AI; Fri, 23 Sep 2022 08:31:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 15A1EE0011;
	Fri, 23 Sep 2022 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663921870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCcH0TixQ9AUWLDzLnm1YNaw3iaLd6rBcDmfk2S9O1Q=;
	b=ccwuXM8qEnNRTU7tHhh2kONd9JpPaqplAY5/o3NPVgrkS/pK6/6ryrURcYkKmlpJ0YOxG0
	PoSg6/hDeR621Mx7cuZjZYpm2VtMac8e2daSHtamZ/lBAiUL9j+YsMgBVmDRsBUIQu/21B
	16CgxDBqWH4hkx+iMIu3GVCr1c+yccwG8EVtVdtPGoLYHF8eGL/lm2keWshBDJZZk3AkCd
	86zBp5MJJu9fWaRbqPjobBL45SYQVLaJt8pnHcO0Zj7vVWQ0yU4dJsJx8WDoeF1jyD2snT
	q3iP8BVeaDPBaA1KVuIh+fV8ezNL+d2MzInpp9JYXgvafngwwZPuM1v1lhVUiw==
Date: Fri, 23 Sep 2022 10:31:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>, Frank Rowand
 <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Robert Marko
 <robert.marko@sartura.hr>
Subject: Re: [PATCH v2 00/20] nvmem: core: introduce NVMEM layouts
Message-ID: <20220923103105.0894845c@xps-13>
In-Reply-To: <1dca4a7f-f4d7-9fd7-69f0-5b0aec51bdef@linaro.org>
References: <20220901221857.2600340-1-michael@walle.cc>
	<20220921115813.208ff789@xps-13>
	<1dca4a7f-f4d7-9fd7-69f0-5b0aec51bdef@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_013116_709014_FE2BD5DC 
X-CRM114-Status: GOOD (  12.53  )
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

SGkgU3Jpbml2YXMsCgpUaGFua3MgZm9yIHRoZSBxdWljayBmZWVkYmFjay4KCnNyaW5pdmFzLmth
bmRhZ2F0bGFAbGluYXJvLm9yZyB3cm90ZSBvbiBUaHUsIDIyIFNlcCAyMDIyIDIyOjIyOjE3ICsw
MTAwOgoKPiBPbiAyMS8wOS8yMDIyIDEwOjU4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gCj4g
PiBTcmluaXZhcywgY2FuIHlvdSBnaXZlIHVzIGFuIHVwZGF0ZSBvbiB3aGF0IHlvdSB0aGluayBh
Ym91dCB0aGlzCj4gPiBzZXJpZXMgKG5vdCBhIGNvbW1pdG1lbnQsIGp1c3QgaG93IHlvdSBmZWVs
IGl0IG92ZXJhbGwpPwo+ID4gICAKPiBPdmVyYWxsIHRoaXMgaXMgZ29pbmcgaW4gcmlnaHQgZGly
ZWN0aW9uLCB0aGVyZSBhcmUgZmV3IGJpbmRpbmdzIHJlbGF0ZWQgY29tbWVudHMgb25jZSB0aG9z
ZSBhcmUgc29ydGVkIG91dCBpdCBzaG91bGQgYmUgZ29vZCB0byBnby4KCk9rLCBsZXQncyB0YWNr
bGUgdGhvc2UuCgo+ICBGcm9tIE5WTUVNIHNpZGUgYW0gaGFwcHkgd2l0aCB0aGlzIGZlYXR1cmUs
IHdoaWNoIGhhcyBiZWVuIGEgbG9uZyBwZW5kaW5nIG9uZS4KPiAKPiBXZSBoYXZlIGZldyBkaXNj
dXNzaW9ucyBvbiBPTklFIHN0YW5kYXJkIGJlZm9yZSwgbGF5b3V0cyB3b3VsZCBmaXQgaW4gbmlj
ZWx5LgoKSSBhZ3JlZSB0aGV5IHdvdWxkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
