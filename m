Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C23C388F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:41:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9803620797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b2Mwp0RN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9803620797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1WUDW1aMp12TNei7E+xm8a2NzDCMPy1213MbeIspKo=; b=b2Mwp0RNvVOiIJaYX9A9AEjg3y
	9QFv/pJMDj+huvgimN81V8sfwW1oQROom75NRkUpFkhFHOQi6vIqTdY6Y8KnyT1+YC3CFYQ+Kmw/G
	yxrvrQyb6XVkA15M2B9DtNToMrE4oEAPFAWxWSACiT1jBZze86sUhHshmd31LrYr1lkrAqLNXnXE0
	Re9anhYYCEbg1rWIA+jAZkvDXl1jJxfqYbhlLGhNQDtVnnBouH8QA649Xd360nQ6L/r5pgU1PpUZp
	/4YaSJsslygxrpslZzXhwMoON337SAsru3zZjHE0Ec+oUcC0100IbhBhBq7v7WzJDFT6jnAzVqaDe
	9SBmxrXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYNT-0002Iy-Us; Fri, 13 Nov 2020 12:40:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYNO-0002GP-0R
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:40:27 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7445A240003;
 Fri, 13 Nov 2020 12:40:22 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: au1550: Ensure the presence of the right
 includes
Date: Fri, 13 Nov 2020 13:40:21 +0100
Message-Id: <20201113124021.32675-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_074026_298380_9FE40C03 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

V2hpbGUgd29ya2luZyBhIGJpdCBvbiB0aGlzIGRyaXZlciBJIGRyb3BwZWQgdGhlIHBsYXRmb3Jt
IGluY2x1ZGVzIGFuZApjb21tZW50ZWQgYSBmZXcgbGluZXMganVzdCB0byB2ZXJpZnkgdGhlIGNv
cnJlY3RuZXNzIG9mIG15IGNoYW5nZXMuIEl0CmFwcGVhcmVkIHRoZSBmb2xsb3dpbmc6Cgpkcml2
ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jOiBJbiBmdW5jdGlvbiDigJhhdTE1NTBuZF93YWl0
cmR54oCZOgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jOjEzMDozOiBlcnJvcjogaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdXNsZWVwX3Jhbmdl4oCZIFstV2Vycm9y
PWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogICB1c2xlZXBfcmFuZ2UoMTAsIDEwMCk7
CiAgIF5+fn5+fn5+fn5+fgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jOiBJbiBmdW5j
dGlvbiDigJhhdTE1NTBuZF9leGVjX2luc3Ry4oCZOgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1
NTBuZC5jOjE4ODozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCY
bmRlbGF54oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogICBuZGVs
YXkoaW5zdHItPmRlbGF5X25zKTsKICAgXn5+fn5+CgpJIHRoaW5rIHRoZSBkZWxheS5oIGhlYWRl
ciBzaG91bGQgYmUgaW5jbHVkZWQgaW4gdGhpcyBmaWxlIGFuZCBub3QKY29tZSBmcm9tIG9uZSBv
ZiBpdHMgcGxhdGZvcm0gaW5jbHVkZXMsIHNvIGxldCdzIGFkZCBpdCBoZXJlLgoKU2lnbmVkLW9m
Zi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KLS0tCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYXUxNTUwbmQuYwppbmRleCA3ODkyMDIyYmQ2ZGQuLjE4ODEz
MmMzYjdhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXUxNTUwbmQuYworKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jCkBAIC0zLDYgKzMsNyBAQAogICogIENv
cHlyaWdodCAoQykgMjAwNCBFbWJlZGRlZCBFZGdlLCBMTEMKICAqLwogCisjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvbW9k
dWxlLmg+CiAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Ci0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
