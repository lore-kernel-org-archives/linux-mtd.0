Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4614DC10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1484820693
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RXViYg3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1484820693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/3Hp6izzb6ClP4XOAfcDOJDzz8dyGYxnhRH/GwN11Y=; b=RXViYg3tpCZBGp
	XKAfUIfXkbLBsmfZF9gXFNNGk9Ys57+PKqtw9ftjO6BhRvJp4DEvwMZT2jYaF8r5P4LJ22MbwlWj2
	zlLJtIQyZSfmhAOT4Y37tH/sKPHrmlWGfjQG7qStCVTkYpZBT+5dODj7/fTdJMCm6J6Xc47GlQlPc
	UrKWXPHv+7/e/jUEn08QV8vcNm/A4jniYLD9e/ZQw138pEaMze6IWepFmUg6ZLKTJfyLxAceYO3cJ
	NNwiqPXtRQHZCn3Js9B42hh2zwq7wYEMAy6a9a4J46nerpOzXPqreWG3JcxTDzgPbaZDj10Urwj03
	omkffAiACS6Rv+nnSQtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxEm-0001pS-QG; Mon, 15 Apr 2019 08:45:12 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxEf-0000ru-FV
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 08:45:09 +0000
Received: from xps13 (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr
 [90.88.18.121]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DB8F2200019;
 Mon, 15 Apr 2019 08:45:00 +0000 (UTC)
Date: Mon, 15 Apr 2019 10:44:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
Message-ID: <20190415104458.7faeec57@xps13>
In-Reply-To: <71df15e7-af2e-0326-78fe-0271a1e240fe@embeddedor.com>
References: <20190208180202.GA16603@embeddedor>
 <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
 <71df15e7-af2e-0326-78fe-0271a1e240fe@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_014506_396573_8E542655 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: Kees Cook <keescook@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gV2VkLCAxMCBBcHIKMjAxOSAxNjoxNjo1MSAtMDUwMDoKCj4gSGkgYWxsLAo+
IAo+IElmIG5vIG9uZSBjYXJlcyBJJ2xsIGFkZCB0aGlzIHRvIG15IHRyZWUgZm9yIDUuMi4KCldo
aWNoIHRyZWUgYXJlIHlvdSB0YWxraW5nIGFib3V0PwoKUGxlYXNlIGxldCB0aGUgTVREIG1haW50
YWluZXJzIHRha2UgcGF0Y2hlcyB0aHJvdWdoIHRoZWlyIHRyZWUuIFdlCm1pZ2h0IGJlIGxhdGUg
YnV0IHRoaXMgaXMgZGVmaW5pdGVseSBub3QgYSBnb29kIHJlYXNvbiB0byBieXBhc3MgdXMuCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
