Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290D6C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKoo5q4Lkj0I0eWCz9ry8N2E++NlJcHLgTSIXN0a/oY=; b=OU7b2MUyOXJg4U
	fbQAitfgo4sxvpeEKtNkJqwDXkZzCkNZF70bnHwjjSGVXKg2ALvTThTNWPPF5hRlEYPFDa1D6u6K0
	K6y8L0UjN3p81pDnVI1krLJVUxdBQ6wBv44D06a63ut1GgMEbO81n9fL4C/A2L0CgRf/JLZ+q0uOC
	G8hsk+hOY3xnD2JjPGI5ztu4v4zCIPrS7OHoiufA/dkmJWRiqu58VpkAnYHEX1bFWpQlUSJsPwRJC
	bl8RbLtwygPHa5xWL3gOGtoNpG3qTtMPFxuipzLEBqt8eBug3/SdGkFW0lY4uBpyWh+u5ljhG8dVr
	/gfD6Av9+LofYF2gTbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA69p-0000000DTIm-13CI;
	Fri, 25 Sep 2026 13:40:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA69l-0000000DTIO-1q6i
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:40:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB9361A1012
	for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 13:40:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DDD76073B;
	Fri, 25 Sep 2026 13:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9147E10329294;
	Fri, 25 Sep 2026 15:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XHkEOzH7Xbe/GK8KJUktRku6qNZ+JMr43NslTVYlhXo=;
	b=NG/AEA5XkeVoN9LDRMXzCggJJ0effMbNMsX+bfZB7oZRhLeHyYc5EYwPgkeQjgNIz9hk+f
	DxIgQ1wnQnCKB9Jjk5AzrYV2RVizD2C1IWxusi60TXHD3oQd3p/2NOOpIyRZ6MxPVbrMab
	tnrej4pqBJzYjyAtJW+SyubNdbYyiJJtg2YffSj4vODQxW6seJRbVsZXySInOoMhz39Rcc
	i/HlN7GspKRTcsn3ys8cCThHnN7hxVl4+6U7jnv9CM3z6VM7jHUO+LkeTMP3ZLRR1iEWq0
	oOmqofvjqyORFbRAfFGZEHJSL9A2RRtjvSrkhzwfzyfsmQSOuF/nKOGU159jEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sagnik Sasmal <sagnik@sagnik.me>
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
 mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <010701a08d7e1638-79aaf1ea-cc8c-49e8-ba74-cba028aaa183-000000@eu-central-1.amazonses.com>
References: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
 <010701a08d7e1638-79aaf1ea-cc8c-49e8-ba74-cba028aaa183-000000@eu-central-1.amazonses.com>
Subject: Re: [PATCH v3] mtd: spinand: Do not update the QE bit on devices
 without one
Message-Id: <179034359937.1130052.15368175578389496971.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:39:59 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_064006_399767_E2214869 
X-CRM114-Status: UNSURE (   6.87  )
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

T24gVGh1LCAxMCBTZXAgMjAyNiAyMjo0NDowNSArMDAwMCwgU2FnbmlrIFNhc21hbCB3cm90ZToK
PiBDb21taXQgYmUwYjg2YzY0OGJmICgibXRkOiBzcGluYW5kOiBHYXRoZXIgYWxsIHRoZSBidXMg
aW50ZXJmYWNlCj4gc3RlcHMgaW4gb25lIHNpbmdsZSBmdW5jdGlvbiIpIG1vdmVkIHF1YWQtZW5h
YmxlIHNldHVwIGludG8KPiBzcGluYW5kX2NvbmZpZ3VyZV9jaGlwKCkuIFRoZSBuZXcgY29kZSBv
bmx5IGRldGVybWluZXMgd2hldGhlciBxdWFkCj4gbW9kZSBpcyBuZWVkZWQgd2hlbiBTUElOQU5E
X0hBU19RRV9CSVQgaXMgc2V0LCBidXQgY2FsbHMKPiBzcGluYW5kX2luaXRfcXVhZF9lbmFibGUo
KSB1bmNvbmRpdGlvbmFsbHkuIFRoaXMgY2xlYXJzIGNvbmZpZ3VyYXRpb24KPiByZWdpc3RlciBi
aXQgMCBvbiBkZXZpY2VzIHdpdGhvdXQgYSBRRSBiaXQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8g
bmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaW5hbmQ6IERvIG5vdCB1cGRhdGUgdGhl
IFFFIGJpdCBvbiBkZXZpY2VzIHdpdGhvdXQgb25lCiAgICAgIGNvbW1pdDogNmI2NjBlMDcyNTVk
NDZhMjVhN2Y4Y2YxNTg4MDQ1MDZkZmZiYmZhNwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFi
bGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92
aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlx
dcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
