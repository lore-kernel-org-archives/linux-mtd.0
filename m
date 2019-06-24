Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4610C43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 07:41:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF28E2089F
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 07:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IEj+YJaH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF28E2089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9UOGjqTJDXgVuddA6IC7wzBc/lYVGBLeCspRNSD4JM=; b=IEj+YJaHy6cnSx
	YNu+5Do0Z8hJQ8DHvWcnUqdvjMYE5jbrGpPUgbnycnpasF6MpN2fMVO76Yb87YX+nmaRIv2ZuSBuU
	l1U0cccjraITsWuINhsoL0NqU6M9L9VZRt8++VxBQpGScjyX0aQm++gNPlCeCdvnIGkA5K1ZH5XOv
	WWW7uN9R7BtxnphphioKN2YwlAVtdwdbsWy8UFCX2UeqC8e1KkE2gtS4zTVqUsRVT18Fhabx8QYmA
	zZPgKBUrppO9gZ4yPggwBh2XjhVpX7tClMjk9UI792Qx5anyq7rH+TlqpRtlEaWcqYxzorjjZaMWi
	WLEmCTBieEOnxgQDa3yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfJbu-0002Iq-C2; Mon, 24 Jun 2019 07:41:54 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfJax-0001hp-SS
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 07:41:00 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45XLnH3BLtz1rghg;
 Mon, 24 Jun 2019 09:40:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45XLnH2K3cz1qql2;
 Mon, 24 Jun 2019 09:40:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id XoQVWKipClzi; Mon, 24 Jun 2019 09:40:49 +0200 (CEST)
X-Auth-Info: DZTbLzDqiOkcYEujMkjIamkDdJFd7U3+pcWzaSI3AhI=
Received: from [192.168.1.106] (87-97-41-30.pool.invitel.hu [87.97.41.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 24 Jun 2019 09:40:49 +0200 (CEST)
Subject: Re: [U-Boot] [nand] [ubi] Discrepancy Between U-Boot and Linux NAND
 PEBs
To: Ken Sloat <KSloat@aampglobal.com>
References: <BL0PR07MB411523A25B85713C637090D3ADE40@BL0PR07MB4115.namprd07.prod.outlook.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <9948b558-05fb-fa6b-ef67-ef702edcf319@denx.de>
Date: Mon, 24 Jun 2019 09:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <BL0PR07MB411523A25B85713C637090D3ADE40@BL0PR07MB4115.namprd07.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_004056_635646_0CCA1DD5 
X-CRM114-Status: GOOD (  24.54  )
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
Reply-To: hs@denx.de
Cc: "kmpark@infradead.org" <kmpark@infradead.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "oss@buserror.net" <oss@buserror.net>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "hs@denx.de" <hs@denx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Ken,

Am 20.06.2019 um 14:55 schrieb Ken Sloat:
> Hello All,
> 
> I have been working on a system using a NAND flash along with U-Boot 2018.07 and Linux Kernel 4.14. This is an Atmel based system FYI so it uses the Atmel NAND driver. I create a UBI image with 3 separate volumes - 2 of these are a specified fixed size and the third is specified as the minimum needed to hold the current files with the auto resize flag set. As a note, before the first run auto resize operation, there is over 200 MiB of unused space in the NAND - meaning there should be plenty of free space available for UBI to leave overhead when auto-resizing for bad block handling. Another point of note, is that I use UBI within U-Boot as well in order to read the kernel image and dtb out of the UBIFS.
> 
> I have noticed warnings in Linux when attaching UBI regarding not having enough reserved PEBs for bad block handling (it's short by 2). Upon further investigation into the issue, it appears as though there is a discrepancy between what U-Boot and Linux see in terms of the number of bad blocks:
> 
> U-Boot:
> ubi0: good PEBs: 4093, bad PEBs: 3, corrupted PEBs: 0
> ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
> 
> Linux:
> ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB handling, reserved 71, need 73
> ......
> ubi0: good PEBs: 4089, bad PEBs: 7, corrupted PEBs: 0
> ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
> 
> After production flashing of a UBI image to NAND (with a "dumb" non UBI aware flasher), U-Boot will be the program to mount UBI. What this means is that it will complete the one time re-size operation. I used a Linux ramdisk image to flash from Linux and mount UBI in Linux for the first time to allow it to complete the auto-resize operation instead and compared:
> 
> U-Boot:
> ubi0: attaching mtd1
> ubi0: scanning is finished
> ubi0: volume 1 ("rootfs") re-sized from 1501 to 3385 LEBs
> ubi0: attached mtd1 (name "mtd=0", size 512 MiB)
> ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> ubi0: good PEBs: 4093, bad PEBs: 3, corrupted PEBs: 0
> 
> Linux:
> ubi0: attaching mtd6
> ubi0: scanning is finished
> ubi0: volume 1 ("rootfs") re-sized from 1501 to 3383 LEBs
> ubi0: attached mtd6 (name "atmel_nand", size 512 MiB)
> ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> ubi0: good PEBs: 4089, bad PEBs: 7, corrupted PEBs: 0
> 
> As you can see, U-Boot resizes the image to 3385 blocks while Linux only 3383 - hence the 2 blocks that Linux would complain about had U-Boot resized the volume.
> 
> I am not sure exactly what is causing this discrepancy as I just figured this out - but thought I would reach out and discuss it here. Obviously there are ways around this issue (program and mount UBI from Linux initially, don't use autoresize and specify all volume sizes, etc) but was wondering if there is some underlying problem. I noticed an older mailing discussion from several years ago where someone reported a similar issue regarding number of bad PEBs and seems the issue was chalked up to a potential driver problem on one side:
> https://lists.denx.de/pipermail/u-boot/2015-June/216482.html
> 
> Any insight would be helpful.

We use in U-Boot the code from linux 4.2 (commit 64291f7db5bd8150a74ad2036f1037e6a0428df2)
(Yes, very old in the meantime)

So may there is a problem with this old code base in U-Boot?

Volunteers for rebasing the U-Boot ubi/ubifs code with a newer
linux version are welcome.

But reading your Email again, may you should first investigate, why U-Boot
and Linux see different good PEBs.

Also your kernel drops the warning:

ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB handling, reserved 71, need 73

You should look here deeper into it.

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
