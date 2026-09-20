Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2010FC982E1
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RroU00t3cNV0bqgHyw+4/BJQs4+DCo6yB1fASEeoMkk=; b=n88XhfVzWah2DC
	wpkS/ZWRQBFrI5OyuuuzFOP3105ta4pKJpJYRTRHl1Y2PdE5EIcXMI1eslfUSyQQqPnrHkTV1mMCJ
	72gk4sjZH5BTA53t5FTJJOnR6t+qF/RYlaRAMTAFv5vikMTYSMtkqMCQ4WAI5JPQDASQ+49a71dkz
	ETraJ1HMgXYI05pRfT4SAyCsF+V3RZ9EOboi2owVjM+AoOX5/Lp+Vb2+meh0p0a814fnrv8rQdgd2
	dUJUymQVawfT/yQbB3MGQQg+oVlh5foqUDFbnKpwPFQO0AQdAbqAst7XKBeEHVbmfPjldsQbyyC16
	+aVXheJMxiCJMhTJnkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IgD-0000000HaGl-3mXw;
	Sun, 20 Sep 2026 14:38:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IgB-0000000HaGK-0CA2
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:38:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 930D44E40923;
	Sun, 20 Sep 2026 14:38:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CCDE6033F;
	Sun, 20 Sep 2026 14:38:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBB9210329078;
	Sun, 20 Sep 2026 16:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789915082; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JFhAMpKcqCT9uHzVU/MN32RuRVXPbT7jg55CNNemccY=;
	b=X5si8/RoJbehh1U3mj+MRrx07ioronomOBnutvN1smWVPL8VkcNSM8GnmgF9L8eMD8OT3F
	IqL68/FFiEzGqVthEZFFUCCHfODcEI+qBh2gN4/iphZ4U7Y5jRjQDBB7p7wpWu+CEXCVAG
	VkYhb6ENHqms+RzMaOInRIVVjyURw7uotXhp9g30fKBz4UQDHbzaQ87kkPUI80JUCL4BHs
	W5dMEA3q0UXUqX6jY2+1FnmyKg2IIn6U1YCG4tsRfSV9cQktXTqmHbSe2POT78rV86FGoU
	m01qfwHy5ZUS4f/hnduLwv18awRkiEU/pEIPbZnOzIYbJTtBAioFmXE//oBd8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Michael Walle" <mwalle@kernel.org>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Richard Weinberger"
 <richard@nod.at>,  sashiko-reviews@lists.linux.dev,  "Steam Lin"
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 17/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-Q/N
In-Reply-To: <20260920141210.B32B51F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 20 Sep 2026 14:12:10
	+0000")
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
	<20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-17-ab9c9688d071@bootlin.com>
	<20260920141210.B32B51F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 16:37:55 +0200
Message-ID: <87zexc6la4.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_073807_219753_D4FC7056 
X-CRM114-Status: UNSURE (   4.57  )
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

T24gMjAvMDkvMjAyNiBhdCAxNDoxMjoxMCBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsCj4gaXNzdWUocykgdG8gY29uc2lkZXI6Cj4gLSBbTWVkaXVtXSBz
cGktbm9yOiB3aW5ib25kOiBjb21taXQgbWVzc2FnZSBjbGFpbXMgRUNDIHN1cHBvcnQgZm9yCj4g
VzI1UTMzUFctUS9OIGJ1dCBjb2RlIGV4Y2x1ZGVzIGl0CgpUaGUgY29tbWl0cyBhcmUgaW5kZWVk
IGluYWNjdXJhdGUsIEkgd2lsbCBmaXggdGhlbSBib3RoIGFuZCBzZW5kIGEgdjMuCgpNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
