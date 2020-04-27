Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940BEC4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE3C206B8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2v9gNBm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE3C206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emUVJSwK16tfm6kS/Gf+FjJahUMPaGk9fv9m7lNMUjc=; b=q2v9gNBmR8Tyoa
	2vyXiqjrPlPBPTjWNKuaiwdHyCKG6L69AqcD1ng6z6tzaE59EgVsKMoKlZWqRrTaXtyyb/t2V0bCh
	Ky7dbBP+DvvF7OoWaUS5kOt/mkuStLrSpUCXf6qX65D9ulsNrr47HnbiVn1Fd2y2/K/ENzJwimjXg
	KNxcqfPq4POe8KBJ7kNwuq9p1DAB65VOxBoxvok6f571Hs4zpLErfo1B9iTxnFbebL0898NNOYbh6
	2mGDU334lOopqAhoUHEu6tS6zkWryraNrbroR5KCCRpK0dwoWc0phDm/9pFBqhHQH0iFS+0bsQPTJ
	ut4CV03sxdnwtICORX8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9iM-0000qU-Rw; Mon, 27 Apr 2020 19:46:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9hz-0000VS-Tt
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:46:33 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 49EFCFF802;
 Mon, 27 Apr 2020 19:46:25 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:46:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 07/17] mtd: rawnand: cafe: Get rid of the debug module
 param
Message-ID: <20200427214624.12853774@xps13>
In-Reply-To: <20200427082028.394719-8-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-8-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_124628_109462_30BDCE7E 
X-CRM114-Status: UNSURE (   6.65  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDEwOjIwOjE3ICswMjAwOgoKPiBEeW5hbWljIHBy
aW5rIGFscmVhZHkgb2ZmZXJzIGNvbmRpdGlvbmFsIGRlYnVnIHRyYWNlcyBlbmFibGVtZW50LCBs
ZXQncwo+IG5vdCBkZWZpbmUgYSBuZXcgd2F5IHRvIGRvIHRoZSBzYW1lIHRoaW5nLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
