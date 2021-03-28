Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BAAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:07:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035486196E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 035486196E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QOM3W4IxV5LUG81YJdf4T1og7lh/mFakSV93nzcfq4k=; b=iIxOCJbkvPDXLVic8dOA98e2E
	lJ2oIZFALD/Zz81rC99SFCA5SPNJ9A4iOcwrCUsb8XG5IiCTjqf/TgowTWNWfAbCz4I6/pS9Yin5B
	4NoG5n7QH0BSTKhMwznJhPiX8WXRIDrkute1YGxtxL1MIwdSUCI+zaHo7S3o3M5AoSFYhA1fFXdO1
	vfjGeCUTQ8FDxZ3cnmt3rvsN7ybzyai8EEPO9ArFxU4NpJfrAbol5nFd0n7SgLTFsRtk4d2Sk2xIB
	XgMH2Eyuub+MgX5To6vRdnnAtgx/XsfVQFPNWymkBDbVXedUBiL+9XucQblMRwbYUZGkt3Y6icUhA
	isGPiYnig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvLR-000qm2-3s; Mon, 29 Mar 2021 17:06:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQouN-000ZVs-O9; Mon, 29 Mar 2021 10:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=A4RK6B1q7o8rUL94eS5CS5HD13R8REiqM9W+3/8QsOQ=; b=e+dUKAYUgZIkJr6iB2PJM15xfh
 mLzmjVN7tKwJR/DML7ZkJDmFCvhOWNQYKsML467Y6xqTTnhjarJ2Hx3HzmUDEfzdbCDbilPWJiidX
 1to6ucnnoe8Ll4bP9aujUOdcKSFXcP3r4lMux4+mHR6BLSKGYIEtk7sso4SOBbyH7t+7GJ2kMdxKu
 fSKT695ki9EyfukKcirXT8+yPqefyJC/ifbNTnkDJuiilmEF1aL0uEufQ99Xi8BNDDhAl3RCqMQfQ
 PiwbCJXzhZWYoE5zcgrwossGQd4Hk3KT6/EvSdUVXCv/Xk8ThvW5xw6yhucpnn/EcdHF6/alRsB9J
 V6dYI5zg==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZ00-000Jgl-2Y; Sun, 28 Mar 2021 17:15:02 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E3950E0009;
 Sun, 28 Mar 2021 17:14:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 ludovic.desroches@microchip.com, bbrezillon@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Kai Stuhlemmer (ebee Engineering)" <kai.stuhlemmer@ebee.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: atmel: Update ecc_stats.corrected counter
Date: Sun, 28 Mar 2021 19:14:29 +0200
Message-Id: <20210328171429.7450-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210322150714.101585-1-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'33cebf701e98dd12b01d39d1c644387b27c1a627'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181456_252842_71349D23 
X-CRM114-Status: UNSURE (   4.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2021-03-22 at 15:07:14 UTC, Tudor Ambarus wrote:
> From: "Kai Stuhlemmer (ebee Engineering)" <kai.stuhlemmer@ebee.de>
> 
> Update MTD ECC statistics with the number of corrected bits.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kai Stuhlemmer (ebee Engineering) <kai.stuhlemmer@ebee.de>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
