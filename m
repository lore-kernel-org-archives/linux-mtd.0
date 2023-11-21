Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F79C61D92
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMo30aLvLwWh4eMVMNfga54c4cFFzhQikXQTh8B92BA=; b=AR1OMcApttHpx2
	JJxe9VzpOYi5WQ8yeuGlxfrQTw3QIog7kzMyRk+0z8SqpqWoJSs2u5CS5rQsZpBFlIrXqk2prqnuF
	MDeOPHjZ0ZGR2RrkbdUwJCedqPxpNwQdHnH24FMiG0FU1JNPBdn5QUDP019avOBtMmiQLWXqgHXkY
	pYEDunb3RkqxIjxeTYxI2IMUOAehVBOVnhJAbemfQkVUG+A23LVHnFcv7GxAbQ3AXfuw4qDayRTaa
	GOJoAXlussDIyrl+Z1mu6dchxJ/ohVMa0kE691oxlTY4AmzdW8Nw3UNm+nAWMvBSvg/f7nziDUCtS
	e+7hmZzIrohWWP8B2kMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Pve-00GiWC-0f;
	Tue, 21 Nov 2023 12:32:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Pva-00GiVY-2i
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 12:32:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 314EE240002;
	Tue, 21 Nov 2023 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700569944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aytELXyhvF7gnPT+fC3JQw+9TgYYn/Aa+5TnTb8UGUs=;
	b=Z1wPRFjPj0MjS25LAlhZ08bUN97nx8ZNaPYnKFL7T0jjeuK5VYeFmSaPWzO1Deg1oD80Zx
	8nIBlY0ixIPZTas2MYhs095K9sgYyltILDQw8FpjlXpkVr2AJMHtzC/sUVbTLPmHnDqTMK
	kgdwn+cxirnkw1zKiX+ucE7EYHPjsaOrMgFXh2DZf6bjKdnPLsThM639R4p/cjPGULCJKp
	PULh2OxAWJexeJnLR0qXg4N2Ajl+F7AMjgFFZvEebANe+PV/4P0OdMVMNed4usBlNM8S3i
	Iz+RTY5ASkfAkWKZpOLmMbqMtnKfzZuTOOpHzbd6oSSTMWO3eFL8GN86cyzvVQ==
Date: Tue, 21 Nov 2023 13:32:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: spi-nor: add myself as maintainer
Message-ID: <20231121133222.12266d8b@xps-13>
In-Reply-To: <20231121122134.1952738-1-michael@walle.cc>
References: <20231121122134.1952738-1-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_043231_192515_3B34CB53 
X-CRM114-Status: UNSURE (   7.00  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gVHVlLCAyMSBOb3YgMjAyMyAx
MzoyMTozNCArMDEwMDoKCj4gQWZ0ZXIgYmVpbmcgYSByZXZpZXdlciBmb3IgYSB3aGlsZSwgYWRk
IG15c2VsZiBhcyBhIG1haW50YWluZXIgZm9yIHRoZQo+IHNwaS1ub3Igc3Vic3lzdGVtLgoKVGhh
bmtzIGZvciBzdGVwcGluZy11cCwgeW91ciBoZWxwIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4KCkFj
a2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
