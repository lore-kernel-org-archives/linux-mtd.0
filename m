Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62885EB64DC
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jun 2023 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Mw+onL4ANWQptkVFBFaYZ8EIYvmIv9cOdBBwBluLR8=; b=UG4zWdI9WfIa0E
	wMZLO5NtRWKWgWERzpOO2jw+NclaC09xCtB3hDjqStKux6g9/KLgYwkXIUpXpJCMAuP+xCGjC5ERu
	1LdTfa4w/QoMZ2JHQkZJMZ3u214kxFGa1Ci5oWNtl48mrWA5zg0MIBH0dBPJnzHUMHWfp/CitRL+k
	hQoR156TKWPl336W/ZzMDTGTjtHkNPdroqJqf8k7d3lFAlfFsnN/6DuMS/dpqkNOyp1o934ineIO0
	f5A7dhX2huJvfAdXCB9WaYG+YGJEU6n1ri2RChD1llAB7nBzyNGNAUitJpdxoTKIYwVBGTNHLwoeR
	WkLs1XpzycEgVZ7/YjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWzK-008j2h-29;
	Sun, 25 Jun 2023 21:09:38 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWzG-008j1c-1O;
	Sun, 25 Jun 2023 21:09:36 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6b71ee710edso2407367a34.2;
        Sun, 25 Jun 2023 14:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20221208.gappssmtp.com; s=20221208; t=1687727373; x=1690319373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ly9zZT5cMT2JPJi4aJhhRjUpBCgLnaeHkZBa+wuAYx0=;
        b=VG+5EvRFBR8/YUJtfadTS7qjlW94stzFRYSxzz/7jV9mZeMCYQdk33nfXt3knJ1sXZ
         uDzL45Fg+/gMzAgUrP9kpQbcg4ilESRIqxtr5mJDesVZ+k+MrndBMnZ/G2hZ3F5wBv+x
         8HCuCAjB1DDhHJ9T2UIezlvi+xW1B0PBl1COrxmQEEQJuTxUNxd8r1if/px/Mj0PrPot
         V7+OI76AEfYb4RNtC4Qz0ciqjW2kCawPkqQgAu65bzzsglOIY47vu9AOkxi6FeQrhBX0
         FYNepKXmnORyb43j7Qju4NBMs/rGXBqJKb0Vb6ztMkNiM7RIv3Si/diw+VfLfTpPBPur
         Tb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687727373; x=1690319373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ly9zZT5cMT2JPJi4aJhhRjUpBCgLnaeHkZBa+wuAYx0=;
        b=BB1deszP1s5r+LMMt+CFe2Nj4dzOPKD36pW86btjXfkHlpSyQDfjUGzlkw7aSwWYjO
         750MyQ1rdZ29V4pn4s8vKGd6FfTRKnkiM1O2OvbtJPw9mxoFK3ekrPVqClGk6d+FNzeg
         TYIECrWqqtl1bUDumMs2JEbZYioLFds5d3ATH2GF8d2bGdqYt2JcQgDaAnpXs2yyIG8z
         FWRfaysHBuuzbblt4egw4GtGx+KqQhuliJJO2IYBdSDdp5fdNLiqvZJP8YvyEBkaYY8F
         vZTRu3Uy5MRjnG/2jQ7rsF68om8lf4LGGgu9BZhoWukl4dDpVMs2CcRGqaImA6cNu5Oy
         juQg==
X-Gm-Message-State: AC+VfDx+4t777bdqcxBHditkcqfVq1tFQxjwlJldViRp0tk1do9hNpkV
	HkFjfpOWywMgel0P0d2F7V6WtdNi9z6H9a6Jy3s=
X-Google-Smtp-Source: ACHHUZ45VlhjANvGt/sgMUrqk4XjH6MWFGs2WOSH3jhAAquz+PXHHUz9i0BmcOh7IoMMhoRkU9PcmG0D/7XNbgVTWOM=
X-Received: by 2002:a05:6830:1d81:b0:6b7:4a52:a33a with SMTP id
 y1-20020a0568301d8100b006b74a52a33amr1515037oti.14.1687727372856; Sun, 25 Jun
 2023 14:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYdKdhscu_NDetiWDgm7bqh-Tf7kqGMHYOvOE0sQh2dU3t64g@mail.gmail.com>
 <CAOMZO5AZQ1147K8tD5e0fJ680CtdDBWk1eMN7n9rVWtJX06W3A@mail.gmail.com>
 <CAOYdKdhuVbzavb9CJYqOLXX7PYCbOGzmeUg2eTgF1saTviCo-Q@mail.gmail.com>
 <f2570cf9-d01f-431b-832c-deae7a8f4c61@lunn.ch> <CAOYdKdiKxpk6sY7wWrrpW+ih6JziMyboRQO=2L3qov_DMhBmOA@mail.gmail.com>
In-Reply-To: <CAOYdKdiKxpk6sY7wWrrpW+ih6JziMyboRQO=2L3qov_DMhBmOA@mail.gmail.com>
From: Rogan Dawes <rogan@dawes.za.net>
Date: Sun, 25 Jun 2023 23:09:21 +0200
Message-ID: <CAOYdKdgrpQ9LQvjG7Eg40XtNPonYXmtRmwR=ZERatRJC6osZsA@mail.gmail.com>
Subject: Re: Trying to boot mainline on Wink Hub v1
To: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, 
	Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_140934_694831_26C099A5 
X-CRM114-Status: GOOD (  33.52  )
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

I tried adding a &nand block to my device tree, but I think it is not
quite as simple as that, as I got an error message complaining about
my additions:

Error: arch/arm/boot/dts/imx28-wink-hub-v1.dts:40.6-11 syntax error
FATAL ERROR: Unable to parse input tree

This was pointing right at the &nand stanza. I suspect that the
problem is that the kirkwood.dtsi that your example was derived from
actually contained an existing nand node, while the imx28.dtsi that I
am deriving from does not. And unfortunately I do not understand
enough of the device tree syntax to solve this.

I did create the following entry, hopefully it maps the partitions
appropriately:
// Based on mtdparts=mtdparts=gpmi-nand:3m(u-boot),4m(updater-kernel),28m(updater-rootfs),8m(database),8m(app-kernel),-(app-rootfs)

&nand {
        status = "okay";

        partition@0 {
                label = "u-boot";
                reg = <0x0000000 0x300000>;
                read-only;
        };

        partition@300000 {
                label = "updater-kernel";
                reg = <0x0300000 0x400000>;
        };

        partition@700000 {
                label = "updater-rootfs";
                reg = <0x0700000 0x1c00000>;
        };

        partition@2300000 {
                label = "database";
                reg = <0x2300000 0x0800000>;
        };

        partition@2b00000 {
                label = "app-kernel";
                reg = <0x2b00000 0x0800000>;
        };

        partition@3300000 {
                label = "app-rootfs";
                reg = <0x3300000 0x0>;
        };

};

Hopefully at least the numbers look right?

Rogan

On Sun, 25 Jun 2023 at 21:31, Rogan Dawes <rogan@dawes.za.net> wrote:
>
> Thanks for the suggestion. It definitely sounds like it might
> short-cut my problems. I'd obviously still like to try and do things
> the "correct" way, whatever that is. My attempts to load the kernel
> and device tree in a FIT so far just end with:
>
> => nand read ${loadaddr} app-kernel 0x00600000
>
> NAND read: device 0 offset 0x2b00000, size 0x600000
>  6291456 bytes read: OK
> => iminfo ${lodaddr}
>
> ## Checking Image at 42000000 ...
> Unknown image format!
> => md.b ${loadaddr} 0x80
> 42000000: d0 0d fe ed 00 5a 81 08 00 00 00 38 00 5a 7c fc    .....Z.....8.Z|.
> 42000010: 00 00 00 28 00 00 00 11 00 00 00 10 00 00 00 00    ...(............
> 42000020: 00 00 00 6c 00 5a 7c c4 00 00 00 00 00 00 00 00    ...l.Z|.........
> 42000030: 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00    ................
> 42000040: 00 00 00 03 00 00 00 04 00 00 00 5c 64 98 90 71    ...........\d..q
> 42000050: 00 00 00 03 00 00 00 21 00 00 00 00 61 72 6d 20    .......!....arm
> 42000060: 6b 65 72 6e 65 6c 2c 20 72 61 6d 64 69 73 6b 20    kernel, ramdisk
> 42000070: 61 6e 64 20 46 44 54 20 62 6c 6f 62 00 00 00 00    and FDT blob....
>
> Seems like it is loaded in the right place, though, and corresponds
> with the FIT file that I would expect to be there.
>
> Anyway, will try replicate the partition information directly into the DT.
>
> I also found the memory base address in the U-Boot bdinfo command output:
>
> => bdinfo
> arch_number = 0x000009E3
> boot_params = 0x40000100
> DRAM bank   = 0x00000000
> -> start    = 0x40000000
> -> size     = 0x04000000
>
> So I updated the .its as shown, with the image loaded from NAND to
> 32MB, the kernel relocated to 16MB, and no relocation/entry data for
> the device tree. I also tried loading it to 0x41000000 (by updating
> ${loadaddr}, specified that the kernel should be relocated to
> 0x42000000, which is where it usually was to be found, with the same
> "Unknown image format!" error:
>
> /dts-v1/;
>
> / {
>         description = "arm kernel, ramdisk and FDT blob";
>         #address-cells = <1>;
>
>         images {
>                 kernel {
>                         description = "ARM MXS Kernel";
>                         data = /incbin/("Image.gz");
>                         type = "kernel";
>                         arch = "arm";
>                         os = "linux";
>                         compression = "gzip";
>                         load = <0x41000000>;
>                         entry = <0x41000000>;
>                         hash {
>                                 algo = "sha1";
>                         };
>                 };
>
>                 imx28-wink-hub-v1 {
>                         description = "lx2162aqds-dtb";
>                         data = /incbin/("imx28-wink-hub-v1.dtb");
>                         type = "flat_dt";
>                         arch = "arm";
>                         os = "linux";
>                         compression = "none";
>                         hash {
>                                 algo = "sha1";
>                         };
>                 };
>         };
>
>         configurations {
>                 default = "wink-hub-v1";
>                 wink-hub-v1 {
>                         description = "config for Wink Hub v1";
>                         kernel = "kernel";
>                         fdt = "imx28-wink-hub-v1";
>                 };
>         };
> };
>
> Suggestions welcome.
>
> Regards,
>
> Rogan
>
> On Sun, 25 Jun 2023 at 17:24, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > I *think* my problem is that U-Boot is not aware of the device tree,
> > > as I have been passing it as an appended item to the kernel, thinking
> > > that U-Boot was not Device-Tree compliant. Consequently, it is unable
> > > to patch it with the contents of the mtdparts environment variable,
> > > and hence the kernel never knows to go looking for the mtd partitions.
> >
> > You should be able to fully describe the MTD partition in DT. For
> > example, from arch/arm/boot/dts/kirkwood-dockstar.dts.
> >
> > &nand {
> >         status = "okay";
> >
> >         partition@0 {
> >                 label = "u-boot";
> >                 reg = <0x0000000 0x100000>;
> >                 read-only;
> >         };
> >
> >         partition@100000 {
> >                 label = "uImage";
> >                 reg = <0x0100000 0x400000>;
> >         };
> >
> >         partition@500000 {
> >                 label = "data";
> >                 reg = <0x0500000 0xfb00000>;
> >         };
> > };
> >
> > You can then continue with appending the DT blob to the kernel. All
> > the bootloader needs to do is load the kernel.
> >
> >     Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
