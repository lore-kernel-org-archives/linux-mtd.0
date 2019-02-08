Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28321C282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 21:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8CF21924
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 21:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="izidrJcI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8CF21924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjB6gg3kz11WX36Y18HbqYERrWh2AHWNCZJRqCwlOmo=; b=izidrJcI2vq1Ns
	WsCnWjU7tKnoJdlboyHLx0pSCFGGXVC1lFc0VU0Fg2Mmr4yqsK0UdCwdzBWXRKpdjCVapDg8+EC2D
	+wE/Z2UVeHa0s2u2H8ACE7JDYWImvAhVHht6Vh3gQ35ZcGJKeIcGor1spdVnUAfAghsmDhO2zxUNn
	ii6N+Fha1Qy8Ixe7/Ro1tGazL7CycpIt6UKZ0DexPbhuKphSpxJE//fUilwJ6KXM7i8inpOjYaN+V
	P7UEK2Z5CT+fh9nhmxKXBdKhprPqZN1I6tKiN/jfYlh+QbYR4WYgy1/a8i6tIOd9ggVAgUy8Ivnlu
	rNBfVAUT3RlYS8ZJ625g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsE9V-0002H2-Ru; Fri, 08 Feb 2019 21:57:41 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsE9S-0002GW-D8
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 21:57:39 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B2AB5100006;
 Fri,  8 Feb 2019 21:57:34 +0000 (UTC)
Date: Fri, 8 Feb 2019 22:57:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 05/11] mtd: rawnand: denali: rename irq_status to irq_stat
Message-ID: <20190208225733.2c8779b9@xps13>
In-Reply-To: <1549613335-30319-6-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-6-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_135738_608349_5FD4EE65 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBGcmksICA4IEZlYgoyMDE5IDE3OjA4OjQ5ICswOTAwOgoKPiBJIHdpbGwg
YWRkIHRoZSB0aGlyZCBhcmd1bWVudCB0byBkZW5hbGlfd2FpdF9mb3JfaXJxKCkgaW4gdGhlCj4g
Zm9sbG93aW5nIGNvbW1pdC4gVGhlbiwgc29tZSBsaW5lcyB3aWxsIGV4Y2VlZCA4MCBjb2x1bW5z
Lgo+IAo+IFJlbmFtZSAnaXJxX3N0YXR1cycgdG8gJ2lycV9zdGF0Jy4gU2F2aW5nIHR3byBjaGFy
YWN0ZXJzIHdpbGwgYXZvaWQKPiBsaW5lLXdyYXBwaW5nIGluIHNvbWUgcGxhY2VzLCBhbmQga2Vl
cCB0aGUgY29kZSBjbGVhbi4KCkkgaGFkIGEgbG9vayBhdCB0aGUgY2hhbmdlcyBhbmQgSSBkb24n
dCB0aGluayB0aGlzIGlzIHdvcnRoIHRoZQp0cm91YmxlLiBJIGRvbid0IGZpbmQgaXJxX3N0YXQg
bWVhbmluZ2Z1bCBlbm91Z2ggY29tcGFyZWQgdG8KaXJxX3N0YXR1cy4gSWYgeW91IHdhbnQsIHlv
dSBtYXkgYnJlYWsgbGluZXMgYmV0d2VlbiBhcmd1bWVudHMgb2YgYQpmdW5jdGlvbiBpbnN0ZWFk
LgoKPiAKPiBJIHJlcGxhY2VkIHVpbnQzMl90IHdpdGggdTMyIGluIHRoZSB0b3VjaGVkIGxpbmVz
LiBUaGlzIHdpbGwgcmVkdWNlCj4gdGhlIHJlcG9ydHMgZnJvbSAnc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tc3RyaWN0Jy4KCldoaWxlIHlvdSBhcmUgYXQgaXQsIGl0IG1pZ2h0IGJlIGludGVyZXN0
aW5nIHRvIGNvbnZlcnQgdGhlIHdob2xlCmRyaXZlciBpbiBvbmUgZ28gdG8gdXNpbmcgdTgsIHUx
NiBhbmQgdTMyPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
