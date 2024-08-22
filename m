Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ECAC3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2024 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gv8X1b2Y0Rblb3K1kIPFEIabiy69r4sWyx+dViQ8kZo=; b=XdOLMA20JfqmW9
	XfgmX3wCHPcv9vhHmSQoTqPr/tlHbkeCMVJXjPHJgiqBhmBfFbll2JWRuQ1zywCshRUevb5XBTxYf
	O0xGohkobOw0Zk6fubnbvZU56osMKF0a/bpOogQNIKh3KSkAddGp/9/H4V7hf2ADtsgC++qeWkpPO
	wHCFMo018uQOOYFQEDL/Isgh3hIEeZuK/O8j33x1fG9JjOZLN4P+yIcknM1lpfgWr8CpWXHTFF1zJ
	aaLcZa4tX0yZneq/U6Y99XWQCCRb3PvXEs/I7hQwqR2VQ4HnlqOHTpKNxwobGHPZXvhvqUV9Pvkav
	LK63onam4Dk1xbROhiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAKU-0000000DVnc-0ZvU;
	Thu, 22 Aug 2024 16:06:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shA9S-0000000DRwE-3pkI;
	Thu, 22 Aug 2024 15:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1724342106; x=1755878106;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T6FKB7FiGWOqnwODINwXV6nvlWEjZs6TSxWvbCgu9q4=;
  b=d+rb+gAEiEFbTvvBRY9/Y9nE1xiNn1wovezDyd7O/75y//DhbKlTiDee
   SKqisfnvCqjsxDZAQcAk/Urtt/k7Nr7b841VJdg+pwZgbjpNLYt6liYoL
   9dQ6IuFQkjFdOb91n0EOxV2cWzpKQbXeGRoH9+WrPzM4galsrzwdM1C9l
   1e9kRDN7ZEfrZDGi8VkcWz5JufWyKzXrH9NookkClcMP3sKIEs4f82FUG
   bNJ8rYxaus/UrRMkDCgi17T0/BdQOCDLayOR3cFbXyNdd+I1AFfCY2t3f
   S6Ibbv/uWOOVK80OKK8zkjteFJzpWQ2SjLPk/3s6pzAdQGgs44a22h4Dt
   w==;
X-CSE-ConnectionGUID: SN1/6utRSOOKy8/CQdqDBg==
X-CSE-MsgGUID: kRwOVHM1RAC6HedrkcyYKA==
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="198218186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2024 08:55:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Aug 2024 08:54:33 -0700
Received: from [10.180.116.170] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 22 Aug 2024 08:54:29 -0700
Message-ID: <a65c4728-4cec-4fb0-a00f-052b0e08d7c1@microchip.com>
Date: Thu, 22 Aug 2024 17:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: nand: raw: atmel: Add message on DMA usage
Content-Language: en-US, fr-FR
To: Alexander Dahl <ada@thorsis.com>, <linux-mtd@lists.infradead.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	"moderated list:ARM/Microchip (AT91) SoC support"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
References: <20240821142006.645306-1-ada@thorsis.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240821142006.645306-1-ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_085507_550427_7F5855D3 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjEvMDgvMjAyNCBhdCAxNjoyMCwgQWxleGFuZGVyIERhaGwgd3JvdGU6Cj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gCj4gTGlrZSBmb3Igb3RoZXIgYXRtZWwgZHJpdmVy
cyAoc2VyaWFsLCBjcnlwdG8sIG1tYywg4oCmKSwgdG9vLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBEYWhsIDxhZGFAdGhvcnNpcy5jb20+CgpBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8
bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgoKPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgIHYx
IC0+IHYyOgo+ICAgICAgLSBtYWtlIGluZm8gbWVzc2FnZSBjb25kaXRpb25hbCAodGhhbmtzIE1p
cXVlbCkKPiAKPiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5j
IHwgNSArKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNv
bnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5j
Cj4gaW5kZXggZGM3NWQ1MGQ1MmU4Li5mOWNjZmQwMmU4MDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0yMDQ5LDcgKzIwNDksMTAg
QEAgc3RhdGljIGludCBhdG1lbF9uYW5kX2NvbnRyb2xsZXJfaW5pdChzdHJ1Y3QgYXRtZWxfbmFu
ZF9jb250cm9sbGVyICpuYywKPiAgICAgICAgICAgICAgICAgIGRtYV9jYXBfc2V0KERNQV9NRU1D
UFksIG1hc2spOwo+IAo+ICAgICAgICAgICAgICAgICAgbmMtPmRtYWMgPSBkbWFfcmVxdWVzdF9j
aGFubmVsKG1hc2ssIE5VTEwsIE5VTEwpOwo+IC0gICAgICAgICAgICAgICBpZiAoIW5jLT5kbWFj
KQo+ICsgICAgICAgICAgICAgICBpZiAobmMtPmRtYWMpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZGV2X2luZm8obmMtPmRldiwgInVzaW5nICVzIGZvciBETUEgdHJhbnNmZXJzXG4iLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV9jaGFuX25hbWUobmMtPmRtYWMpKTsK
PiArICAgICAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJy
KG5jLT5kZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBETUEgY2hhbm5lbFxuIik7Cj4gICAgICAgICAg
fQo+IAo+IAo+IGJhc2UtY29tbWl0OiA0N2FjMDliOTFiZWZiYjZhMjM1YWI2MjBjMzJhZjcxOWY4
MjA4Mzk5Cj4gLS0KPiAyLjM5LjIKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
