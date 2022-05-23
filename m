Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617F9C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEWA/Z/CJM5qL5724rsX9BAYk6tFFH7Zfy4Yi4WKZE0=; b=KS34pSDpIlprsx
	uUyqWvz5S4JyVNNu8tohafK5DD+DekbZi7C3cUvdPg5z5GR4hQWnBVXje6hM4MmUq5vOGjedmiQqf
	CRARPUxMVI6q/gGRaVwh0exbno09C2sC9wgwQ68Tb0LQpDjPSa2ppIuVkjPcXvBnLeMTrW4T1JkX6
	HGnugwE/+0cUq+fBel4CAcF0TFNe5VAc5ybRwP5E5/X/3Xi2BsBHaQS92Uf7zN6B5FPLEwichA8k5
	hRQ/5TQZOaFLqzTX8PTThGiM+KH0xPS0KrK2eLA7CjV6kgPlNIwwGpd8VVcv8l9USMy+GlqEE2l9D
	qE85YI633XKVzDcHsfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9bH-004q9w-R8; Mon, 23 May 2022 15:04:03 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9bE-004q9R-I7
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 15:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653318240; x=1684854240;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8ReV047EYtCbMUXsoUg3vLWxCvg/Zeg6iwFf6J0iLBs=;
 b=lgRe5sIDneQ7IJH4aJ28ZggWpA5GjXHR9bEsa0KiIC7DDTSXwmi8CrHk
 SfB97EeZX1N8WosFiWRvhVBI3oQOS+Azrzn6fC206p7JKQf2HvN0+4FDi
 036nmus0JA/1FYvkk33ghTf/f/mVGqgxfpZDu1+xA4XDzexCjEEFjUH07
 3bRognCEWvbqYST7Cy6pEus5li5IX6oIAnv2k14Om/ZOn5E0MUC+qT8AR
 DsZjB3nqdAEIxO0h4dV2/45JKlM2ZohzDrUaEaDVJ/dzm1YN3rA7WH4v+
 wBeJveFJnstOnp7Bdl2MJ+xiyfAcLjcYClva76RlTa6iSDRitNGWEwqHD g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="298563057"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="298563057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:03:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600691370"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.171.16])
 ([10.249.171.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 08:03:51 -0700
Message-ID: <a7bbd451-e054-c69c-6e39-e73320878b8f@linux.intel.com>
Date: Mon, 23 May 2022 23:03:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: Add support for mx66l2g45g
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
References: <20220523143002.1754922-1-jiaqing.zhao@linux.intel.com>
 <fde9bd5a-7161-9222-4719-4279b2416163@linux.intel.com>
 <35d64d702798d437245090ce96ae29a8@walle.cc>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <35d64d702798d437245090ce96ae29a8@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_080400_682471_226BC367 
X-CRM114-Status: GOOD (  11.15  )
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

T24gMjAyMi0wNS0yMyAyMjo1OSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBBbSAyMDIyLTA1LTIz
IDE2OjMzLCBzY2hyaWViIEppYXFpbmcgWmhhbzoKPj4gVXNlIFBBUlNFX1NGRFAgZm9yIG5vdyBh
cyB0aGUgU05PUl9JRDMoKSBwYXRjaCBpcyBub3QgbWVyZ2VkIHlldCwgd2lsbAo+PiBzd2l0Y2gg
dG8gaXQgYWZ0ZXIgaXQgaXMgbWVyZ2VkLgo+IAo+IEZhaXIgZW5vdWdoLCBjb3VsZCB5b3UgcmVz
dWJtaXQgaXQgd2l0aAo+IHsgIm14NjZsMmc0NWciLMKgIElORk8oMHhjMjIwMWMsIDAsIDAsIDAp
IFBBUlNFX1NGRFAgfSwKPiAKPiBMb29rcyBvZGQsIGJ1dCBpcyB0aGUgc2FtZSBhcyBTTk9SX0lE
MygweGMyMjAxYyksIHNvIHdlIGNhbiBqdXN0Cj4gc3dpdGNoIHRvIHRoZSBuZXcgbWFjcm8gd2l0
aG91dCBhbnkgbW9yZSB0ZXN0aW5nLiBPciBQcmF0eXVzaCBjYW4KPiByZXBsYWNlIGl0IGlubGlu
ZSB3aGlsZSBjb21taXR0aW5nIHRoaXMgcGF0Y2ggaWYgdGhlIFNOT1JfSUQzKCkKPiB3aWxsIG1h
a2UgaXQgaW4gYmVmb3JlLgoKSSdsbCBhZGQgYSBUT0RPIGNvbW1lbnQgaW4gY2FzZSB3ZSBmb3Jn
b3QgaXQuCgo+IC1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
