Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE05C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FPSJj53KoC/lMC1WG5fuTODdQZ0Ck88iTmtcOOlRjg=; b=jUyMJWFslrGte/
	OAp2CGmykP1GHh0jjsWcgbkNwt3FE5Aqmwv3xQ2DD7HjIEfZFelWa7HH+QHYfTCknKoy/gmG06Lx8
	POF8bWYy090xTuBhS5KpU+4TYzvVzetfl9JUy4nq/nT5smyCc/BzBo6uJpW84ML7rwpShXs2v1Oxs
	o9tnW5IBJ6/c4O1pLfx/7aQQMkuJqI9cgqSu263j3LI4DfHOyS0XCdPSWwXzxzWtxowfq3rMENApo
	P0Sx6zUxzdDZhluu/rwMhseXupLtbUe6UvbhNJmYF9BCcXnRuAWRurC0zf4UwzQzQDRjsDLj44d5u
	bZ+9+YGWENxsz2wAXFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CgP-00499S-CG; Mon, 05 Dec 2022 14:43:01 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CgM-00497U-Ez
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 14:43:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 74476FF809;
	Mon,  5 Dec 2022 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670251375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNZEK/cO0ve68fGOH7+FuKJsQ+43JRZpHaVlBa10hDY=;
	b=EmCBkcL1DjWC17j+vAQNBM+vHlK7k7ezcvMi7PtXfTEzSBqTceoll40v7v2LoCuwKWti2t
	ORE0RasGJDp2o+m+4wuzBmTPS8I/ifUYu79+yCPBDG1GnKpB10MLOzfaHaXCP5TGQzzjVH
	DawkiqD1YPqHFv0gEyUr1t+6EliyWckxWkPsgXqH0xPJGGU1xrLD1gvgS8D0ycKf6lxcBV
	g7s/rYgB9IDt/rOXnx/7Mcm8vYzX0bGxbXE8ZZOQoLbxmPpZ6gROpWuX39Cj5tgSALBZah
	lj+tjcSkqY4BQmWPYBU++35+ZmUSuw4BC5uq6vS8ns7QIqv+AynIKIRQmltQDw==
Date: Mon, 5 Dec 2022 15:42:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.2
Message-ID: <20221205154251.13578a20@xps-13>
In-Reply-To: <20221129154631.1e1a09bf@xps-13>
References: <20221129154631.1e1a09bf@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_064258_651803_8653A25D 
X-CRM114-Status: UNSURE (   7.43  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFR1ZSwgMjkgTm92IDIw
MjIgMTU6NDY6MzEgKzAxMDA6Cgo+IEhlbGxvLAo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgOWFiZjIzMTNhZGMxY2ExYjYxODBjNTA4YzI1ZjIyZjkzOTVjYzc4MDoKPiAK
PiAgIExpbnV4IDYuMS1yYzEgKDIwMjItMTAtMTYgMTU6MzY6MjQgLTA3MDApCj4gCj4gYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gICBnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdzL25hbmQvZm9y
LTYuMgo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2NDA4Y2MwNWE1MGFhZjg4
MDc0YTVhMzFkMDY1ZTVhZjg3YTQ1NmY1Ogo+IAo+ICAgbXRkOiByYXduYW5kOiBEcm9wIG9ic29s
ZXRlIGRlcGVuZGVuY2llcyBvbiBDT01QSUxFX1RFU1QgKDIwMjItMTEtMjUgMTA6MDU6MzMgKzAx
MDApCj4gCj4gUGxlYXNlIG1pbmQgdGhlIGNvbmZsaWN0IHdoaWNoIHdpbGwgbmVlZCB0byBiZSBt
YW5hZ2VkIGluIHRoZSBtZXJnZQo+IGNvbW1pdCwgYXMgcmFpc2VkIGJ5IFN0ZXBoZW46Cj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbmV4dC8yMDIyMTExODExNDU0Ni4zYWMzNTIxZUBj
YW5iLmF1dWcub3JnLmF1LwoKUHVsbGVkIGludG8gbXRkL25leHQuCgpDaGVlcnMsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
