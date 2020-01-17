Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC14C33CB1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 09:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3250F2082F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 09:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hMdKse9T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3250F2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4P0lqiYTTXdKdFQiLUMmjSPqlm+HbHfX0N8tha+wt7U=; b=hMdKse9TfhlHdP
	r6O/gP0XO42jcM3d14TdLYY9d/x4G3+w0TMcKLmljlfHvj1m+Ns0d8XwEINAJ+Bgr5KnQ4MmgSgoi
	kgCAHY6zRGA9Pxr6bKftT02FMPUh1FaA2eVXpMPdoXIV+dS8Y7oUEpgjyPNl/eLxvgPi8cPYn2EVU
	3w1muEj1v4KyTkIh2NpBEXIGa6cRdD4WT4YamWPD5aktdQs8PnnIFVzsJDM5QUthazsJT/LGGQLxR
	yg1O+H9J5+SNo4w6RlSZZRke7MEt1Jj/FobG/wZmd3mcdxR5LiRZYP1KTne222oYhffwFl9D4Lqij
	l4VCugNrUThL2hv5MJMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isNhg-0004bZ-UF; Fri, 17 Jan 2020 09:14:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isNhZ-0004ag-VB
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 09:14:07 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0B6A9FF80F;
 Fri, 17 Jan 2020 09:13:46 +0000 (UTC)
Date: Fri, 17 Jan 2020 10:13:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add support for Macronix NAND
 randomizer
Message-ID: <20200117101346.3611dc0a@xps13>
In-Reply-To: <OFECBDB130.03AD44B7-ON482584F2.002B40F2-482584F2.002B720F@mxic.com.tw>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
 <1571902807-10388-2-git-send-email-masonccyang@mxic.com.tw>
 <20200109172816.6c1d7be7@xps13>
 <OFECBDB130.03AD44B7-ON482584F2.002B40F2-482584F2.002B720F@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_011402_141491_A4F52C71 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICBzdGF0aWMgdm9pZCBtYWNyb25peF9u
YW5kX29uZmlfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ID4gPiAgewo+ID4gPiAgICAg
c3RydWN0IG5hbmRfcGFyYW1ldGVycyAqcCA9ICZjaGlwLT5wYXJhbWV0ZXJzOwo+ID4gPiAgICAg
c3RydWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXggKm14aWM7Cj4gPiA+ICsgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmRuID0gbmFuZF9nZXRfZmxhc2hfbm9kZShjaGlwKTsKPiA+ID4gKyAgIGlu
dCByYW5kX290cCA9IDA7Cj4gPiA+ICsgICBpbnQgcmV0Owo+ID4gPiAKPiA+ID4gICAgIGlmICgh
cC0+b25maSkKPiA+ID4gICAgICAgIHJldHVybjsKPiA+ID4gCj4gPiA+ICsgICBpZiAob2ZfZmlu
ZF9wcm9wZXJ0eShkbiwgIm14aWMsZW5hYmxlLXJhbmRvbWl6ZXItb3RwIiwgTlVMTCkpCj4gPiA+
ICsgICAgICByYW5kX290cCA9IDE7Cj4gPiA+ICsKPiA+ID4gICAgIG14aWMgPSAoc3RydWN0IG5h
bmRfb25maV92ZW5kb3JfbWFjcm9uaXggKilwLT5vbmZpLT52ZW5kb3I7Cj4gPiA+ICsgICAvKiBT
dWJwYWdlIHdyaXRlIGlzIHByb2hpYml0ZWQgaW4gcmFuZG9taXplciBvcGVyYXRvaW4gKi8gIAo+
ID4gCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3aXRoICAgICAg
ICAgIG9wZXJhdGlvbgo+ID4gICAKPiA+ID4gKyAgIGlmIChyYW5kX290cCAmJiBjaGlwLT5vcHRp
b25zICYgTkFORF9OT19TVUJQQUdFX1dSSVRFICYmCj4gPiA+ICsgICAgICAgbXhpYy0+cmVsaWFi
aWxpdHlfZnVuYyAmIE1BQ1JPTklYX1JBTkRPTUlaRVJfQklUKSB7Cj4gPiA+ICsgICAgICBpZiAo
cC0+c3VwcG9ydHNfc2V0X2dldF9mZWF0dXJlcykgewo+ID4gPiArICAgICAgICAgYml0bWFwX3Nl
dChwLT5zZXRfZmVhdHVyZV9saXN0LAo+ID4gPiArICAgICAgICAgICAgICAgT05GSV9GRUFUVVJF
X0FERFJfTVhJQ19SQU5ET01JWkVSLCAxKTsKPiA+ID4gKyAgICAgICAgIGJpdG1hcF9zZXQocC0+
Z2V0X2ZlYXR1cmVfbGlzdCwKPiA+ID4gKyAgICAgICAgICAgICAgIE9ORklfRkVBVFVSRV9BRERS
X01YSUNfUkFORE9NSVpFUiwgMSk7Cj4gPiA+ICsgICAgICAgICByZXQgPSBtYWNyb25peF9uYW5k
X3JhbmRvbWl6ZXJfY2hlY2tfZW5hYmxlKGNoaXApOwo+ID4gPiArICAgICAgICAgaWYgKHJldCA8
IDApCj4gPiA+ICsgICAgICAgICAgICBwcl9pbmZvKCJNYWNyb25peCBOQU5EIHJhbmRvbWl6ZXIg
ZmFpbGVkXG4iKTsKPiA+ID4gKyAgICAgICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgIHByX2lu
Zm8oIk1hY3Jvbml4IE5BTkQgcmFuZG9taXplciBlbmFibGVkXG4iKTsgIAo+ID4gCj4gPiBNYXli
ZSB3ZSBzaG91bGQgdXBkYXRlIHRoZSBiaXRtYXBzIG9ubHkgaWYgaXQgc3VjY2VlZHM/ICAKPiAK
PiBva2F5LCB3aWxsIGRyb3AgcHJfaW5mbygpOwoKSXQncyBub3QgbXkgcG9pbnQsIHlvdSBjYW4g
a2VlcCB0aGUgcHJfaW5mbywgSSBqdXN0IHNheSB0aGF0IHlvdSBzaG91bGQKY2hlY2sgcmV0IGJl
Zm9yZSB1cGRhdGluZyB0aGUgYml0bWFwIG1heWJlPyBPdGhlcndpc2UgaWYKbWFjcm9uaXhfbmFu
ZF9yYW5kb21pemVyX2NoZWNrX2VuYWJsZSgpIGZhaWxzLCB5b3UgZW5kIHVwIHdpdGhvdXQgdGhl
CmZlYXR1cmUgYnV0IHdpdGggaXRzIGJpdCBzZXQgaW4gdGhlIGJpdG1hcC4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
