Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95208C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F5120848
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeZZDzj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48F5120848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+CirE3/IRpAtEGnUMqGjdZ29yELKMMcli5iXU1N/o4I=; b=TeZZDzj6FbX9t13ELq5rzHJ8kR
	W8j8jWTpC9wceIhnnuXtA35ObNjeZJWVggDHxGzsbCbSj9gUwJTJX52i8IV0OMBTypOaxv3BVmsrf
	A+gB2L12bh+VDQj3VxrAN6UiFCymH4hwXD7DyMx2N7nzDQEV2VgMa1/JumakNFPPwiwFGv9h2//pK
	mYb4AbVMI95ZY5CQhe/8Ddn4ufkpDnPo5QdYW7p+Tt6aBlK4dBDVdnRHtbhTZew+o2jmY/cnRjCE/
	iTCAQOMCJok9++eY73ACoRgDBDX31WWsA2qThpL0WSwlY13Ink8MtarQ3acxb2QHvUuJK1MNm15i6
	Jtkcq+qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNvhK-0002ft-TQ; Thu, 01 Oct 2020 10:20:26 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNvhE-0002dK-6p
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 10:20:24 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 45022240015;
 Thu,  1 Oct 2020 10:20:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/6] Bringing generic ECC engine support to SPI-NAND
Date: Thu,  1 Oct 2020 12:20:08 +0200
Message-Id: <20201001102014.20100-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_062020_336302_F958F093 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGlzIGlzIHRoZSBwZW51bHRpbWF0ZSBzZXJpZXMgcmVnYXJkaW5nIEVDQyBlbmdp
bmUgc3VwcG9ydCBmb3IKU1BJLU5BTkQgZGV2aWNlcy4KClByZXZpb3VzIHdvcmsgcHJlcGFyZWQg
dGhlIHN1YnN5c3RlbSBmb3IgdGhlIGFkZGl0aW9uLCBjbGVhbmVkIGFuZApjcmVhdGVkIHJlYWwg
c29mdHdhcmUgZW5naW5lcywgY3JlYXRlZCBhIHJlYWwgb24tZGllIEVDQyBlbmdpbmUuIFRoaXMK
c2VyaWVzIGdhdGhlcnMgYWxsIHRoZSBleGlzdGluZyBiaXRzIGludG8gYSBmaW5hbCBzb2x1dGlv
biB3aGVyZQpTUEktTkFORCBkZXZpY2VzIG1heSBiZSBsaW5rZWQgdG8gZWl0aGVyIHRoZWlyIG93
biBvbi1kaWUgRUNDIGVuZ2luZSwKb3IgYW4gZXh0ZXJuYWwgc29mdHdhcmUgZW5naW5lLgoKTGFz
dCBzdGVwIHdpbGwgYmUgdG8gYnJpbmcgZXh0ZXJuYWwgYW5kIHBpcGVsaW5lZCAoaWUuIG5vdCBv
bi1kaWUpCmhhcmR3YXJlIEVDQyBlbmdpbmVzLgoKVGhhbmtzLApNaXF1w6hsCgpNaXF1ZWwgUmF5
bmFsICg2KToKICBtdGQ6IG5hbmQ6IEFkZCBoZWxwZXJzIHRvIG1hbmFnZSBFQ0MgZW5naW5lcyBh
bmQgY29uZmlndXJhdGlvbnMKICBkdC1iaW5kaW5nczogbXRkOiBEZXByZWNhdGUgbmFuZC1lY2Mt
bW9kZQogIG10ZDogc3BpbmFuZDogVXNlIHRoZSBleHRlcm5hbCBFQ0MgZW5naW5lIGxvZ2ljCiAg
bXRkOiBzcGluYW5kOiBBbGxvdyB0aGUgY2FzZSB3aGVyZSB0aGVyZSBpcyBubyBFQ0MgZW5naW5l
CiAgbXRkOiBzcGluYW5kOiBGaXggT09CIHJlYWQKICBtdGQ6IHNwaW5hbmQ6IFJlbW92ZSBvdXRk
YXRlZCBjb21tZW50CgogLi4uL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCAgICAg
ICAgIHwgIDExICstCiBkcml2ZXJzL210ZC9uYW5kL2NvcmUuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMjQgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL210ZC9uYW5kL2VjYy5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL0tjb25maWcg
ICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgICAg
ICAgICAgICAgICAgICAgfCAxMDkgKysrKysrKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L210ZC9u
YW5kLmggICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogNiBmaWxlcyBjaGFuZ2VkLCAxOTQg
aW5zZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
