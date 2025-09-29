Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488EECAC5B9
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58S7XQaYF0QrrygwHvbrpSbS4sHNoKcU7CbfO3etsGA=; b=CG/zk1PKNf1x28
	q+fLwn9h8beYcAGZvnzMwJpG1mFC1KZgVqEionTiOlQ7ixpiVuhw7dE4uQIOYTNZvgH6qFLzEqmeF
	Li/5Botv54gIr69TfXhxsE6eqHXGZ8Qfio8qWlwRryxE+0Z1T5pdmNFL6SHTnH0lOEOjLSV2BD64u
	Onwy45KexzsyqaRL4k3BSZduSe2Tfs35MtWubMsh9IsiGQNSd9/MbXpuFZrxBNKyehThiL6CB31g9
	dXpSDL6Q4pRyjBEMoheHJu8Q2A9NpiK8OZcxzZR5tFccpa2th9eym5WYdgbq8TL06EPb7PwkJFKcM
	xdFMK8TllCwI+ho5R2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GHE-00000002sA3-1KTD;
	Mon, 29 Sep 2025 15:59:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GHB-00000002s8v-3lFR
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 15:58:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7972F1A1036;
	Mon, 29 Sep 2025 15:58:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 500FB606AE;
	Mon, 29 Sep 2025 15:58:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B215102F1A13;
	Mon, 29 Sep 2025 17:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xK32v/0Jkwck6iAKn3UemLakhpvM4618EmLE+cDlDTo=;
	b=veGu8sJMgZnNLDBYOB8QxNyDYhYCEkdSxQmW+fqbx/4azPd+BqakxhSgcPIXkCr9NhWpXt
	ldSbI3IKsjWn2EqzPV4B6h480FMxNAug5jTHpVTRtoUZtBw8xKOt5XXSfmY2tfuGZTZHLO
	DGn2WAzuzXjNSXhGrhL688fP2Ge3fBG1V1tpGqTXYFd486GrkHfK6RvxffkYFcKVLBxONs
	D/vPqQ7Q+yQBkhDxusjfkGkbVjzhySpcBxSbzlp7HKLEUVvEx2m8N2jsbmS05MsoEAqCKM
	3hPEkPKX/E/k9R8qr4xLq6AMrJn9JaefrX5fk6Q5iyzTFuEsFEUVJ+U3pDCMrQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Han Xu <han.xu@nxp.com>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  stable@vger.kernel.org,
  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N
In-Reply-To: <87ecrpi741.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 29
	Sep 2025 17:57:50 +0200")
References: <20250922153938.743640-2-maarten@zanders.be>
	<87ecrpi741.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Sep 2025 17:58:53 +0200
Message-ID: <878qhxi72a.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085858_069381_20A03E8D 
X-CRM114-Status: UNSURE (   9.72  )
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

T24gMjkvMDkvMjAyNSBhdCAxNzo1Nzo1MCArMDIsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIZWxsbywKPgo+IE9uIDIyLzA5LzIwMjUgYXQgMTc6
Mzk6MzggKzAyLCBNYWFydGVuIFphbmRlcnMgPG1hYXJ0ZW5AemFuZGVycy5iZT4gd3JvdGU6Cj4K
Pj4gQ29tbWl0IGYwNGNlZDZkNTQ1ZSAoIm10ZDogbmFuZDogcmF3OiBncG1pOiBpbXByb3ZlIHBv
d2VyIG1hbmFnZW1lbnQKPj4gaGFuZGxpbmciKSBtb3ZlZCBhbGwgY2xvY2sgaGFuZGxpbmcgaW50
byBQTSBjYWxsYmFja3MuIFdpdGggQ09ORklHX1BNCj4+IGRpc2FibGVkLCB0aG9zZSBjYWxsYmFj
a3MgYXJlIG1pc3NpbmcsIGxlYXZpbmcgdGhlIGRyaXZlciB1bnVzYWJsZS4KPj4KPj4gQWRkIGNs
b2NrIGluaXQvdGVhcmRvd24gZm9yICFDT05GSUdfUE0gYnVpbGRzIHRvIHJlc3RvcmUgYmFzaWMg
b3BlcmF0aW9uLgo+PiBLZWVwaW5nIHRoZSBkcml2ZXIgd29ya2luZyB3aXRob3V0IHJlcXVpcmlu
ZyBDT05GSUdfUE0gaXMgcHJlZmVycmVkIG92ZXIKPj4gYWRkaW5nIGEgS2NvbmZpZyBkZXBlbmRl
bmN5Lgo+Pgo+PiBGaXhlczogZjA0Y2VkNmQ1NDVlICgibXRkOiBuYW5kOiByYXc6IGdwbWk6IGlt
cHJvdmUgcG93ZXIgbWFuYWdlbWVudCBoYW5kbGluZyIpCj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0
ZW4gWmFuZGVycyA8bWFhcnRlbkB6YW5kZXJzLmJlPgo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+Cj4gVGhpcyBwYXRjaCBkb2VzIG5vdCBhcHBseSBvbiBuYW5kL25leHQuIENhbiB5b3Ug
cGxlYXNlIHJlYmFzZSBvbgo+IHY2LjE4LXJjMSB3aGVuIGl0IHdpbGwgYmUgb3V0PyBJJ2xsIHRh
a2UgaXQgaW4gYSBmaXhlcyBQUi4KCk5ldmVybWluZCwgbXkgZmF1bHQsIGl0J3MgYXBwbHlpbmcg
ZmluZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
