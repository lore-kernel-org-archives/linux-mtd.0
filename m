Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF92C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 19:07:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B22782175B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 19:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="By54zjCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B22782175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shwnHlZmY++iZkWTROw0J+MUPwmwV8SF0H9FIz6IwKY=; b=By54zjCf5EQqF3
	+BpyJX7QgAh6UxO5RwyyPApCcJAkiq2JEjNiIlfM09XC56up+u+1b2NPZZmVMKCaI0HB0UnbVf02x
	fTF3Lx7PK/lqW/t5uX52Ep6dn/PQqe5TgkLxXsF6X7ePDzPy+tgNnD3Cv3cmCmTzXvtmhrh/X05D7
	4sUHbXRFx5hk8Y6x1ZORzjxUNky45vizIBCiNaDVcP1Mn8KdU6UwRPOaxD1CvLdfgdqXL1jRCTzJu
	MDsfydfbnRJAVE5VavfPLEMCFR6MklFNPNQhNHzRiUVg3xrzTw/EtEokr8XhxFZpvJ9cUkzhpBPOm
	3ABYydfIbLPVp+KCUM1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr63f-00014R-FT; Tue, 05 Feb 2019 19:06:59 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr635-0000SJ-KG; Tue, 05 Feb 2019 19:06:43 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id EF1AE200002;
 Tue,  5 Feb 2019 19:06:18 +0000 (UTC)
Date: Tue, 5 Feb 2019 20:06:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] mtd: rawnand: stm32_fmc2: Make some functions static
Message-ID: <20190205200617.087f3e4a@xps13>
In-Reply-To: <20190130100908.19532-1-yuehaibing@huawei.com>
References: <20190130100908.19532-1-yuehaibing@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_110624_392160_5B80D578 
X-CRM114-Status: UNSURE (   5.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: christophe.kerello@st.com, alexandre.torgue@st.com, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, mcoquelin.stm32@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWXVlLAoKWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZSBvbiBXZWQs
IDMwIEphbiAyMDE5IDE4OjA5OjA4CiswODAwOgoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNwYXJz
ZSB3YXJuaW5nOgo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jOjEyMjg6
Njogd2FybmluZzogc3ltYm9sICdzdG0zMl9mbWMyX3JlYWRfZGF0YScgd2FzIG5vdCBkZWNsYXJl
ZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMy
X25hbmQuYzoxMjc1OjY6IHdhcm5pbmc6IHN5bWJvbCAnc3RtMzJfZm1jMl93cml0ZV9kYXRhJyB3
YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IGRyaXZlcnMvbXRkL25hbmQv
cmF3L3N0bTMyX2ZtYzJfbmFuZC5jOjE3MDc6MzI6IHdhcm5pbmc6IHN5bWJvbCAnc3RtMzJfZm1j
Ml9uYW5kX29vYmxheW91dF9vcHMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0
aWM/Cj4gCj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
Pgo+IC0tLQoKTWVyZ2VkIGluIG5hbmQvbmV4dCB3aXRoIHRoZSBvcmlnaW5hbCBjb21taXQuCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
