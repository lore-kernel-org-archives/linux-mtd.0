Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6E0E83EF5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFkS/808hP6bN4RJRmF2+qXvszcriP+Ug0L1U1jsn+8=; b=2xYyopYKvGyMWA
	Jbd2j7PsG79FYgskdin5MPyN5s8fXHZlVdwpGkLbdabUMjbFRgj3EO8DC8VeWyHgF18BA7YMFheJo
	+xMkNlEIfLME2hCvz6iRcOFAKyzDEIgY9ewKp7Z2UwhYCYo+is5dmKmjanW/bqVPRoWY1eG+YoHYA
	59lk/jwuFPHVyWIVOsF/b2tMXqVJC/jydAnwMXkjs4ImmxrbIfOC8CiGfDoFT7Rz0Pyi3dUy6YnVL
	7rT7tSh5daIu0/7m1hMFX3LgGn0e0kl8UYbyJfaHuBwGLMSjPDnexaGSZGPhG+V7VKOpyiG8lKGPr
	zVXGIn9oaKX6aXL2+Vyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYKr-000000087jV-3kt1;
	Wed, 04 Feb 2026 08:34:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYKo-000000087jB-3ORE
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 08:34:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F0DD1A2BDE;
	Wed,  4 Feb 2026 08:34:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51B6F60745;
	Wed,  4 Feb 2026 08:34:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9468E119A865B;
	Wed,  4 Feb 2026 09:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770194039; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jU5XUIh7qVqt1sNUIHOcERIDnddZF1LxnSDFOqNZfuA=;
	b=SycNVSkpMox2GZw+VUtazXmr99r7RBfMPX2qbNICLIyAdULdXws1QGwjsFZk7MzCM4KHf8
	7f+Ls934Gx0knfKnFms+Ivb/q5d9zahuB5iaok1cIcDrQGNJT9x7F/fPp3jSp8syonmcGI
	C6XfkSOj87kbeBCWJLnDRPMQW5FoWg5eX1d1z8h6mwoWd5ZPbvk810qfuFwV0DFhhnbxeN
	sM1ll5DTqemkQ4zFrPHEU5g84jSvRFWInoBia7lrFBpHkuzgGqDfOHRDPN9vnFFgavZrpm
	YfwbI0Gkx/Fir0IyEylRQsnF42ixvtJKBHh+ZUMH2MCj1sbA4BFxmxXeS4DL9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Richard Weinberger
 <richard@nod.at>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Martin
 Kurbanov <mmkurbanov@salutedevices.com>,  Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v4 1/2] mtd: spi-nand: Add support for randomizer
In-Reply-To: <CAAyq3SbZn5Hjx85xMS4cPYaoBccsiCj1obRbLO9eD9_RV=h7RQ@mail.gmail.com>
	(Cheng Ming Lin's message of "Wed, 4 Feb 2026 09:47:15 +0800")
References: <20260203021358.693291-1-linchengming884@gmail.com>
	<20260203021358.693291-2-linchengming884@gmail.com>
	<87ecn1hovq.fsf@bootlin.com>
	<CAAyq3SbZn5Hjx85xMS4cPYaoBccsiCj1obRbLO9eD9_RV=h7RQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 04 Feb 2026 09:33:54 +0100
Message-ID: <878qd8hpql.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_003402_978552_1E1E22A8 
X-CRM114-Status: UNSURE (   8.96  )
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

SGkgQ2hlbmcgTWluZywKCj4+IExvb2tpbmcgYXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24s
IEkgcmVhbGx5IGRvbid0IGxpa2UgdGhlIGNvcmUKPj4gYWx3YXlzIGNhbGxpbmcgaW4gdGhlICJp
bml0IiBhbmQgdGhlIG1hbnVmYWN0dXJlciBkcml2ZXIgcmVhZGluZyB0aGUgRFQKPj4gYW5kIGRl
Y2lkaW5nIHdoZXRoZXIgb3Igbm90IGl0IGVuYWJsZXMgaXQuCj4KPiBJIGFncmVlLiBJIHdpbGwg
cmVmYWN0b3IgdGhlIGxvZ2ljIGluIHY1IHNvIHRoYXQgdGhlIGNvcmUgcGFyc2VzIHRoZQo+IGdl
bmVyaWMgRFQgcHJvcGVydGllcyAobmFuZC1lbmFibGUtcmFuZG9taXplciBhbmQKPiBuYW5kLWRp
c2FibGUtcmFuZG9taXplcikuCj4KPiBUaGVuLCBzcGluYW5kX3JhbmRvbWl6ZXJfaW5pdCB3aWxs
IGRldGVybWluZSB0aGUgc3RhdGUgYW5kIHBhc3MgYQo+IGJvb2xlYW4gYXJndW1lbnQgdG8gdGhl
IHNldF9yYW5kb21pemVyIGNhbGxiYWNrLCBsZWF2aW5nIHRoZSBkcml2ZXIKPiB0byBzdHJpY3Rs
eSBoYW5kbGUgdGhlIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uCgpQZXJmZWN0LgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
