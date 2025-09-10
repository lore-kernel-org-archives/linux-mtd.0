Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5D2CA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ezsAQSpgeoj+8It9kVRrQQRQzJCSi/M90M2AlOGSik=; b=KkCdLi7FmXXQM0
	EFnW9qYafK7rFuJ4RqvlpKMsc9L8P6ijDZa1Lv46dsLum7/E+XgbqAmGN4k0N41YQxf+3XW5FmGRv
	VnXxHDbw6swJrL8F4lnEkWhxibh6RW8vWBHHwiANYuq5OyWC0uE5CN4a9Rsucj+Ql22DV+mnOA2AG
	aLY8pyB4Sq/8RBNCbwmIUtgyt5s/gNChAznY3+l+wMrLIBlwEfI5jMLv1LdrbulePD6aSi4FZxpwo
	Z0cqlPfCmwQQID8TmHrU7SZeEGcM5uMrvTe2vakXCgeGjtr7H3fPMwyEMvabM25DFTOF79VLxnEY+
	SRe20tgEHJEygGrlgA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGsX-0000000D9J8-2slM;
	Wed, 10 Sep 2025 09:12:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGsV-0000000D9IA-3XZT
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 09:12:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A58D4E40BB5;
	Wed, 10 Sep 2025 09:12:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3698D606DB;
	Wed, 10 Sep 2025 09:12:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3794C102F289F;
	Wed, 10 Sep 2025 11:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757495553; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x8mYPqMfnQauFzBZDg5ZJTpmwumJ9yjmzmJK4BlUL04=;
	b=rHZPmXjQR5Im+BblKXKIPgicyTX9KsxmyLJkqy0ISbkcoXeKWyHrT0a9Y1eDuvSsgFPt7I
	Muh7Nw3iYL39ATM8fo68JE5tyw6yaZM/4rNUjnC626t/7eWEzyH3bVYCzakiytAEwm2MaB
	ICv2UB5QTT8GoPVJZhaV2Rr9/1T+jX/+6Xp8zSxTk9CCEniu+bvbIWJZgxlQ9uBcrRtyO0
	v3lBAmgFOttu6//b4fgE867ClQOVGCmxYcHE0yu4hnOZlbyD3BDTjcfe2ushq1Jl+sl466
	CR7tTBq10L1/GaQh4cGOVBrhprj4jfvtn+y8tIjkZ5kPnQMnAPZmJTasY9NGPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  tudor.ambarus@linaro.org,
  mmkurbanov@salutedevices.com,  Takahiro.Kuwano@infineon.com,
  pratyush@kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 3/3] mtd: spi-nand: macronix: Add randomizer support
In-Reply-To: <20250910030301.1368372-4-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 10 Sep 2025 11:03:01 +0800")
References: <20250910030301.1368372-1-linchengming884@gmail.com>
	<20250910030301.1368372-4-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 11:12:29 +0200
Message-ID: <87qzwed62q.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_021236_017284_AD5730B8 
X-CRM114-Status: UNSURE (   5.65  )
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

Cj4gK3N0YXRpYyBpbnQgbWFjcm9uaXhfc2V0X3JhbmRvbWl6ZXIoc3RydWN0IHNwaW5hbmRfZGV2
aWNlICpzcGluYW5kKQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCBleGVjX29wID0gU1BJTkFO
RF9QUk9HX0VYRUNfMVNfMVNfMF9PUCgwKTsKPiArCXN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCA9
IHNwaW5hbmRfdG9fbmFuZChzcGluYW5kKTsKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZG4gPSBu
YW5kZGV2X2dldF9vZl9ub2RlKG5hbmQpOwo+ICsJaW50IHJhbmRvcHQsIHJldDsKPiArCXU4IGNm
Zywgc3RhdHVzOwo+ICsKPiArCXJldCA9IHNwaW5hbmRfcmVhZF9yZWdfb3Aoc3BpbmFuZCwgTUFD
Uk9OSVhfRkVBVFVSRV9BRERSX1JBTkRPTUlaRVIsICZjZmcpOwo+ICsJaWYgKHJldCkKPiArCQly
ZXR1cm4gcmV0Owo+ICsJaWYgKGNmZykKPiArCQlyZXR1cm4gMDsKPiArCj4gKwljZmcgPSBNQUNS
T05JWF9DRkdfRU5QR00gfCBNQUNST05JWF9DRkdfUkFOREVOOwo+ICsJcmFuZG9wdCA9IG9mX3By
b3BlcnR5X3JlYWRfYm9vbChkbiwgIm14aWMscmFuZG9wdCIpOwoKSXNuJ3QgdGhhdCBhIGxlZnRv
dmVyPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
