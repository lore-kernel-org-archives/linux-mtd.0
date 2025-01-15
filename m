Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F4BC02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHu2dOxtlqi+lhvCtcxUD5ADbRp9wNjO5HlVNDl1qTk=; b=Sq/lFd68+QY4fh
	77yRvO1QWw5SBzB8iuvOacUjgOV5fgjGwt/bAMt60zhW9zx6h76IoWu1bHdM3R/wvoh4SYHEBDujg
	adZcptvPhhSkth3or/g9C5Dc4SVFANPgPmk7cgYeaPcqOhopK1DRXCpmSF1t5cHEj1Klw32amz80E
	hJtS04/eqoSiqMC18vA9+uJJ/BBG7kmj2XdUkLvdd+/T9edOyLcdqRq1sxhlj0dGfbQ/wkmkH8J+9
	8m0vZL5qmmrLVC4o0CUMBtS3Mk0aC2/vhmhPeqbypoqiKa65/F4j3SlrjIzARWGCLfzFHeDzCsbD/
	UldA/a2MDCLYirurzsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7ow-0000000CiGB-20yK;
	Wed, 15 Jan 2025 18:08:50 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7ou-0000000CiEe-1BiS
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 18:08:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBB89C0003;
	Wed, 15 Jan 2025 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736964526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRZZWW7ToEMVMZmjTFMCLTtfxxvgXGipEv0bjwycwOA=;
	b=J6D60mwgghSsdNJ29HsxffEq4ScXbwVbGWB0pFhxeaoN6rLWdZklS+IrwE8XZkQFNK+br2
	2Hmxy6e2uhTxOWul2aNjKnEGmS6fqrQF/9frAhypK79KW19tUqqi2h9bCg6aAa4CJkM8NM
	bglDLlBFqYBMh/EOrhOEXzHBmViqiYn/FIXl5C3E+fd2Z9Gsq0FTWqr9vbIrgEPGZ6EHxA
	hFSBeBqXk45lbC2GzkxPJt/Cqj5fEi4gUmB1VtBsv96zahqBm/ZAnFSMXCketaK7RJ2TlH
	vJ0hfO7UbEYaWkFI5NAk3gUomspQYx64CcZ04utTWbeHMcd5k8eVinuIyorRWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@combitech.com>
In-Reply-To: <20250109-davinci-nand-v2-1-06bc5a3d177a@gmail.com>
References: <20250109-davinci-nand-v2-1-06bc5a3d177a@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: davinci: add ROM supported OOB layout
Message-Id: <173696452561.428480.11743500587240695986.b4-ty@bootlin.com>
Date: Wed, 15 Jan 2025 19:08:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_100848_610846_156F11B6 
X-CRM114-Status: UNSURE (   8.42  )
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

T24gVGh1LCAwOSBKYW4gMjAyNSAwODo1ODozMSArMDEwMCwgTWFyY3VzIEZvbGtlc3NvbiB3cm90
ZToKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIE9PQiBsYXlvdXQgdXNlZCBieSB0aGUgUk9NIGJvb3Rs
b2FkZXIuCj4gVGhlIHNhbWUgbGF5b3V0IGlzIHVzZWQgYnkgYm90aCBLZXlzdG9uZSBbMV0gYW5k
IE9NQVBMMTM4L0RBODUwIFsyXQo+IHdoaWNoIGN1cnJlbnRseSBpcyB0aGUgb25seSB1c2VycyBv
ZiBkYXZpbmNpLW5hbmQuCj4gCj4gT25seSBzZWxlY3QgdGhpcyBsYXlvdXQgaWYgdGhlIGBuYW5k
LWlzLWJvb3QtbWVkaXVtYCBwcm9wZXJ0eSBpcyBzZXQuCj4gVGhpcyB0byBhdm9pZCBicmVha2lu
ZyBhbnkgZXhpc3RpbmcgZGV2aWNlcyBvdXQgdGhlcmUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8g
bmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGRhdmluY2k6IGFkZCBST00g
c3VwcG9ydGVkIE9PQiBsYXlvdXQKICAgICAgY29tbWl0OiBkMGI4MDZmYzk5MzJhMDRkYWU4N2Ri
ZDAzYTJkZWE4MTE0ZWU2OTk2CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQv
bGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQg
bm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
