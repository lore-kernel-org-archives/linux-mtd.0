Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870BDC77B7A
	for <linux-mtd@archiver.kernel.org>; Thu, 25 May 2023 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QnEMYI0eH5Imw3jog/ZDGHbXlnEQFEvFARpqhD1Agio=; b=dja
	vnUmNJ7vfEpLK/SNJpzfpFX2utNOWk0Ej37ztKfUN6zZOOtHnwyZVOZSWDpAQtmynXxRf5XzeuxSb
	42nJf/KIRGN42WGN0FayGeLTWjvdGgS9M4RkrfxhnNfrl5VN+HaYbllYKNVqGPRAz/0pbm6BlgeY/
	3eGcXhhA3DrVXq4NXqYHyilbErCd1zcHute5/Y4yOOGC+Q2E3f9o5or/RfVlbMp5yVKaWCjJtDXYm
	YGxHXapePjwIezWSp2i/puXUIOp8jAcJuv0AOAHRl3TXZ4b9XMsjcsJmwZI+pfEyoj1CRoLqlbuc0
	2f/bfioPL2IxBsY9Qz5y9I+b4NYGzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q25iS-00FsHB-0d;
	Thu, 25 May 2023 07:48:56 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q25iO-00FsFy-2i
	for linux-mtd@lists.infradead.org;
	Thu, 25 May 2023 07:48:54 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so1146410a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 25 May 2023 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685000931; x=1687592931;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vOlE2RYq1cL7fVhIHKJAxqY/AQlP9mZGeei2bWlalug=;
        b=kO8MgCrVvCpPq4gZC7avMicy8jRAcfSS9yiNeWfQgBYAVRShLSTe85Y5xzBnSIX9Cp
         RRSsSKmPUbv3kiIMWJxKzkDikvH4k477TIQ5IMd+oz2VPk2EO3+Ec7T5yULSFJKx0ZYc
         wzd9atdetol2QPKlFlHkLmt+HQFN5wXxYin8lfQwWoS5Z/1i8KzDJC1Le/v2QyzJxEk5
         V7jScFYdjuIF3FBCjEWfHdxzeUJ/taElvghRqRyLnyz05wx0LZMOgrrrwnzyNeBNenk9
         F9WU+hMN7nWei7N/xqWKKprd8MF6UuvW5RD9EBktC3crXGG2VBl959W9vaq+Hn660ffh
         2M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685000931; x=1687592931;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOlE2RYq1cL7fVhIHKJAxqY/AQlP9mZGeei2bWlalug=;
        b=LNZvIXpmhW1PoqBje5D5HEy3FzhX8DsgByv2KXpae6hV9NepWDjU6rJNnLgzEH3CC4
         5dLiqK2NSdivV2v6BtxDcmPwK+sIKf18PxFVcG0xaan0aMBgNZrO9BkJDoF5cR/lj5TZ
         aPOm5yqcDj7BI1zQW6AM37RLVhw1FOdwr5OfoHgOqr/HyjFgdpzM793zz1S5sVJstqIw
         o8n2tnlHZu2w9rSI0svAwXrr9GFjne+BsnUjUu0MalReef15Sp398FHIw54CtSh/Rmq7
         ilmLjeuRQ/OKv01gGOkOnVzOPYaQU5RyWkajhZtRZBVZwkmz3X3IIwdyziJGMg/EBigZ
         INSw==
X-Gm-Message-State: AC+VfDze2T1Ir86+ZaqMxhjiXq+Dda6grnLZhm9eXRFmviZboG1i2fT4
	SZpAmzzyXJtBgubia7e8Be7gxMS3A55izYPgseC+gSScaMk=
X-Google-Smtp-Source: ACHHUZ5iDu4mlQb/kd7vIcgONvhmyTi5bTjSGriH8YYb2YmzRZsiTo+csIa8lMuah/4c7yz9Xs+phVVK7uSTGZRsMho=
X-Received: by 2002:a17:902:b213:b0:1ae:35ba:8c8f with SMTP id
 t19-20020a170902b21300b001ae35ba8c8fmr803972plr.13.1685000930669; Thu, 25 May
 2023 00:48:50 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 25 May 2023 10:48:39 +0300
Message-ID: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
Subject: Boot failed after patch "mtd: rawnand: Support for sequential cache reads"
To: Miquel Raynal <miquel.raynal@bootlin.com>, JaimeLiao <jaimeliao.tw@gmail.com>, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_004852_885222_56DEDBE6 
X-CRM114-Status: UNSURE (   5.62  )
X-CRM114-Notice: Please train this message.
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

Hello.

Kernel boot fails after patch "mtd: rawnand: Support for sequential
cache reads" (thanks to git bisect).
Please advise what can be done here and where to look for a bug.

Thanks.

...
omap-gpmc 50000000.gpmc: GPMC revision 6.0
...
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
...
VFS: Mounted root (squashfs filesystem) readonly on device 254:0.
devtmpfs: mounted
Freeing unused kernel image (initmem) memory: 1024K
Run /sbin/init as init process
SQUASHFS error: lzo decompression failed, data probably corrupt
SQUASHFS error: Failed to read block 0xd291c2: -5
SQUASHFS error: lzo decompression failed, data probably corrupt
SQUASHFS error: Failed to read block 0xd291c2: -5
SQUASHFS error: Unable to read data cache entry [d291c2]
SQUASHFS error: Unable to read page, block d291c2, size 14307
SQUASHFS error: Unable to read data cache entry [d291c2]
SQUASHFS error: Unable to read page, block d291c2, size 14307
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
CPU: 0 PID: 1 Comm: init Not tainted 6.3.0+ #105
Hardware name: Generic AM33XX (Flattened Device Tree)
 unwind_backtrace from show_stack+0xb/0xc
 show_stack from dump_stack_lvl+0x2b/0x34
 dump_stack_lvl from panic+0xbd/0x230
 panic from make_task_dead+0x1/0x120
 make_task_dead from 0xc102ca80
---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000007 ]---

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
