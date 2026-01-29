Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2D3D73E84
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToaEvkf33RkYnj4G+3kCFK9qigf1l3u1II2vcs2OLBc=; b=0t2Jcjdqo22Zgy
	5R+1qV72r/92QkSwZELLOsUzibuP03hpi3jaweEj89Ly5YfIGLAy29StctGTO5mYNb1ttv6c8QETW
	/uas10MeLLiHrcC3j9L665gZvBV87BO1/C24151E7TUlI3/PYMcPBP22m5iwsv6CDOQGncGgnwnML
	TR+y5xerv2/MzGhrKTjJVYNW4AwjIl94Beg6SEqoEtgFAQX7PsMarJddCrYHRNn5DvHZpNxWXqhf3
	j3yXyILuq2H+/6/JR1oSLiWMIMRJ5KRJEdYdhHxOseuYeRv4EmbK3LmJz3Xg36Zt3MXCQC+KAhj4W
	OEoVQzHEUdHY3TEgU3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRS-00000000Xxn-0WpB;
	Thu, 29 Jan 2026 19:12:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRO-00000000Xvm-2ZpK
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:12:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E3304E42325;
	Thu, 29 Jan 2026 19:12:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0081760746;
	Thu, 29 Jan 2026 19:12:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1649B119A8864;
	Thu, 29 Jan 2026 20:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769713948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q3CWvP5JLIJdDuUGCy6bV+F8zV/0FtEjbWQPXPcSFlA=;
	b=TA+Qsabq+4fySWpU1Ewg+wxlnx8rpH0mqNXykj9K2U+dhivoV1g6l1s9l3+r+MNUBSg3zC
	bkP2++0gonwdfnIGoQH5FoGN3Dd25LdgUyCfuMfmFTKLhpnFBUrp34dUFzHbvAx0lu9iCM
	WjOll8sqAY27r5ldmnU+rdWx61I36gw537th6rn/FeWsViMaSwZh+NJWYwo0HA6VYGmG5m
	ULRz0yXefXW/v70ULu0BC4ZUpUhCzFufR3tCSQM33GeaVXAtcnrNa8uPdOnJMM766cd5gO
	er7YWT/pWNIlJJTAk0LBiEbSnrKOwf34x788xkbKcPoysGjkeKzIma+WR/CVwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20260129-gemini-mtd-of-partition-parse-order-v1-1-c209dfd7c0ce@kernel.org>
References: <20260129-gemini-mtd-of-partition-parse-order-v1-1-c209dfd7c0ce@kernel.org>
Subject: Re: [PATCH] mtd: physmap-core: Prioritize ofparts for OF probe
Message-Id: <176971394786.256159.18224773453751051734.b4-ty@bootlin.com>
Date: Thu, 29 Jan 2026 20:12:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_111230_803101_D238E9B7 
X-CRM114-Status: UNSURE (   9.40  )
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

T24gVGh1LCAyOSBKYW4gMjAyNiAwMDo1NTowOSArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToK
PiBQbGFjZSB0aGUgb2ZwYXJ0cyBiZWZvcmUgUmVkQm9vdCBwYXJ0aXRpb25zIGluIHRoZSBPRiBw
cm9iZQo+IHBhdGg6IHRoaXMgbWFrZXMgaXQgcG9zc2libGUgdG8gb3ZlcnJpZGUgYW55IGV4aXN0
aW5nCj4gUmVkQm9vdCBwYXJ0aXRpb25zIHdpdGggZml4ZWQtcGFydGl0aW9ucyB3aGljaCBtYXkg
YmUgbmVjZXNzYXJ5LAo+IHN1Y2ggYXMgd2hlbiB5b3UgbmVlZCB0byByZXBhcnRpdGlvbiB0aGUg
Zmxhc2ggZnJvbSBMaW51eCcKPiBwb2ludCBvZiB2aWV3IGJ1dCBub3QgbmVjZXNzYXJ5IGZyb20g
dGhlIGJvb3Rsb2FkZXJzIHBvaW50Cj4gb2Ygdmlldy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBt
dGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBwaHlzbWFwLWNvcmU6IFByaW9yaXRpemUgb2Zw
YXJ0cyBmb3IgT0YgcHJvYmUKICAgICAgY29tbWl0OiA4YTU2NWUzZWUxZWNjYWY3NTcwYTFjMTA3
YjY4MzI3YmExYTY4Yjg0CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGlu
dXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8g
cm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
