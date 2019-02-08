Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D4C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 21:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F02218D2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 21:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J0qiZBbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9F02218D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nW2HYuwiQlXmthu8S/x+f0IpB3Fuh2cqKMbf6CdoGPA=; b=J0qiZBbnOC1Vok
	K52jDQ5iGY3OBiCkXbLBTfpbFMbCTtuBB4nX3QYQnRoGD4UcFi+JrPwH9/DXybvWdJXuBHD7bEzIz
	u0xwaTdmE4DhKQe59wVihqu7ubkVyKnlDNgYzcD9mwk44sgtPrrOvIkCNUY+1FUXM2wmXXYwj/su0
	Fkse/fqQfnk2EZTgziPBRsAF0O9t7sxoGZKbByRTr1li/0B6Sc2uIaORW/UMUZPNUXCcdywXdzhA7
	fY/OFdl8nXzJCkYQ8VgCF7A1yiFJfZF86h2h5wijpvvxQaUumNv0Y5b4aR3Ny4iDZpBM4n2H8RpXh
	GQQgQvIKXqz3I3hfc6lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsE7S-0001cE-Au; Fri, 08 Feb 2019 21:55:34 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsE7P-0001ax-3t
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 21:55:32 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C1C82100005;
 Fri,  8 Feb 2019 21:55:21 +0000 (UTC)
Date: Fri, 8 Feb 2019 22:55:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 00/11] mtd: rawnand: denali: exec_op(), controller/chip
 separation, and cleanups
Message-ID: <20190208225520.2f19d2de@xps13>
In-Reply-To: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_135531_310667_225785B5 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBGcmksICA4IEZlYgoyMDE5IDE3OjA4OjQ0ICswOTAwOgoKPiBJIHRvb2sg
dGltZSBmb3IgdGhlIERlbmFsaSBkcml2ZXIgdG8gY2F0Y2ggdXAgd2l0aCB0aGUgbGF0ZXN0IGZy
YW1ld29yay4KPiAKPiAgLSBzd2l0Y2ggb3ZlciB0byBleGVjX29wKCkgYW5kIHJlbW92ZSBsZWdh
Y3kgaG9va3MKPiAKPiAgLSBzZXBhcmF0ZSBjb250cm9sbGVyL2NoaXBzCj4gCj4gIC0gdmFyaW91
cyBjbGVhbnVwcwo+IAoKV2hhdCB5b3UgZG8gaXMgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLiBUaGFu
a3MgZm9yIGtlZXBpbmcgdGhpcyBkcml2ZXIKdXAtdG8tZGF0ZSEgQSBmZXcgcmV2aWV3cyBhcmUg
Y29taW5nLCBJJ2xsIGRvIGFub3RoZXIgcGFzcyBmb3IgdGhlIG1vc3QKY29tcGxleCBwYXRjaGVz
IGxhdGVyLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
