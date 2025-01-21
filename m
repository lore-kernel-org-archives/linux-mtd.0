Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322ACC02182
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2025 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRpDJX8Oag1tNj9jk6C+ODgubNoTxxz2/C8rH2mURZ0=; b=DW4LO909c1F+Ln
	1iP/vQCLQux0ZPl/h95PiOhVES7aTRX+SY7or+tBhpgHMeKVU0fynXBR0Vw2v6atEe0ZM5hiC3M8r
	vC9k4youO9MbytiUmB21DhnfH55nqGKSKixpbb5rhGSXYGuRwT4UOrso2HcSiK4BgjPocZnM0SmNs
	Q9EaCVUHbzyGIQ1+17mqQjku/kGYAvfVXwuEjaTiLHFm9qFeGTaERltPH28H4IHMUNEJVedJZZqOJ
	EBL6vzQDNj43HU7gV969ac7YFoAAXjMFKyeZsa27N9euNJgGcvhAWzGWpTdVNlHDxv5kKcfT4sURK
	vhXRZwj9FQaECMDZhwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAwv-00000007TQ8-3K5T;
	Tue, 21 Jan 2025 09:53:33 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAws-00000007TPa-3kgA
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jan 2025 09:53:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2ED3FF811;
	Tue, 21 Jan 2025 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737453207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+c6kQoGMII5VVsutdEuxvBRff1dE5WdMaDtL/pUrqU=;
	b=DjwuNruNGDTiV/G6vejkSBTSpcBLSk3yVsf6RR7t/BviF9sNhEXHYAUC7FqQMu0pJwIDDF
	AziEnKbIk4Wrp0G201/tESCyRdTKQUw6yX7sWiF28of7bnTwlPAAcIHsTs+8BtffBV/tsS
	pfYex/+amlQ2HyWPl1ENdOucWoURjvSajsQDrh2AQy6QHU4zg1OG1wdFWnHcjYlHsJNbnt
	MrTz7Y/GDU+VA0uzBzDOgE4Kyu/F0dpHb55U0juMNGpa2F/0MmWjq4yCEodMr0k/euWV3i
	3RXF/rrXcX+HxlldP6eeB84vha9yj2vKmlONYCgVfBphz83hzzr7Eg11vS75dw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: niravkumar.l.rabara@intel.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux@treblig.org,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  u.kleine-koenig@baylibre.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: cadence: use dma_map_resource for
 sdma address
In-Reply-To: <20250116032154.3976447-3-niravkumar.l.rabara@intel.com>
	(niravkumar l. rabara's message of "Thu, 16 Jan 2025 11:21:53 +0800")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-3-niravkumar.l.rabara@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 21 Jan 2025 10:53:26 +0100
Message-ID: <87ed0wpk6h.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_015331_083114_E418AF4B 
X-CRM114-Status: UNSURE (   6.33  )
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

SGVsbG8sCgpPbiAxNi8wMS8yMDI1IGF0IDExOjIxOjUzICswOCwgbmlyYXZrdW1hci5sLnJhYmFy
YUBpbnRlbC5jb20gd3JvdGU6Cgo+IEZyb206IE5pcmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2a3Vt
YXIubC5yYWJhcmFAaW50ZWwuY29tPgo+Cj4gTWFwIHRoZSBzbGF2ZSBETUEgSS9PIGFkZHJlc3Mg
dXNpbmcgZG1hX21hcF9yZXNvdXJjZS4KPiBXaGVuIEFSTSBTTU1VIGlzIGVuYWJsZWQsIHVzaW5n
IGEgZGlyZWN0IHBoeXNpY2FsIGFkZHJlc3Mgb2YgU0RNQSByZXN1bHRzCj4gaW4gRE1BIHRyYW5z
YWN0aW9uIGZhaWx1cmUuCgpJdCBpcyBpbiBnZW5lcmFsIGEgYmV0dGVyIHByYWN0aWNlIGFueXdh
eS4gRHJpdmVycyBzaG91bGQgYmUgcG9ydGFibGUKYW5kIGFsd2F5cyByZW1hcCByZXNvdXJjZXMu
Cgo+IEZpeGVzOiBlYzRiYTAxZTg5NGQgKCJtdGQ6IHJhd25hbmQ6IEFkZCBuZXcgQ2FkZW5jZSBO
QU5EIGRyaXZlciB0byBNVEQgc3Vic3lzdGVtIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IE5pcmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2a3VtYXIubC5yYWJh
cmFAaW50ZWwuY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
