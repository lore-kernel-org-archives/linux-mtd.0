Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB7EF94CDF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2026 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfRWZ6wlNnh3Urw0dmNPv93D7eqauxzYPzoYr13HC5k=; b=2wacaxAnBWfwFM
	TeF9s+VKa14JPHHwbJ2Jd2uJxa8mgynHqLuvU5vbmtjmUJIlt+KweYtMQMW4ErfG0fCn/Wwy/04C6
	FD+6tFHs9S9cFjD7WzIzLYf2jVUp4fKrlEg4bpROuV9ISZ+OU/maVaTeVSeoC/xJdNlPusPTNpLQa
	XLeXIoVWbLI+vyTrJNa27VnswBKnpV9Otaw7BCqYmwr2RJywgs1LNiCjxWkTCYrsUQRmEtHHp47Vd
	yy6OuLHLwH1DQ3FXyhaii0uEtRcr9rDMVsouFGFBjoKUpnr/Cc0qhLQA9Btjg6MxjWlm01TCRz/S/
	UuGF9uFNUTGvfM3qN4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSdG-00000009l5z-01Cc;
	Wed, 22 Apr 2026 08:08:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFSdC-00000009l5J-1aFU
	for linux-mtd@lists.infradead.org;
	Wed, 22 Apr 2026 08:08:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 152CD1A33A1;
	Wed, 22 Apr 2026 08:08:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD026600DD;
	Wed, 22 Apr 2026 08:08:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50A3210460A3E;
	Wed, 22 Apr 2026 10:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776845296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ok/jDao3QWG80+zWCp1k65124isQJzzQbc2D1YJo5sA=;
	b=M/Ss/FQBq/QU57FoaB+yrUWa8nP1Z4ZxnvQO2psZ7Wbhqswl57GHd27JnXUpvuyqAMzUMi
	9NuBBXAv51qpepXszjoSlQbbOWwzCGzvy0pos0FO2fCVICOMjktJHE1zJQwCrxD7z8ZTUb
	FECM0gD/gh285SVjsm9QygsHvBgj+MPfFIBxsx58hOqYbsz6BCksKqtoo4NcweibazK/r8
	RovbaHM1aIY/dZREHsuzsCCG9NNykN7WNEJummlJB3av+Hk6CVvy7ghFooWYNPFyd3jdja
	QgQF5dBZmxeiNyUzBP4nkJ63w1lrD0KJMkPa7vv3d0hTLASfvdZ9+9OauI0vVg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v9 2/3] mtd: spi-nand: Add support for randomizer
In-Reply-To: <20260422070203.698716-3-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 22 Apr 2026 15:02:02 +0800")
References: <20260422070203.698716-1-linchengming884@gmail.com>
	<20260422070203.698716-3-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Apr 2026 10:08:10 +0200
Message-ID: <87a4uv5set.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_010822_856053_A4DD00A6 
X-CRM114-Status: UNSURE (   5.33  )
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

SGkgQ2hlbmcgTWluZywKCj4gK3N0YXRpYyBpbnQgc3BpbmFuZF9yYW5kb21pemVyX2luaXQoc3Ry
dWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICt7Cj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wID0gc3BpbmFuZC0+c3BpbWVtLT5zcGktPmRldi5vZl9ub2RlOwo+ICsJdTMyIHJhbmRfdmFs
Owo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAoIXNwaW5hbmQtPnNldF9yYW5kb21pemVyKQo+ICsJ
CXJldHVybiAwOwo+ICsKPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAibmFuZC1y
YW5kb21pemVyIiwgJnJhbmRfdmFsKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+
ICsJcmV0dXJuIHNwaW5hbmQtPnNldF9yYW5kb21pemVyKHNwaW5hbmQsIHJhbmRfdmFsID09IDEp
OwoKWW91IGRvIG5vdCBuZWVkIHRoZSAiPT0gMSIgcGFydC4gcmFuZF92YWwgaXMgY2FzdCBpbnRv
IGEgYm9vbGVhbiwgc28gYW55Cm5vbiB6ZXJvIHZhbHVlIHdpbGwgYmUgdGFrZW4gdW5kZXJzdG9v
ZCBhcyBhbiAiZW5hYmxlIiBhbmQgemVybyB3aWxsIGJlCnRyZWF0ZWQgYXMgImRpc2FibGUiLCB3
aGljaCBpcyBmaW5lLgoKVGhlIHJlc3QgbG9va3MgZmluZS4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
