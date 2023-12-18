Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F6BC35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4JWfmCDWDBG5UNB2GVTKMN62gS0lpcIVsiirbKhzHE=; b=sdJQSPmolrN1K8
	MzntowOqE5X7tXZmqZS8QcOmGIieVFMwOwg7MZ7cgyGh0no7Xwc/SYFK9ewiWTJyYebh95EUk/ZOW
	hdAV5gsrfHcZny/+HDw5jNqNSucKkat41cFo8VghEjT++YF+FBIdaL9VcgK8Lxj2DNQPVxu2GbduK
	3LN6u3y0eeMw7t0XPHFBYndXXNtRgnit73dvdZ6UFadjyPq+eEZ2afGLYqkav4GRiyTvNAs/dmde0
	nj0pUW9Tg2k96AqVywlVfXCkGE7gnvpVfUIvwXsSCaiopC9YeASQrQLizW3s/1/FusE6xxZg5vi7h
	dsAQQhip+4yjsZMRH41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEDJ-00AyHA-1e;
	Mon, 18 Dec 2023 14:03:21 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFEDF-00AyF4-17;
	Mon, 18 Dec 2023 14:03:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26EE2FF805;
	Mon, 18 Dec 2023 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702908194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOdu4nC8A547RSrmQaxjTwDGTHM+CV5BhhKgD0gmeTo=;
	b=KStf55k35pwB3Kf+9oYro7aVUbzOX88GtQSkvx2+3d9QuT5CPmNp8cPZb1hhaQXobbp/PW
	NbpyQvc9Nkj1P4yR2b4Trd3QGZIp2QMThiPUbyTC2uelXRCPGxvdwSxiRJxg9W2n2BqA3e
	D3hP3YUq4441ekhB49ki7NFpLhseKqfgvY7CCEqtK0GPcWnq1mmReLN2l0P+m8n3rpC9u/
	rO7Imna95yvuffMOoXMNVYBqTT8QBhWT5xIyQhPrWBYl004cL/IJXfpz/UzrIsjT1ynOx4
	6Wq8r6ad9OmdumDTjyYSeJ1ksOfy/SllnGI2Fp4RZb6ab2+/Yp7YJcbO4ZCpvw==
Date: Mon, 18 Dec 2023 15:03:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/4] nvmem: core: add nvmem_dev_size() helper
Message-ID: <20231218150312.01bc1472@xps-13>
In-Reply-To: <20231218133722.16150-2-zajec5@gmail.com>
References: <20231218133722.16150-1-zajec5@gmail.com>
	<20231218133722.16150-2-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_060317_525193_BC1F75DC 
X-CRM114-Status: UNSURE (   5.95  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDE4IERlYyAyMDIzIDE0
OjM3OjIwICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVGhpcyBpcyByZXF1aXJlZCBieSBsYXlvdXRzIHRoYXQgbmVlZCB0byByZWFkIHdob2xl
IE5WTUVNIGNvbnRlbnQuIEl0J3MKPiBlc3BlY2lhbGx5IHVzZWZ1bCBmb3IgTlZNRU0gZGV2aWNl
cyB3aXRob3V0IGhhcmRjb2RlZCBsYXlvdXQgKGxpa2UKPiBVLUJvb3QgZW52aXJvbm1lbnQgZGF0
YSBibG9jaykuCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
