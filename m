Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C73C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83s2riUahKFouNcT/ZnTwNS+9Pmi1XzflfJJxY+kBnc=; b=Moi1hLiWAQKO/n
	kNha/gQGURGHQaJj17FelUCrm/cP0xiRcSuj7D/iKXdUsGW8hrNzsgCaN5Cr0uBImVbJDlnQLsleM
	u2Gk0NTBEhD/1uPzAzfDvbN8e6EO0R0a/Abm9HdryCeAsbR4ooBR3A1A73g77HlJE8voE2S+Nqrpp
	one1Pvr+gcjYzpa7f2aqhCmcfegHgayXm2ZOGTb9OFVgMArSZo9IKNtmfhrlG4SHtiKPVW0GaeYMA
	WW0SjLPkICgE97KP9FtMLOrnzoBbzIpcCw5OLcVS/TATXtacvT2lFaWAEek/BMpqosxnT1wAg9/BC
	lH7NzboFYv7fpdyLKq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vX-0000000DaO6-0rJr;
	Fri, 25 Sep 2026 14:29:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vW-0000000DaLs-0eIA
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Sep 2026 14:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JJuC5P2/SLW6SGurBPLj/a4CObZQWKJbGuaLnG1+AqM=; b=RN2vqC5JYPZ/qbxkkchwBF/S68
	2rfxHnXJPrOwejIUOHsOiT88s2AJGHZmoYl1f4rkH6iaBw/rsBuR6XYDeY0nsqfy4NKNC7V3VDDTb
	YNHwPXq5qV/CCUiLCJy8wqH0AUZv+w2BpNHVr/EMhI9LCsKXjqs3XU1Cb+OjwqSxWbmABxz5OieUP
	V9lnlY+S9msN5Qk+o+SGtqSeYk22m/c76DIMl9pyUQhqQFTl8sqB7MmLqNbkTBAr3zWd1diEGv5P1
	SisJ4OPB50uww7jCnWzn15wz4zgt7yLLV77SUTnqJSePvIoN/DxpV7ThFY1rllyMm2S4S9CetulUH
	VF+5vQQA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA6vT-0000000H0Bb-102I
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:29:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9848A4E41072;
	Fri, 25 Sep 2026 14:29:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 641E96073B;
	Fri, 25 Sep 2026 14:29:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A477102F08C8;
	Fri, 25 Sep 2026 16:29:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JJuC5P2/SLW6SGurBPLj/a4CObZQWKJbGuaLnG1+AqM=;
	b=XkAnVrpmJuQTQyKh2aWpgdbg2QrDT7f3JYEgTekTWrKBfGMVmHEOrQ5aWKO8KPzlI5SUDZ
	wwLCxQrDna1+k+PuSHazJC0vXNHTqlznS3Omx8d7sVSEP0CyFUFj3fIhukF0YuXtsxPrru
	iNL0aiFwLfVzozsGkyHrYmsvcK3lcHW1D35n/PALpSL9eRa33SZ2s6jQx3tt60eQg3/srn
	U0KgdyTSEiMMSOaaj2Ly4StfGsFx4tmgka+uhZADStjaYqv2ml1pDKv5yeg8k+oZ1UJjF6
	9sQrOK2psfTin/yJ31BT40iG/sV6HaPu9Yq7laKIE+wUsUbE6xxUomLimeFbAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qingfang Deng <qingfang.deng@linux.dev>
Cc: syzbot+e08e0a15269eefa87790@syzkaller.appspotmail.com
In-Reply-To: <20260921014921.78150-1-qingfang.deng@linux.dev>
References: <20260921014921.78150-1-qingfang.deng@linux.dev>
Subject: Re: [PATCH] mtd: block: prevent reclaim I/O during request
 processing
Message-Id: <179034655494.1166139.8055654489913256442.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_152923_372272_F57CAE79 
X-CRM114-Status: UNSURE (   6.70  )
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

T24gTW9uLCAyMSBTZXAgMjAyNiAwOTo0OToyMCArMDgwMCwgUWluZ2ZhbmcgRGVuZyB3cm90ZToK
PiBUaGUgYmxrdHJhbnMgcmVxdWVzdCBjYWxsYmFja3MgcnVuIHVuZGVyIGRldi0+bG9jayBhbmQg
bWF5IGFsbG9jYXRlCj4gbWVtb3J5IHdpdGggR0ZQX0tFUk5FTC4gRm9yIGV4YW1wbGUsIG10ZGJs
b2NrX3dyaXRlc2VjdCgpIHVzZXMgdm1hbGxvYygpCj4gdG8gYWxsb2NhdGUgaXRzIGVyYXNlYmxv
Y2sgY2FjaGUuIERpcmVjdCByZWNsYWltIGNhbiB0aGVuIHJlY3Vyc2UgaW50bwo+IGJsb2NrIEkv
TyBhbmQgZGVhZGxvY2sgb24gcmVzb3VyY2VzIGhlbGQgYnkgdGhlIHJlcXVlc3QgYmVpbmcgcHJv
Y2Vzc2VkLgo+IHN5emJvdCByZXBvcnRzIGEgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IGlu
dm9sdmluZyB0aGUgZGV2aWNlIG11dGV4Cj4gYW5kIGZzX3JlY2xhaW0uCj4gCj4gWy4uLl0KCkFw
cGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogYmxvY2s6IHByZXZlbnQgcmVj
bGFpbSBJL08gZHVyaW5nIHJlcXVlc3QgcHJvY2Vzc2luZwogICAgICBjb21taXQ6IGQ0OThiMmRk
ZGE5OWVlZDI4Y2RlMTc3YjE2MjBkYmNlYTI0NmExYzQKClBhdGNoZShzKSBzaG91bGQgYmUgYXZh
aWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAo
cHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMs
Ck1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
