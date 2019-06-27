Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF4AC48BD6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 10:44:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C932083B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 10:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gU6d2Dmv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJOk+MjP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C932083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YfV9v6x3Qu8Dfe0GaWXcjBeT/yecwtaA4AsDsfw0FY=; b=gU6d2DmvlU6uZq
	ukeWAITny0yzy3PyOF7nKKgPWgTkdDVQtamKHsb5S6GR03MfwILtTdnmwTY6eDDhryOHJlxGUs2gH
	4xMw9jNp7uJe1/Lm74uEpr+8o5mNGhv5HSlsk1U0GFAcVHL8QfFbbrlMsBpUhdETOsudlQitQvssM
	FEDhank++aktGH/0O5IVIBXTvHFElW7xjTIPnbyPb6wS9gFYvLvf/9QMe6v8zUCixfi9g25wy6DQC
	GQlmc3bbZgsZJpU0k6YrusW9QXZGiHlOLBHAG1Z+Sy+mrdNItOHSRM9HwnWgoUXFnXNZ3cyJjjqlB
	UJ3ji12/B1HWl9HAdfOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgRtA-0003GB-Dt; Thu, 27 Jun 2019 10:44:24 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgRt7-0003FZ-5z
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 10:44:22 +0000
Received: by mail-io1-xd35.google.com with SMTP id r185so3663911iod.6
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhdwCmeLwlRZ/4GZ9S8B4tPx6Z/f2FMcyMJaWntmaFI=;
 b=sJOk+MjPQYVBSdGSy/F3aJNIiLK9PptVgyZtF7ZlCEP5CH/Of4Yh4aGlHV1I8nDijB
 pnhz9XLqLEpyHOzbb7aCp2zmx/etXdOhQW1yVVebpXTdAdYRmfCDLuEj/RZGaC9ISkLM
 ERYkxLY0BrDEpLRO1E/trT7a7FW0yHqiN7UqSmMhlbU4FQQViafYuTzwiThE8cLgXEWm
 hmLnSONjsKHptGuWJH0gF3my1fm+peqzLx+dvCax//tcaH8DERrT6TXE1yD5pFhPig54
 //IkVsr7UekgTG3d9f2LLnZCh6nDVbXvdSZTQGZbMZI//OPC8Xdm/hPtOFNycVDkyhdw
 z/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhdwCmeLwlRZ/4GZ9S8B4tPx6Z/f2FMcyMJaWntmaFI=;
 b=twAA4UujxVWn6s4e74d27h7w/3Mq9YjA0xvrFyO2Ap6vetURTe0hJq98F6HZ3IBT/H
 s8CdcrkvGfduKxJztKMTA0p/9hzQN+jk8vgGQUUMS3C+L/TPoWMD5YjBuv/DE7C6jyle
 yiCDb0bu9+e1vyrTlKZEUAhl8a2M4/oEZRr28WUvZ7jPnPwWFpUchIs+zW7Sjb29vGQN
 T12CgRIHGS1vkOqn2Brq10aFnR23lnLlcxfrYZYGhtB+ZOsEHWWVZ1Uo1Qw3WjleXO72
 v+QtQHsmBWlecVmzfEw6dX2r9GPTdKSua62ypMFuwC8On+iFezwulsxb16DJatHzUjtn
 zZYg==
X-Gm-Message-State: APjAAAVBz+iUFCL1eSY/h5dDsWEg2h9AKlx8wDewUKAbGtJRasmFPSwV
 PlQBLWG46AkaNwXjdQBTVzdZ7zeWMfSMbGQ8StY=
X-Google-Smtp-Source: APXvYqzsMvyajYKscZuvXGyO/uG20bY9rbOyNTfBIyX48cGkhEmIyXq+26ilHc1b1zQXOfKxvsmbY0Uiu67vRj7xpPs=
X-Received: by 2002:a02:4484:: with SMTP id o126mr3872937jaa.34.1561632259888; 
 Thu, 27 Jun 2019 03:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <CALtMJEBpxc+oN1Uf03F0oG-smHZazeeptE=BRX7tPpixnAgFrw@mail.gmail.com>
In-Reply-To: <CALtMJEBpxc+oN1Uf03F0oG-smHZazeeptE=BRX7tPpixnAgFrw@mail.gmail.com>
From: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 27 Jun 2019 12:44:08 +0200
Message-ID: <CALtMJEBEo8u0YSqqAbRY0YwnuzCByAuQ8YKt8FrPzhoJpW_YCg@mail.gmail.com>
Subject: Re: regression: nand/spi flashes listed in reversed order after "ARM:
 dts: at91: Switch to the new NAND bindings"
To: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_034421_250638_483A249B 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: alexandre.belloni@free-electrons.com, "Michonski,
 Krzysztof" <krzysztof.michonski@digitalstrom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

fyi,

actually straight forward when also dumping the attributes:
udevadm info -a /dev/mtd0

here my rules
SUBSYSTEM=="mtd", ATTR{type}=="nand", ACTION=="add", SYMLINK+="mtd/%s{name}"
SUBSYSTEM=="mtd", ATTR{type}=="nor", ACTION=="add" SYMLINK+="mtd/spi"

/andi

Am Mi., 26. Juni 2019 um 11:36 Uhr schrieb Andreas Fenkart <afenkart@gmail.com>:
>
> After this patch, which is of course much appreciated:
>
> 1004a2977bdc7566bca87c565541c3232ed467c4
> Refs: v4.12-rc1-7-g1004a2977bdc
> Author:     Boris Brezillon <boris.brezillon@free-electrons.com>
> AuthorDate: Tue May 30 11:20:53 2017 +0200
> Commit:     Alexandre Belloni <alexandre.belloni@free-electrons.com>
> CommitDate: Wed May 31 11:55:41 2017 +0200
>
>     ARM: dts: at91: Switch to the new NAND bindings
>
>     Use the new EBI/NAND bindings to declare NAND chips and remove old NAND
>     nodes along the way.
>
>     Note that we keep using old bindings in at91rm9200.dtsi because this
>     SoC is not supported by the EBI driver.
>
> The listing and indexing of my mtd devices changed:
>
> root@after:~# cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00080000 00010000 "spi32766.0"
> ...
> mtd4: 32000000 00080000 "rootfs"
> mtd5: 0bc00000 00080000 "config"
>
> root@before:~# cat /proc/mtd
> dev:    size   erasesize  name
> ...
> mtd3: 32000000 00080000 "rootfs"
> mtd4: 0bc00000 00080000 "config"
> mtd5: 00080000 00010000 "spi32766.0"
>
>
> I assume sorting the mtd listing in a specific order is not supported
> nor desired by the mtd maintainers. So I'm not argueing about that.
>
> But since the index of rootfs device is hard-coded in the cmdline, the
> fw-utils config file and a custom script to backup/retrieve
> configuration, this is causing me some problems.
>
> The nand is partitioned, the spi is not:
> mtdparts=mtdparts=atmel_nand:2M(foo),2M(bar),32M(baz),800M(rootfs),-(config)
>
> While the bootargs can be fixed easily by using the human readable
> name (ubi.mtd=rootfs). I can't retrieve that human readable name from
> udev alone, nor can I build something from major/minor alone, since
> the major is the same for nand/spi flash.
>
> root@before:/etc/udev/rules.d# udevadm info /dev/mtd3
> P: /devices/platform/ahb/40000000.nand/mtd/mtd3
> N: mtd3
> E: DEVNAME=/dev/mtd3
> E: DEVPATH=/devices/platform/ahb/40000000.nand/mtd/mtd3
> E: DEVTYPE=mtd
> E: MAJOR=90
> E: MINOR=6
>
> root@dSS:/etc/udev/rules.d# udevadm info /dev/mtd5
> P: /devices/platform/ahb/ahb:apb/fffc8000.spi/spi_master/spi32766/spi32766.0/mtd/mtd5
> N: mtd5
> E: DEVNAME=/dev/mtd5
> E: DEVPATH=/devices/platform/ahb/ahb:apb/fffc8000.spi/spi_master/spi32766/spi32766.0/mtd/mtd5
> E: DEVTYPE=mtd
> E: MAJOR=90
> E: MINOR=10
> E: OF_COMPATIBLE_0=st,m25p40
> E: OF_COMPATIBLE_N=1
> E: OF_FULLNAME=/ahb/apb/spi@fffc8000/m25p40@0
> E: OF_NAME=m25p40
> E: SUBSYSTEM=mtd
>
> What is the preferred to make the rootfs agnostic of a particular mtd
> listing order

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
