Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB48C61DC2
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnFvO0wPb5HPTvHsW3s+UgVnGIa5twN3eiB0sBxu40Y=; b=kVoSAinSIPRKZw
	XArmT9q1MKze84r5orAFZPPw5xwxgHHHht9bh0ZuZymlVUywP1cejbYSbCq3Ygo3GGwC/X5VF52oK
	B1/+llqa+CtHliV081iInHwVwqNCY1PfBCxWMQD+5UCXbhdiblldOdAO3u8/DzP5FbsmNn2gf2xJ6
	n0m6b8ZU3zh8TXBASWtM/SSJ+V5fgHV0tSrnJ+Ft7ldIs4CrDj8TRh8psKGsj1bTST+3P8cn/Py9w
	cNerXPLomkwoe6p1wvq39ZlvqQuIh2CDKM15WLO7A+3GYolS9MMGfrMSF8SFwFJ+4GjLy32l/fKao
	e2sDyceZPgWv418kOsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVXv-00000003e7X-1Syp;
	Thu, 27 Aug 2026 08:33:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVXs-00000003e72-0oBw
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 08:33:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E1951A1849;
	Thu, 27 Aug 2026 08:33:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10273602B8;
	Thu, 27 Aug 2026 08:33:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE5B111C783F8;
	Thu, 27 Aug 2026 10:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787819587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MXcYU0wpdxigUdN91eobDqnjz/40R6iSKgJHLhVwIdQ=;
	b=BDFAZGrBnc9OcX8stWh9bwubCZ56sqUXoivFmTfpmjZhlbZqWZwfETMzz7ge4To9Np0x1H
	Lb0yLVUQ3r87bdcbEq0bPc6t4SiO6aGh8pqM4Q/RQ4Ug1e6GnCUFxkPKNL0a9aavJU0Pwk
	khI1c9118GZG4hBU54JkCL6yTBsnMDorIYywjd5+XPG1L8OXm4qeCmOpg2xRaonarPieKQ
	CXqibtoCNgmGWsrGXAD+M+AHRfRX1ukEaJzCmHbuECUO+hO/YcQqiTOtYa2A4F6xlcddDq
	LSoHgN6+LAxGGAlvD4A3Dk6w8Q6dgkgBOUK6Rlx1LSmoo1B2yzVQmM1AbxX8UQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v5] mtd: spi-nor: core: Fix mutex leak in
 spi_nor_rww_start_exclusive()
In-Reply-To: <20260827082656.2772784-1-runyu.xiao@seu.edu.cn> (Runyu Xiao's
	message of "Thu, 27 Aug 2026 16:26:56 +0800")
References: <87tsoigz8x.fsf@bootlin.com>
	<20260827082656.2772784-1-runyu.xiao@seu.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 27 Aug 2026 10:33:03 +0200
Message-ID: <87jypcdku8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_013313_088129_F3523C8B 
X-CRM114-Status: UNSURE (   9.44  )
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

T24gMjcvMDgvMjAyNiBhdCAxNjoyNjo1NiArMDgsIFJ1bnl1IFhpYW8gPHJ1bnl1LnhpYW9Ac2V1
LmVkdS5jbj4gd3JvdGU6Cgo+IHNwaV9ub3Jfcnd3X3N0YXJ0X2V4Y2x1c2l2ZSgpIGlzIHVzZWQg
YXMgYSB3YWl0X2V2ZW50X2tpbGxhYmxlKCkKPiBjb25kaXRpb24uIFdoZW4gYW4gUldXIG9wZXJh
dGlvbiBpcyBhbHJlYWR5IGluIHByb2dyZXNzLCBpdCByZXR1cm5zCj4gZmFsc2Ugd2hpbGUgc3Rp
bGwgaG9sZGluZyBub3ItPmxvY2suIFRoZSB3YWl0IGNvbmRpdGlvbiBpcyB0aGVuIHJldHJpZWQs
Cj4gYnV0IHNwaV9ub3Jfcnd3X2VuZF9leGNsdXNpdmUoKSBuZWVkcyB0aGUgc2FtZSBsb2NrIHRv
IGNsZWFyIHRoZSBSV1cKPiBzdGF0ZSwgc28gdGhlIHdhaXQgY2FuIGRlYWRsb2NrLgoKVGhpcyBw
YXJhZ3JhcGggaXMgYSBiaXQgaXJyZWxldmFudCwgd2UgZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQg
dGhlCmZlYXR1cmUgaXRzZWxmOiB0aGVyZSB3YXMgYSBjb252ZXJzaW9uIHRvIHNjb3BlZCBtdXRl
eGVzLCB0aGlzCmNvbnZlcnNpb24gbWlzc2VkIG9uZSBwbGFjZSwgeW91IGZpeCBpdC4gVGhhdCBp
cyB0aGUganVzdGlmaWNhdGlvbiwgYnV0CmZpbmUsIGxldCdzIHN0b3AgaXRlcmF0aW5nIG9uIHN1
Y2ggYSB0cml2aWFsIGZpeC4KCj4gVXNlIHRoZSBzYW1lIGd1YXJkKG11dGV4KSBwYXR0ZXJuIGFz
IHRoZSBvdGhlciBSV1cgaGVscGVycyBzbyBub3ItPmxvY2sKPiBpcyByZWxlYXNlZCBvbiBib3Ro
IHRoZSBidXN5IGFuZCBzdWNjZXNzZnVsIHJldHVybiBwYXRocy4KPgo+IEZpeGVzOiAwM2U3YmI4
NjRkOWEgKCJtdGQ6IHNwaS1ub3I6IHVzZSBzY29wZS1iYXNlZCBtdXRleCBjbGVhbnVwIGhlbHBl
cnMiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUnVueXUg
WGlhbyA8cnVueXUueGlhb0BzZXUuZWR1LmNuPgoKRGlkbid0IEkgc2VuZCBhIFJldmlld2VkLWJ5
IHRhZyBhbHJlYWR5PwoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+CgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
