Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410F5C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 08:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0711A613B0
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 08:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0711A613B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HK4AKnmSqntjpUH4XaXeJOZ9zO+/YpGSHVA3P/odiIs=; b=q57A8s6Y9u5AdE
	vVOddbsDlowlOJ4HmNaCE31HYjC3FFccBleX1BjIdPgFJ5mIhna5AJ97H8bx2C88OYgxD5fpp/rAO
	12PQkFk5wQqKqGYce5mnLdgachpB4oIQir54Z6NeHhYUqDAbJNQHwsYr/oP+Zvf8KMjnOJlW5DsyO
	bJINTyIlYmQX7HoHblAoPgUA2Iok3LI84aTLvcKz8Yj3sY2NbFkhb1c1PvfsCB19WG+u5KK8Pb5XS
	6QG0dnuMVTrtd8EpG1OYz5meMeaCdVejACE8kZ/gwCCiE+jNsUa9BIM0wKBDQtuOZpWtrUDvz0/KA
	rO+IDR6T+CvAoMNx865A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lloye-00CTEh-Uo; Wed, 26 May 2021 08:33:21 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lloy6-00CSyn-UC; Wed, 26 May 2021 08:32:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CE013FF80D;
 Wed, 26 May 2021 08:32:41 +0000 (UTC)
Date: Wed, 26 May 2021 10:32:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: patrice.chotard@foss.st.com, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 christophe.kerello@foss.st.com
Subject: Re: [PATCH v5 0/3] MTD: spinand: Add spi_mem_poll_status() support
Message-ID: <20210526103240.1c71002c@xps13>
In-Reply-To: <20210519191836.GH4224@sirena.org.uk>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
 <20210519191836.GH4224@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_013247_148224_B4BE2130 
X-CRM114-Status: GOOD (  13.26  )
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

SGkgTWFyaywKCk1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGUgb24gV2VkLCAx
OSBNYXkgMjAyMSAyMDoxODozNgorMDEwMDoKCj4gT24gVHVlLCBNYXkgMTgsIDIwMjEgYXQgMDY6
Mjc6NTFQTSArMDIwMCwgcGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tIHdyb3RlOgo+ID4gRnJv
bTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gPiAKPiA+
IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIHNwaV9tZW1fcG9sbF9zdGF0dXMoKSBz
cGluYW5kCj4gPiBpbnRlcmZhY2UuCj4gPiBTb21lIFFTUEkgY29udHJvbGxlcnMgYWxsb3dzIHRv
IHBvbGwgYXV0b21hdGljYWxseSBtZW1vcnkgCj4gPiBzdGF0dXMgZHVyaW5nIG9wZXJhdGlvbnMg
KGVyYXNlLCByZWFkIG9yIHdyaXRlKS4gVGhpcyBhbGxvd3MgdG8gCj4gPiBvZmZsb2FkIHRoZSBD
UFUgZm9yIHRoaXMgdGFzay4KPiA+IFNUTTMyIFFTUEkgaXMgc3VwcG9ydGluZyB0aGlzIGZlYXR1
cmUsIGRyaXZlciB1cGRhdGUgYXJlIGFsc28KPiA+IHBhcnQgb2YgdGhpcyBzZXJpZXMuICAKPiAK
PiBUaGUgU1BJIGJpdHMgbG9vayBnb29kIHRvIG1lIC0gc2hvdWxkIHdlIG1lcmdlIHZpYSBNVEQg
b3IgU1BJPwoKSSBkb24ndCBleHBlY3QgYW55IGNvbmZsaWN0cyB3aXRoIHRoZSBjdXJyZW50IGNo
YW5nZXMgaW4gTVRELCBJIGp1c3QKYWNrZWQgdGhlIFNQSS1OQU5EIHBhdGNoLCB5b3UgbWF5IHRh
a2UgaXQgdGhyb3VnaCBTUEkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
