Return-Path: <SRS0=bYPC=UZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49FEC48BD3
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 09:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCA9B20663
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 09:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f5f/4dF8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgWg6g1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCA9B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OZi2Jj7canqr+6SFTebNKT28jbd0K4cLfWKVchnyu9U=; b=f5f/4dF8B5RNm3
	g8dn/rFw3miaGzzR1/lNvTupvw/seatoLHvI0WNrFrDkALWrXCW5wfq/ntwUo3cAR/7yTih5fXNMx
	wiExkeqMNTIB+52WMzzx6LOZSjUNduTDybDOLsHkvWj4TU83ckgGAkI+MCLez57/RrpiMJcIDias3
	JALUuzXJHb5XYhUugX8na/mE83Iqnu1uTfQZzUDiAKEjvm8E0JonOBvF0oK62M16mvIZpJ+C+/629
	e0OEx56s8lGa4kt7oIYs5m7f8fb59b7qZRBc404saaGxvJ6ei23GSgppEB6LXQv02iVKHt0IMbwJY
	9s75BQsouwUQKUtagfRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg4Ln-0002Po-I2; Wed, 26 Jun 2019 09:36:23 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg4Li-0002PH-0w
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2019 09:36:19 +0000
Received: by mail-io1-xd30.google.com with SMTP id m24so326926ioo.2
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2019 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3bXdon3OqBDizi1U9rxgE4KJiCWUb9IjTneJEpKAvGI=;
 b=SgWg6g1EBeYsH3FIxYNtCSdZJbt0/O+Ft2Zdr4ZSHO70oiWZKXCKayEwu5ZYXSucJ3
 2/VZGyaFwovczFBLT9OuRs7kBKF2tPOj3FXJWvLU+Oyy/WGDDOul500G5WNoNtb642k0
 Ph1W915M7tWxFUzqNKZfvgvDeKQ2rjE6rP8Anky3ev/qGoZ8eYHXpQp28Deaoxz+xfMV
 ZvrxfTrOTSTlhg0pBhwTFZ5DfAnnTm7DrHIPVsagrjjRiVKp+6z8NHKc0NA1QBCVzc4o
 XJ7/krSH77DK/VM8zZmLpQgd0D0BgtPsJMpZAB+ws+QxGWgEBlEwZOlYGA3CpxVO4lTW
 hNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3bXdon3OqBDizi1U9rxgE4KJiCWUb9IjTneJEpKAvGI=;
 b=dcq4vreBrazDGAYW8BEP4n+3nsJDYl00z07R94pZTjPrb8nKklBLChOLt6PAWyBQ0e
 ByyCeTnu36DugSlzZBAJPvVrUdmEYWuI5+0w0LspGXIyz4F3t+IB98UDxRy7yB1RlMhd
 VbsPC8YxET2SM/NrJ/BSAU/J8ZlcElXlI3RR2WlKwelcXWyR9eEkPwaMSTqCQvk5AH1l
 BuOyxSqc029L0yqkVCjd8BtbbMsD6jkNEhYQf61JEAftTf9equfRy4jeNkLF2bXxSjCB
 5KqMYSzdsDblkoMG2YrhduRiXAnvuSSJeArQHvIgGEzlkOKY1i5WWVXUojJhyWoVoCN9
 cYGA==
X-Gm-Message-State: APjAAAWPA5g7ESADSl1UU55A2LJIkGbXUgM7butKAzNavmup4h0D/KCz
 xfKJd7Lem1nw4yKkN3TozXcrk2pCxwN8KKTvUKLti+UB
X-Google-Smtp-Source: APXvYqzv2aUAM9Ilsa3f+/W3afiYJiXv5OhnyQiV/J0mBS05dl45dX2W/kzYMBf6CXJpWbWDHS0DOiqwz3n35/wa5/I=
X-Received: by 2002:a5e:8a05:: with SMTP id d5mr19055iok.147.1561541776831;
 Wed, 26 Jun 2019 02:36:16 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Fenkart <afenkart@gmail.com>
Date: Wed, 26 Jun 2019 11:36:06 +0200
Message-ID: <CALtMJEBpxc+oN1Uf03F0oG-smHZazeeptE=BRX7tPpixnAgFrw@mail.gmail.com>
Subject: regression: nand/spi flashes listed in reversed order after "ARM:
 dts: at91: Switch to the new NAND bindings"
To: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_023618_098035_31764907 
X-CRM114-Status: UNSURE (   6.84  )
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
Cc: alexandre.belloni@free-electrons.com, "Michonski,
 Krzysztof" <krzysztof.michonski@digitalstrom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

After this patch, which is of course much appreciated:

1004a2977bdc7566bca87c565541c3232ed467c4
Refs: v4.12-rc1-7-g1004a2977bdc
Author:     Boris Brezillon <boris.brezillon@free-electrons.com>
AuthorDate: Tue May 30 11:20:53 2017 +0200
Commit:     Alexandre Belloni <alexandre.belloni@free-electrons.com>
CommitDate: Wed May 31 11:55:41 2017 +0200

    ARM: dts: at91: Switch to the new NAND bindings

    Use the new EBI/NAND bindings to declare NAND chips and remove old NAND
    nodes along the way.

    Note that we keep using old bindings in at91rm9200.dtsi because this
    SoC is not supported by the EBI driver.

The listing and indexing of my mtd devices changed:

root@after:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00010000 "spi32766.0"
...
mtd4: 32000000 00080000 "rootfs"
mtd5: 0bc00000 00080000 "config"

root@before:~# cat /proc/mtd
dev:    size   erasesize  name
...
mtd3: 32000000 00080000 "rootfs"
mtd4: 0bc00000 00080000 "config"
mtd5: 00080000 00010000 "spi32766.0"


I assume sorting the mtd listing in a specific order is not supported
nor desired by the mtd maintainers. So I'm not argueing about that.

But since the index of rootfs device is hard-coded in the cmdline, the
fw-utils config file and a custom script to backup/retrieve
configuration, this is causing me some problems.

The nand is partitioned, the spi is not:
mtdparts=mtdparts=atmel_nand:2M(foo),2M(bar),32M(baz),800M(rootfs),-(config)

While the bootargs can be fixed easily by using the human readable
name (ubi.mtd=rootfs). I can't retrieve that human readable name from
udev alone, nor can I build something from major/minor alone, since
the major is the same for nand/spi flash.

root@before:/etc/udev/rules.d# udevadm info /dev/mtd3
P: /devices/platform/ahb/40000000.nand/mtd/mtd3
N: mtd3
E: DEVNAME=/dev/mtd3
E: DEVPATH=/devices/platform/ahb/40000000.nand/mtd/mtd3
E: DEVTYPE=mtd
E: MAJOR=90
E: MINOR=6

root@dSS:/etc/udev/rules.d# udevadm info /dev/mtd5
P: /devices/platform/ahb/ahb:apb/fffc8000.spi/spi_master/spi32766/spi32766.0/mtd/mtd5
N: mtd5
E: DEVNAME=/dev/mtd5
E: DEVPATH=/devices/platform/ahb/ahb:apb/fffc8000.spi/spi_master/spi32766/spi32766.0/mtd/mtd5
E: DEVTYPE=mtd
E: MAJOR=90
E: MINOR=10
E: OF_COMPATIBLE_0=st,m25p40
E: OF_COMPATIBLE_N=1
E: OF_FULLNAME=/ahb/apb/spi@fffc8000/m25p40@0
E: OF_NAME=m25p40
E: SUBSYSTEM=mtd

What is the preferred to make the rootfs agnostic of a particular mtd
listing order

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
