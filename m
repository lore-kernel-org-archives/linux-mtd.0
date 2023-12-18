Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7C1C35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZTCLoSiLWMGCiplQo5obzE/ZIrTKeconZZIVv0/5Y0=; b=tYFLlTzjCRjXoJ
	D8ptP3UEtfTcCPfLqOYuFmn4suJ1iUEhX4u6wsqyV9TJK3jvfd9yi3tl5sSECN6qisXj1RFDZeQaE
	B1fO7CUjQvNDPVosBx824GvgOYtSvHzy3Kx6kgnbxCGSgPLDV9+Fc1htoZWQrVCDiEgMYw8uXZr8T
	8tvax39LSzVXp42zFC5Iltog7iN9BlDKuyb1MrPaj9VDFdPB6GfR4zt1sOQRa27Xxn5gt+ldpBAsk
	oRzOezvOI4/QXn0IZCW1fiRHaA5Pk+f3uQT0fr0h7snnmJXC6pkXdylMmrwe7mAXOHji7PqZ2r7b4
	V5NpZxmVfrR4/k2Y/X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFECY-00AxwI-1t;
	Mon, 18 Dec 2023 14:02:34 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFECT-00Axrm-2e;
	Mon, 18 Dec 2023 14:02:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FE7B1BF209;
	Mon, 18 Dec 2023 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702908145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9hdpzX59dlQ8BbL4qFPt1i7iHlvmq58cF5p1A5NsrM=;
	b=DOKiAw5d7xeVSCsPETCVl3JSgk/hiu/3PuGa55ZqK+Mqil78nGr4xHia+JwjeUxMDrbhI5
	y3hnlnv+LZXEoRaVYDv8sTz36fwuCXuO+W8MN/u5l6DqOgluyW4NTGfhoQCJUsxmH3IMN8
	af0EqVjAzehFN+CFmBFMb4pNtYYYwpPvIiBo9sEHnUuNgNDItJvuo4jnMYAqie66OBAU19
	r7p/HUxwXAbjhyptKwWJyvnCiyMs57PaiBJ9BMU2gk6L047ISKzcrAS+scHnctBctydjaJ
	PMhepo1FjXI51w3WVgEnUE5Wmp8FWRklZzUDSMAn2vCPSb0+Wt9P72ymNQ2NeQ==
Date: Mon, 18 Dec 2023 15:02:23 +0100
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
Subject: Re: [PATCH 3/4] nvmem: u-boot-env: use more nvmem subsystem helpers
Message-ID: <20231218150223.000aacf0@xps-13>
In-Reply-To: <20231218133722.16150-3-zajec5@gmail.com>
References: <20231218133722.16150-1-zajec5@gmail.com>
	<20231218133722.16150-3-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_060230_128923_019D6ACC 
X-CRM114-Status: UNSURE (   6.95  )
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
OjM3OjIxICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gMS4gVXNlIG52bWVtX2Rldl9zaXplKCkgYW5kIG52bWVtX2RldmljZV9yZWFkKCkgdG8g
bWFrZSB0aGlzIGRyaXZlciBsZXNzCj4gICAgbXRkIGRlcGVuZGVudAo+IDIuIFVzZSBudm1lbV9h
ZGRfb25lX2NlbGwoKSB0byBzaW1wbGlmeSBhZGRpbmcgTlZNRU0gY2VsbHMKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CgpSZXZpZXdlZC1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
