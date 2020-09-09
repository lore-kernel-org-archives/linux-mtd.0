Return-Path: <SRS0=hzeh=CS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CCDC433E2
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 10:50:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AC2F21D79
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 10:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="isB3A1ud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AC2F21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cvSx91tNaU9vzQtp23L/cNa8aRtoZfM3EzYB+JwHAao=; b=isB3A1udcxLkZL/gINsEU5eLB
	bnoyxCF2M3ZRNIkA7TJmU7PZCyYzUKxp4FUuMTwCd0F1uhowWABA2FPgTpdSNJkAluYr2/NvkDV/d
	yBREougJOB0FGUkskiyrVQ828kxHjBa2JHC+qBLCW9Icvg3pwhiQQlZgZJIyFweOtnSuis0GlfqF+
	MVCOjo4DsOb6TqaRr4RvFECkALrzKPN89DNmQBhKiKj9U29rXdneG+U7ySOCdRuzA7fxUEtOvOH6/
	3uKOaABSHKdb/BQKvNB9id7ti6xyy3bUQoABGE4pk+oyGF54XiUcT6qZuKluY9RlGq3WdSdf0gfOt
	t4tYOGaoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFxf1-0001wa-Or; Wed, 09 Sep 2020 10:49:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFxez-0001wG-FP
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2020 10:49:06 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CB5661BF213;
 Wed,  9 Sep 2020 10:48:57 +0000 (UTC)
Date: Wed, 9 Sep 2020 12:48:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Subject: Re: [PATCH v3] mtd: spinand: micron: add support for MT29F2G01AAAED
Message-ID: <20200909124856.09afd61b@xps13>
In-Reply-To: <20200909104442.22171-1-nthirumalesha7@gmail.com>
References: <20200909104442.22171-1-nthirumalesha7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_064905_612169_6B5DAEC3 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVGhpcnVtYWxlc2hhLAoKVGhpcnVtYWxlc2hhIE5hcmFzaW1oYXBwYSA8bnRoaXJ1bWFsZXNo
YTdAZ21haWwuY29tPiB3cm90ZSBvbiBXZWQsICA5ClNlcCAyMDIwIDE4OjQ0OjQyICswODAwOgoK
PiBUaGUgTVQyOUYyRzAxQUFBRUQgaXMgYSBzaW5nbGUgZGllLCAyR2IgTWljcm9uIFNQSSBOQU5E
IEZsYXNoIHdpdGggNC1iaXQKPiBFQ0MKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGlydW1hbGVzaGEg
TmFyYXNpbWhhcHBhIDxudGhpcnVtYWxlc2hhN0BnbWFpbC5jb20+Cj4gLS0tCgpDaGFuZ2Vsb2cs
IHBsZWFzZT8KCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jIHwgMTQxICsrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwMSBpbnNlcnRp
b25zKCspLCA0MCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvbWljcm9uLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+IGluZGV4IDVk
MzcwY2ZjZGFhYS4uZmE4YzIwZjM3NjExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL21pY3Jvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiBAQCAt
MjgsNyArMjgsNyBAQAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
