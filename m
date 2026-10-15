Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E03CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVU1zpYy0zRHQrDIhxiX/QseoMLHJa9+w4GG9irUtkA=; b=Blz6GryY9tZ+fa
	/AKVm9XNcquo+H6I+ggzIGk4UcyiDlMqOSaTaerb7L/YH0ZwATNkqB4ymcTJDq2Uo7xlqhVvvvSj1
	4oZ32WeJJzPDn/Dn3yplhN9YokZOyj9IGyjro5PuRONSG4jwRRuN75TMAIvVmkj+6MOASwB8Nw5VK
	uVgIpiAx48YfrMhCM5E+ZTw6MvhWYqGn1/XdqZL1jxgHEMtiDLimTjpVobI27YZuWJvuIlkih9XkD
	/HMOE1Plrhx1geP7wJRVPIx6XkXE0HWDCd7scd66momxSbIJYXwAJL36BgMiH12cBo2MifwWhPCaz
	v7aG16EsASK5moHBRZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHXr-0000000HESv-0gCM;
	Thu, 15 Oct 2026 09:14:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHXn-0000000HESK-1XmZ
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 09:14:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 994121A1230;
	Thu, 15 Oct 2026 09:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B48B60360;
	Thu, 15 Oct 2026 09:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BD36103284ED;
	Thu, 15 Oct 2026 11:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792055664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GDIs34+0F22s0lXrQtwpdXjAxxPG5r9UfLbC+tcd03Y=;
	b=N7phaWWQTjNJ/gboiiveDQAAoHOctXPp/BdXU9qB3Qs3q/AkPUvQlQgoJeqn2g6ewqiToY
	NPGWcPj0BEO+Jf2pJKw+uJdi5psjvxi+LgzEqquTKKT08Hp8ORFs2lLM0Y+VDM9Qdoio7A
	mmBYn2zBfBXztMm17fufDi3//B7t84UN6k2ihDjpSblyoBznzaaTiYY3K3CKC7LZ9iNGxG
	KEjaYi1ZYT5GH492TBcju5TnZJUwtBFdpDXaVCLuYP/Rsz5837T2H6aP6GXqC9YXzcrrGG
	cRVkEU7PeyThxkvEoCYz+VAHaIlMANOOGDN4R4WQWZ19wWQHKPkn1dhetMqE1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Tal Zussman" <tz2294@columbia.edu>,  "Joern Engel"
 <joern@lazybastard.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,  Matthew
 Wilcox (Oracle) <willy@infradead.org>,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
In-Reply-To: <sashiko-outbox-172225@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 15 Oct 2026 03:45:56 +0000")
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
	<20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
	<sashiko-outbox-172225@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 11:14:20 +0200
Message-ID: <87mrsfwck3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_021435_548774_67A04191 
X-CRM114-Status: UNSURE (   5.09  )
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

SGkgVGFsLAoKT24gMTUvMTAvMjAyNiBhdCAwMzo0NTo1NiBHTVQsIHNhc2hpa28tYm90QGtlcm5l
bC5vcmcgd3JvdGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28g
QUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW01l
ZGl1bV0gbW06IG1pc3NpbmcgZm9saW8tPm1hcHBpbmcgcmUtdmFsaWRhdGlvbiBhZnRlciBmb2xp
b19sb2NrKCkKClRCSCwgSSBkb24ndCBrbm93IHRoZSBmb2xpbyBBUEkgc28gSSdsbCBsZXQgeW91
IGRldGVybWluZSB3aGV0aGVyIHRoaXMKaXMgYSByZWFsIGlzc3VlIG9yIG5vdC4KCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
