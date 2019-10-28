Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E2DCA9EC1
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 16:44:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D88821744
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 16:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e3C9LvRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D88821744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF7S2bULbYJR+xrIphGv2pmouhc06YQId0dSO6kz3Us=; b=e3C9LvRSHHerLI
	WMq51fmowaJc65zs63T2rhlsQBHUBBMkB/Pihw5dEf/F5FWuSrn7oxFs6jIeo9q3rBmtX4pTD4LVU
	6FJictzBfB2bw61lpzmr2FQhWziiSAZV+cJ5+yTaUqq9SSD7Cwivs7Frzx3I6XQyy5bIFR7FBo7XR
	QjEoibLoQTH6GY2HGDw8SWe5jIqdu0rAvZBKysezYpyjPEhujhLwGGxmJH74KsfP9GeKCNpL8O7PR
	fFXrBQjaPHQ7Cb7y4WR/ZmSIiMxbwmECW8PGbjstfvsPDxPRG4QZJLJPf2xCc3rPeARpL1BV+v31a
	XVrClOTruQyzwXO/NFjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP87x-0002Cw-Rh; Mon, 28 Oct 2019 16:44:21 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP85K-00088u-Ua
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 16:41:41 +0000
X-Originating-IP: 91.217.168.176
Received: from xps13 (unknown [91.217.168.176])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EC341FF80E;
 Mon, 28 Oct 2019 16:41:31 +0000 (UTC)
Date: Mon, 28 Oct 2019 17:41:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH][RFC] mtd: spinand: fix detection of GD5FxGQ4xA flash
Message-ID: <20191028174131.65c3d580@xps13>
In-Reply-To: <20191016013845.23508-1-gch981213@gmail.com>
References: <20191016013845.23508-1-gch981213@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_094139_136292_7CB8E671 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: Stefan Roese <sr@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Jeff Kletsky <git-commits@allycomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpDaHVhbmhvbmcgR3VvIDxnY2g5ODEyMTNAZ21haWwuY29tPiB3cm90ZSBvbiBXZWQs
IDE2IE9jdCAyMDE5IDA5OjM4OjI0CiswODAwOgoKPiBHRDVGeEdRNHhBIGRpZG4ndCBmb2xsb3cg
dGhlIFNQSSBzcGVjIHRvIGtlZXAgTUlTTyBsb3cgd2hpbGUgc2xhdmUgaXMKPiByZWFkaW5nLCBh
bmQgaW5zdGVhZCBNSVNPIGlzIGtlcHQgaGlnaC4gQXMgYSByZXN1bHQsIHRoZSBmaXJzdCBieXRl
Cj4gb2YgaWQgYmVjb21lcyAweEZGLgo+IFNpbmNlIHRoZSBmaXJzdCBieXRlIGlzbid0IHN1cHBv
c2VkIHRvIGJlIGNoZWNrZWQgYXQgYWxsLCB0aGlzIHBhdGNoCj4ganVzdCByZW1vdmVkIHRoYXQg
Y2hlY2suCj4gCj4gV2hpbGUgYXQgaXQsIHJlZG8gdGhlIGNvbW1lbnQgYWJvdmUgdG8gYmV0dGVy
IGV4cGxhaW4gd2hhdCdzIGhhcHBlbmluZy4KPiAKPiBGaXhlczogY2ZkOTNkN2M5MDhlICgibXRk
OiBzcGluYW5kOiBBZGQgc3VwcG9ydCBmb3IgR2lnYURldmljZSBHRDVGMUdRNFVGeHhHIikKPiBT
aWduZWQtb2ZmLWJ5OiBDaHVhbmhvbmcgR3VvIDxnY2g5ODEyMTNAZ21haWwuY29tPgo+IENDOiBK
ZWZmIEtsZXRza3kgPGdpdC1jb21taXRzQGFsbHljb21tLmNvbT4KPiAtLS0KPiBSRkM6Cj4gSSBk
b3VidCB3aGV0aGVyIHRoaXMgcGF0Y2ggaXMgYSBwcm9wZXIgZml4IGZvciB0aGUgdW5kZXJseWlu
ZyBwcm9ibGVtOgo+IFRoZSBhY3R1YWwgcHJvYmxlbSBpcyB0aGF0IHdlIGhhdmUgdHdvIGRpZmZl
cmVudCBpbXBsZW1lbnRhdGlvbiBvZiByZWFkIGlkCj4gY29tbWFuZDogT25lIHJlcGxpZXMgaW1t
ZWRpYXRlbHkgYWZ0ZXIgbWFzdGVyIHNlbmRpbmcgMHg5ZiBhbmQgdGhlIG90aGVyCj4gbmVlZCB0
byBzZW5kIDB4OWYgYW5kIGFuIG9mZnNldCBieXRlIChmb3VuZCBpbiB3aW5ib25kIGFuZCBlYXJs
eSBHRCBmbGFzaGVzLikKPiBDdXJyZW50IGNvZGUgb25seSB3b3JrcyBpZiBTUEkgbWFzdGVyIGlz
IHByb3Blcmx5IGltcGxlbWVudGVkIChpLmUuIGtlZXAgTU9TSQo+IGxvdyB3aGlsZSByZWFkaW5n
LikKCkkgYW0gbm90IGVudGlyZWx5IGFnYWluc3QgdGhlIGZpeCwgYnV0IHRoaXMgaXMgYSBTUEkg
aG9zdCBjb250cm9sbGVyCmlzc3VlLCByaWdodD8gQ2FuIHlvdSB0cnkgdG8gZml4IHRoZSBjb250
cm9sbGVyIGRyaXZlciBpbnN0ZWFkPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
