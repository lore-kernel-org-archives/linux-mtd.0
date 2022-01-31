Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF559C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6DezQD8t5Iwp8pOz6+YuK1x6AMc+7Pigv3xWIZ4dW0=; b=AgyS0sWGq4yO3A
	JtJEf1BPJoM1oRQ4iSB3YbV+J5cEvXhbxnc5WjiZNi9q4OOjN1sQdSUtsggnnm4GvaznrUSeL3aqZ
	2OdQtrcjKgcb0WiHDF+uHepuB/d58jCYpoa8E2OgZ7rf7NJKpG4USO/SJXyZxXAhALUQpSxPs8oTL
	QGBULW6/3x9cQvyAgWomvv+K54g0gjSa/9lTiPVoQVda/V8MN9JK2HghMuMUvef7XT1/lrAlzGYdo
	zVCJNDSD+Hz/ZFsen/TnY/ku/+jKfxXlsZXmTIFanfI4Uoa/rb/yhIkqfjSqVjSGoQV8xkQXO/itx
	ZHPrPqBItx7bQf83pEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEX3h-009Wl0-4w; Mon, 31 Jan 2022 13:49:29 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEX3d-009WkH-2N
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 13:49:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28FF5FF80F;
 Mon, 31 Jan 2022 13:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643636962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2i0ebk4yhbArcz3JBloFwALfFKX+cehM0zWe+fzdaqA=;
 b=P/8UCFDpXfQuQbnEIXdtMWcCpevXiyQ5YIBjaE/H0dHp69zfQSefMSzvoN6qOGuilAIEiP
 cZ9wGzbT/PsReS4Z+rJgADtosmy/PgVvH1wV3EbLRixPwdSjZKL7DVRLV+dIJapaclIzAm
 VIzSXH2WTy3QodtKVPp6U9ifhbb97EM069GRXkUI95O1kDGoRVW6E4xX5Mto1R84qWh/om
 5Kr8dH62lUtxUSS4DRJ8nIE3c0o5JHt841DWVU62gZsg0ZeChRo+ueVxJFEKmSMARNU3kz
 KZpXgFfVgAj3nCPiAgXtuBv9r1hk1ub8v12XswtdkW0MJejwXhwg+NlrX7hj+Q==
Date: Mon, 31 Jan 2022 14:49:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 00/13] External ECC engines & Macronix support
Message-ID: <20220131144917.63c36b92@xps13>
In-Reply-To: <YfRvjJf+6Db89RRg@sirena.org.uk>
References: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
 <YfL5ApsG7c619+R0@sirena.org.uk> <20220128090812.5b7a5982@xps13>
 <YfRvjJf+6Db89RRg@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_054925_277677_E535F85A 
X-CRM114-Status: UNSURE (   9.32  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBGcmksIDI4IEphbiAyMDIyIDIy
OjM0OjUyICswMDAwOgoKPiBPbiBGcmksIEphbiAyOCwgMjAyMiBhdCAwOTowODoxMkFNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+ID4gQXMgdGhyZWUgcGF0Y2hlcyBpbiB0aGlzIHNl
cmllcyB3ZXJlIG5ldy9yZXdvcmtlZCBJIGRyb3BwZWQgeW91ciB0YWcKPiA+IHRoZXJlLiBJIHNo
b3VsZCBoYXZlIGFza2VkIHlvdSBhZ2Fpbi4gU2hhbGwgSSBhZGQgdGhlbSAoYmFjaykgdG8gdGhl
Cj4gPiBmb2xsb3dpbmcgcGF0Y2hlcz8gIAo+IAo+ID4gCXNwaTogY2FkZW5jZS1xdWFkc3BpOiBQ
cm92aWRlIGEgY2FwYWJpbGl0eSBzdHJ1Y3R1cmUKPiA+IAlzcGk6IG14aWM6IFByb3ZpZGUgYSBj
YXBhYmlsaXR5IHN0cnVjdHVyZQo+ID4gCXNwaTogc3BpLW1lbTogSW50cm9kdWNlIGEgY2FwYWJp
bGl0eSBzdHJ1Y3R1cmUgIAo+IAo+IFllcywgcGxlYXNlLgoKR3JlYXQsIHRoYW5rcy4gSSdsbCBh
cHBseSB2MTAgc29vbiwgYW5kIHdpbGwgc2hhcmUgYW4gaW1tdXRhYmxlIHRhZy4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
