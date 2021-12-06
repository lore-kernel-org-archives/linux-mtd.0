Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A01CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 22:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T1r7mcZUXiJpTWV4/y6WsGAID/FLslzhPvrpvz4nrN0=; b=J5uUzZzRxrbGxQ
	L8zDpM1Q3hZs9kS7BgykAOxXyBqw3RkqcX+PSJsRAb9gdmoFI5Hd/LmBcnLTmMGYvnscNhpuwL2FW
	tA2mrwZ9eLgkYmSoBSuTmDOYFNFpXX8XtH/C8m4cJYO6O2oukagp5PyKGfH0kGsA/Pj/QGSGrN6XH
	ulD7fDWy21xqDXumsOaK17arZX7DqLiQbsUBkI4/LBhuoF+kVkg7d56hYrMBfEwKaX8BTn53kyY1+
	WCsRY9GrMJfNMYxLwwJ8t+kfzESCZ+YKiPqvvWeO4REJZXJnUP8ha4VmyTGeAwulJwjNF3LwLOPBY
	xHPYx37y3t+z6gsiwERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muMEa-006AWy-Od; Mon, 06 Dec 2021 22:13:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muMET-006AV4-0y
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 22:13:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id y7so8054230plp.0
 for <linux-mtd@lists.infradead.org>; Mon, 06 Dec 2021 14:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=I6+1HMUuUMFmX0J1AAWx7gYEquDYHGfibn4Zq8XT4gQ=;
 b=iw2LlZtSbw00ec166dK4U+m8BXHWcVxJUNzeEKpkc/fEhv4PZoxwR1vNig3/Nj8QRF
 bBHz1zLn5tEcYMKSv7n/i5eCvaSBV1gj5PF4aY6uNe8E5FJWB5gB0dPJF4yAiw/4vc/i
 4+BVqX4XEnSU//Sk6R/A36ZAsFUHfUpX8hbRmh4KArf/ayA00WU6SIGL2j3WukeGqOFb
 P47iLQtDa2m1SiLoZaRzbvToLvt28o1GP11QQsdBT8kODIyTuo73xLzVliY8o+BnMJLx
 QKTO4PTgqw7d1mQK9Y8UuThdk/yTAIq+OuE/huwfQIQtj/UaSBUccQsJ3hW+ACc/eieh
 DGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=I6+1HMUuUMFmX0J1AAWx7gYEquDYHGfibn4Zq8XT4gQ=;
 b=yefFEBeb8awzk+M/NOFvk1QYe0ookr0pEVVQv7yPpSvozbxOiG89sQnDjYxZEIPuSP
 e5FMcSesxrO1NE5hw0jzB02Zuyi48vL3uV8RHFQwNzgctEXtSoLLjp+zCjVoINJjPfGC
 eq6rDJ2wiXKEurOPtFVVILbFIIw3/V9H1T92W1a9mJtR92QIuSYrivw2QjomSS/xLVsl
 x9BzWUZmrWLUD+iwcR1SItFQzKXWKASLhlLdLgH7p+omBVVo1TMeTWzKIQLJBmXYPChn
 GI84ADdAWN6CaT+5oqiuTfKAXe2PxVD/u4bcckiNl45QbVkhKlvDj7UOc3cE5YGaapTc
 0uWw==
X-Gm-Message-State: AOAM533dpXB5aZ3uaXbMLpJb6/XjdbgFGTMWOdPL3Hxn5PONY0mS9wmD
 KhWJaiv7+HWtT+5K/tToguL3AneDQ0e7aR8r
X-Google-Smtp-Source: ABdhPJyMir8K4gUksKXDqAylD/kDdTIO1nU+PtZ/ZMdOaCKcX2vRTOmNpepXQ/PtN15rNqw+X+P/UA==
X-Received: by 2002:a17:90a:fe0b:: with SMTP id
 ck11mr1589357pjb.15.1638828791290; 
 Mon, 06 Dec 2021 14:13:11 -0800 (PST)
Received: from [192.168.130.7] (c-24-19-222-129.hsd1.wa.comcast.net.
 [24.19.222.129])
 by smtp.gmail.com with ESMTPSA id mq14sm322719pjb.54.2021.12.06.14.13.10
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 14:13:10 -0800 (PST)
Message-ID: <ae580001397f55ff36f1e46e8ff09ab0c068a131.camel@gmail.com>
Subject: ubiattach fails after ubiformat
From: Steve Kinneberg <steve.xcomlabs@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 06 Dec 2021 14:13:10 -0800
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_141313_200238_EA851196 
X-CRM114-Status: GOOD (  12.62  )
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

Hello,

I am having problems using ubiattach with an SLC NAND Flash device on a
custom board based off the NXP LS1046ARDB reference design running
OpenWrt 21.02.  If I issue the following commands, ubiattach appears to
work:

flash_erase /dev/mtd0 0 4096
ubiattach -m 0 -O 2048

If I use ubiformat, then ubiattach will fail.  Here is the sequence of
commands that I have tried:

flash_erase /dev/mtd0 0 4096
ubiformat /dev/mtd0 -s 2048 -O 2048
ubiattach -m 0 -O 2048

At this point, the kernel repeatedly outputs the following (the PEB
value increments):

[13440.396590] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 3:0, read only 64 bytes, retry
[13440.408305] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 3:0, read only 64 bytes, retry
[13440.420021] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 3:0, read only 64 bytes, retry
[13440.431737] ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 3:0, read 64 bytes
[13440.441660] CPU: 2 PID: 3110 Comm: ubiattach Not tainted 5.4.154 #0
[13440.447924] Hardware name: XAPH Board (DT)
[13440.452013] Call trace:
[13440.454453]  dump_backtrace+0x0/0x120
[13440.458110]  show_stack+0x14/0x20
[13440.461417]  dump_stack+0xb4/0xf4
[13440.464724]  ubi_io_read+0x17c/0x308
[13440.468292]  ubi_io_read_ec_hdr+0x4c/0x210
[13440.472383]  ubi_attach+0x40c/0x1330
[13440.475953]  ubi_attach_mtd_dev+0x570/0xb08
[13440.480130]  ctrl_cdev_ioctl+0x3ac/0x510
[13440.484047]  do_vfs_ioctl+0xa4/0xe00
[13440.487617]  ksys_ioctl+0x44/0x90
[13440.490924]  __arm64_sys_ioctl+0x1c/0x210
[13440.494928]  el0_svc_handler+0x88/0x118
[13440.498757]  el0_svc+0x8/0x210

The same sequence of commands using the nandsim driver on a desktop
Linux system works fine.  I can even flash a UBI image or create
volumes using the nandsim.

Here is Linux kernel bootup messages regarding identification of the
NAND Flash:

[    0.787530] nand: device found, Manufacturer ID: 0x01, Chip ID: 0xac
[    0.793889] nand: AMD/Spansion S34MS04G2
[    0.797810] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
[    0.806065] Bad block table found at page 262080, version 0x01
[    0.813052] Bad block table found at page 262016, version 0x01
[    0.819495] mtd: no mtd-id
[    0.822506] fsl,ifc-nand 7e800000.nand: IFC NAND device at 0x7e800000, bank 0

The part number and size are correct for the HW.
Linux kernel version (from /proc/version):

Linux version 5.4.154 (steve@steve-linux) (gcc version 8.4.0 (OpenWrt GCC 8.4.0 r16330+8-4607f55439)) #0 SMP PREEMPT Tue Nov 30 14:37:50 2021


Output from /proc/mtd:

dev:    size   erasesize  name
mtd0: 20000000 00020000 "7e800000.flash"
mtd1: 00100000 00001000 "bl2"
mtd2: 00400000 00001000 "fip"
mtd3: 00100000 00001000 "u-boot-env"
mtd4: 00300000 00001000 "reserved-1"
mtd5: 00040000 00001000 "fman"
mtd6: 005c0000 00001000 "reserved-2"
mtd7: 00100000 00001000 "dtb"
mtd8: 01000000 00001000 "kernel"
mtd9: 02000000 00001000 "rootfs"
mtd10: 0186e000 00001000 "rootfs_data"
mtd11: 03100000 00001000 "firmware"


Linux boot command line:

root=/dev/mtdblock9 rootfstype=squashfs noinitrd earlycon=uart8250,mmio,0x21c0500 console=ttyS0,115200 mtdparts=1550000.spi:1m(bl2),4m(fip),1m(u-boot-env),3m(reserved-1),256k(fman),5888k(reserved-2),1m(dtb),16m(kernel),32m(rootfs),49m@0xf00000(firmware),64m@0x000000(nor-flash);7e800000.flash


I presume that I am missing a step or mis-configured something.  Any
pointers would be greatly appreciated.

Thanks,
Steve Kinneberg




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
