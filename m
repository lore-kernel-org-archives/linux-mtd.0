Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57E3D44D56
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/jVOzxrhlNBN9NcXmtP0F3Lz6fRPhbZkP/Mjz4nwQc=; b=E0xjs9X/Xk1H6K
	Ct8xNjMHFT2aScpKovs3pIX0Vs/Jew0kurBBqAQK95E3DIASlFAtvKrBBP+GVl4KngqwtzoPMFaS5
	tbmAgJ2KsXL/tJRQfxWcM/XY5xc4QkXWySIovWjLUWtL8wXigoC14oqOTk/auFr7RFUzEQq3inERx
	uHhnvkoPU7m4MzJvxAbyGWqrFK/v2QNBHXIAGAvSPYRo8tj1ID8BmJ+qTYiZEp65gV/+q+STuehmk
	gPx7zQ0rNVVHAcrkTtHkBmVVJdmjLO68NEoWJp4dnRESUc6AMNG6Yapbyg8h0/7HaohTwHVF+rvRD
	L9Me5IThDhJ1QlVjtczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zz6-00000006X3N-2tRC;
	Thu, 07 Nov 2024 10:43:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zvp-00000006W8N-3zBd
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 10:40:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E87081BF209;
	Thu,  7 Nov 2024 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730976003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgSzosFJSH8w/4ycn/e9QMvALB4jweT7uSpUF3seKmA=;
	b=cFYIgntuquIvNe88nPbQ5rZSSFJJJMyAIIV3q5982B47Py6rcIwtjBnsIJeBca4j7VXDTv
	OM+4LaAEvMe9+P5p8XAXD3qZQvAlnJe14BIp62qqnwO9Vmze+o2n8Uw13Iu/VjRRDp1fJI
	+E9CqjVqTQR04sReuVFR8fZ+8nzrbPxMSC4FJphquJcI7w8JmMMX0m2G5E+TLOvtD36lvy
	VaggWdXWUi3iMISfAWuUL1Jn39WzLWWi7QV77Cbd/1cne5RkYS4yoklHelQJbpErRJLtV3
	YJeXrTZ607goiMaP+8zrd9ZzoeIwbMV9xNAJ8bCC4aw6u00vDkW1iDOsBYgx1g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  linux-mtd@lists.infradead.org,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 02/24] spi: spi-mem: Add a new controller capability
In-Reply-To: <586cf617-37ee-4859-a11b-67654d650380@sirena.org.uk> (Mark
	Brown's message of "Fri, 1 Nov 2024 20:17:33 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-3-miquel.raynal@bootlin.com>
	<586cf617-37ee-4859-a11b-67654d650380@sirena.org.uk>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Thu, 07 Nov 2024 11:40:00 +0100
Message-ID: <871pznqqdb.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_024006_299419_7EEEC1CE 
X-CRM114-Status: GOOD (  19.48  )
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

CkhpIE1hcmssCgpUaGFua3MgYSBsb3QgZm9yIHRoZSB0ZXN0aW5nIGFuZCBzb3JyeSBmb3IgYmVp
bmcgc2xvdy4KCk9uIDAxLzExLzIwMjQgYXQgMjA6MTc6MzMgR01ULCBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIE9jdCAyNSwgMjAyNCBhdCAwNjoxNDoz
OVBNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBUaGVyZSBhcmUgc3BpIGRldmljZXMg
d2l0aCBtdWx0aXBsZSBmcmVxdWVuY3kgbGltaXRhdGlvbnMgZGVwZW5kaW5nIG9uCj4+IHRoZSBp
bnZva2VkIGNvbW1hbmQuIFdlIHByb2JhYmx5IGRvIG5vdCB3YW50IHRvIGFmZm9yZCBydW5uaW5n
IGF0IHRoZQo+PiBsb3dlc3Qgc3VwcG9ydGVkIGZyZXF1ZW5jeSBhbGwgdGhlIHRpbWUsIHNvIGlm
IHdlIHdhbnQgdG8gZ2V0IHRoZSBtb3N0Cj4+IG9mIG91ciBoYXJkd2FyZSwgd2UgbmVlZCB0byBh
bGxvdyBwZXItb3BlcmF0aW9uIGZyZXF1ZW5jeSBsaW1pdGF0aW9ucy4KPgo+IEFmdGVyIGFwcGx5
aW5nIHRoaXMgcGF0Y2ggKEkgYmlzZWN0ZWQgdGhlIHNlcmllcykgbXkgQXZlbmdlcjk2IGJvYXJk
Cj4gc3RhcnRlZCBmYWlsaW5nIHRvIHByb2JlIHRoZSBTUEkgTk9SIGZsYXNoIGl0IGhhczoKPgo+
IFsgICAgMy41Njc4NzZdIHNwaS1ub3Igc3BpMC4wOiBwcm9iZSB3aXRoIGRyaXZlciBzcGktbm9y
IGZhaWxlZCB3aXRoCj4gZXJyb3IgLTk1CgpUaGlzIGlzIGFuIEVPUE5PVFNVUFAgc28gbWF5YmUg
dGhlcmUgaXMgYSBuZXcgY2hlY2sgdGhhdCBpcyBicmVha2luZwp5b3VyIGJvYXJkLiBJIGNoZWNr
ZWQgdGhlIGhhcmR3YXJlIG1hbnVhbCwgdGhleSB0YWxrIGFib3V0IGEgTk9SCmZsYXNoLiBMb29r
aW5nIGF0IHRoZSBjb2RlLCBJIGJlbGlldmUgSSBmb3Jnb3QgdGhlIFNQSS1OT1IgY2FzZSB3aGlj
aApjdXJyZW50bHkgZG9lcyBub3QgKHlldD8pIHVzZSB0aGUgb3AtPm1heF9mcmVxIHBhcmFtZXRl
ci4KCj4gRnVsbCBqb2I6Cj4KPiAgICBodHRwczovL2xhdmEuc2lyZW5hLm9yZy51ay9zY2hlZHVs
ZXIvam9iLzkyNTE1Ngo+Cj4gSSBkaWRuJ3Qgc3BvdCBhbnl0aGluZyB3aXRoIHRoZSBjb2RlIG9u
IGEgcmVjaGVjayBidXQgaXQncyBsYXRlIG9uIGEKPiBGcmlkYXkgc28gSSd2ZSBub3QgbG9va2Vk
IHRvbyBoYXJkLiAgTXkgb3RoZXIgYm9hcmRzIGFyZSBhbGwgZmluZSB0aG91Z2gKPiB0aGVyZSdz
IGxpbWl0ZWQgY292ZXJhZ2UuCgpXb3VsZCB5b3UgbWluZCB0ZXN0aW5nIHRoZSBzZXJpZXMgd2l0
aCB0aGlzIGNoYW5nZSBvbiB0b3AgYW5kIHRlbGwgbWUgaWYKdGhhdCBmaXhlcyBpdD8KCi0tLSBh
L2RyaXZlcnMvc3BpL3NwaS1tZW0uYworKysgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKQEAgLTE4
NCw3ICsxODQsNyBAQCBib29sIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcChzdHJ1Y3Qgc3Bp
X21lbSAqbWVtLAogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgICAg
fQogCi0gICAgICAgaWYgKG9wLT5tYXhfZnJlcSA8IG1lbS0+c3BpLT5tYXhfc3BlZWRfaHopIHsK
KyAgICAgICBpZiAob3AtPm1heF9mcmVxICYmIG9wLT5tYXhfZnJlcSA8IG1lbS0+c3BpLT5tYXhf
c3BlZWRfaHopIHsKICAgICAgICAgICAgICAgIGlmICghc3BpX21lbV9jb250cm9sbGVyX2lzX2Nh
cGFibGUoY3RsciwgcGVyX29wX2ZyZXEpKQogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7CiAgICAgICAgfQoKSSBkb24ndCBrbm93IGhvdyBlYXN5IGl0IGlzIGZvciB5b3UgdG8g
bWFrZSB0aGF0IHRlc3Qgd2l0aCBsYXZhLCBsZXQgbWUKa25vdyBpZiB5b3UgcHJlZmVyIG1lIHRv
IHNlbmQgYSBmaXh1cCEgcGF0Y2ggb3IgZXZlbiByZXNlbmQgdGhlIHdob2xlCnNlcmllcyAoYnV0
IGl0J3MgYSBiaXQgYmlnKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
