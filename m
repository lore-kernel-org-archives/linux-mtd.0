Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5444DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 07:11:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2BF360232
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 07:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2BF360232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:Date:Cc:To:From
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qTBBYUQJL5gRVnSeWAXUW6jTJLbAIa2WSTgV69rppDY=; b=qgFyuXaSmddXwC
	zGfOM2Al7KiHget8PrafkmxpFpRtM/JpJndlNBNtsI+dS26JAUfZcytIH6xFURL05+MHOcRjz2moO
	GLRtuLT0p2wcTCTrCFlOhS4qXxy0bsXH3aqNELNsoLRdAZVnhVKtzPSXyepzAqUzxXCWkZbShZfXa
	VJrWKfViKR9+W74U/lm1PRjbQ1CJw8ciNRScx//arg2X1oJ7jDVTxv4kt23lAJ3CuWpo4+7knve6e
	SzU5PC8wZUXF0ncGuPHD5JeMJ0qQ1WOzERMtMAZwSRYR60+NN/INscDvdO+vefEdftzH5r2wmwuHu
	Mh6+bdhWmikH1b45mXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYk1y-001oF6-Td; Fri, 08 Oct 2021 07:10:58 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYk1v-001oDj-TM
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 07:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633677055; x=1665213055;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=jWRHRVPBFUVetVaD+ip2tzxDrpeioyY+OQf4Xmta5Mg=;
 b=S643uS5AnRhHcK8lL25YWdvxcs2jLmh/tvBaZuMGbi3Rjd0CYICyVNPH
 pO2VfbAfCkcCho4vG00EqRiUrmbs91wLPflYHHYEE//O1/YsUJhr4tfEs
 zpS7zM5Y5tCjiXnqDmjlqaQfX/xqSc9hIWiW5FEAOj/G/lxep6r2d//qs
 F34MGmhZmNjIT9PEZTjnKjuNqwrnrqbDgKmZAHYcUlot6IgTbKEhPdY8H
 Fx8vSdBzAhlbbd6pmmVluJYQCjP4i0EJwFUaIQotInLYZfyM1jJBdwRRZ
 q5d99aVttqI+PHVC9uIbxxOkOkOYig6kSAD4hJhs4XYxxvk2yzJi2KIea A==;
X-IronPort-AV: E=Sophos;i="5.85,356,1624312800"; d="scan'208";a="19934038"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 08 Oct 2021 09:10:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 08 Oct 2021 09:10:47 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 08 Oct 2021 09:10:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633677047; x=1665213047;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=jWRHRVPBFUVetVaD+ip2tzxDrpeioyY+OQf4Xmta5Mg=;
 b=TOZYn8l2TBErpX73ID7emRlGD4OrAv8fcevpHjHSgNu9yomgJDAwpjtF
 7FBYuXswMe2prDoBalCQWy3GdfbCCbtaB4Nn3aaxpijgO41p2CIQP9sog
 EZ8wZQkB4UNOtsmmPDeNqq1bY1tQNqMhIwTrSGiUTOPQs5iMmcOCgHuwM
 BrZRFZ36NjOf+VQcj4+byOwfBlpL1rBldU0ECRahJHNKdEcUBZVthy51U
 6dHUZ/YHH3280U/kOz2QHntapN/wkiRq/hgUK8VdO8JOk40Fj2dVDZdri
 BnrAinhKHJ5DYKdccDEZ+7QAc9BFQaDoAb8ROFREAQ/E7U95KmeCYzfid A==;
X-IronPort-AV: E=Sophos;i="5.85,356,1624312800"; d="scan'208";a="19934037"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Oct 2021 09:10:47 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id E992E280065;
 Fri,  8 Oct 2021 09:10:46 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Fri, 8 Oct 2021 09:10:46
 +0200
Subject: AW: (EXT) Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add
 output-driver-strength property
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Rob Herring" <robh@kernel.org>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Tudor Ambarus" <tudor.ambarus@microchip.com>,
 =?us-ascii?Q?linux-kernel=40vger=2Ekern?= =?us-ascii?Q?el=2Eorg?=
 <linux-kernel@vger.kernel.org>, "Michael Walle" <michael@walle.cc>,
 =?us-ascii?Q?devicetree=40vger=2Ekernel=2Eorg?= <devicetree@vger.kernel.org>, 
 "Richard Weinberger" <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rob Herring" <robh@kernel.org>,
 =?us-ascii?Q?linux-mtd=40lists=2Einfradead=2Eorg?=
 <linux-mtd@lists.infradead.org>, "Pratyush Yadav" <p.yadav@ti.com>
Date: Fri, 8 Oct 2021 07:10:46 +0000
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.RpXtjvjwSXyzkQ19eSpGDg.AB9KnRO81wE@vtuxmail01.tq-net.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_001056_308774_07BF48C2 
X-CRM114-Status: GOOD (  19.53  )
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

T24gTW9uLCAwNSBPY3QgMjAyMSAxNDoyNjoyOCArMDIwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4g
RnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBPbiBNb24sIDA0IE9jdCAyMDIx
IDEzOjE1OjI4ICswMjAwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6Cj4gPiBGcm9tOiBBbGV4YW5k
ZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+Cj4gPgo+ID4gVGhpcyBw
cm9wZXJ0eSBpcyBmb3Igb3B0aW1pemluZyBvdXRwdXQgdm9sdGFnZSBpbXBlZGFuY2UgYW5kIGlz
Cj4gPiBzcGVjaWZpYyB0byBlYWNoIGJvYXJkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4KPiA+IC0tLQo+ID4g
SSBjaGVja2VkIE1pY3JvbiBhbmQgTWFjcm9uaXggZGF0YXNoZWV0cy4gQm90aCBoYXZlIHNpbWls
YXIgYnV0IG5vdAo+ID4gaWRlbnRpY2FsIHN1cHBvcnRlZCB2YWx1ZXMuIEFsc28gdGhlIHJlZ2lz
dGVyIGxvY2F0aW9ucyBhcmUgZGlmZmVyZW50Lgo+ID4gRm9yIHRob3NlIHJlYXNvbnMgSSBkZWNp
ZGVkIHRvIHNwZWNpZnkgdGhlIE9obXMgdmFsdWUgZGlyZWN0bHkgYW5kIGxldAo+ID4gdGhlIGRl
dmljZSBzcGVjZmljIGRyaXZlciBmaWd1cmUgb3V0IGlmIGl0IGlzIHN1cHBvcnRlZCB3aGVyZSB0
byB3cml0ZQo+ID4gaXQgdG8uCj4gPiBCVFc6IEFyZSB0aGUgT2htIHZhbHVlcyBhbmQgdGhlIGNv
cnJlc3BvbmRpbmcgcmVnaXN0ZXIgYml0cyBzdGFuZGFyZGl6ZWQKPiA+IHNvbWV3aGVyZT8KPiA+
Cj4gPsKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5v
ci55YW1sIHwgNiArKysrKysKPiA+wqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
ID4KPgo+IFJ1bm5pbmcgJ21ha2UgZHRic19jaGVjaycgd2l0aCB0aGUgc2NoZW1hIGluIHRoaXMg
cGF0Y2ggZ2l2ZXMgdGhlCj4gZm9sbG93aW5nIHdhcm5pbmdzLiBDb25zaWRlciBpZiB0aGV5IGFy
ZSBleHBlY3RlZCBvciB0aGUgc2NoZW1hIGlzCj4gaW5jb3JyZWN0LiBUaGVzZSBtYXkgbm90IGJl
IG5ldyB3YXJuaW5ncy4KPgo+IE5vdGUgdGhhdCBpdCBpcyBub3QgeWV0IGEgcmVxdWlyZW1lbnQg
dG8gaGF2ZSAwIHdhcm5pbmdzIGZvciBkdGJzX2NoZWNrLgo+IFRoaXMgd2lsbCBjaGFuZ2UgaW4g
dGhlIGZ1dHVyZS4KPgo+IEZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBoZXJlOiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3BhdGNoLzE1MzYwNjIKClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBv
dXQuIEkgY2hlY2tlZCB0aGUgYW1vdW50IG9mIGVycm9yIG1lc3NhZ2VzIHJlbGF0ZWQgdG8KamVk
ZWMsc3BpLW5vci55YW1sIGJlZm9yZSBhbmQgYWZ0ZXIgYXBwbHlpbmcgdGhlc2UgcGF0Y2hlcyB1
c2luZwo+IEFSQ0g9YXJtNjQgbWFrZSAtajEyIGR0YnNfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sIDI+
JjEgPiAvZGV2L251bGwgfCB3YyAtbAoKd2l0aCBhbGwgYXJtNjQgcGxhdGZvcm1zIGVuYWJsZWQu
IFRoZXJlIHdhc24ndCBhIGNoYW5nZSBpbiB0aGUgbGluZSBjb3VudCwKc28gSSBhc3N1bWUgdGhp
cyBuZXcgYmluZGluZyBkaWRuJ3QgY2F1c2UgdGhlbS4KCkJlc3QgcmVnYXJkcywKQWxleGFuZGVy
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
