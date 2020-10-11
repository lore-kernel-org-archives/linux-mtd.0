Return-Path: <SRS0=teGx=DS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C915AC433E7
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 20:42:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D9120578
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 20:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z2Z7cHJm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D9120578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oTiGkVo/DVRFC2WIZuir2dXyw/PjAywhxkeuIg/FH0w=; b=z2Z7cHJmfVIO+wSYbcVOeGWqJ
	Ro0nDkkPqSylSXaobl0G3xIvq1nhAXxG7kQQx8TikRYiZcFhrK0wUULL8cA9bgvmJtcik4ws0W4OR
	oErvvuVigN+TNIWe8yyNzkKQ/qzDw92gFbFwAwN+Kj997R9LJH+NCC9CveCfEnF0szMUGfMu3FgxH
	wV2C9eN8/7Gim4uGqW5yToeMnSgdRyg3QYd4HOjKDp7H4xLVuo/t/D1sLgVi13NhlY0Wpvqjmutup
	A0lec5i/vD0JWGWV7LZ8cHuVYQROu9RpDIGVRaxUCaAOCbTWOp8F8cSki/t5IC0xX0+qkUwPho4qY
	1+xPu+F9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRiAD-0007S5-1N; Sun, 11 Oct 2020 20:41:53 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRiAA-0007Ri-Kh
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2020 20:41:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 50899608311C;
 Sun, 11 Oct 2020 22:41:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NTTgk24zSXct; Sun, 11 Oct 2020 22:41:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2168C6125F28;
 Sun, 11 Oct 2020 22:41:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id T2K8bwxXKA99; Sun, 11 Oct 2020 22:41:45 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id EDDFA608311C;
 Sun, 11 Oct 2020 22:41:44 +0200 (CEST)
Date: Sun, 11 Oct 2020 22:41:44 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <1479002508.185626.1602448904778.JavaMail.zimbra@nod.at>
In-Reply-To: <20201011215539.43d964c8@xps13>
References: <20201011215539.43d964c8@xps13>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.10
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: nand: Changes for 5.10
Thread-Index: 8cHMF+lhQmISo5igF2ju6JZtRRiX2w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_164150_779716_1D1468ED 
X-CRM114-Status: UNSURE (   5.95  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAiVHVk
b3IgQW1iYXJ1cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIgo+IDx2aWduZXNockB0aS5jb20+LCAiU2NocmVtcGYgRnJpZWRlciIgPGZyaWVkZXIu
c2NocmVtcGZAa29udHJvbi5kZT4KPiBHZXNlbmRldDogU29ubnRhZywgMTEuIE9rdG9iZXIgMjAy
MCAyMTo1NTozOQo+IEJldHJlZmY6IFtHSVQgUFVMTF0gbXRkOiBuYW5kOiBDaGFuZ2VzIGZvciA1
LjEwCgo+IEhlbGxvLAo+IAo+IFRoaXMgaXMgdGhlIE5BTkQgUFIgZm9yIDUuMTAuCgpQdWxsZWQs
IHRoYW5rcyEKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
