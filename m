Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE2BC433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 16:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B12860FC2
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 16:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B12860FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/T7aUq8+4iXQvNxAHnocrWo8DOsB4/WIoL8QJJObVw=; b=Gpk3EUUYxv8G6F
	W+Rvzxng5iUlMNs8Ykb89gYC2exJP8mND7KabeqFjGqz09RPqtf6/Nxh7+EAVov6rDmtuGffv+Fh1
	rVmhs7BCSZc7jOB+YO0nnt1ZVH8VvCp1nCok8bnWYC+LwaLl+4LdDdbdtuYLO4qIjXwpucwzG7lXt
	zhTkaH8ncVsTf8CTPPjmd6EvePhHg6JPRPIQEqHo1+uwAdXDscPFYRT+6/APDSsh6nUFAlA3sf+p6
	U0cdP30FgGhOjNkXgecPM6IW+glt5cxoBepuxkbBvUInLsWi8eK5oZ7F/oVaXktNiK8kzBkB5Pm6W
	dUvfZYfB9qr3Ev5eoNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjlGI-00EZwB-2x; Sun, 07 Nov 2021 16:43:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjlGE-00EZvh-As
 for linux-mtd@lists.infradead.org; Sun, 07 Nov 2021 16:43:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 92C0A1BF203;
 Sun,  7 Nov 2021 16:43:08 +0000 (UTC)
Date: Sun, 7 Nov 2021 17:43:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.16
Message-ID: <20211107174307.56b5abee@xps13>
In-Reply-To: <20211101200026.293028db@xps13>
References: <20211101200026.293028db@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_084314_554619_CCB29F67 
X-CRM114-Status: UNSURE (   5.47  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gTW9uLCAxIE5vdiAyMDIxIDIwOjAw
OjI2ICswMTAwOgoKPiBIZWxsbyBmb2xrcywKPiAKPiBIZXJlIGlzIHRoZSBOQU5EIFBSIGZvciA1
LjE2LgoKUHVsbGVkLgoKPiAKPiBDaGVlcnMsCj4gTWlxdcOobAoKQ2hlZXJzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
