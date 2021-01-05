Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F749C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:07:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9A922AAA
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9A922AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z/xlRt7el/OyncWGm0+hehO1Ov976Ktwz2m5K4ShscM=; b=CseZQc9QrlogIZpBCGYiKRGQW
	gZTzKqOHYjEDAs7MG4+lDM7JBD/45MmnFdOtKsstbk9KMJb2k38uJxmB5/kApywzPzNpr8ngGH/XG
	BQE15iIqSxJc9nViy8qyPx4Xd8/SAwCboQmZ1Tv+MO6YcVK8kZRwy9vufTZd2gN3osIcovSbIM2+P
	gECBjiNUzxedI1IWIuEj7zeBoiEwdFDqqqHQNuyGwKLthMhG/1oOKAAm1HNg1s0BOQe33qlg/p5NG
	sPJVbJe8ittLSLK6n70ztDVjt5cW4DGVmWmtHwS9MlWOdd4/q8ldQGFko5ofpWqjbSXO0d+eqioY2
	kyx2D+wrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwmz7-00046h-VP; Tue, 05 Jan 2021 14:06:54 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwmz1-00041v-7F
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 14:06:51 +0000
X-Originating-IP: 90.89.98.255
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4F0391C000F;
 Tue,  5 Jan 2021 14:06:37 +0000 (UTC)
Date: Tue, 5 Jan 2021 15:06:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 06/10] mtd: Remove drivers used by TX49xx
Message-ID: <20210105150636.175598fc@xps13>
In-Reply-To: <20210105140305.141401-7-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-7-tsbogend@alpha.franken.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_090647_389491_63BCDBA1 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-rtc@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5k
ZT4gd3JvdGUgb24gVHVlLCAgNSBKYW4KMjAyMSAxNTowMjo1MSArMDEwMDoKCj4gQ1BVIHN1cHBv
cnQgZm9yIFRYNDl4eCBpcyBnZXR0aW5nIHJlbW92ZWQsIHNvIHJlbW92ZSBNVEQgc3VwcG9ydCBm
b3IgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dlbmRA
YWxwaGEuZnJhbmtlbi5kZT4KCklmIHRoZSByZW1vdmFsIGhhcHBlbnMsIHlvdSBtYXkgdGFrZSB0
aGlzIHBhdGNoIHRocm91Z2ggdGhlIG1pcHMgdHJlZS4KCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKT25lIGxlc3MgZHJpdmVyIHRvIGNvbnZlcnQg
dG8gLT5leGVjX29wKCkgOi0pCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tYXBzL0tjb25maWcgICAg
ICAgICAgICAgICAgIHwgICA2IC0KPiAgZHJpdmVycy9tdGQvbWFwcy9NYWtlZmlsZSAgICAgICAg
ICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvbXRkL21hcHMvcmJ0eDQ5MzktZmxhc2guYyAgICAg
ICAgfCAxMzMgLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAg
ICAgIHwgICA3IC0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAgICAgICAgICB8
ICAgMSAtCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3R4eDluZGZtYy5jICAgICAgICAgfCA0MjMg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3R4
eDkvbmRmbWMuaCB8ICAyOCAtLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDU5OSBkZWxldGlvbnMoLSkK
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL21hcHMvcmJ0eDQ5MzktZmxhc2guYwo+
ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcvdHh4OW5kZm1jLmMKPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS90eHg5L25kZm1j
LmgKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
