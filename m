Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9uea-0004RR-0d
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 06:33:49 +0000
Subject: Re: [PATCH] UBI: Fix s/then/than/ typos
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
In-Reply-To: <4BE23A6F.1010406@renesas.com>
References: <4BE23A03.1030001@renesas.com>  <4BE23A6F.1010406@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 May 2010 09:33:05 +0300
Message-ID: <1273127585.3702.198.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-06 at 12:41 +0900, Shinya Kuribayashi wrote:
> Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
> ---
>   drivers/mtd/ubi/Kconfig |    2 +-
>   drivers/mtd/ubi/io.c    |    2 +-
>   drivers/mtd/ubi/kapi.c  |    6 +++---
>   drivers/mtd/ubi/scan.c  |    4 ++--
>   drivers/mtd/ubi/wl.c    |    2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
> index 0a8c7ea..f702a16 100644

Weird, but I cannot apply this patch. Could you please save it from the
mailing list and try to apply? For me, all hunks fail:

[dedekind@eru ubi-2.6]$ patch -p1 < ~/tmp/shinya1 
patching file drivers/mtd/ubi/Kconfig
Hunk #1 FAILED at 27.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/mtd/ubi/Kconfig.rej
patching file drivers/mtd/ubi/io.c
Hunk #1 FAILED at 65.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/mtd/ubi/io.c.rej
patching file drivers/mtd/ubi/kapi.c
Hunk #1 FAILED at 488.
Hunk #2 FAILED at 571.
Hunk #3 FAILED at 590.
3 out of 3 hunks FAILED -- saving rejects to file
drivers/mtd/ubi/kapi.c.rej
patching file drivers/mtd/ubi/scan.c
Hunk #1 FAILED at 231.
Hunk #2 FAILED at 452.
2 out of 2 hunks FAILED -- saving rejects to file
drivers/mtd/ubi/scan.c.rej
patching file drivers/mtd/ubi/wl.c
Hunk #1 FAILED at 350.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/mtd/ubi/wl.c.rej

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
