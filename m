Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5FDC4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 12:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6B8F2085B
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 12:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOR8XaR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6B8F2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8jthNEAjBzb2bMFv53w3Ikm7YzKW2Z4DbianDhzAIRM=; b=rOR8XaR2gtyfuvt3sFTV+tt1A
	YxNbdcaMipZpsE7B3ZvACpgCqaWB0qGqRKmgsAeeFliGYbG+5jPYfH2ZGQbvyTrAwbdLQvceXn6Qn
	rsL1Qo0i5sYZguHFkzfX2mlX1DteeZvGXfPRG/1UGx0OdVHWHR10eLe/Jd6j52jH6jYqz6BczZhO5
	sQ9XTCkRYVCBFSWYjAWhPtZtpLNDXA2BokXNm5NSbvuWeVc4h50Wc0BoGFTwCRW1upK6l6xf2BIbc
	8BAI9/Q78uvCkMnT+64W7ifi1HLWnThfip+rIs3PnrTKK44EgDLZDEnaZoUw1bpG00Cs3G6SmUNAj
	KZ2abRELA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPPhJ-0002jX-ER; Mon, 05 Oct 2020 12:34:33 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPPhG-0002iN-5s
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 12:34:31 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A571224000E;
 Mon,  5 Oct 2020 12:34:24 +0000 (UTC)
Date: Mon, 5 Oct 2020 14:34:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH -next] mtd: sunxi-nand: add dma support for allwinner h3
Message-ID: <20201005143423.5a9dd1ee@xps13>
In-Reply-To: <1203329103.515411.1601900419875.JavaMail.zimbra@robart.cc>
References: <1203329103.515411.1601900419875.JavaMail.zimbra@robart.cc>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_083430_315834_300A5F62 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>, maxime <maxime@cerno.tech>,
 bbrezillon@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFudWVsLAoKTWFudWVsIERpcG9sdCA8bWRpcG9sdEByb2JhcnQuY2M+IHdyb3RlIG9uIE1v
biwgNSBPY3QgMjAyMCAxNDoyMDoxOQorMDIwMCAoQ0VTVCk6Cgo+IFRoZSBBbGx3aW5uZXIgSDMg
c29jIGlzIHVzaW5nIGRpZmZlcmVudCBkbWEgbW9kZSwKPiBzZWUgb2xkIHN1bnhpIGRyaXZlcnMg
aHR0cHM6Ly9naXRodWIuY29tL2FsbHdpbm5lci16aC9saW51eC0zLjQtc3VueGkvdHJlZS9tYXN0
ZXIvbW9kdWxlcy9uYW5kCj4gCj4gQWRkZWQgc3VwcG9ydCBmb3IgaXQgYW5kIGEgY29tcGF0aWJs
ZSBvcHRpb24gc3VuOGktaDMtbmFuZC1jb250cm9sbGVyLAo+IHdoaWNoIHVzaW5nIHN1bnhpX25m
Y19oM19jYXBzIHdpdGggYSBuZXcgZG1hX29wdGlvbiBmaWVsZCwgd2hpY2ggaXMgc2V0IHRvIDAg
Zm9yIHRoZSBIMy4KPiAKPiAKPiAKClRoZXJlIGFyZSBhIGZldyBvYnZpb3VzIHN0eWxlIGlzc3Vl
cyBpbiB5b3VyIHBhdGNoLCBjYW4geW91IHBsZWFzZSBydW4KCgkkIHNjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLXN0cmljdAoKYW5kIGFkZHJlc3MgYWxsIHRoZSByZXBvcnRlZCBlcnJvcnMgaW4gYSB2
Mj8KClRoYW5rcyEKTWlxdcOobAoKPiBTaWduZWQtb2ZmLWJ5OiBNYW51ZWwgRGlwb2x0IDxtYW51
ZWwuZGlwb2x0QHJvYmFydC5jYz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
