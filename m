Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53B3CF855E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV5WM29P9HmlFaN/p5wnch6S1T20pJRgTKD8wc3hv0Y=; b=MHfPumvUR70D2U
	toMdvJTdOkJKpS8kVkQjzb94fuDh1h4TWNkKFLoMd6WbLg2H+awEYiq7kdZsxixo7M/xCjavoxElC
	owxFRwQntqDOp+7YPP/s86pAlKZVl88jXSmBYHTiE82kZADFAWgei8ImkhrcacHKLgW37WWRx5WI9
	2ghjvdMevQzeIKySI9Dhjz/bCxloxWLDS+rkdei0cn9xncs57oRJz/A/jt4O+WhiUZN/dS/vtmKU2
	ub9WYsMCvpN4pKotymU7n5GrcdQMXF5chwYCf7dAlC6YBrM4Jx9fKoeFR9y/Osd0xJwBo7kvYGkjt
	Id/ebJ9HAptQ+1tTVOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swGQH-00000008PJK-1cOA;
	Thu, 03 Oct 2024 07:38:53 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swGQC-00000008PIP-3iSO
	for linux-mtd@lists.infradead.org;
	Thu, 03 Oct 2024 07:38:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF29BC000F;
	Thu,  3 Oct 2024 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727941123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBrqkKvGl4kLLjZgTx5geh5hlpljwKGXfB3/2Okw3cg=;
	b=Bqs7lguPte2uKhNCq2dF+fhZHHYwARQ+M4Eup1PWFlpbRybJm16S7QBsU6Iq9vw9M2MZeY
	do6eHkuT6zQ5AmwlQ401Lm7ctzrPsxuCHO1Ml91lXCJK31PA3GxDrmn7z0S2TQDvBLCaNl
	RDV8duvykWVybkpvdlTegP7v4aidlfXOvF9DLVONQpUPLQuOABJ9dkNtwHWHlYdutP1D47
	/HQh+RCvI/zSIuXvN2PYlHZvaWKgqQT0ITMYE5lZ809gNgDZhAtH1lHdFPLEj9yK4T/s5f
	Lf8rgw/MPT5gQQfzBhUEbArx3IxS16ZwvgX5+AHBhvHias40tEKrRP2MBNCWjg==
Date: Thu, 3 Oct 2024 09:38:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241003093840.2965be20@xps-13>
In-Reply-To: <20241002153944.69733-2-han.xu@nxp.com>
References: <20241002153944.69733-1-han.xu@nxp.com>
	<20241002153944.69733-2-han.xu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_003849_741788_7305D919 
X-CRM114-Status: UNSURE (   9.11  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gV2VkLCAgMiBPY3QgMjAyNCAxMDozOTo0
NCAtMDUwMDoKCj4gVGhlIGNvbW1pdCByZWZhY3RvcnMgdGhlIHBvd2VyIG1hbmFnZW1lbnQgaGFu
ZGxpbmcgaW4gdGhlIGdwbWkgbmFuZAo+IGRyaXZlci4gSXQgcmVtb3ZlcyByZWR1bmRhbnQgcG1f
cnVudGltZSBjYWxscyBpbiB0aGUgcHJvYmUgZnVuY3Rpb24sCj4gaGFuZGxlcyB0aGUgcGFkIGNv
bnRyb2wgaW4gc3VzcGVuZCBhbmQgcmVzdW1lLCBhbmQgbW92ZXMgdGhlIGNhbGxzIHRvCj4gYWNx
dWlyZSBhbmQgcmVsZWFzZSBETUEgY2hhbm5lbHMgdG8gdGhlIHJ1bnRpbWUgc3VzcGVuZCBhbmQg
cmVzdW1lCj4gZnVuY3Rpb25zLgoKTWF5IEkga25vdyB0aGUgbW90aXZhdGlvbiB0byBhY3F1aXJl
IGFuZCByZWxlYXNlIHRoZSBETUEgY2hhbm5lbHMKZHVyaW5nIHN1c3BlbmQ/IEluIGdlbmVyYWwg
aXQgc2VlbXMgbGlrZSBhIGRpZmZlcmVudCBjaGFuZ2Ugd2hpY2ggSSdkCnByZWZlciB0byBzZWUg
aW4gaXRzIG93biBjb21taXQgd2l0aCBhIGp1c3RpZmljYXRpb24uIFRoZSByZXN0IGxvb2tzCm9r
IG90aGVyd2lzZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
