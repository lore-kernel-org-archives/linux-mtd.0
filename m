Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QmJrf-0006H1-2i
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2011 06:14:36 +0000
Received: by fxd20 with SMTP id 20so1064179fxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Jul 2011 23:14:31 -0700 (PDT)
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Thu, 28 Jul 2011 09:14:18 +0300
In-Reply-To: <1311683250-7921-1-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1311683250-7921-1-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1311833667.2169.1.camel@koala>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
	tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-07-26 at 14:27 +0200, David Wagner wrote:
>  * The numbering of devices is much easier with ubiblk than with
>    gluebi+mtdblock_ro. With gluebi+mtdblock_ro, you get one additional
>    MTD device for each UBI volume, so the number of MTD devices grows
>    quite a lot and is a bit difficult to understand. For example,
>    mtdblock[0-4] might be your real MTD partitions, while mtdblock[5-9]
>    might be your UBI volumes.
>    It also means that if a new real MTD
>    partition is added, the number of all the MTD devices exposing UBI
>    volumes will be incremented by one, which is a bit
>    confusing/annoying.
>    As well, if you add an UBI volume, the mtdblock devices that are
>    emulated on top of volumes that come after this new one will have
>    their ID incremented.
> 
>  * The performance appears to be slightly better with ubiblk than
>    gluebi+mtdblock_ro, according to our benchmarks (see
>    http://elinux.org/Flash_Filesystem_Benchmarks_2.6.39)

Hi, I am having vacation till the middle of August and I do not have a
possibility to look at UBI/UBIFS/MTD stuff now, sorry. When I come back,
I'll go through my e-mails and respond. Apologies again.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
