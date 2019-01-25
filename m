Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97607C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E722146E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhF6mZHS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E722146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99t92MAay7lXnwdVeegRpnHa/9EKby7ReFZqWnip8qc=; b=AhF6mZHSG9s7yg
	N/tibbCKJbEnD2+L8Wll1gGP1h1bDuHru+l0WC00U+JosiXeWgiiSF2BQPjyIgstEhnwHxGLO1qSz
	V8q9EXGybcq4wGkACeHWK8IqNiYKUf73Z5Wt+MpTfSZkSDeJK/PO903TR7Cr+dJ2RBj7WiDJxeZQl
	z27aQ0GAh3VYs4I7FIrl8tH+1FDRMua20hSWIUVkQ+Jl2eDeEzXKLktftuHxLM9I7luo0Fs747LiG
	YoCD3dp9HNCuZ3rfgdEl45LCWog6QWW+a9OmIX13OafolxwipXbk4RDOrNYf5Iv62WyZZTWglNsqO
	N4h4jBy3+Ib6JJA7Jzsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn0jS-0005pz-7U; Fri, 25 Jan 2019 12:37:14 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0jN-0005pF-P4
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 12:37:11 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 542BD209BF; Fri, 25 Jan 2019 13:37:08 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 15B4A207B0;
 Fri, 25 Jan 2019 13:36:58 +0100 (CET)
Date: Fri, 25 Jan 2019 13:36:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: denali: remove ->erase hook
Message-ID: <20190125133658.540b19fa@xps13>
In-Reply-To: <1548046326-26776-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548046326-26776-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_043710_054571_CDF35606 
X-CRM114-Status: GOOD (  10.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBNb24sIDIxIEphbgoyMDE5IDEzOjUyOjA2ICswOTAwOgoKPiBDb21taXQg
ZjllYmQxYmI0MTAzICgibXRkOiByYXduYW5kOiBEZXByZWNhdGUgLT5lcmFzZSgpIikgZGlzY291
cmFnZWQKPiB0aGUgdXNlIG9mIHRoaXMgaG9vaywgc28gSSBhbSBoYXBweSB0byBmb2xsb3cgdGhl
IHN1Z2dlc3Rpb24uCj4gCj4gQWx0aG91Z2ggdGhlIERlbmFsaSBJUCBwcm92aWRlcyBhIHNwZWNp
YWwgTUFQMTAgY29tbWFuZCBmb3IgZXJhc2luZywKPiB1c2luZyBpdCB3b3VsZCBub3QgYnV5IHVz
IG11Y2guIFRoZSBEZW5hbGkgSVAgYWN0dWFsbHkgd29ya3Mgd2l0aCB0aGUKPiBnZW5lcmljIGVy
YXNpbmcgYnkgc2luZ2xlX2VyYXNlKCkgKyAtPmNtZGZ1bmMgaG9vayAobmFuZF9jb21tYW5kX2xw
KQo+ICsgLT5jbWRfY3RybCBob29rIChkZW5hbGlfY21kX2N0cmwpLgo+IAo+IFRoaXMgbWV0aG9k
IGlzIGFsc28gZGVwcmVjYXRlZCwgYnV0IGRlbmFsaV9lcmFzZSgpIGNhbiBnbyBhd2F5Cj4gaXJy
ZXNwZWN0aXZlIG9mIC0+ZXhlY19vcCBjb252ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1h
c2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+CgpBcHBsaWVkIHRv
IG5hbmQvbmV4dC4KClRoYW5rcyEKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
