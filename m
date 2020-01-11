Return-Path: <SRS0=phPz=3A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1FFC33CA2
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 02:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A94E20721
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 02:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SjAp7KuL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="svowljHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A94E20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nv7j2n6cg1wOui/Lw4XQfFNEwOf84XUnJF0GzDslp+0=; b=SjAp7KuLmF4Fvv
	e+JK/PlvyiAjv+TD7JZAu1pcA3wiIHXYkhQIiPGqoUp95KW88hW1GmihJeWClR+9TLZklr3nWSsep
	ivt73bisMnYM4tDRcYkjP1QJUWbTLag33MPMFg5VXXUKfoFMuqKfttdyD/f+WYxVl5ngsgwYgBM2V
	5uc5234teHVQ00oiHRn2BIy/hBfUCk2YlLQaFeF4+DIzutcemyZ+ACvGJrFlXgqWvyw+P3QDzjb8f
	TTV369ngy4xGTShzgdyZcgvwAq9ONw8pvtW3d96eZYnH0C7SNYsRTeBigBAXv7CMPBlmxWXs9zD1Z
	jvLRV8Sb/wp4b6pjYiCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iq6gd-00055t-5t; Sat, 11 Jan 2020 02:39:39 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq6gZ-000558-Dv
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2020 02:39:37 +0000
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 00B2dBXs026461
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2020 11:39:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 00B2dBXs026461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1578710352;
 bh=cCpKJptwbytiKiuqP/ywOWw+40BFhuBXXDegbirkwCo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=svowljHXZWLZoE1LrBpA6UNa1/JS0ynD8no/EX7I9sLNPBjR5/H0Pfs2khkq7ZKOV
 D2fho13/6BcY0LDa6g/K+l5FgOmxT1pr/XdLG6iYMcMEuo3l9GnhPkRukYr7uMqf5l
 zd3R6BO3g7/+KDFD7zdak59e4amu3Hms7c56pMRboczcERExMRop5s7lRJg/wVei+6
 x+vSlgqvvfXBipQ1mC2cp0a7s5v8vfmxNHqw82wERCGXkW6iAZ7CWG8n+fq4u8/OCL
 EBifEd51EYv8YoT2Yj7puvH7YlK+vpK5MmBpwAvWDa9XKZ2bGWit6eoKb1Jc6PHXcx
 /rmIvE3zslJLA==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id s16so2522993vsc.10
 for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2020 18:39:12 -0800 (PST)
X-Gm-Message-State: APjAAAUn+ghZNsoFCWhfRaFkC4rCKltj8Vjz8rzT0t/O3ONIWW2iSR1q
 TyiRFZezrHb9OCT+i3NjsKkmm64x7s+SJTeXMHE=
X-Google-Smtp-Source: APXvYqyGfuynkA1llTi0lP764vulPUvdwDrV8zogwS7oYJCk1KcQf4MlTbfGMBz7tvzDdh5lgBD93b6Tg4OjcCQfQtc=
X-Received: by 2002:a05:6102:2334:: with SMTP id
 b20mr1065290vsa.155.1578710351167; 
 Fri, 10 Jan 2020 18:39:11 -0800 (PST)
MIME-Version: 1.0
References: <5143724.5TqzkYX0oI@dabox> <2827587.laNcgWlGab@dabox>
 <CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com>
 <2585494.6OhLyxUeiZ@hydra>
In-Reply-To: <2585494.6OhLyxUeiZ@hydra>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 11:38:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZMH34QcQij8CuGnOkC1_g6UShiHw3+_QBLddzf6W4XA@mail.gmail.com>
Message-ID: <CAK7LNASZMH34QcQij8CuGnOkC1_g6UShiHw3+_QBLddzf6W4XA@mail.gmail.com>
Subject: Re: mtd raw nand denali.c broken for Intel/Altera Cyclone V
To: Tim Sander <tim@krieglstein.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_183935_813091_06B87DEB 
X-CRM114-Status: GOOD (  38.11  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Jan 11, 2020 at 7:38 AM Tim Sander <tim@krieglstein.org> wrote:
>
> Hi
> Am Freitag, 10. Januar 2020, 20:05:20 CET schrieb Masahiro Yamada:
> > On Sat, Jan 11, 2020 at 1:47 AM Tim Sander <tim@krieglstein.org> wrote:
> > > Hi Masahiro Yamada
> > >
> > > Sorry for the large delay. I have seen the patches at
> > > https://lists.infradead.org/pipermail/linux-mtd/2019-December/092852.html
> > > Seem to resolve the question about the spare_area_skip_bytes register.
> > >
> > > I have now set the register to 2 which seems to be the right choice on an
> > > Intel SocFPGA. But still i am out of luck trying to boot 5.4.5-rt3 or
> > > 5.5-rc5. I get the following messages during bootup booting:
> > > [    1.825590] denali-nand-dt ff900000.nand: timeout while waiting for irq
> > > 0x1000 [    1.832936] denali-nand-dt: probe of ff900000.nand failed with
> > > error -5
> > >
> > > But the commit c19e31d0a32dd 2017-06-13 22:45:38 predates the 4.19 kernel
> > > release (Mon Oct 22 07:37:37 2018). So it seems there is not an obvious
> > > commit which is causing the problem. Looking at the changes it might be
> > > that the timing calculations in the driver changed which might also lead
> > > to a similar error.
> > >
> > > I am booting via NFS the bootloader is placed in NOR flash.  The
> > > corresponding>
> > > nand dts entry is updated to the new format and looks like this:
> > >                 nand@ff900000 {
> > >
> > >                         #address-cells = <0x1>;
> > >                         #size-cells = <0x0>;
> > >                         compatible = "altr,socfpga-denali-nand";
> > >                         reg = <0xff900000 0x100000 0xffb80000 0x10000>;
> > >                         reg-names = "nand_data", "denali_reg";
> > >                         interrupts = <0x0 0x90 0x4>;
> > >                         clocks = <0x2d 0x1e 0x2e>;
> > >                         clock-names = "nand", "nand_x", "ecc";
> > >                         resets = <0x6 0x24>;
> > >                         status = "okay";
> > >                         nand@0 {
> > >
> > >                                 reg = <0x0>;
> > >                                 #address-cells = <0x1>;
> > >                                 #size-cells = <0x1>;
> > >                                 partition@0 {
> > >
> > >                                         label = "work";
> > >                                         reg = <0x0 0x10000000>;
> > >
> > >                                 };
> > >
> > >                         };
> > >
> > >                 };
> > >
> > > The last kernel i am able to boot is 4.19.10. I have tried booting:
> > > 5.1.21, 5.2.9, 5.3-rc8, 5.4.5-rt3 and 5.5-rc5. They all failed.
> > > Unfortunately the range is quite large for bisecting the problem. It also
> > > occurred to me that all the platforms with Intel Cyclone V in mainline
> > > are development boards which boot from SD-card not exhibiting this
> > > problem on their default boot path.
> > What will happen if you apply all of these:
> >
> > http://patchwork.ozlabs.org/project/linux-mtd/list/?series=149821
> I have applied this patch set but it does not help completely.


OK, I just wanted to eliminate any other possibility, just in case.


> The timings are
> wrong. I don't have access to the hardware now but one thing i tested before i
> left (the HW) was to write the NAND timings from the bootloader into the
> denali controller after the driver configured the timings in denali_init.
> After that the driver worked again for me.
>
> > on top of the mainline kernel,
> > and then, hack denali->clk_rate and denali->clk_x_rate as follows?
> >
> >
> > -       denali->clk_rate = clk_get_rate(dt->clk);
> > -       denali->clk_x_rate = clk_get_rate(dt->clk_x);
> > +       denali->clk_rate = 50000000;
> > +       denali->clk_x_rate = 200000000;
> >
> > If it still fails, what about this?
> >
> >        denali->clk_rate = 0;
> >        denali->clk_x_rate = 0;
> Will try the above next week. Skimming over the socfpga.dtsi it seems as if
> on the Intel SocFPGA the OSC1 has a value of 25000000 set in
> socfpga_cyclone5.dtsi (I am currently not sure about the clock tree with all
> the plls and i am missing the value of osc2?). Also right now it seems i am to
> tired to parse denali_setup_data_interface...


You do not need to parse denali_setup_data_interface().


There are good hints.

You said:
"The last kernel i am able to boot is 4.19.10. I have tried booting:
5.1.21, 5.2.9, 5.3-rc8, 5.4.5-rt3 and 5.5-rc5. They all failed."

There is no commit between 4.19.10 and 5.1.21
that changes denali_setup_data_interface().

So, denali_setup_data_interface() is not the
root cause.


From the information you provided,
I suspect some clock settings are wrong.



> > > PS: Here is some snippet from an older mail i didn't sent to the list yet
> > > which might be superseded by now:
> > > To get into this matter i started reading the "Intel Cyclone V HPS TRM"
> > > Section 13-20 Preserving Bad Block Markers:
> > > "You can configure the NAND flash controller to skip over a specified
> > > number of bytes when it writes the last sector in a page to the spare
> > > area. This option write the desired offset to the spare_area_skip_bytes
> > > register in the config group. For example, if the device page size is 2
> > > KB, and the device area, set the spare_area_skip_bytes register to 2.
> > > When the flash controller writes the last sector of the page that
> > > overlaps with the spare area, it spare_area_skip_bytes must be an even
> > > number. For example, if the bad block marker is a single byte, set
> > > spare_area_skip_bytes to 2."
> >
> > I did not know this documentation.
> >
> > It says "For example" (twice),
> > it sounds uncertain to me, though.
> >
> > Anyway, an intel engineer checked the boot ROM code.
> > SPARE_AREA_SKIP_BYTES=2 is correct, he said.
> As far as i understand the documentation it must be a multiple of 2. The most
> nand flashes i know need one byte for bad block marking so 2 seems to be a
> pretty sane value.


Most of NAND flashes, but not all.

See the "Bad Block Location" in this page:

http://www.linux-mtd.infradead.org/nand-data/nanddata.html



Many of devices have BBM at 1st byte/word,
but there are devices that have it at 6th byte.

SPARE_AREA_SKIP_BYTES=2 for SOCFPGA
corrupts the BBM at offset 6.
So, probably such a device is not used
on SOCFPGA boards.

I am guessing that is why the UniPhier platform
adopted SPARE_AREA_SKIP_BYTES=8.





> The explanation why default value of
> spare_area_skip_bytes=0 of the boot rom is a little unfortunate is also in the
> documentation: The fact that the ECC values might spill into the spare area
> where the bad block marker of the nand is located.




-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
