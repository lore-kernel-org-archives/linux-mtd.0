Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBA1CDB482
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 01:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WVi5xMeN8ZzGXI0Ip5S4VxZEUjyg9VjOFfM2xkUho0c=; b=sBw
	gxVI+s2grEpfJPX6sRkOdWQkIpYAaurrxGieQ+LbHZTrZlHzVBthAnadpqHx5unJSlZ6lXUWCm1xD
	fcpThso7PvxK7c1SUJ71/LeaZ5We45OJDtyclRQDK1NhNvPzE5REhA10sOA7NYJb92/9mTXjo2Dgx
	iNQ7MrbQVPU9LU25JVS0m6iJ6xcZ/XkTgvFwWcFSDsI4gil+/JhH6EolNbr084/CVY4v2dq7PMlTJ
	i8qL3xaINiEoxqSW/6BB+fcJOVDCa3au194nT5EGNMc3d4eeZ3/rDFYdMfUwc3NX0tMtKiz8IH7KQ
	Kmkmn8Cv+OK4tm1mmhwLD7cGOcXhn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvF7-00DX3a-2m;
	Wed, 18 Oct 2023 01:21:01 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvF4-00DX2l-1J
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 01:20:59 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so75338871fa.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 18:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697592052; x=1698196852; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w9bsZxjzCPh+j9mOqAEjdN74J0YCo7pjjZD9ZpCkphM=;
        b=QxAkhORsNFdphz4237XkWtZDxh5dCzIyPCLBpr/L5T0hjo8cPR7xlZ3n/5cxkW9Fvm
         HatzrVNJL2U5OpwWSwtLyvownfT8OecV5eKwAOHmqmYdOja4x1aNTMz2wdAVuUFxiSww
         s+pxkjHJglb2xejuB+9W0MGTwmrwQxQKacXQ1p7F9nFwHUMIDHod0T85Txv/XsErhwrY
         nDa861vUTqiE++EKO8mxijkQPj3z2Qq5fLxkJZhUY6HkzfCUdOO7KKj8W+m2IyjVagvy
         2/9sxWXCdlwmM7O3SmrmLKCaBPD/ZBZh6oLcDS5BWSJABEzFUUADbX4J/cks/c2CtQzO
         G3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697592052; x=1698196852;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9bsZxjzCPh+j9mOqAEjdN74J0YCo7pjjZD9ZpCkphM=;
        b=U/E+5j7gre9C6ZPTYHzbwu86XwmqeKpOQBxstJnL4FgHxw5f5ydJ0f+AdDcQEw71py
         ljG2uKNZhN0NOKgiS0QjvaC58q6Ntrps13YX5PB0RCrg6n3kyPHL5wJxGXxznRl6NuX3
         jOVUy7nKdl6DHrSenJxpD4smC19OLxXD3oo4VuBCK///Cf1saHZZ+HUKr/E+Uklx70F8
         nCHVPKw0iK0yuKfrRHlnyoMG6xSidysKf/QouodSWenhGFxsCRG8TyZ/OdU7c+fT7pvW
         XRp/QulnSOpgiP2JH0JDbaYWydAWlQSWToJTbMZo+ThXsAw7+IXHIPb/inM+wAFJPLIf
         1m3w==
X-Gm-Message-State: AOJu0YwlsCB3GRpPhk+xX6J4rna4LGpWrZo2cjia8IZqdy4p+Vd3XRQ9
	Aw/lUwmyHWxwFADOz7ipxrW4BAwRHp7VF/eu4ejuGl/FfFU=
X-Google-Smtp-Source: AGHT+IGNHw/fCX8xVSNKnY4IFoE7QOUwm6WpXGyagawKD5RX0i/z68Rb1TKNSVVZgashP/LkbfolBd3V4LhFYr8ve+g=
X-Received: by 2002:a05:651c:314:b0:2bc:f252:6cc4 with SMTP id
 a20-20020a05651c031400b002bcf2526cc4mr2578249ljp.10.1697592051819; Tue, 17
 Oct 2023 18:20:51 -0700 (PDT)
MIME-Version: 1.0
From: Charles Manning <cdhmanning@gmail.com>
Date: Wed, 18 Oct 2023 14:20:39 +1300
Message-ID: <CAE21AQqTPJqy9QdFkK+QTgK7bbU3XUQZJcZeJXg1a8Hhs1VouA@mail.gmail.com>
Subject: Should spi-nand wok with SPI on Zynq?
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_182058_442258_0D070178 
X-CRM114-Status: GOOD (  13.63  )
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

Hi All

I am trying to use spi-nand an a Zynq via an spi port (NB not qspi)

I have tried both 5.15 and 6.1.5 as supported on the XIlinx linux tree,

The device tree node is:
        spi@e0007000 {
            compatible = "xlnx,zynq-spi-r1p6";
            reg = <0xe0007000 0x1000>;
            status = "okay";
            interrupt-parent = <0x04>;
            interrupts = <0x00 0x31 0x04>;
            clocks = <0x01 0x1a 0x01 0x23>;
            clock-names = "ref_clk\0pclk";
            #address-cells = <0x01>;
            #size-cells = <0x00>;

            nandflash@0 {
                compatible = "spi-nand";
                reg = <0x00>;
                spi-max-frequency = <0x989680>;

                partitions {
                    compatible = "fixed-partitions";
                    #address-cells = <0x02>;
                    #size-cells = <0x02>;

                    partition@0 {
                        label = "small";
                        reg = <0x00 0x00 0x00 0x800000>;
                    };
                };
            };
        };


The boot up recognises the device fine:

spi-nand spi0.0: Micron SPI NAND was found.
spi-nand spi0.0: 128 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
1 fixed-partitions partitions found on MTD device spi0.0
Creating 1 MTD partitions on "spi0.0":
0x000000000000-0x000000800000 : "small"

But all the blocks are bad.

# nanddump -c /dev/mtd0
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 62
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 128
Dumping data starting at 0x00000000 and ending at 0x00800000...
libmtd: error!: cannot read 2048 bytes from mtd0 (eraseblock 0, offset 0)
        error 110 (Connection timed out)
nanddump: error!: mtd_read

When I attach a logic analyser I can see that when the CPU issues a
request for status, the expected traffic is on the bus, with the
status being 0x00, but the spi_mem_status() is not giving back a valid
status (I'm betting 0xff) and the -110 return value indicating a time
out.

In spi_mem_poll_status() the ret == -ENOTSUPP) code is being executed.

        if (ret == -EOPNOTSUPP) {
                if (!spi_mem_supports_op(mem, op))
                        return ret;

                if (initial_delay_us < 10)
                        udelay(initial_delay_us);
                else
                        usleep_range((initial_delay_us >> 2) + 1,
                                     initial_delay_us);

                ret = read_poll_timeout(spi_mem_read_status, read_status_ret,
                                        (read_status_ret || ((status)
& mask) == match),
                                        polling_delay_us, timeout_ms *
1000, false, mem,
                                        op, &status);
   +          pr_info("mem op status status 0x%x ret %d\n", status, ret);

                if (read_status_ret)
                        return read_status_ret;
        }

That gives me :
mem op status status 0xff ret -110

This suggests to me that something isn't working properly in the
spi-mem is using the underlying driver.

Any suggestions/pointers would be welcome.

Thanks

Charles

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
