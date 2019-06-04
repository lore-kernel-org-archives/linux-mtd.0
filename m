Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34E7C282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 14:18:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89654249E1
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 14:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fPcEyy7Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89654249E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ln2xZg/yN1wAZTwGNHVNdcDq1Mx60CJrrKQNNHcP9Ak=; b=fPcEyy7Y92zOt2
	yBL5TgC5hKsOMmxtPaCI+Npf8oxNGaZTFAdPPkN8xPoBrCbQySDbum7jjgiB1jvqVCpZT4dlHa5lU
	5RaFL9mlixndY7S/OYmaqAWkxU6F8RQal0xEwtkdTCyh9Rv8MM5VkBq+eN7Up151UsIrviVDvMJlU
	WJQngsHVX05GqB1V7DLCZhHRc3Lm5CiewEoIyxp+lFFRs9s5SLFXnGYUCxxAnKbI/K5IMLV6fYBaQ
	DSD6E8Ue1t9GwsJtErcinKex4ZgR86sPfxD88xkeUzTo2ZP0RvPzMVcxku54jSMHTid0LkQY/qMFx
	/Il+EpwgRcB5NL6Zv5kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYAGL-0001TB-7C; Tue, 04 Jun 2019 14:18:05 +0000
Received: from gateway21.websitewelcome.com ([192.185.45.176])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAGG-0001R2-4J
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 14:18:01 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id AC948400D2349
 for <linux-mtd@lists.infradead.org>; Tue,  4 Jun 2019 09:17:45 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id YAG1hNuJG4FKpYAG1hi1KT; Tue, 04 Jun 2019 09:17:45 -0500
X-Authority-Reason: nr=8
Received: from [189.250.127.120] (port=33416 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hYAFz-0006u9-So; Tue, 04 Jun 2019 09:17:44 -0500
Date: Tue, 4 Jun 2019 09:17:37 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH] mtd: onenand_base: Mark expected switch fall-through
Message-ID: <20190604141737.GA1064@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.127.120
X-Source-L: No
X-Exim-ID: 1hYAFz-0006u9-So
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.127.120]:33416
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_071800_246787_7313BCFF 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2ggY2FzZXMKd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMvbXRkL25hbmQvb25l
bmFuZC9vbmVuYW5kX2Jhc2UuYzogSW4gZnVuY3Rpb24g4oCYb25lbmFuZF9jaGVja19mZWF0dXJl
c+KAmToKZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOjMyNjQ6MTc6IHdh
cm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRo
cm91Z2g9XQogICB0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTX05PUF8xOwpkcml2ZXJzL210
ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI2NToyOiBub3RlOiBoZXJlCiAgY2FzZSBP
TkVOQU5EX0RFVklDRV9ERU5TSVRZXzRHYjoKICBefn5+CgpXYXJuaW5nIGxldmVsIDMgd2FzIHVz
ZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MwoKVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBv
bmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCi1XaW1wbGljaXQtZmFsbHRocm91Z2guCgpDYzogSm9u
YXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4KU2lnbmVkLW9mZi1ieTogR3VzdGF2byBB
LiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5k
L29uZW5hbmQvb25lbmFuZF9iYXNlLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2Uu
YyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwppbmRleCBiYTQ2ZDBj
ZjYwYTEuLmJkYjVmNDczM2QyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L29uZW5hbmRfYmFzZS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jh
c2UuYwpAQCAtMzI2Miw2ICszMjYyLDcgQEAgc3RhdGljIHZvaWQgb25lbmFuZF9jaGVja19mZWF0
dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAlzd2l0Y2ggKGRlbnNpdHkpIHsKIAljYXNlIE9O
RU5BTkRfREVWSUNFX0RFTlNJVFlfOEdiOgogCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFT
X05PUF8xOworCQkvKiBmYWxsIHRocm91Z2ggKi8KIAljYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJ
VFlfNEdiOgogCQlpZiAoT05FTkFORF9JU19ERFAodGhpcykpCiAJCQl0aGlzLT5vcHRpb25zIHw9
IE9ORU5BTkRfSEFTXzJQTEFORTsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
