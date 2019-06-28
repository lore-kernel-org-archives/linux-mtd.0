Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F552C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 19:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22FF62086D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 19:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWMI/L4l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="pyZPyavb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22FF62086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QwhtKgK75aOnQ1Lo68fQ8gbtmo8ni/T9x1jLth9iqB8=; b=mWMI/L4lCsXJ4Gt5IMICrAqRJ
	ahQoiGX2yyGiTsZ3HoYNfGo1U1w6d28wNOOk1ouw0oIYflxNiThMyTMFzyX6ye7IqtHt0XppEpzek
	5xHlP8IwznM9cpCoC2mN+54FB/6MZ4XKnOxxmKVTYi18qenUZ5DANvURxth7BZQMAl0ixKuvZKL0i
	njIgEC8y4DA1WF0HBxCK3JrqkEe4QnSNZeOSVmHaL668oEHEN95nmHBlceVofRJJzDur8VVNdj0HA
	bi5XYsSn1PaViu+c/I6dQoErlh2alvULjWe9D8NoXctPsJ8/whYLrjQ0WTwCLrp+g7+RBjx46ctgh
	Vz6wq3PBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgww1-0007eA-KP; Fri, 28 Jun 2019 19:53:25 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgwvx-0007cZ-Bx
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 19:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1561751593; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXThYP6vEL2CRlY5WzupI6gQ/RhO4QbnhM+KuTasqDo=;
 b=pyZPyavbwN58kLdm306KC9LokVom5Rwg+HfXnbKM4U+Qp1NK5uBplbXFQrcbrxoIFXpx5B
 1QnngrkGcFjVdjkniE1o7QWhhFrbphNSUZD56up0p2qrEi1jQ53w3Ws/4l+HeAbsE0P8IY
 ZuzzYoBN6I9kg7PGYG+r0EFBwh5hb5I=
Date: Fri, 28 Jun 2019 21:53:08 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: fix ingenic_ecc dependency
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1561751588.1914.0@crapouillou.net>
In-Reply-To: <20190627184047.6faa058a@xps13>
References: <20190617111110.2103786-1-arnd@arndb.de>
 <1560770644.1774.0@crapouillou.net>
 <CAK8P3a28NrvLP1nE7TQUCqwYXVwrSnVUJoH0yTSqRpz93f4g2Q@mail.gmail.com>
 <20190617141659.376c0271@xps13> <20190627184047.6faa058a@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_125321_601467_398DE6C0 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le jeu. 27 juin 2019 =E0 18:40, Miquel Raynal =

<miquel.raynal@bootlin.com> a =E9crit :
> Hi Paul,
> =

> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 17 Jun 2019
> 14:16:59 +0200:
> =

>>  Hello,
>> =

>>  Arnd Bergmann <arnd@arndb.de> wrote on Mon, 17 Jun 2019 14:12:48 =

>> +0200:
>> =

>>  > On Mon, Jun 17, 2019 at 1:24 PM Paul Cercueil =

>> <paul@crapouillou.net> wrote:
>>  >
>>  > > I think there's a better way to fix it, only in Kconfig.
>>  > >
>>  > > * Add a bool symbol MTD_NAND_INGENIC_USE_HW_ECC
>>  > > * Have the three ECC/BCH drivers select this symbol instead of
>>  > >   MTD_NAND_INGENIC_ECC
>>  > > * Add the following to the MTD_NAND_JZ4780 config option:
>>  > >   "select MTD_NAND_INGENIC_ECC if MTD_NAND_INGENIC_USE_HW_ECC"
>>  >
>>  > I don't see much difference to my approach here, but if you want
>>  > to submit that version with 'Reported-by: Arnd Bergmann =

>> <arnd@arndb.de>',
>>  > please do so.
>>  >
>>  > Yet another option would be to use Makefile code to link both
>>  > files into one module, and remove the EXPORT_SYMBOL statements:
>>  >
>>  > obj-$(CONFIG_MTD_NAND_JZ4780) +=3D jz4780_nand.o
>>  > jz4780_nand-y +=3D ingenic_nand.o
>>  > jz4780_nand-$(CONFIG_MTD_NAND_INGENIC_ECC) +=3D ingenic_ecc.o
>>  >
>> =

>>  I personally have a preference for this one.
> =

> Would you mind sending the above change? I forgot about it but I would
> like to queue it for the next release. Preferably the last version =

> Arnd
> proposed.

It does change the module name from 'ingenic_nand' to 'jz4780_nand', =

though.
That's not really ideal...

> =

> Thanks,
> Miqu=E8l



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
