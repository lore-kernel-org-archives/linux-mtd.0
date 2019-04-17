Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90028C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:25:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D482064A
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TCK3G11K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kUqaoJWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D482064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yzh/d5pmReDmHnMYeb2XHyPpwksMOTI4RAM+GLSNCek=; b=TCK3G11KQjJ/cs
	zlEmf2GVE6Hub30ZcwiLGatsUyP2leldb16dZmKgB9Ez3tAdhUMwC51dOwTk31P8bWLocYX22LDg6
	61F/lgU8dWL7XMht5H52/8uZjSOQ4ueqDjtA287KW86V7UGRA5wRN6YG9iWZmc4BfoKXh+W1ouXX6
	AchQrPB4AJkkDjgPPWrH/6aYdU/VzNqGidzSMbozYIOZ3cze/qZHBxX5Rds0zhhRkdvETHwPf02kP
	Quc1RfL/WTMJ8py0eY7MTNpGtiJ74igLeQhkSSxnS39PYQjiliLcvXIQQLf55xpksa3v3I/+8z8VJ
	UIwzfySwypS/4M3XQfZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhlI-0002o9-B3; Wed, 17 Apr 2019 10:25:52 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhlA-0002bF-AA
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tk03vq9lSgrI2S6HiL6tipDncSxhWGcwCmrYkFUlRjI=; b=kUqaoJWumuK888K85lfI9qERh1
 gyzlkqNv7g2IG+mK3AmBE+fNLMBLVnZet9n2LWycv9crURy4TgCHh38MNvEoAGe1Kmy6gkais92Zb
 OxW3cz0A0o1QUNNDUSyMddxfn34n4Tu6jv0Qzlz9TkGW24UsEPa3fpE2kt9ALXIv1iveg7sFeZ3xy
 i3AmfZ07iR8rjsznDX3CJ/vKnrR1wgX/S5s5C79DWzm9gN3tJZNeNWjAQcX0ZjZCeirsonJiigx+u
 JgSsj2VIYKNsMXYaJTC4ElUzwYO+YJFqqXPl2BnfbUmojEpnLRuSWC0sbW1Oywmzh3OxiF0TLw8ww
 xJSo2UQA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhl7-00085D-3A
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:25:42 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7CF506000D;
 Wed, 17 Apr 2019 10:25:09 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:25:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 06/14] mtd: rawnand: gpmi: read buf in nand_read_page_op
Message-ID: <20190417122508.639ebd68@xps13>
In-Reply-To: <20190409113421.3037-7-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-7-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_062541_716367_D5519379 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjEzICswMjAwOgoKPiBUaGUgZHJpdmVyIGNhbGxzIG5h
bmRfcmVhZF9wYWdlX29wIHdpdGhvdXQgYSBidWZmZXIgcGFzc2VkIGFuZCB0aGVuCj4gY2FsbHMg
Y2hpcC0+bGVnYWN5LnJlYWRfYnVmIHRvIHJlYWQgdGhlIGJ1ZmZlciBhZnRlcndhcmRzIHdoaWNo
IGlzCj4gdGhlIHNhbWUgYXMgcGFzc2luZyB0aGUgYnVmZmVyIG5hbmRfcmVhZF9wYWdlX29wIGlu
IHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1
ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFu
ZC9ncG1pLW5hbmQuYyB8IDEyICsrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
