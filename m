Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CE9C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:51:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C356108B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31C356108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l2FkBTctRfkheaaKUyM6gz/qPMKtH156JFFNwzhih3c=; b=Ofs4BJpYM4epK8Cb5+7CINy6f
	xf9Rm3uLAQ1akxhqHBOl0sw1fZCToxOuxqa2cHIiyRDrT8Ce9Z6gLx1UmqEBFK4p0iRLNv1RbJ5oc
	ZHLtsMzJHQ3G9qoTLsiRveLnJcYX3163fYxD8JGZXduDMuGT4idDmwJRr/sS+16FfQgLu+Qdxzn3M
	J3BZR+OK4nuCt2PIPfiA2Xx8o5UhPX1mwCFqWiKKIyozARGkxrII6q0Nqse0DqSJUT13xg0h5aUEm
	A49I0R00QLKK0yL+gUA+mVq/Kb7XLoLTJILGd/21WJXLbfMxzthQK+GmAYe8MA0AW7PqA5lj7r53Q
	lfO6EumCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2YW-00DpBB-8E; Mon, 10 May 2021 09:50:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2KF-00Dmjm-Tb
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=bZ+bgMkDcjU2znRlHSzcvUHAAYmuPruNQn7uzhentgc=; b=WE11paPZYFBBPcHr3qOrHD97qT
 cy7MefiNYXosK4y9l1BaKneqmdLZpw81xwEtgXsjL2LU7r/HvzdDVjDaabr7cR7hmXomfZrfg9RQn
 L5kzR2iIDlL/SxcYIT6yT3mdmMD0vZ6OAxjclrvKNoAs5PBKUj+5i6oZYSkAayrBRyxLbFP0/ZK7b
 joKtJwFZmZlfTn97DiCiYl+ONFOYxzYPceALlhG5s9YP9Z9t9PCzrWGkCPJss16J3vEGlhBcoSnRw
 aEs1roVQ9DF3TNulemo13OdQ4tZI0SA2zaBtif01IRL7/G/CnqWUINeKctB3kZYhoveF98+6dUAIv
 YNWkYqFg==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2KC-008SeS-G7
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:35:42 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 66AD722234;
 Mon, 10 May 2021 11:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620639333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZ+bgMkDcjU2znRlHSzcvUHAAYmuPruNQn7uzhentgc=;
 b=UHRSBW8yHEEc4Nxk86/NFlgoLSspNtDAL+PZuEfc6vAZqTWNU+CBZ0RgmyAqr44vogsUGd
 5+0FMuegk+XfEbzfV2qX2sFafVLLRFRG/0yDScJsH3A5ih7PdfHHQnUvawv7TOFqZPL+AW
 zbOqFaoZhP3DX3dZSRWaeUVKxcorXFY=
MIME-Version: 1.0
Date: Mon, 10 May 2021 11:35:32 +0200
From: Michael Walle <michael@walle.cc>
To: David Bauer <mail@david-bauer.net>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
In-Reply-To: <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_023540_854440_340C2A47 
X-CRM114-Status: GOOD (  15.59  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGF2aWQsCgpBbSAyMDIxLTA1LTEwIDExOjI4LCBzY2hyaWViIERhdmlkIEJhdWVyOgo+IE9u
IDUvMTAvMjEgMTA6MDAgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGUKPiAKPiBbLi4uXQo+IAo+Pj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBib2hvbmdfcGFydHNbXSA9IHsKPj4+ICvC
oMKgwqAgLyogQm9Ib25nIE1pY3JvZWxlY3Ryb25pY3MgKi8KPj4+ICvCoMKgwqAgeyAiYmgyNXEx
MjhhcyIsIElORk8oMHg2ODQwMTgsIDAsIDY0ICogMTAyNCwgMjU2LAo+PiAKPj4gSSBjb3VsZG4n
dCBmaW5kICJCb0hvbmciIGluIEpFUDEwNkJDLiAweDY4ICh3aXRob3V0IGNvbnRpbnVhdGlvbiAK
Pj4gY29kZXMpCj4+IGlzICJDb252ZXggQ29tcHV0ZXIiLiBTbyB0aGlzIGlzIHdyb25nLiBPVE9I
IEknbSBub3Qgc3VyZSwgaG93IG1hbnkKPj4gU1BJIGZsYXNoZXMgImNvbnZleCBjb21wdXRlciIg
aGF2ZSwgaWYgYW55IDspIFRoaXMgY29tcGFueSB3YXMgYnJvdWdodAo+PiBieSBIUCBpbiB0aGUg
ZW5kLgo+PiAKPj4gSW4gYW55IGNhc2UsIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBob3cgd2UgaGFu
ZGxlIGNvbnRpbnVhdGlvbiBjb2RlcyBvcgo+PiBpZiB3ZSBjYW4gaGFuZGxlIHRoZW0gYXQgYWxs
LiBPciBpZiB0aGlzIGZsYXNoIGp1c3QgbGllIGFib3V0IGl0cwo+PiBtYW51ZmFjdHVyZXIgaWQg
YW5kIGRvbid0IGFuZCBDQy4KPiAKPiBGaXJzdCBvZiBhbGwsIEJvSG9uZyBhbmQgQm95YSBtaWNy
b2VsZWN0cm9uaWNzIHNlZW1zIHRvIGJlIHRoZSBzYW1lCj4gY29tcGFueSwgYXMgdGhlaXIgZGF0
YXNoZWV0cyBzZWVtIHRvIGNvcHkgZWFjaCBvdGhlci4gVGhlcmUncyBub3QgbXVjaAo+IGluZm9y
bWF0aW9uIGFib3V0IGVpdGhlciBvZiBib3RoLCBzbyBJJ2Qgc2F5IHRoYXQncyBhIGZhaXIgYXNz
dW1wdGlvbi4KPiAKPiBSZWdhcmRpbmcgdGhlIGNvbnRpbnVhdGlvbiBjb2RlcywgQm95YSBpcyBs
aXN0ZWQgaW4gYmFuayBuaW5lLCBob3dldmVyCj4gaW4gdGhpcyBjYXNlIEkgc2hvdWxkIGN1cnJl
bnRseSByZWFkIGFuIGFsbCAweDdmIElEIHNob3VsZG4ndCBJPwoKSSdkIGd1ZXNzIHNvLCB5ZXMu
Cgo+IFRoZSBkYXRhc2hlZXQgYWxzbyBvbmx5IHNwZWNpZmllcyAzIGJ5dGVzIGFzIGEgcmV0dXJu
IHZhbHVlIGZvcgo+IHJlZ2lzdGVyIDB4OWZoIDooCgpZZWFoLiBTbywgdGhpcyBmbGFzaCBmYWxs
cyBpbnRvIHRoZSBzYW1lIGNhdGVnb3J5ICJzaW1wbHkgaGlqYWNrcwphIG1hbnVmIGlkIiBhcyBh
bGwgdGhlIG90aGVyIGZsYXNoZXMuCgpXZSBzdGlsbCBuZWVkIHRvIGNvbWUgdXAgd2l0aCBhIHNv
bHV0aW9uIGZvciB0aGlzIHByb2JsZW0uCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
