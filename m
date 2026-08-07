Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755EEC5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3l/e6c57KMKg3DiHXhWsdDD9q/O5fs1LyGisJYlaWzY=; b=0Y/b2C2TCK6maM
	nRKWV7oKenRS4QcWQScy7zDSz78HQ6O+mKSE693kxawI57jd9AbzMnwGfl2+teyJLzrBIT0QmnuEf
	gc4FGP0GejbgavSweRyKsbYFqeFE7ngdoC4WawDw+AwrolDXY9q9hIYIv8V+EaWV3JmLUOK+5h7WC
	aX3vjXgcc6jljt3pTbWp0wMXBvYz7mFj7QZ0QtEwu2JKw+e7pEzc6QyUWxpu3wL5+e/SQUt/2KCG1
	801iv3ckpmfBzDwRXCSAdYbGk0TtviSk6rCXsRNMk+9cPWlsNrGIpHr5JirCyvtSX0ZFn7MyOA4yX
	5SGn+OYsgk40jSPuowHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL36-00000008CEv-3wrF;
	Fri, 07 Aug 2026 13:55:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL35-00000008CDz-0b60;
	Fri, 07 Aug 2026 13:55:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4CBEB4E4113A;
	Fri,  7 Aug 2026 13:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CDA8603F0;
	Fri,  7 Aug 2026 13:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B3411C37940;
	Fri,  7 Aug 2026 15:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786110944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Z9zSxLfnk7YiVlIisYk8KT7P1MGEF3qpYsTg5YEnEk=;
	b=nlNd8SWwUAven5A2D+JdB964IEJxFekkIs00rvccp2m4ShINygrjg5jELkdc9PIe+RCin3
	+rLDGFD1GhyNRoREH/YpRbKPzDkwNoYQKUn86dwDU0L3k8TFZMY6rrcZIsSA328SOvOzOe
	9J7aE94wqutVPNpitsyqWtjmu/DaAe0U36u6qv1j3MdhgWRL9BOZGxkPZavVh0Pfak1IGT
	XQeSmRH4n+FjCIArWgHTQuM33N/0xevGlSPQxcaU6CgW78Mx8kW7CTYk091Lza3t+Vdq5S
	PLCGfpWbd+HBe05P6dqKYs95LC9YV+FD9J7wLObmBaZtgi0uaby42e+XoSWAuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
In-Reply-To: <20260717164202.3099982-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Fri, 17 Jul 2026 10:41:58 -0600")
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:55:41 +0200
Message-ID: <87tsp6avc2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065547_317722_54D5DC13 
X-CRM114-Status: GOOD (  11.30  )
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

SGkgSmFtZXMsCgpPbiAxNy8wNy8yMDI2IGF0IDEwOjQxOjU4IC0wNiwgSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgSDYxNiBOQU5EIGNvbnRy
b2xsZXIgdXNlcyBhIGRlc2NyaXB0b3ItYmFzZWQgaW50ZXJuYWwgTUJVUyBETUEKPiBlbmdpbmUg
aW5zdGVhZCBvZiB0aGUgZGlyZWN0IGFkZHJlc3MgYW5kIGNvdW50IHJlZ2lzdGVycyB1c2VkIGJ5
IHRoZQo+IEEyMy9BMzMgY29udHJvbGxlci4gU2luY2UgdGhlIGRyaXZlciBkb2VzIG5vdCBzdXBw
b3J0IHRoZXNlIGRlc2NyaXB0b3JzLAo+IGl0IGN1cnJlbnRseSBhdHRlbXB0cyB0byByZXF1ZXN0
IGFuIGV4dGVybmFsIHJ4dHggRE1BIGNoYW5uZWwgYW5kIGZhbGxzCj4gYmFjayB0byBQSU8gd2hl
biBub25lIGlzIHByb3ZpZGVkLgo+Cj4gQWRkIGEgc2luZ2xlLWRlc2NyaXB0b3IgYmFja2VuZCB0
byB0aGUgZXhpc3RpbmcgRUNDIHBhZ2UgRE1BIHBhdGhzLgo+IEFsbG9jYXRlIHRoZSBkZXNjcmlw
dG9yIGNvaGVyZW50bHksIGNvbnN0cmFpbiBkYXRhIG1hcHBpbmdzIHRvIHRoZQo+IGNvbnRyb2xs
ZXIncyAzMi1iaXQgYWRkcmVzcyByYW5nZSwgcHJvZ3JhbSB0aGUgSDYtc3R5bGUgZGF0YSBibG9j
ayBtYXNrLAo+IGFuZCByZXF1ZXN0IGFuIGludGVycnVwdCBmb3IgYm90aCBjb21tYW5kIGFuZCBE
TUEgY29tcGxldGlvbi4gS2VlcCB0aGUKPiBleGlzdGluZyBleHRlcm5hbCBETUEgYW5kIGxlZ2Fj
eSBNQlVTIERNQSBwYXRocyB1bmNoYW5nZWQsIGFuZCBmYWxsIGJhY2sKPiB0byBQSU8gaWYgdGhl
IGRlc2NyaXB0b3IgY2Fubm90IGJlIGFsbG9jYXRlZC4KPgo+IFdpdGggaWRlbnRpY2FsIGtlcm5l
bHMgZXhjZXB0IGZvciB0aGlzIHBhdGNoLCBydW5uaW5nCj4gZmxhc2hfc3BlZWQgLWQgLWIgMTkw
NiAtYyAxMDAgL2Rldi9tdGQ2IG9uIGFuIEg2MTYgYm9hcmQgd2l0aCAyIEtpQi1wYWdlCj4gU0xD
IE5BTkQgcmVwb3J0ZWQ6Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgUElPICAgICAgICAg
IGRlc2NyaXB0b3IgRE1BCj4gZXJhc2VibG9jayB3cml0ZSAgICAgICAgMzM2NSBLaUIvcyAgICAg
ICA0MTkyIEtpQi9zCj4gZXJhc2VibG9jayByZWFkICAgICAgICAgNjQ1NCBLaUIvcyAgICAgIDE2
MDQwIEtpQi9zCj4gcGFnZSB3cml0ZSAgICAgICAgICAgICAgMzI1NCBLaUIvcyAgICAgICA0MDIx
IEtpQi9zCj4gcGFnZSByZWFkICAgICAgICAgICAgICAgNjQxOSBLaUIvcyAgICAgIDE1Njg2IEtp
Qi9zCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KClRoaXMgcGF0Y2ggZG9lcyBub3QgYXBwbHkgKGxpbnV4LW10ZCByZXBvc2l0b3J5
LCBuYW5kL25leHQgYnJhbmNoKS4gWW91Cm5lZWQgdG8gcmViYXNlIGFuZCBzZW5kIGEgbmV3IGl0
ZXJhdGlvbi4KClRoYW5zaywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
