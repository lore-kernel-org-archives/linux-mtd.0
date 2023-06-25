Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B85EB64DC
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jun 2023 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ec9CZVWZvz4Cby832l2y1GTIOGCnbAw0gT8gIOej54=; b=TeRcP/2CJ08SJV
	0XvZKe7rzX1h4VRS5PqZ2mbxbavnNHDATyPYqiX1teWQc9ZVktiyE8dC5Tfl7z6KhMlUb3V863Vgf
	ul6RuFA4pHjx6ZNIl8swm9xNDkx5PKZMfzJjoqIAN2fJihcb2pL14bPRcpA3XoT2oMg4xMMy/zfII
	7PjqWiW3nHzqjI0O6RoetSZb8t3aREQz3oIgbYZmuByvE9hWTx+m07hczYkn1nfW2k45yZs4HhAut
	FdkdNWV01KSwsTkd5a+09ZP2OYFRnlsygINPb0nHav/Sj1fWnnf3LWMMFfA5dUwGGh8vGBMzJPXMX
	AP22EnwZutk9O5MZEbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDVSA-008YeI-2N;
	Sun, 25 Jun 2023 19:31:18 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDVS6-008YdO-1G;
	Sun, 25 Jun 2023 19:31:17 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6b73c2b6dcfso224585a34.2;
        Sun, 25 Jun 2023 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20221208.gappssmtp.com; s=20221208; t=1687721472; x=1690313472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NBBTABoRiiQyieyPJyueUICVO52O3a3upjp3c4s5T44=;
        b=truXG36bM6XUHgd6tQAPfIsOWT7LJ4u34am5EIlSJ7+xGQ3cuThEw433ZjRtvomFPa
         e7HBVgF4chufSTRW7COGbcNgUcv0kC56HeP9mWtuR8mCtSiw9nbXJLBlIgE6YeaDJCYs
         mzXhXzxExX+UzRk+mTsFB/NcURz0J61G0gqgJcOqIXliSWP9deqUpZAfMjNH1rN/pgYU
         ol42fYJyVx7juy2ZuUdg6uK7x8FOz1C7LpK6RoY3UUDLG4EpgI4KRzNyH8WcsVrzeZPK
         d5PmUwBKTjStVZLk2MS7i8mt+jCDKTpErEnfwIVE4qgBrOhQZuYSXJHYg8Xu7l4Bhakb
         g55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687721472; x=1690313472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBBTABoRiiQyieyPJyueUICVO52O3a3upjp3c4s5T44=;
        b=hFU5zPvNT5s9fzOBKvDW5aF5t/JDnQ59tjFfcvht+LyKH9k8AbM9u6Nr2PFiyGoGyZ
         7WJg6gSTzglNMDRZtZHuOw9YzbKk8Qxuh5aGCQEn+AKu6FlBeat0ll1QIqHtzEww2Q1r
         3AsCEq73CS6wDkCd4ao6aYs+vnKF/nnpaU1bJCdf1m29tPt8jUyZyw6+uI71mhRpWueZ
         3xAGcFrFNoGf3aTHM3dahGo+iZ3i/t1TI39ZTnTThyuYRVqlhTC0Wa/6jxC0jO1aXF/u
         YxkH6TlWFjC1RjHnYxECelOi0fPQZdCVPfEa7IBDIcAcXnBs5HRmdWtZsrXxYiUyMlbY
         xdKQ==
X-Gm-Message-State: AC+VfDyIQaQmzJw7eJdM0eCEnwDTxlCe1w6svftL4ZlY6RdS6iXQayUX
	jB+Avwhoni7dS/A2vU3c2PYhGI0BgzLKCXJa/gU=
X-Google-Smtp-Source: ACHHUZ7vp4j7vwaPLL2EJ4P/1osVxqvRul+ya7E3pMTi4A8wm3+85TKRt4cNJP8XabuZVkWj1NAOX9yHZpNHSmTFyMc=
X-Received: by 2002:a05:6830:1394:b0:6b7:2ef2:5beb with SMTP id
 d20-20020a056830139400b006b72ef25bebmr3574783otq.32.1687721472312; Sun, 25
 Jun 2023 12:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYdKdhscu_NDetiWDgm7bqh-Tf7kqGMHYOvOE0sQh2dU3t64g@mail.gmail.com>
 <CAOMZO5AZQ1147K8tD5e0fJ680CtdDBWk1eMN7n9rVWtJX06W3A@mail.gmail.com>
 <CAOYdKdhuVbzavb9CJYqOLXX7PYCbOGzmeUg2eTgF1saTviCo-Q@mail.gmail.com> <f2570cf9-d01f-431b-832c-deae7a8f4c61@lunn.ch>
In-Reply-To: <f2570cf9-d01f-431b-832c-deae7a8f4c61@lunn.ch>
From: Rogan Dawes <rogan@dawes.za.net>
Date: Sun, 25 Jun 2023 21:31:01 +0200
Message-ID: <CAOYdKdiKxpk6sY7wWrrpW+ih6JziMyboRQO=2L3qov_DMhBmOA@mail.gmail.com>
Subject: Re: Trying to boot mainline on Wink Hub v1
To: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, 
	Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_123114_680371_D2BB8048 
X-CRM114-Status: GOOD (  22.17  )
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

Thanks for the suggestion. It definitely sounds like it might
short-cut my problems. I'd obviously still like to try and do things
the "correct" way, whatever that is. My attempts to load the kernel
and device tree in a FIT so far just end with:

=> nand read ${loadaddr} app-kernel 0x00600000

NAND read: device 0 offset 0x2b00000, size 0x600000
 6291456 bytes read: OK
=> iminfo ${lodaddr}

## Checking Image at 42000000 ...
Unknown image format!
=> md.b ${loadaddr} 0x80
42000000: d0 0d fe ed 00 5a 81 08 00 00 00 38 00 5a 7c fc    .....Z.....8.Z|.
42000010: 00 00 00 28 00 00 00 11 00 00 00 10 00 00 00 00    ...(............
42000020: 00 00 00 6c 00 5a 7c c4 00 00 00 00 00 00 00 00    ...l.Z|.........
42000030: 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00    ................
42000040: 00 00 00 03 00 00 00 04 00 00 00 5c 64 98 90 71    ...........\d..q
42000050: 00 00 00 03 00 00 00 21 00 00 00 00 61 72 6d 20    .......!....arm
42000060: 6b 65 72 6e 65 6c 2c 20 72 61 6d 64 69 73 6b 20    kernel, ramdisk
42000070: 61 6e 64 20 46 44 54 20 62 6c 6f 62 00 00 00 00    and FDT blob....

Seems like it is loaded in the right place, though, and corresponds
with the FIT file that I would expect to be there.

Anyway, will try replicate the partition information directly into the DT.

I also found the memory base address in the U-Boot bdinfo command output:

=> bdinfo
arch_number = 0x000009E3
boot_params = 0x40000100
DRAM bank   = 0x00000000
-> start    = 0x40000000
-> size     = 0x04000000

So I updated the .its as shown, with the image loaded from NAND to
32MB, the kernel relocated to 16MB, and no relocation/entry data for
the device tree. I also tried loading it to 0x41000000 (by updating
${loadaddr}, specified that the kernel should be relocated to
0x42000000, which is where it usually was to be found, with the same
"Unknown image format!" error:

/dts-v1/;

/ {
        description = "arm kernel, ramdisk and FDT blob";
        #address-cells = <1>;

        images {
                kernel {
                        description = "ARM MXS Kernel";
                        data = /incbin/("Image.gz");
                        type = "kernel";
                        arch = "arm";
                        os = "linux";
                        compression = "gzip";
                        load = <0x41000000>;
                        entry = <0x41000000>;
                        hash {
                                algo = "sha1";
                        };
                };

                imx28-wink-hub-v1 {
                        description = "lx2162aqds-dtb";
                        data = /incbin/("imx28-wink-hub-v1.dtb");
                        type = "flat_dt";
                        arch = "arm";
                        os = "linux";
                        compression = "none";
                        hash {
                                algo = "sha1";
                        };
                };
        };

        configurations {
                default = "wink-hub-v1";
                wink-hub-v1 {
                        description = "config for Wink Hub v1";
                        kernel = "kernel";
                        fdt = "imx28-wink-hub-v1";
                };
        };
};

Suggestions welcome.

Regards,

Rogan

On Sun, 25 Jun 2023 at 17:24, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I *think* my problem is that U-Boot is not aware of the device tree,
> > as I have been passing it as an appended item to the kernel, thinking
> > that U-Boot was not Device-Tree compliant. Consequently, it is unable
> > to patch it with the contents of the mtdparts environment variable,
> > and hence the kernel never knows to go looking for the mtd partitions.
>
> You should be able to fully describe the MTD partition in DT. For
> example, from arch/arm/boot/dts/kirkwood-dockstar.dts.
>
> &nand {
>         status = "okay";
>
>         partition@0 {
>                 label = "u-boot";
>                 reg = <0x0000000 0x100000>;
>                 read-only;
>         };
>
>         partition@100000 {
>                 label = "uImage";
>                 reg = <0x0100000 0x400000>;
>         };
>
>         partition@500000 {
>                 label = "data";
>                 reg = <0x0500000 0xfb00000>;
>         };
> };
>
> You can then continue with appending the DT blob to the kernel. All
> the bootloader needs to do is load the kernel.
>
>     Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
