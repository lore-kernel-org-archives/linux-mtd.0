Return-Path: <SRS0=c1be=3T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8ECC2D0DB
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2020 19:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4119820708
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2020 19:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/bcceVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4119820708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdLSZv2XJ45XD+q9uweF/2MiZ4bn2S4Jw4LFOjEKQjk=; b=e/bcceVtHCLQdw
	rKizTSxFCqFQL03SaZdJRxPuBPrRyUeAmZ/dAzL3LhCMUCidppd4+l79/1zZi30VGOllP8dVgCYRP
	swwIFCzEMg8SXnhaCFzOfNUY13Km5iQ0moewi1lHyShI+fuRaNgqw2g9aSAj0FQ7tQEQ2dBc6uLjd
	cP33Lvozcfj4+GqmSFdfJ4manmPvVDQH2VWuz85lFF50neo+d+04rmSQj4tRIaW1s60Sp2Pnf3BAX
	4UYrX5+hyolOIT3tzf+Jv/jl+CMambvbz3Fg1hfzO2hBlnaxXrriw38+uOY/TWYcqPFvkKJcgpCFS
	elxW14IvDWUqXXrqpZyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixFqs-00056q-Un; Thu, 30 Jan 2020 19:51:46 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixFqp-00056F-La
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2020 19:51:45 +0000
X-Originating-IP: 93.23.196.10
Received: from xps13 (10.196.23.93.rev.sfr.net [93.23.196.10])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6CC2640002;
 Thu, 30 Jan 2020 19:51:34 +0000 (UTC)
Date: Thu, 30 Jan 2020 20:51:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: miquel.raynal@bootlin.com
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.6
Message-ID: <20200130205133.4b69eb2b@xps13>
In-Reply-To: <20200121200829.346bcbdc@xps13>
References: <20200121200829.346bcbdc@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_115143_843793_F3B1AFC8 
X-CRM114-Status: UNSURE (   8.58  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBUdWUsIDIxIEphbiAyMDIwCjIwOjA4OjI5ICswMTAwOgoKPiBIZWxsbywKPiAKPiBUaGlzIGlz
IHRoZSBOQU5EIFBSIGZvciA1LjYuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKPiBUaGUgZm9s
bG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGIzYTk4N2IwMjY0ZDNkZGJiMjQyOTNlYmZmMTBl
ZGRmYzQ3MmY2NTM6Cj4gCj4gICBMaW51eCA1LjUtcmM2ICgyMDIwLTAxLTEyIDE2OjU1OjA4IC0w
ODAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQgdGFncy9uYW5kL2Zvci01LjYKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
ZDg1MzM5ZDllYTI2NjBiNTUwZjEyYWNhOGJkMDQwYmU0Mzk1Yzk2MzoKPiAKPiAgIG10ZDogb25l
bmFuZDogUmVuYW1lIG9tYXAyIGRyaXZlciB0byBhdm9pZCBhIGJ1aWxkIHdhcm5pbmcgKDIwMjAt
MDEtMjEgMjA6MDA6MzUgKzAxMDApCgpQdWxsZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
