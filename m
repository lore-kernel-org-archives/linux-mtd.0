Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2CEC001B0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 06:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ClPvb+DW9gJwXyTSEFE6Vn0wBo205naDNSfUndzpN0=; b=xiobT7r9yDhTHQ
	kSJonMJAycwJyWLovzYyW/C7M/BNpO1T1CfQhRZ1RdCesd4XENfwdt7DYkLKlw7l+npWZCvx+GY6h
	aDAjL8v0AtafR6Cg2tkWOBLL/0zEveX57xksZTBnAEBaszD0pXCZASHnw9S708L8FL6a+mA9EYe1S
	lO+JjVXkW8VeZX07jX5OxJQb2d51kRJyQELHFdE6+Kn43te2lBaRKDZilHIT+MwZCt5/djXMagglE
	8nu67yTQ2Pp7NI4NtAaC/34IrWCHcpefmOL+smjoSpk+9CFHwPChOcQDLPh+xJzm8DIGUA+rk3vXN
	GuBT7VMd8p1CsvjV8KHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qULpe-009eXQ-29;
	Fri, 11 Aug 2023 06:41:10 +0000
Received: from mail.thorsis.com ([92.198.35.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qULpY-009eU5-2Z
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 06:41:09 +0000
Date: Fri, 11 Aug 2023 08:40:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=default;
	t=1691736050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ojQHiL/3Kh+PidQXLPhXTVchmZo+67SvMJ6+nAF70Ms=;
	b=bdfN+DMHTE1qSCtTpYYW+1Y/HzzfvefKURHjVOmJuucemFV7oxlbEHzu9ViHfczCk5loBu
	kqaIJsQI0UoEY/fJzSdF0FsSC57X9cEi5vNw6X1LkiYdv2d2V7hnB+CQJhQnpfP0ZpY4LD
	hLVh/3q7vRhtF1Ru/dVGHZNTtj5WbpWRJxbo7m9Xf3wOlbCZu60SE1D7RCLg7DG5YkXlMi
	LMy0M0IvIl635C1ZaUrahWooHLpXI6kOi/8+tE9hAjhubR31W0yJnzHnfry//s6Kx5TwIh
	1D7K9RSICsouZSbK8XW8CYugDGMabAa7al1trJ+EDanLj9XRTn/ddYRUVRrACQ==
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: raw nand: Accessing R/B# through GPIO never used
Message-ID: <20230811-anyplace-backhand-4131de006e84@ifak-system.com>
Mail-Followup-To: linux-mtd@lists.infradead.org
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_234105_077440_BDA1B83D 
X-CRM114-Status: GOOD (  17.59  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello flash developers,

I'm currently evaluating the nice Microchip SAM9X60-Curiosity board
for booting from NAND flash.  Is has a at91 SAM9X60 SoC, a Macronix
MX30LF4G28AD 4Gbit flash chip and uses the new atmel raw nand driver
contributed by Boris Brezillon back in 2017 based on different older
drivers.  NAND flash access in Linux works fine and out of the box
with current mainline, I did not expect anything else.

When trying to get the NAND flash access working in U-Boot I noticed a
strange behaviour.  You can see the whole thread here:

https://lore.kernel.org/u-boot/20230809-marvelous-number-8e973a3bb5e0@ifak-=
system.com/T/#t

What got me wondering is the behaviour with regard to the R/B# line of
the flash chip.  According to the chips datasheet (and datasheet of
other raw NAND flash chips we used before, e.g. a Spansion=AE S34ML02G1
2Gbit chip) that pin is somewhat optional to use, right?  You can get
the same information through an access of bit 6 in the status register
of the flash chip.  We learned this a few years ago when trying to
make raw nand work with an at91 sama5d2 in U-Boot, where U-Boot had
only an old driver for the atmel nand controller which did not work
with the pio4 GPIO controller of the SoC, so accessing R/B# through
GPIO was not possible, but thanks to the other way (status bit) you
could get it to run.

Note: the SoC's nand flash controller we are talking about here (SMC
in SAM9X60) has no native R/B# line support and the SAM9X60 datasheet
explicitly recommends to connect that pin to a GPIO.

Now the problem in recent U-Boot with proper GPIO access is: it takes
ages for some flash operations to complete.  The gpio signal stays 0
for several hundrets (!) of milliseconds until the read from the pin
gets 1 (confirmed by debug print in modified U-Boot source).  My
workaround for now is removing the 'rb-gpios' property from U-Boot
dts, that way flash access is reasonably fast.

So I wondered what the Linux driver makes different.

Turns out: if I am not mistaken, the Linux driver does not consider
that R/B# line at all.  Why?  The GPIO is determined in DTS through
the property 'rb-gpios' which is well documented in device tree
bindings docs, and used in numerous dts files over different vendors.
However that property is not evaluated in a single driver?!  My
conclusion is: no driver ever accesses that pin and everything just
works through status bit register access, right?

Can anyone confirm that?

Bonus questions:

Has anyone tried to really access that line through GPIO if the SoC
requires that and how does that R/B# line behave over different flash
chips then?  Can this be a problem of the NAND flash chip itself?  Is it
safe to go with "soft wait" through status bit access only?

(Note: it's not easily possible to analyse this with an oscilloscope
or logic analyzer on the sam9x60-curiosity board, because the line in
question is a direct pcb trace from a ball of one chip to a ball of
the other chip.  Similar for other connections from NAND to SoC.)

Hoping someone can shed some light on this topic.

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
