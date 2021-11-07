Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A75C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 18:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0808761354
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 18:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0808761354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYMEMmSLF7jnLoMQkqcP5/quxKB9/ltYEZGXwj9Z3/Q=; b=Hp8cNilIt6Zo8yE9XaQHNdWIQg
	Bq3FvnJAhS26D2IOZekCVWpUX5nmj9xu8gqyyFajc3IKzSq8x6KAMLwibEKy2PD7xOj0OdRWHmhDf
	Emy7ksnlAPasNVwUnoskjdMM5Ep3DS2zFgXhKOY9Gec3WOdZtlOjle3OaIDY5jaeHwLICudlvHsN5
	ABxPnnzRDFQ9kDYllMKShQdAwRUJSQTAG4aZybWKHw1w4dHe2FuI5WdbYs1AwK7S64Uq35TgebMOS
	kCFHoTajB+lzh24fp+Kklr4CYk2Gjc8Kd7jl9Ak6ocvtQGD0R6RKLpuT+VnWflkmB280QGblQDebR
	zH+13ybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjn93-00EiGA-9b; Sun, 07 Nov 2021 18:43:57 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjn90-00EiFl-Gt
 for linux-mtd@lists.infradead.org; Sun, 07 Nov 2021 18:43:56 +0000
Date: Sun, 07 Nov 2021 18:43:33 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/3] mtd: Ingenic NAND fix for JZ4740
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mips <linux-mips@vger.kernel.org>, Riccardo Mottola
 <riccardo.mottola@libero.it>, Discussions about the Letux Kernel
 <letux-kernel@openphoenux.org>, Paul Boddie <paul@boddie.org.uk>
Message-Id: <LCT72R.SB2TF0MK7Q3B@crapouillou.net>
In-Reply-To: <968356A9-2A88-48B1-B31F-55C22BCE620E@goldelico.com>
References: <20211009184952.24591-1-paul@crapouillou.net>
 <968356A9-2A88-48B1-B31F-55C22BCE620E@goldelico.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_104354_760725_F3D02A77 
X-CRM114-Status: GOOD (  14.00  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Nikolaus,

Le dim., nov. 7 2021 at 14:47:43 +0100, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> Hi Paul,
> =

>>  Am 09.10.2021 um 20:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>> =

>>  Hi,
>> =

>>  Looks like NAND support has been broken on the JZ4740 SoC for a =

>> while;
> =

> Yes, I remember someone telling that something was fundamentally =

> broken
> and impossible to be fixed a while ago.

You mean MLC NAND, and that's still broken.

>>  it looks like it comes from the fact that the "hw_oob_first" =

>> mechanism
>>  was dropped from the NAND core and moved to the Davinci driver.
>> =

>>  It turns out the JZ4740 SoC needs it too; I didn't notice it when
>>  writing the new ingenic-nand driver (to replace the old jz4740-nand
>>  driver) most likely because my Device Tree had the "nand-ecc-mode" =

>> set
>>  to "hw_oob_first".
>> =

>>  I am not very sure about patch [1/3]; to me the original code does =

>> not
>>  make sense, and it didn't work out-of-the-box on the JZ4740 without =

>> it.
>>  By applying patch [1/3] the function =

>> nand_read_page_hwecc_oob_first()
>>  can be reused for the JZ4740 SoC as well. But I did not test patch =

>> [1/3]
>>  on Davinci.
> =

> would this also work for jz4780 NAND?

The JZ4780 NAND driver does work, but UBI refuses to use the CI20's =

NAND as it's a MLC.

-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
