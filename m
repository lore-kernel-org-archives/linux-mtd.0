Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D25BC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBEFF20679
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CpnHZL9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBEFF20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cRjVi9r8AIOXkqsZKziT1sMhzQZRUYvUzInznOhEtg=; b=CpnHZL9bmNmuM0
	yNAYtHwgTWofAJ7L1UUCD2NthM9KhBr6PMURO9mmn6wZFJtxf329PF5IQ3LjruuK8nKfkHxhP7uCA
	VFHJOftLLBRnN5riVieW578w6DcxGpCXyJPpbufdwDjhXaYl85LWflrRnfoF2ZxjQ79/dqr9EyQQU
	sDJ9snfYbJrAsqAwcdMdn1UTbElo9PQ53Lf/arWLVqm8MjAfPSPDNosOKuFogBqU06wPKxZ17tyP3
	/DGW6FXhmDR23e4R3MLYSejmI0t3Z6R6/Hy36ePEx38VOY648IuquSLTzCaalZ49LJbbNtF9TgSUr
	iFlK/FJJh6/WAR2MaISw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgUIo-0003Py-JL; Wed, 03 Jun 2020 14:23:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgUIl-0003PB-89
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 14:23:32 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2E7C420010;
 Wed,  3 Jun 2020 14:23:29 +0000 (UTC)
Date: Wed, 3 Jun 2020 16:23:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: rawnand: tango: Convert the driver to exec_op()
Message-ID: <20200603162328.64f39596@xps13>
In-Reply-To: <20200518170912.328988-1-boris.brezillon@collabora.com>
References: <20200518170912.328988-1-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_072331_418024_50411E64 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3
cm90ZSBvbiBNb24sIDE4IE1heQoyMDIwIDE5OjA5OjEyICswMjAwOgoKPiBMZXQncyBjb252ZXJ0
IHRoZSBkcml2ZXIgdG8gZXhlY19vcCgpIHRvIGhhdmUgb25lIGxlc3MgZHJpdmVyIHJlbHlpbmcK
PiBvbiB0aGUgbGVnYWN5IGludGVyZmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IC0tLQoKQW55b25lIHRvIHRl
c3QgdGhpcyBzZXJpZXM/CgpJZiBub3QgSSB3aWxsIGFwcGx5IGl0IGFzIHNvb24gYXMgdjUuOC1y
YzEgaXMgcmVsZWFzZWQuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
