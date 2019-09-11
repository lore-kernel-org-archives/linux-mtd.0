Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5794ECDE20
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 07:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 891A32089F
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 07:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sG4LAeKR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 891A32089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=krieglstein.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAudzwcIkfGFESG1GhzJTeq6DIvmAYSmgXyKAXDjT2M=; b=sG4LAeKRwCpmpB
	AXV0pugtb6XzilmPYNwRALKG8eEvCzOAqyG2G7mnvipkocKxqES2vuSZyAqxO98qYPmWIO1rl5z6P
	yPnNi8CRBYCv5chNeiEl9nzYBC+8zZ1P7BJw5UHPFga9DGfO5e/npeTzafiq6OdTZLAeDNpnZBD6y
	59gPjQB9MQ57mLWvR3mYhE9lXfvc05njVf8U6/g3aAg8uyFpZmP9SzN0pJuZLoxXa+5RGkQYlioDP
	KTSZ3KnS1fkF9CG2fsRJz2HQFIc6vggs21k9BiJ+BrhFvV7zP5KGPInnc2vlsCwjZ0FgDRu2bD6rS
	8qKodfzdOnWbidHuAyCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7x36-0001gq-Mh; Wed, 11 Sep 2019 07:28:20 +0000
Received: from krieglstein.org ([188.68.35.71])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i7x31-0001gY-Dv
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2019 07:28:17 +0000
Received: from dabox.localnet (gateway.hbm.com [213.157.30.2])
 by krieglstein.org (Postfix) with ESMTPSA id 3079A401B1;
 Wed, 11 Sep 2019 09:27:43 +0200 (CEST)
From: Tim Sander <tim@krieglstein.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: mtd raw nand denali.c broken for Intel/Altera Cyclone V
Date: Wed, 11 Sep 2019 09:27:42 +0200
Message-ID: <2810592.g4EWBO4qaL@dabox>
Organization: Sander and Lightning
In-Reply-To: <CAK7LNARCPwqY+YmUzsHkABpshzzS3tC=fDgp4vZjVgBwS+LKJw@mail.gmail.com>
References: <5143724.5TqzkYX0oI@dabox>
 <9bb2fb0e-a9e7-c389-f9b7-42367485ff83@kernel.org>
 <CAK7LNARCPwqY+YmUzsHkABpshzzS3tC=fDgp4vZjVgBwS+LKJw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_002815_612339_9668B401 
X-CRM114-Status: UNSURE (   6.54  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi

Am Mittwoch, 11. September 2019, 04:37:46 CEST schrieb Masahiro Yamada:
> - Does the SOCFPGA boot ROM support the NAND boot mode?
Cyclone V HPS TRM Section "A3 Booting and Configuration" lists QSPI, SD/MMC and 
Nand as bootsource.

> - If so, which value does it use for SPARE_AREA_SKIP_BYTES?
I have no idea about this one.

Tim



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
