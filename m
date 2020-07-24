Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16A0C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 14:55:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B43D206D8
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 14:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFSeLV3F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdIWxsZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B43D206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReltGOjhIBOVqEMeLx74PifktQxFZiM5MJkqb6fzUUE=; b=oFSeLV3FPwEgClMd4GDw6nb1il
	zBYp9VUTziI17j0+ctgmMR4EOYxtitWJOh+OlBmaPibhNuz6AJX0i59+cT43a4i7ajt6WUhRoc9Yf
	O4ub+X5hnPFGiJIL/M+oVSA0Ny2T1XMOcZ/4Wg51TY7dTnJ0URD7Ay+KbiM/foWcZK6dcb5t8vfOs
	P/HKKTHTif32kGiX2U2ZoXAcWkFDaXSLiDjx17wOm9SSeey6InIJoSUWmmXzO7sd2Cx4+S913OmPG
	5uC3R/VYGhFBie7x5jmbw4j+dSFaxBhMEDobG/ZkwBaxn1TFD54dKp4+nybmaP6kNtXMNfFSWtUZE
	mxYIWTfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyz5k-0007I7-HQ; Fri, 24 Jul 2020 14:54:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyz5g-0007G5-Py
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 14:54:29 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52DFA206D8;
 Fri, 24 Jul 2020 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595602468;
 bh=lA8L4QbfMWZzFUbBzDVpfC0tQQM+meY4raaaZQOddqk=;
 h=From:To:Cc:Subject:Date:From;
 b=qdIWxsZMfM+uWkvquOcATmNMTDMlYCx0VtHVfeeLpcE6fBqeFgYb9oswE1n4rnxiu
 tHE8AIKo69bXI1dyhrGmeA0fMDcLFLZ1oYD/ixk5sDYAM/WWN1UWQHXwrZMoIslsVw
 t993egJsJ64Qo5u3fyoXk93TQor+/inEGHcvJMiw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/2] mips: jz4780: Kconfig cleanup
Date: Fri, 24 Jul 2020 16:53:59 +0200
Message-Id: <20200724145401.2566-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_105428_913561_97D8635B 
X-CRM114-Status: UNSURE (   8.04  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This is a subset of my bigger work for memory controller drivers [1].

Patch #1 (memory): I can take it through my tree because of dependant
work around compile testing.

Patch #2: Independent, please pick it up if it looks good.

[1] https://lore.kernel.org/lkml/20200724140345.GB13472@kozik-lap/T/#t

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  memory: jz4780-nemc: Limit dependency and compile testing to Ingenic
    architecture only
  mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to architecture only

 drivers/memory/Kconfig               | 4 ++--
 drivers/mtd/nand/raw/ingenic/Kconfig | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
