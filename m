Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658C9C5AD55
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVri7Kq+akFSjjKVFWAo+EZv6YiQzg1RT3U10864+Xw=; b=rB7IDQ+k3UIq7o
	6C/c2ikCP6r0G0lrSnsOzOm2GYI/dpjik1N9X+5AFmNG07QKLok12rFF+Z4EGGcgcOC2wHe3+wIn8
	n8zd3HPlJwien2g0yL0wcIsR6WUHckAkmIMIIJuZFv3+AybeNw7nWqduycbWBWx7t5C7hc2WwwzrE
	BCk3M25pHHrSksduXUc50UgMtNOQZX6MH1gO0i604ZFVWD7I8G/mzD2wdnuA7TIAKJ9HuR6Yh7EFy
	9ObuPj64TAV4vNZWQXx+UQ0HJqQWsY11dBL8WEu51NkQJZi1s1gjoMT0LqN+7JO8PacfsdpquCBuz
	gbvXdPPOmT2lMgXgG2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRDn-0000000C33O-32m9;
	Mon, 10 Aug 2026 14:43:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRDl-0000000C335-0z7a
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 14:43:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 10D874E411A7;
	Mon, 10 Aug 2026 14:43:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0C586033B;
	Mon, 10 Aug 2026 14:43:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C0DA11C4A92D;
	Mon, 10 Aug 2026 16:43:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786372993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DFcmzTxcfvHvsND/GxU4BOG9tZi3TmHLVO3tfLXELVI=;
	b=ixyRUP3VJdZ4Xt0yFsjWxqDi8+Dr492tC1T4SfoUVox5rNxOI5nQniHRkV8d7WEEhCr1da
	c0RM1LdCGMi5VX67mf1kJQgzt5I9vRzqdxWHeP93senNma6CjswrsVYlPgJGNu8vSO3DN1
	cpkQGTpmgWgyzMphNK8euhsT45LQWebCKOzIuZ/LImPJNZHP/Qz/XQt8+aGdI7CNOLfNYl
	RQ0OZugTVj7K6OaCyLoJ2wHJoA+a0yn6AGiBconIdWqLEfBWdIfzHS/iPjeiORojKe0xZH
	QPqOpXOcOxC0Q4KneUN84rlIuGWoqzqEtc6oLzovpeDt3heuZpGcfWKPEQvjDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  praneeth@ti.com,  u-kumar1@ti.com,  p-mantena@ti.com,  a-dutta@ti.com,
  s-k6@ti.com,  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/3] mtd/spi-mem: Enable DQS support
In-Reply-To: <8a729209-3bf9-4f2e-8870-1cbb64a95184@sirena.org.uk> (Mark
	Brown's message of "Fri, 7 Aug 2026 17:14:37 +0100")
References: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
	<8a729209-3bf9-4f2e-8870-1cbb64a95184@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 16:43:09 +0200
Message-ID: <87zeyuox36.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074321_412494_00CA50CD 
X-CRM114-Status: UNSURE (   7.14  )
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

SGksCgo+PiBNYXJrLCBhcyBhZ3JlZWQsIHlvdSBjYW4gdGFrZSB0aGUgc3BpLW1lbSBwYXRjaCB0
aHJvdWdoIHNwaSBmb3IgdGhpcwo+PiBjeWNsZSwgYW5kIEkgd2lsbCBwaWNrIHVwIHRoZSByZW1h
aW5pbmcgc3BpLW5hbmQgcGF0Y2hlcyBhZnRlciB0aGUgbWVyZ2UKPj4gd2luZG93Lgo+Cj4gQXMg
SSBzYWlkIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uIGNhbiB5b3UgcGxlYXNlIHNlbmQgc29tZXRo
aW5nIHRoYXQgY2FuCj4gYmUgYXBwbGllZD8gIFRoZSBNVEQgcGF0Y2hlcyBhcmUgZmFpbGluZyB0
byBhcHBseS4KCkkgdGhvdWdoIHlvdSBoYWQgaXNzdWVzIHdpdGggdGhlIHNwaS1tZW0gcGF0Y2gu
IFRoaXMgdmVyc2lvbiBzdGlsbApkZXBlbmRzIG9uIFNhbnRob3NoJ3Mgd29yay4gSSB3aWxsIHNl
bmQgYW4gdXBkYXRlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
