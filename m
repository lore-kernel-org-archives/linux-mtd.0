Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B47C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4APH5vxNHV7huoeCRtMSLbY1AqPYu7uVQZzVnRRlf0c=; b=wPN8RkVnZ4cmcx
	7+nJwmDjeuANbytt6oFfYrVvgD2G36fC4WUrJUG5+x8cPShY6v5TvF1hl7msO4BwqY3t168qb3cI2
	7wPBYKnEVBMP3QXNxeUo2mNgZdgPIWVNcODd30HB3Yn2urO+RbbeSFaqRGGjomrRqeJi3wi47MyAA
	MYRPlEgjz6q3DaYSXp5da/QWRmxdijnepR3iB/HI/OcPG6U7hJwnqOPnwXEdGEeQfahQ6XdRzrI5D
	oJSapCqqg+K3Lr8hc7KqN7BQPqk8qjblNtjd9sI2qdBMcwQABOICifnhdVQxVCz3b3yfBo5Tzfp53
	hpJxdScps1DsQfe5YrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3Oh-0000000BxtM-2nqs;
	Wed, 15 Jan 2025 13:25:27 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3Of-0000000BxsP-1us3
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 13:25:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB718E0003;
	Wed, 15 Jan 2025 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736947519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xlBR/QRpi0uMVI/DYKPrRq+AyCl7kCOjNGNXpjkFWJw=;
	b=FM7FhK0yY3EDNT3elFFkL99ih4gPh462n9hs1HPfe1YWzIFAjCV0nJHFomk/YftaIVsoJp
	0KLuIcXSbNUcKFNnmGi119tScsJWE0UuhNEtCS5ezIdQP6enTBav2mDIWtwoIubFWjsLlf
	B6nNUi3ldddi+Qe9JRTioy/6r6xIrFJQI+IdGvrXtmTEv6dtzso9zJcmPTweaDuVOwyxED
	u+L6HwMsuoxHY8f83bk8iQroVrFPfrYOcJB0fh8UV6AcSxGIZwAGic9rWdVwhTeZHEsnAB
	qkArkjUBbkZiv7DlqWh1XLJF56XSna3dBvLvzahrWG8pll85nZX25/DGuvHQJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Cheng Ming Lin
 <linchengming884@gmail.com>,  Alexander Stein
 <alexander.stein@ew.tq-group.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: replace dummy buswidth from
 addr to data"
In-Reply-To: <mafs0cygo5p2f.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	15 Jan 2025 10:50:00 +0000")
References: <20250115101659.55882-1-pratyush@kernel.org>
	<878f66c3-83a4-4f83-88d8-ea2917d82d76@linaro.org>
	<mafs0cygo5p2f.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 14:25:17 +0100
Message-ID: <87o708p5tu.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_052525_781994_DB395D09 
X-CRM114-Status: UNSURE (   6.16  )
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

T24gMTUvMDEvMjAyNSBhdCAxMDo1MDowMCBHTVQsIFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBr
ZXJuZWwub3JnPiB3cm90ZToKCj4gT24gV2VkLCBKYW4gMTUgMjAyNSwgVHVkb3IgQW1iYXJ1cyB3
cm90ZToKPgo+PiBPbiAxLzE1LzI1IDEwOjE2IEFNLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPj4+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgOThkMWZiOTRjZTc1ZjM5ZmViZDQ1NmQ2ZDNjYmJlNThiNjY3
ODc5NS4gVGhlIGNvbW1pdAo+Pgo+PiAiVGhlIGNvbW1pdCIgb24gYSBuZXcgcGFyYWdyYXBoIHBs
ZWFzZQo+Cj4gQUNLLCB3aWxsIGRvIHdoZW4gYXBwbHlpbmcuCgpJIGNhbiBhcHBseSB0aGUgZml4
IG9uIG10ZC9maXhlcyBkaXJlY3RseSBhbmQgZmlyZSB0aGUgZml4ZXMgUFIgb25lIGRheQpsYXRl
ciwgYnV0IEknbGwgbmVlZCB5b3VyIHYyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
