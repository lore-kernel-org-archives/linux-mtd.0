Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDD1CCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mD8/D7yhlx2ZGJwUeh7b5XfJxNiT+tW1Cm+nOI98N1k=; b=R49+jIK667VxYb
	dD+Wb0eqS6KdR+aAUuGR85lIwBoHszvv3kQZstr1dI0qvivohugAaIzB+nLi6q85Hc8TN9oMqir2c
	jWJ5fEWli65Kn1sf/wgRhJOuKvWwnA5HhrMXDHzb3Vt8MiAhrsc2tiEJRmbpj3aP1SaKyzGROZ4pK
	AwFN27F//V3fj+PuaCG5shtqRDG3tVvPCoobH660WCadK122yUcclCWK41XyS5V/IfxOZaGx+Zfvz
	3FcyIOP21EQzVySjxNearGn6DqAvk6ImKj6vdqmJnubkd8xkj/hMbVch2jKZKM569NhOsCjBwbbj7
	PiFCgTaJSIAyDgBOcoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6c-0000000GGCp-0wKr;
	Tue, 28 Oct 2025 15:59:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm6Z-0000000GGAd-43Az
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:59:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E1F9C0BEA2
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 15:59:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52681606AB;
	Tue, 28 Oct 2025 15:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9911117A9A2D;
	Tue, 28 Oct 2025 16:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761667165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WcxhwvKSc5b2IcYbnhyEyjHhKPPCadkTEbsGrKZDwhI=;
	b=vuawdEFzN6L9I91dzo4sN1xkAyaHvrjZCKyWCKQt6JLekc018BlbUKUCpLu2TjXgQkbLPM
	DVVWj8jIb8qER8fBbPa5jo3ye4tge/eSWLrt3O5y7pw+oBUARagJzQniNIYJzH0m5OBohE
	ju3+jQFghY0p5q45EOkuHlgjv0V9Xh7gfBDlTZuSsjyrR2rZA8kvC5EsdyC1PyiWSc5u38
	G1XjF8SqmAPYZqYPI9umXQmZHCNcRNvOLFgAMtW0hKD4NA2ZBHPVYh5m8Z0zOLzg0bIMgV
	NQJ8zCwwqrsi2d2YwL+1ahxHoTCyhCu3Y77yDU8zqxwN6O/MWauSL3lsm1ZBAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev
In-Reply-To: <20251027114032.390754-1-sakari.ailus@linux.intel.com>
References: <20251027114032.390754-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] mtd: rawnand: gpmi: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-Id: <176166715957.365556.3971555889957567045.b4-ty@bootlin.com>
Date: Tue, 28 Oct 2025 16:59:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085928_158956_183713BD 
X-CRM114-Status: UNSURE (   7.15  )
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

T24gTW9uLCAyNyBPY3QgMjAyNSAxMzo0MDozMiArMDIwMCwgU2FrYXJpIEFpbHVzIHdyb3RlOgo+
IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCksIHBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1
c3BlbmQoKSwKPiBwbV9ydW50aW1lX2F1dG9zdXNwZW5kKCkgYW5kIHBtX3JlcXVlc3RfYXV0b3N1
c3BlbmQoKSBub3cgaW5jbHVkZSBhIGNhbGwKPiB0byBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5
KCkuIFJlbW92ZSB0aGUgbm93LXJlZHVudGFudCBleHBsaWNpdCBjYWxsIHRvCj4gcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeSgpLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEK
ClsxLzFdIG10ZDogcmF3bmFuZDogZ3BtaTogUmVtb3ZlIHJlZHVuZGFudCBwbV9ydW50aW1lX21h
cmtfbGFzdF9idXN5KCkgY2FsbHMKICAgICAgY29tbWl0OiA4ZjkyMTNhYWM1MWRmZTFiYjMxMzll
NmIxZDJjYjM1NjkwZjY3MGI2CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQv
bGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQg
bm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
