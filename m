Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136C3C5B578
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D924420652
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3MdYb1q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Co6g7lvD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D924420652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVTBwxNO8oufY1513cG4tzKT9M4d2VqJSF9iiajjgCE=; b=m3MdYb1qiukgrd
	UvFXES3Rnq978HKDqpLMyyW8C5ivjIbA+tdBBxCfhD1plp3Djr7lDsAPQK/obfq5+edk84scbfWGQ
	T1gZ5xJSWBvNF2yqIRCqWzsXHlHcqcTl3tUAmuFhVlVfKvjv8FHt3F61VcmtKMO7fCsSd2d6IlwxS
	6adcXi07vqhxn5/Ocu/yW8x6XsvJ0oLbbCXzvUfbLJCMw4yT2YUrsEZqsPB5AkpbvHk7Q0/hOI31C
	B1PlIvsXU3Zh7G+MHX/9WUXqsybK9jnCNP/F9d4INDMkHQSomGZ6mnHKXqxl6QGsO7m2jJqsO3/jf
	GW4ChD68/pNZ0jPwhbbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhqWq-0002fR-AA; Mon, 01 Jul 2019 07:15:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhqWc-0001tf-0x
 for linux-mtd@bombadil.infradead.org; Mon, 01 Jul 2019 07:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LHn25MNsrmRseoy+vZB4T8HPFRXKIaAL6VAC9/YjaI4=; b=Co6g7lvDJw1Qf3lYLH/rU4c1dF
 EgBeTUt228tWFP0PYeQNrFdRi0dpqOzlBVPRG7VELscM/I3yrDc7eqRVV7CqqiZa0pReGhOCIJdNd
 QW0ezv6Su47Rd+OOGR8llovpJ2Fqt+uoovH5tPFujFuLWsi30DRS5WSe9b7/rrBzY0g+OSJJXIBRa
 U3Je6laJtzd52+7DkQGrKT6Suvd+4O4kJlP4vCrtNhMCdmuzREH9pO+/JwkV6mUWO4hIeFsb7bH3A
 Tr3ApTkHGG5W4zDPL411vY7o7ynsH+xzNTiWWOy7Ahs/qzAbOUd7I5TNeQ+mxrJShMsw4wL5S4eJb
 2TOOSuCQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhqWd-000692-43
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 07:14:57 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 43710240008;
 Mon,  1 Jul 2019 07:14:16 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:14:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190701091416.701e9bca@xps13>
In-Reply-To: <1559529724-5454-1-git-send-email-masonccyang@mxic.com.tw>
References: <1559529724-5454-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_081455_214189_3C174930 
X-CRM114-Status: UNSURE (   7.48  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org, allison@lohutok.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
TW9uLCAgMyBKdW4gMjAxOSAxMDo0MjowNAorMDgwMDoKCj4gQWRkIHN1cHBvcnQgZm9yIE1hY3Jv
bml4IE5BTkQgcmVhZCByZXRyeS4KPiAKPiBNYWNyb25peCBOQU5EcyBzdXBwb3J0IHNwZWNpZmlj
IHJlYWQgb3BlcmF0aW9uIGZvciBkYXRhIHJlY292ZXJ5LAo+IHdoaWNoIGNhbiBiZSBlbmFibGVk
IHdpdGggYSBTRVRfRkVBVFVSRS4KPiBEcml2ZXIgY2hlY2tzIGJ5dGUgMTY3IG9mIFZlbmRvciBC
bG9ja3MgaW4gT05GSSBwYXJhbWV0ZXIgcGFnZSB0YWJsZQo+IHRvIHNlZSBpZiB0aGlzIGhpZ2gt
cmVsaWFiaWxpdHkgZnVuY3Rpb24gaXMgc3VwcG9ydGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1h
c29uIFlhbmcgPG1hc29uY2N5YW5nQG14aWMuY29tLnR3Pgo+IC0tLQoKCkFwcGxpZWQgdG8gbmFu
ZC9uZXh0LCB0aGFua3MuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
