Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B39C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74KBQoAylMVxhn8pEflOuz1y6wH4shIG7SD3CoYMrS4=; b=rZEXcyZDIVOYdo
	ecFvWGy3x7EI6xV7I62n03REm2Llx+1ArNlqiLBfeMxK3GSsfQAME6JqsX4S/uy6ISGkFyGvvyJDW
	cR8q/Wp7C0I8tdNk2IhWCSuNswEvKM2H1rLGRB8ma85Y8X6V+j/ovLOg85n8LemIgPDELQmoxuVnm
	MfLjzoz+i642IHsvPDUfT95F+tZc61GWTZgz3Ey+ysuZBRTTqEKXh4Q6SUKJjbS7SfUPJvine4s7x
	lM6pNgM6rc0UxUAtMxz/Eyhba4eZ2U3jPSWyNeJSMuAyLRn8feJCTVLWi0xy+7XfUzsHqh9RLRF2b
	zob5BDUeWB4GbRWd+/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBfC7-001DDJ-Ps; Sun, 23 Jan 2022 15:54:19 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBf1y-0019YG-Vw
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:43:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E36C100002;
 Sun, 23 Jan 2022 15:43:45 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:43:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: s921975628@gmail.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: nandsim: Replace overflow check with
 kzalloc to single kcalloc
Message-ID: <20220123164344.015f1447@xps13>
In-Reply-To: <20211225100607.118932-1-s921975628@gmail.com>
References: <20211225100607.118932-1-s921975628@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_074351_205325_1FAA0288 
X-CRM114-Status: UNSURE (   6.34  )
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

SGVsbG8sCgpzOTIxOTc1NjI4QGdtYWlsLmNvbSB3cm90ZSBvbiBTYXQsIDI1IERlYyAyMDIxIDE4
OjA2OjA3ICswODAwOgoKPiBGcm9tOiBSaW5IaXpha3VyYSA8czkyMTk3NTYyOEBnbWFpbC5jb20+
Cj4gCj4gSW5zdGVhZCBvZiBzZWxmLWNoZWNraW5nIG92ZXJmbG93IGFuZCBhbGxvY2F0aW5nIGFu
IGFycmF5IG9mIHNwZWNpZmljIHNpemUKPiBieSBjb3VudGluZyB0aGUgdG90YWwgcmVxdWlyZWQg
c3BhY2UgaGFuZHksIHdlIGFscmVhZHkgaGF2ZSBleGlzdGVkIGtlcm5lbAo+IEFQSSB3aGljaCBy
ZXNwb25zZXMgZm9yIGFsbCB0aGVzZSB3b3Jrcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaW5IaXph
a3VyYSA8czkyMTk3NTYyOEBnbWFpbC5jb20+CgpTZXJpZXMgYXBwbGllZCB0byBuYW5kL25leHQu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
