Return-Path: <SRS0=F6Bg=2M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28F2C2D0C8
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Dec 2019 19:19:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676B0206CB
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Dec 2019 19:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N12kuXp8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=syscall7-com.20150623.gappssmtp.com header.i=@syscall7-com.20150623.gappssmtp.com header.b="Z28R4HK/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676B0206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=syscall7.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nUFTPdST1GM5WhFiKw7Mlv+eRi8dM6WKQEOJy5R222Q=; b=N12
	kuXp8P3sbv7vEX7y3dhmyNsHac8Y0Dq3GfUsGX+FBVfHm7FudB7Ni7RHiT4VUL4Ho6gQwtdJWfJde
	lT57hEBEwHUBz0f59FnAVjKCjQPSMcyEVsgQUZJTLc8tsQjz+xP1HIpAMTYUaIjR/7vi5aYjwIkfH
	HbfssMnv6l8SaYu4oKSi8120NYKJmktUvVOHRtGcwZtmxYd5d+l4552QqOCgybYQohuuN6gbC2Xwd
	JPmJoZAtAFUpvMKqAR0C5iFLr/CQExI3dhAgkjet+DAMl0O5SpKJSdkeFYIVc5SgrNn7TRnbB5J22
	oOVHgBYFUbh3+O2SIw2smD2DejuIYPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6kx-0005GU-S8; Sun, 22 Dec 2019 19:19:11 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6ku-0005Fx-3s
 for linux-mtd@lists.infradead.org; Sun, 22 Dec 2019 19:19:10 +0000
Received: by mail-il1-x130.google.com with SMTP id c4so12368627ilo.7
 for <linux-mtd@lists.infradead.org>; Sun, 22 Dec 2019 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=syscall7-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=TnMIl9VvVNwq5h87zmq6ezfH/BuIIoiOa1Eia6V6Xl8=;
 b=Z28R4HK/ftR8gMctx4CxRUh7yMA3++K1txPygL5JSStVdrE6bJUu87D8DxevgsuScN
 dmtPND/z7OZuNowevbEXRbHTiZQkpkSUfxf0KOPdtSi21p7btBnjmLF4Pv5/t6m4WSBf
 Se4CkBJsb9TnDK/NS8ix9AlB+lCbUBCeaPDpgGTW7g4oDEu/dhw04VpXNqliEf1i1/3P
 mrOxxgBpFkrxlwOv+rRrB+lsEXHjRp/xcA2ggsA7eGFcQCZyPdXm1303WW1smGzDdy85
 K7qO/5YrB0i5f5AQPvVpvHOP/wqXrqVX9hZAclcu4v1Nd0ETjMJpQagdb6+FWF8O1H19
 9mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TnMIl9VvVNwq5h87zmq6ezfH/BuIIoiOa1Eia6V6Xl8=;
 b=hC7vnH/dd5A0jcUPDzFxzkAyOsRICbbEpFRzWK4f0MTkyT6YXMOhGcIo2LM8uzm4TD
 EQJ17HrJSasIAYbgEjd52gK/RKeb++ab8y6jTQZjwpQF40jd9sa7vXpsePXkfKwUxPZ+
 3D2gPhlkI6M8J1dZhkWHuPIQ/Bfss86hQJSIp7ZD0+HSRBVQs8cHiiEh679lZf/1bud9
 Ti41K61zcZDt1X9JhDD0h3TCqF4tJC6bfHahH4C8kjpler/pkC6tecJamYyzAADFOqoz
 J+LxYf33gQnRg/TZDg5dqSzt+N39CBK4sbsT+YOQelYQuzEC/4DiqWd9K98qje8/CysD
 nKLA==
X-Gm-Message-State: APjAAAUxiwdVfiyVTtrhbMUsNmHlPM/kTbKsqJvjKCHPB/pHIUZ3VVtB
 twXmc6zAbB0sxPnMXWCTyu6pMqqnA0AdV+zNzIMCFtNM3ZqjbA==
X-Google-Smtp-Source: APXvYqzTLUcWpajYLwyntVpOt4Yu6Ez/Phzb/MmuQuVJ/rJywtwHalceCq8f2RsM8RSLWDV9jSZnprgTQFuhH3D77Vg=
X-Received: by 2002:a92:c990:: with SMTP id y16mr22913189iln.109.1577042345394; 
 Sun, 22 Dec 2019 11:19:05 -0800 (PST)
MIME-Version: 1.0
From: Anthony DeRosa <anthony.derosa@syscall7.com>
Date: Sun, 22 Dec 2019 14:18:54 -0500
Message-ID: <CAB595VxE0CDKpQZE5MCZbpGQ-dJzScgXouh+pWy6czK9sQ9Qkw@mail.gmail.com>
Subject: Writing to SST25VF080B
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_111908_159707_BA7FC56F 
X-CRM114-Status: GOOD (  13.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I'm trying to write to a SST25VF080B SPI Serial Flash device from a
Raspberry Pi 4. I've got the chip wired to SPI0 with a breadboard, and
I've tried using both SPI0_CE0_N and SPI0_CE1_N. In trying to get this
to work, I've tried two different approaches, and both approaches
resulted in the same outcome: I can identify/read the device (all
0xFFs) but I cannot seem to write to the device.

Approach 1
------------

My first approach was to enable jedec-spi-nor in the device overlay
tree in /boot/config.txt as shown below.

    # Enable SST25VF080B
    dtoverlay=jedec-spi-nor,flash-spi0-1

Using this approach, I'm able to see /dev/mtd0 show up and /proc/mtd
looks like this:

    pi@raspberrypi:~ $ cat /proc/mtd
    dev:    size   erasesize  name
    mtd0: 00100000 00001000 "spi0.1"

I can read/erase/write the device without any errors but write
operations don't seem to be written to the device. See the session
below.

pi@raspberrypi:~/workspace/overlays/flash $ sudo mtd_debug erase
/dev/mtd0 0 4096
Erased 4096 bytes from address 0x00000000 in flash
pi@raspberrypi:~/workspace/overlays/flash $ sudo mtd_debug read
/dev/mtd0 0 4096 read.bin
Copied 4096 bytes from address 0x00000000 in flash to read.bin
pi@raspberrypi:~/workspace/overlays/flash $ xxd read.bin | head
00000000: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000010: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000020: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000030: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000040: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000050: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000060: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000070: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000080: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000090: ffff ffff ffff ffff ffff ffff ffff ffff  ................
pi@raspberrypi:~/workspace/overlays/flash $ dd if=/dev/zero
of=write.bin bs=4096 count=1
1+0 records in
1+0 records out
4096 bytes (4.1 kB, 4.0 KiB) copied, 0.000903078 s, 4.5 MB/s
pi@raspberrypi:~/workspace/overlays/flash $ sudo mtd_debug write
/dev/mtd0 0 4096 write.bin
Copied 4096 bytes from write.bin to address 0x00000000 in flash
pi@raspberrypi:~/workspace/overlays/flash $ sudo mtd_debug read
/dev/mtd0 0 4096 read.bin
Copied 4096 bytes from address 0x00000000 in flash to read.bin
pi@raspberrypi:~/workspace/overlays/flash $ xxd read.bin | head
00000000: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000010: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000020: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000030: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000040: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000050: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000060: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000070: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000080: ffff ffff ffff ffff ffff ffff ffff ffff  ................
00000090: ffff ffff ffff ffff ffff ffff ffff ffff  ................


Approach 2
------------

In addition to using the jedec-spi-nor driver as shown above, I also
tried using flashrom directly with /dev/spidev0.1. I changed my
overlay tree to be as follows:

    # Enable SST25VF080B
    # comment this out for now... dtoverlay=jedec-spi-nor,flash-spi0-1

    # Enable /dev/spidev0.1
    dtoverlay=spi0-cs


Then I try to use flashroom to write to the device, but I have the
same problem with not being able to write to the device.

pi@raspberrypi:~ $ flashrom -VV -p
linux_spi:dev=/dev/spidev0.1,spispeed=60000 -w image.bin
flashrom  on Linux 4.19.81-v7l+ (armv7l)
flashrom is free software, get the source code at https://flashrom.org

flashrom was built with libpci 3.5.2, GCC 8.2.0, little endian
Command line (5 args): flashrom -VV -p
linux_spi:dev=/dev/spidev0.1,spispeed=60000 -w image.bin
Using clock_gettime for delay loops (clk_id: 1, resolution: 1ns).
Initializing linux_spi programmer
Using device /dev/spidev0.1
Using 60000 kHz clock
The following protocols are supported: SPI.
Probing for AMIC A25L05PT, 64 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L05PU, 64 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L10PT, 128 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L10PU, 128 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L20PT, 256 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L20PU, 256 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L40PT, 512 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L40PU, 512 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for AMIC A25L80P, 1024 kB: probe_spi_rdid_generic: id1 0xbf, id2 0x258e
...
Probing for SST unknown SST SPI chip, 0 kB: probe_spi_rdid_generic:
id1 0xbf, id2 0x258e
Probing for ST unknown ST SPI chip, 0 kB: probe_spi_rdid_generic: id1
0xbf, id2 0x258e
Probing for Sanyo unknown Sanyo SPI chip, 0 kB:
probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for Winbond unknown Winbond (ex Nexcom) SPI chip, 0 kB:
probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for Generic unknown SPI chip (RDID), 0 kB:
probe_spi_rdid_generic: id1 0xbf, id2 0x258e
Probing for Generic unknown SPI chip (REMS), 0 kB: probe_spi_rems: id1
0xbf, id2 0x8e
Found SST flash chip "SST25VF080B" (1024 kB, SPI).
Some block protection in effect, disabling... disabled.
Reading old flash chip contents... done.
Erasing and writing flash chip... Trying erase function 0...
0x000000-0x000fff:EW, 0x001000-0x001fff:S, 0x002000-0x002fff:S,
0x003000-0x003fff:S, 0x004000-0x004fff:S, 0x005000-0x005fff:S,
0x006000-0x006fff:S, 0x007000-0x007fff:S, 0x008000-0x008fff:S,
0x009000-0x009fff:S, 0x00a000-0x00afff:S, 0x00b000-0x00bfff:S,
0x00c000-0x00cfff:S, 0x00d000-0x00dfff:S, 0x00e000-0x00efff:S,
0x00f000-0x00ffff:S, 0x010000-0x010fff:S, 0x011000-0x011fff:S,
0x012000-0x012fff:S, 0x013000-0x013fff:S, 0x014000-0x014fff:S,
0x015000-0x015fff:S, 0x016000-0x016fff:S, 0x017000-0x017fff:S,
0x018000-0x018fff:S, 0x019000-0x019fff:S, 0x01a000-0x01afff:S,
0x01b000-0x01bfff:S, 0x01c000-0x01cfff:S, 0x01d000-0x01dfff:S,
0x01e000-0x01efff:S, 0x01f000-0x01ffff:S, 0x020000-0x020fff:S,
0x021000-0x021fff:S, 0x022000-0x022fff:S, 0x023000-0x023fff:S,
0x024000-0x024fff:S, 0x025000-0x025fff:S, 0x026000-0x026fff:S,
0x027000-0x027fff:S, 0x028000-0x028fff:S, 0x029000-0x029fff:S,
0x02a000-0x02afff:S, 0x02b000-0x02bfff:S, 0x02c000-0x02cfff:S,
0x02d000-0x02dfff:S, 0x02e000-0x02efff:S, 0x02f000-0x02ffff:S,
0x030000-0x030fff:S, 0x031000-0x031fff:S, 0x032000-0x032fff:S,
0x033000-0x033fff:S, 0x034000-0x034fff:S, 0x035000-0x035fff:S,
0x036000-0x036fff:S, 0x037000-0x037fff:S, 0x038000-0x038fff:S,
0x039000-0x039fff:S, 0x03a000-0x03afff:S, 0x03b000-0x03bfff:S,
0x03c000-0x03cfff:S, 0x03d000-0x03dfff:S, 0x03e000-0x03efff:S,
0x03f000-0x03ffff:S, 0x040000-0x040fff:S, 0x041000-0x041fff:S,
0x042000-0x042fff:S, 0x043000-0x043fff:S, 0x044000-0x044fff:S,
0x045000-0x045fff:S, 0x046000-0x046fff:S, 0x047000-0x047fff:S,
0x048000-0x048fff:S, 0x049000-0x049fff:S, 0x04a000-0x04afff:S,
0x04b000-0x04bfff:S, 0x04c000-0x04cfff:S, 0x04d000-0x04dfff:S,
0x04e000-0x04efff:S, 0x04f000-0x04ffff:S, 0x050000-0x050fff:S,
0x051000-0x051fff:S, 0x052000-0x052fff:S, 0x053000-0x053fff:S,
0x054000-0x054fff:S, 0x055000-0x055fff:S, 0x056000-0x056fff:S,
0x057000-0x057fff:S, 0x058000-0x058fff:S, 0x059000-0x059fff:S,
0x05a000-0x05afff:S, 0x05b000-0x05bfff:S, 0x05c000-0x05cfff:S,
0x05d000-0x05dfff:S, 0x05e000-0x05efff:S, 0x05f000-0x05ffff:S,
0x060000-0x060fff:S, 0x061000-0x061fff:S, 0x062000-0x062fff:S,
0x063000-0x063fff:S, 0x064000-0x064fff:S, 0x065000-0x065fff:S,
0x066000-0x066fff:S, 0x067000-0x067fff:S, 0x068000-0x068fff:S,
0x069000-0x069fff:S, 0x06a000-0x06afff:S, 0x06b000-0x06bfff:S,
0x06c000-0x06cfff:S, 0x06d000-0x06dfff:S, 0x06e000-0x06efff:S,
0x06f000-0x06ffff:S, 0x070000-0x070fff:S, 0x071000-0x071fff:S,
0x072000-0x072fff:S, 0x073000-0x073fff:S, 0x074000-0x074fff:S,
0x075000-0x075fff:S, 0x076000-0x076fff:S, 0x077000-0x077fff:S,
0x078000-0x078fff:S, 0x079000-0x079fff:S, 0x07a000-0x07afff:S,
0x07b000-0x07bfff:S, 0x07c000-0x07cfff:S, 0x07d000-0x07dfff:S,
0x07e000-0x07efff:S, 0x07f000-0x07ffff:S, 0x080000-0x080fff:S,
0x081000-0x081fff:S, 0x082000-0x082fff:S, 0x083000-0x083fff:S,
0x084000-0x084fff:S, 0x085000-0x085fff:S, 0x086000-0x086fff:S,
0x087000-0x087fff:S, 0x088000-0x088fff:S, 0x089000-0x089fff:S,
0x08a000-0x08afff:S, 0x08b000-0x08bfff:S, 0x08c000-0x08cfff:S,
0x08d000-0x08dfff:S, 0x08e000-0x08efff:S, 0x08f000-0x08ffff:S,
0x090000-0x090fff:S, 0x091000-0x091fff:S, 0x092000-0x092fff:S,
0x093000-0x093fff:S, 0x094000-0x094fff:S, 0x095000-0x095fff:S,
0x096000-0x096fff:S, 0x097000-0x097fff:S, 0x098000-0x098fff:S,
0x099000-0x099fff:S, 0x09a000-0x09afff:S, 0x09b000-0x09bfff:S,
0x09c000-0x09cfff:S, 0x09d000-0x09dfff:S, 0x09e000-0x09efff:S,
0x09f000-0x09ffff:S, 0x0a0000-0x0a0fff:S, 0x0a1000-0x0a1fff:S,
0x0a2000-0x0a2fff:S, 0x0a3000-0x0a3fff:S, 0x0a4000-0x0a4fff:S,
0x0a5000-0x0a5fff:S, 0x0a6000-0x0a6fff:S, 0x0a7000-0x0a7fff:S,
0x0a8000-0x0a8fff:S, 0x0a9000-0x0a9fff:S, 0x0aa000-0x0aafff:S,
0x0ab000-0x0abfff:S, 0x0ac000-0x0acfff:S, 0x0ad000-0x0adfff:S,
0x0ae000-0x0aefff:S, 0x0af000-0x0affff:S, 0x0b0000-0x0b0fff:S,
0x0b1000-0x0b1fff:S, 0x0b2000-0x0b2fff:S, 0x0b3000-0x0b3fff:S,
0x0b4000-0x0b4fff:S, 0x0b5000-0x0b5fff:S, 0x0b6000-0x0b6fff:S,
0x0b7000-0x0b7fff:S, 0x0b8000-0x0b8fff:S, 0x0b9000-0x0b9fff:S,
0x0ba000-0x0bafff:S, 0x0bb000-0x0bbfff:S, 0x0bc000-0x0bcfff:S,
0x0bd000-0x0bdfff:S, 0x0be000-0x0befff:S, 0x0bf000-0x0bffff:S,
0x0c0000-0x0c0fff:S, 0x0c1000-0x0c1fff:S, 0x0c2000-0x0c2fff:S,
0x0c3000-0x0c3fff:S, 0x0c4000-0x0c4fff:S, 0x0c5000-0x0c5fff:S,
0x0c6000-0x0c6fff:S, 0x0c7000-0x0c7fff:S, 0x0c8000-0x0c8fff:S,
0x0c9000-0x0c9fff:S, 0x0ca000-0x0cafff:S, 0x0cb000-0x0cbfff:S,
0x0cc000-0x0ccfff:S, 0x0cd000-0x0cdfff:S, 0x0ce000-0x0cefff:S,
0x0cf000-0x0cffff:S, 0x0d0000-0x0d0fff:S, 0x0d1000-0x0d1fff:S,
0x0d2000-0x0d2fff:S, 0x0d3000-0x0d3fff:S, 0x0d4000-0x0d4fff:S,
0x0d5000-0x0d5fff:S, 0x0d6000-0x0d6fff:S, 0x0d7000-0x0d7fff:S,
0x0d8000-0x0d8fff:S, 0x0d9000-0x0d9fff:S, 0x0da000-0x0dafff:S,
0x0db000-0x0dbfff:S, 0x0dc000-0x0dcfff:S, 0x0dd000-0x0ddfff:S,
0x0de000-0x0defff:S, 0x0df000-0x0dffff:S, 0x0e0000-0x0e0fff:S,
0x0e1000-0x0e1fff:S, 0x0e2000-0x0e2fff:S, 0x0e3000-0x0e3fff:S,
0x0e4000-0x0e4fff:S, 0x0e5000-0x0e5fff:S, 0x0e6000-0x0e6fff:S,
0x0e7000-0x0e7fff:S, 0x0e8000-0x0e8fff:S, 0x0e9000-0x0e9fff:S,
0x0ea000-0x0eafff:S, 0x0eb000-0x0ebfff:S, 0x0ec000-0x0ecfff:S,
0x0ed000-0x0edfff:S, 0x0ee000-0x0eefff:S, 0x0ef000-0x0effff:S,
0x0f0000-0x0f0fff:S, 0x0f1000-0x0f1fff:S, 0x0f2000-0x0f2fff:S,
0x0f3000-0x0f3fff:S, 0x0f4000-0x0f4fff:S, 0x0f5000-0x0f5fff:S,
0x0f6000-0x0f6fff:S, 0x0f7000-0x0f7fff:S, 0x0f8000-0x0f8fff:S,
0x0f9000-0x0f9fff:S, 0x0fa000-0x0fafff:S, 0x0fb000-0x0fbfff:S,
0x0fc000-0x0fcfff:S, 0x0fd000-0x0fdfff:S, 0x0fe000-0x0fefff:S,
0x0ff000-0x0fffff:S
Erase/write done.
Verifying flash... FAILED at 0x00000000! Expected=0x61, Found=0xff,
failed byte count from 0x00000000-0x000fffff: 0x3
Your flash chip is in an unknown state.
Please report this on IRC at chat.freenode.net (channel #flashrom) or
mail flashrom@flashrom.org, thanks!

As you can see, it appears to identify the chip as "SST25VF080B", and
it's able to read/erase/write. However, when it goes to verify the
written values it fails.

Does anyone have any idea of things to try?

Thanks!

Anthony

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
