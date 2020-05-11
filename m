Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16DF0C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE75E20735
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 10:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2OO+C3N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE75E20735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9MlY01TgI3BeDUegjhNfMQl0n3AYbaWj01SptxVLDg=; b=O2OO+C3NOv0C0r
	IZoFqAM5eDDNI1GBmB0ioUk+HUDqeeaXAmR4Ky2yZVtOqd83u835ZTIUSDzPmCv88qX9wF2vS5Dkr
	qyRgEsK8GYCm1W6y1ua53Ohnxh6Id6hpS2Qsez2/9yBGv9scch6A/p24zTwn8Bq2K/oBCn8rJPlO3
	flxz+oMB4r384pT8WHGbMS+W3Sn1WoLDRWnk7weRDs31Ef9qKglt8Aq2GWF5Qay5j/fLZLmxoTETZ
	SBUaZgIWgrmuL/OrwoRtHp6NbCDCaFVC7KOMtQcNmC4LtQ5r4OxQpQv0wujWHZkZICjGOkjQQa894
	58Tpfk28lqBIW0WYvpig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY64b-0000dp-AM; Mon, 11 May 2020 10:54:13 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY64W-0000Ym-Qt
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 10:54:12 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436287|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.115081-0.00104849-0.883871;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03306; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.HWrnPPN_1589194442; 
Received: from 172.16.10.102(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.HWrnPPN_1589194442)
 by smtp.aliyun-inc.com(10.147.41.231);
 Mon, 11 May 2020 18:54:03 +0800
Subject: Re: [PATCH v7 00/18] pstore: mtd: support crash log to block and mtd
 device
To: Kees Cook <keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Message-ID: <0586f5cb-991c-3528-dfbf-ee61a39a3955@allwinnertech.com>
Date: Mon, 11 May 2020 18:54:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_035409_041814_02567454 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Kees Cook,

On 2020/5/11 AM 4:24, Kees Cook wrote:
> Hi!
> 
> Well, I guess I spoke too soon. :) Here is v7. Hopefully this is
> it. WeiXiong, can you test this and make sure you're happy with the
> results?

I tested it on Allwinner board for all frontends, including panic.
All of them work well! That's a very good news.

> 
> Take care!
> 
> -Kees
> 
> v7:
> - more renamings in the exported APIs and structs
> - fix mtd build
> - replace psblk_blkdev_info with passing in a struct to fill
> - consolidate bdev opening/checking
> - rename psblk_device -> pstore_device_info
> - kerndoc for pstore_blk_get_config
> - fix hunks in wrong patch
> - add missing "static"s for local functions (0day)
> 
> v6: https://lore.kernel.org/lkml/20200509234103.46544-1-keescook@chromium.org/
> v5: https://lore.kernel.org/lkml/1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com/
> v4: https://lore.kernel.org/lkml/20200508064004.57898-1-keescook@chromium.org/
> v3: https://lore.kernel.org/lkml/1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com/
> v2: https://lore.kernel.org/lkml/1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com/
> v1: https://lore.kernel.org/lkml/1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com/
> 
> 
> Kees Cook (8):
>   pstore/ram: Move dump_oops to end of module_param list
>   pstore/platform: Switch pstore_info::name to const
>   pstore/platform: Move module params after declarations
>   pstore/platform: Use backend name for console registration
>   pstore/ram: Refactor ftrace buffer merging
>   pstore/ftrace: Provide ftrace log merging routine
>   printk: Introduce kmsg_dump_reason_str()
>   pstore/blk: Introduce "best_effort" mode
> 
> WeiXiong Liao (10):
>   pstore/zone: Introduce common layer to manage storage zones
>   pstore/blk: Introduce backend for block devices
>   pstore/zone,blk: Add support for pmsg frontend
>   pstore/zone,blk: Add console frontend support
>   pstore/zone,blk: Add ftrace frontend support
>   Documentation: Add details for pstore/blk
>   pstore/zone: Provide way to skip "broken" zone for MTD devices
>   pstore/blk: Provide way to query pstore configuration
>   pstore/blk: Support non-block storage devices
>   mtd: Support kmsg dumper based on pstore/blk
> 
>  Documentation/admin-guide/pstore-blk.rst |  243 ++++
>  MAINTAINERS                              |    1 +
>  drivers/mtd/Kconfig                      |   10 +
>  drivers/mtd/Makefile                     |    1 +
>  drivers/mtd/mtdpstore.c                  |  564 +++++++++
>  fs/pstore/Kconfig                        |  109 ++
>  fs/pstore/Makefile                       |    6 +
>  fs/pstore/blk.c                          |  520 ++++++++
>  fs/pstore/ftrace.c                       |   54 +
>  fs/pstore/internal.h                     |    9 +
>  fs/pstore/platform.c                     |   40 +-
>  fs/pstore/ram.c                          |   70 +-
>  fs/pstore/zone.c                         | 1463 ++++++++++++++++++++++
>  include/linux/kmsg_dump.h                |    7 +
>  include/linux/pstore.h                   |    2 +-
>  include/linux/pstore_blk.h               |  118 ++
>  include/linux/pstore_zone.h              |   60 +
>  kernel/printk/printk.c                   |   21 +
>  18 files changed, 3210 insertions(+), 88 deletions(-)
>  create mode 100644 Documentation/admin-guide/pstore-blk.rst
>  create mode 100644 drivers/mtd/mtdpstore.c
>  create mode 100644 fs/pstore/blk.c
>  create mode 100644 fs/pstore/zone.c
>  create mode 100644 include/linux/pstore_blk.h
>  create mode 100644 include/linux/pstore_zone.h
> 

-- 
WeiXiong Liao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
