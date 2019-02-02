Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A99C282DA
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A4E218A6
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OCUqTnol";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="eNRjaBEA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7A4E218A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/zu6MglwH177gPG6FhfM3XIJrgbK58+xSPYXK0I9+o4=; b=OCU
	qTnol9YeofkkcznyTtKqXgUKu0d3MkqdojPaRmXv+7oweQQT1C2cZLGr9nGfDxS2y6QDvjkim9Jb2
	9WNQN7neXjUDVNu8+Vk8jIoof9MZbMpg3fAvQ93ckaDM1+3S1Yo2/ksfhC9dOy4Fw5UiPFCO4pYNX
	AKuKM+bJNI/LKlp3+Mch957KPTjkcuuo7p39cd+z8a3x+ZVnoa1O+tjesCyydR3tn91CuzovuQDm/
	Trl/Sh2P5SPUCmk+e1VEi72K/XCi4b6LnGWJtEScB+qTRkRHU1QHVXT4nAiMGab43obsiX5tOJhjn
	uETMxAqqc/AuoaapVdt6+Hb+ZtnGG5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gq4Zx-0006KY-UQ; Sat, 02 Feb 2019 23:20:05 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gq4Zp-0006Iv-Mf
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2019 23:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549149583; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kHFNaBMJjrQPd5BXuqAmkwVDhqX1yrvQGdQDiBFNjms=;
 b=eNRjaBEAuxOhVuL10DANDCjfN2FsQMbBmhEIKFEb8LNZuzT2ObgRuOHIFJhAcyFr0W1UP9
 6Oyqtqi9lwnVHpG6/CS62wGbS3xn3Em9Ho9TMCIt2DzLJ9WOXhTRihFhHrTGOnoLxMqsz9
 q/URvldHSImufwy51ZFvuegJctHCXlE=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v2 0/9] Ingenic JZ4780 NAND patchset v2
Date: Sat,  2 Feb 2019 20:19:17 -0300
Message-Id: <20190202231926.2444-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_151957_946626_F87E4C8C 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Cc: Mathieu Malaterre <malat@debian.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

As requested by Boris, I added a patch to move all the Ingenic NAND
drivers to their own directory.

In this V2 I added support for the JZ4740 SoC. The combo of the
jz4780-nemc, jz4780-nand and jz4740-bch now obsolete the old and dusty
jz4740-nand driver.

To support the only upstream JZ4740-based board we have, the Ben
Nanonote, I added an option to specify the OOB layout of that device
from a device property string.

Finally, I dropped the last two patches that moved the platform NAND
code to devicetree; I will upstream them as part of a different
patchset.

Cheers,
-Paul


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
