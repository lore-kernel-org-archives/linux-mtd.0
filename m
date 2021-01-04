Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F0DC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 13:20:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16EC2072D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 13:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16EC2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d6066cF3bhmzTzesgLGRYOJvo1oNrhVsd7U0QNBuTXg=; b=NXjL6AC2qOZomR1Cr65ErYHH6
	SQFGcez9Arrgot4WO+8neDn4v6QGEPw3y14paqQHRWkmxIicP3jYWrMcFBak0V443R9s5LpOLUIoR
	pBJCnewC7Mgge8l5dGvRcRdpFy9gxcPiF7PMm/kQ0HydOEKNVIh6veM+sxkaEqgiPc1tJYZ1I2/r5
	NF62G5Mg4sbpqFRkfKv7r3hG8646S8eNkYA11JhUG+6wr8uMdNYUJ+R+GHHAFL6xJKJTeqEhArX/F
	G2blRuBSaSU1kptBQc66Ra+I35YVPxyYtu5mKTJwGVlEqSY2FOkqVB/OaTZvxJjSrqxIW/Pumo4he
	zIXl+0Jfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPlx-0004WN-QI; Mon, 04 Jan 2021 13:19:45 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPls-0004V5-IS
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 13:19:45 +0000
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D0640240003;
 Mon,  4 Jan 2021 13:19:33 +0000 (UTC)
Date: Mon, 4 Jan 2021 14:19:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] mtd: rawnand: intel: remove broken code
Message-ID: <20210104141932.1037f8e3@xps13>
In-Reply-To: <CAFBinCDw_Zwwww88Vd2yU5sMZxYg-NQWHhLiuV7A5rhApeNroA@mail.gmail.com>
References: <20201217221148.2877318-1-martin.blumenstingl@googlemail.com>
 <20210104094849.1850c993@xps13>
 <CAFBinCDw_Zwwww88Vd2yU5sMZxYg-NQWHhLiuV7A5rhApeNroA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_081940_709547_C90C7060 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: vadivel.muruganx.ramuthevar@linux.intel.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org, richard@nod.at
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4gd3JvdGUgb24gTW9uLAo0IEphbiAyMDIxIDE0OjEzOjA0ICswMTAwOgoKPiBI
aSBNaXF1ZWwsCj4gCj4gdGhhbmsgeW91IGZvciBsb29raW5nIGludG8gdGhpcwo+IAo+IE9uIE1v
biwgSmFuIDQsIDIwMjEgYXQgOTo0OCBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cm90ZToKPiBbLi4uXQo+ID4gPiAgICAgICBuYW5kX3NldF9mbGFzaF9ub2Rl
KCZlYnVfaG9zdC0+Y2hpcCwgZGV2LT5vZl9ub2RlKTsKPiA+ID4gLSAgICAgaWYgKCFtdGQtPm5h
bWUpIHsKPiA+ID4gLSAgICAgICAgICAgICBkZXZfZXJyKGVidV9ob3N0LT5kZXYsICJOQU5EIGxh
YmVsIHByb3BlcnR5IGlzIG1hbmRhdG9yeVxuIik7Cj4gPiA+IC0gICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiA+IC0gICAgIH0gIAo+ID4KPiA+IFRoaXMgaXMgdmFsaWQgY29kZSwgaXQn
cyBiZXN0IHRvIHVzZSBhIGxhYmVsID0gIm15LXN0b3JhZ2UiOyBwcm9wZXJ0eQo+ID4gaW4geW91
ciBOQU5EIERUIG5vZGUuIFRoZW4gbXRkLT5uYW1lIHdpbGwgYmUgdXBkYXRlZCBieQo+ID4gbmFu
ZF9zZXRfZmxhc2hfbm9kZSgpLiAgCj4gc28geW91IHN1Z2dlc3QgbW92aW5nIHRoZSBjaGVjayBp
bnN0ZWFkPwo+IHRoZSBvcmlnaW5hbCBjb2RlIGZsb3cgd2FzOgo+ICAgbXRkID0gTlVMTDsKPiAg
IGlmICghbXRkLT5uYW1lKQo+ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICBtdGQgPSBuYW5kX3Rv
X210ZCgmZWJ1X2hvc3QtPmNoaXApOwo+ICAgLi4uCj4gCj4gYnkgc2F5aW5nIHRoYXQgdGhlIGNv
ZGUgaXRzZWxmIGlzIHZhbGlkIHlvdSdyZSBhc2tpbmcgbWUgdG8gdXBkYXRlIHRoZQo+IGZsb3cg
dG8gdGhlIGZvbGxvd2luZzoKPiAgIG10ZCA9IG5hbmRfdG9fbXRkKCZlYnVfaG9zdC0+Y2hpcCk7
Cj4gICBpZiAoIW10ZC0+bmFtZSkKPiAgICAgIHJldHVybiAtRUlOVkFMOwoKSSBhY3R1YWxseSBt
aXNzZWQgdGhlIGZhY3QgdGhhdCBtdGQgd2FzIHVzZWQgaW5pdGlhbGl6ZWQsIGJ1dCB5ZXMgdGhh
dAppcyBleGFjdGx5IHdoYXQgSSBtZWFudCEKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
