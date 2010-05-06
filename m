Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9xLn-0002JV-FN
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 09:26:37 +0000
Message-ID: <4BE28B46.40908@renesas.com>
Date: Thu, 06 May 2010 18:26:30 +0900
From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: Re: [PATCH] UBI: Remaining typos and comments cleanups
References: <4BE23A03.1030001@renesas.com> <4BE23A8D.7040106@renesas.com>
In-Reply-To: <4BE23A8D.7040106@renesas.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: shinya.kuribayashi.px@renesas.com
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem-san,

On 5/6/2010 12:42 PM, Shinya Kuribayashi wrote:
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 016ec13..cd0bf57 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -64,7 +64,7 @@
>   * device, e.g., make @ubi->min_io_size = 512 in the example above?
>   *
>   * A: because when writing a sub-page, MTD still writes a full 2K page but the
> - * bytes which are no relevant to the sub-page are 0xFF. So, basically, writing
> + * bytes which are not relevant to the sub-page are 0xFF. So, basically, writing
>   * 4x512 sub-pages is 4 times slower than writing one 2KiB NAND page.  Thus, we
>   * prefer to use sub-pages only for EV and VID headers.
>   *                                 ^^^^

Looking at the last line, I think above 'EV' is a typo of 'EC', right?
I'll incorporate it in the next submission,
-- 
Shinya Kuribayashi
Renesas Electronics
