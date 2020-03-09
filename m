Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E3BC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 13:16:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE5420828
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 13:16:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YANBsPy8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gLotY6Q5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE5420828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVRm7d0A9Zlw0Vt/j1u3lFQX043XD4LDPCyg6FuVfpI=; b=YANBsPy8Tbx26Z
	W8lWYUafH2U0ftmlFX27Q9Ot0pGxkS3zS6BVXWKHq47kdcbbKc//Un1zyspaeIhAMP2ov2mKetU8F
	Fzurqg6UZH4HHkw1954X9zJfp/bAfb7sKVp6sJFV7VAzo+MmML/ki6Sb76u/VwLu/DlgkNTyzReVz
	gjljq1pKx/T5ORKNJPlzyWYyuyTgQ/NnPIocxVP9PBhXiLZQt/+ThnRHJuOgKSgDWgrVTQzDtx1Ft
	VuPugrkz3uPO2wnakQbqEcUkXB+047Z+oOu9oP4bEPJpoWLub6HRwY82M4/vdiknRcRtSJpHWuKuX
	c5z9n2z7OTcV72L3x0bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBIGA-00010k-Fr; Mon, 09 Mar 2020 13:15:54 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBIG9-00010X-QX
 for linux-mtd@bombadil.infradead.org; Mon, 09 Mar 2020 13:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=0uNVZQSKN/Z+keWc/UiKBJaE7wunZBwgGha5D2Q0oyI=; b=gLotY6Q5q/6lSux//qHvEhAzmb
 6PV5i51+KYMeAKlu98MBkblW8orrAv9h9uKa+7VasiN7enha46nspeMV/hyV6x2lUQx171h9vnkx6
 GTGzoILvR41fOVM5grQMQ+QgS7jlIyIlz0m/jh8B+rPPelZfpm99X0KkEziPE4yn8KXOfJWpMkidI
 aWmExPKOQ4qapmruSa5LK+2t4yet0C8Tfp6xFV2Ru1Hai/jWMDqGcgKCstcZmEFvsFUI9O7SQpR6r
 scxt/n4REW/B5XhY7v1tWO+yvK8RLDCml+YvWizPQyEBXJEYWjtsrtFSB00Hgj6DDQ9RkU6pZg44c
 y6tgZ4oQ==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBIFG-0005Gx-7G
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 13:15:51 +0000
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0C204100007;
 Mon,  9 Mar 2020 13:14:04 +0000 (UTC)
Date: Mon, 9 Mar 2020 14:14:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3 0/4] mtd: rawnand: Add support Macronix Block
 Portection & Deep Power Down mode
Message-ID: <20200309141403.241e773e@xps13>
In-Reply-To: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, rfontana@redhat.com,
 linux-mtd@lists.infradead.org, frieder.schrempf@kontron.de, tglx@linutronix.de,
 allison@lohutok.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
VHVlLCAgMyBNYXIgMjAyMCAxNToyMToyMAorMDgwMDoKCj4gSGksCj4gCj4gQ2hhbmdlbG9nCj4g
Cj4gdjM6Cj4gcGF0Y2ggbmFuZF9sb2NrX2FyZWEvbmFuZF91bmxvY2tfYXJlYS4KPiBmaXhlZCBr
YnVpZHRlc3Qgcm9ib3Qgd2FybmluZ3MgYW5kIHJldmlld2VyJ3MgY29tbWVudHMuCgpJIGtub3cg
aXQgaXMgcGFpbmZ1bCBmb3IgdGhlIGNvbnRyaWJ1dG9yIGJ1dCBJIHJlYWxseSBuZWVkIG1vcmUg
ZGV0YWlscwppbiB0aGUgY2hhbmdlbG9nLiBUaGlzIGlzIHNvbWV0aGluZyBJIGNhcmUgYWJvdXQg
YmVjYXVzZSBJIGNhbiBzcGVlZC11cApteSByZXZpZXdzIHdoZW4gSSBrbm93IHdoYXQgSSBhbHJl
YWR5IGFja2VkIG9yIG5vdC4gImZpeGluZyByZXZpZXdlcidzCmNvbW1lbnRzIiBpcyB3YXkgdG9v
IHZhZ3VlLCBJIGhhdmUgYWJzb2x1dGVseSBubyBpZGVhIG9mIHdoYXQgSSB0b2xkCnlvdSBsYXN0
IHRpbWUgOikgU28gcGxlYXNlLCBmb3IgdGhlIG5leHQgaXRlcmF0aW9ucywgYmUgbW9yZSB2ZXJi
b3NlIGluCnRoZXNlIGNoYW5nZWxvZ3MhICh0aGF0J3MgZmluZSBmb3IgdGhpcyBvbmUsIEknbGwg
Y2hlY2sgbXlzZWxmKS4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
