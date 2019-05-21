Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9528C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F61216B7
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5fiVnwb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MjNpwhLo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F61216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UaMioKPyfKvOPLC2Bb90iKtBXFaWGdHinfDonRAi/E=; b=b5fiVnwbazwYm5
	rb0nkqe86j+dczaFxRVtz6UwW+0uFl6V5KLaSCe7jKcTE4RthpmrzGRZ2Xz6Ev/Ox49KKet9jmvY7
	Sjbop4sDHMIftLPLTl5CLOAtxCqDcmlEJsVT2IgRW60QTeIoYTo1dFhMy7nplyZoY8swl3Z2daEBw
	lxaw5KzXMKwBLG4FYAoakjo0M2NQjDBHtydYQxhpyrt5KTJmjtmtkSdOkxBm+jgHNNIFqvgFaVQKS
	YWu8j9D70e+vCxNdBGzNicNu+glp910tQujGVJrLTslU/995O1uF+5qLc5c23iXJek+VBjNUjgdBW
	V5rF61FPLv4Gogre+izg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0DT-0000fN-JV; Tue, 21 May 2019 08:33:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0DR-0000bV-IZ
 for linux-mtd@bombadil.infradead.org; Tue, 21 May 2019 08:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o1mzADbX4WWJguEzTmoGBTG/8qeXlXsUKgO1XhAlNME=; b=MjNpwhLoBaO13x2G8JYVZlzH7M
 adBF/2eRo7X1PC027vSTlVs4Sd9fJ8qOTpCKeq/ui4xgJ9Bw3wQHHkDJCqKYiC27TCoBVT0qHwWK+
 ZdgnpciAhkwfgiA44T50dt4sK7saqVzy8tQOpISZuoAM/Ld0cJf2pXTpAjSkH2z6T1BNsi2MyH7vM
 ug2fPmZIHOAUc4ZhSd9gDCVyOWm4AeDrpwAS/1KOVYyfH3DggLw/QvMbe9x5eUPoI5FJ7YeIf1Ok5
 wDtRHO5yt5kXgkPmAV23Q1/Pqv2Nl4Jqg+PlsRujk/fXUe5euFN2wMFY3a5V1sLRTtrTU9eKZFU2l
 0IH1MpEw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0DO-00008D-6L
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:33:44 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DAB961C001A;
 Tue, 21 May 2019 08:33:05 +0000 (UTC)
Date: Tue, 21 May 2019 10:33:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: initialize ntargets with maxchips
Message-ID: <20190521103304.45318f4d@xps13>
In-Reply-To: <20190521081721.541-1-s.hauer@pengutronix.de>
References: <20190521081721.541-1-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_093342_254222_2723E838 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsIDIxIE1heSAyMDE5CjEwOjE3OjIxICswMjAwOgoKPiBtZW1vcmctPm50YXJnZXRzIGlz
IGluaXRpYWxpemVkIHdpdGggJzEnLiBJdCBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgd2l0aAo+IHRo
ZSBtYXhjaGlwcyBhcmd1bWVudCBmcm9tIG5hbmRfc2NhbigpIGluc3RlYWQuIE90aGVyd2lzZSBt
dWx0aSBjaGlwCj4gc3VwcG9ydCBlcnJvcnMgb3V0IG9uIHRoZSBzZWNvbmRhcnkgY2hpcCBzZWxl
Y3RzIHdoZW4gdHJ5aW5nIHRvIGNhbGwKPiBuYW5kX3Jlc2V0KCkgb24gdGhlbToKPiAKPiBXQVJO
SU5HOiBDUFU6IDAgUElEOiAxIGF0IGRyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oOjEx
NAo+IG5hbmRfcmVzZXRfb3ArMHgxOTQvMHgxYzQKPiAKPiBXaXRoIHRoaXMgbWVtb3JnLT5udGFy
Z2V0cyBpcyBpbml0aWFsaXplZCB3aXRoIHRoZSBtYXhpbXVtIG51bWJlciBvZgo+IGNoaXAgc2Vs
ZWN0cyBzdXBwb3J0ZWQgYnkgdGhlIGRyaXZlci4gQWZ0ZXIgaGF2aW5nIGRldGVjdGVkIHRoZSBu
dW1iZXIKPiBvZiBhY3R1YWxseSBjb25uZWN0ZWQgY2hpcHMgbWVtb3J5LT5udGFyZ2V0cyBpcyB1
cGRhdGVkIHdpdGggdGhhdAo+IG51bWJlci4KPiAKPiBGaXhlczogMjgxM2UyODg0MTQgKCJtdGQ6
IHJhd25hbmQ6IEdldCByaWQgb2YgY2hpcC0+bnVtY2hpcHMiKQo+IAoKTXkgR2l0IGhpc3Rvcnkg
ZG9lcyBub3Qga25vdyB0aGlzIGNvbW1pdCwgYXJlIHlvdSBzdXJlIGl0J3Mgbm90CjMyODEzZTI4
ODQxNCBpbnN0ZWFkPwoKVGhpcyBjb21taXQgd2lsbCBnbyB0aHJvdWdoIHRoZSBmaXhlcyBicmFu
Y2guCgpUaGFua3MhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
