Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HF7jo-0000wd-VZ
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 06:46:58 -0500
Received: by ug-out-1314.google.com with SMTP id m2so438918uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Feb 2007 03:46:40 -0800 (PST)
Message-ID: <625fc13d0702080346y661a4e9fo531b7832c218e741@mail.gmail.com>
Date: Thu, 8 Feb 2007 05:46:34 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: kmpark@infradead.org
Subject: Re: [PATCH] [MTD] Utils: Add 1KB page & 32 bytes spare NAND
In-Reply-To: <003301c74b58$0422c020$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <003301c74b58$0422c020$c7a3580a@swcenter.sec.samsung.co.kr>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/8/07, Kyungmin Park <kmpark@infradead.org> wrote:
> >From 8d5c48ee5369203fed3df8b6b58967d0e63e43a5 Mon Sep 17 00:00:00 2001
> From: Kyungmin Park <kyungmin.park@samsung.com>
> Date: Thu, 8 Feb 2007 17:04:54 +0900
> Subject: [PATCH] [MTD] Utils: Add 1KB page & 32 bytes spare NAND
>
> Some OneNAND chips use this spec.
>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  nanddump.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/nanddump.c b/nanddump.c
> index b2323f6..a8cb378 100644
> --- a/nanddump.c
> +++ b/nanddump.c
> @@ -196,6 +196,7 @@ int main(int argc, char **argv)
>
>         /* Make sure device page sizes are valid */
>         if (!(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
> +           !(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
>             !(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
>             !(meminfo.oobsize == 8 && meminfo.writesize == 256)) {
>                 fprintf(stderr, "Unknown flash (not normal NAND)\n");

This doesn't apply because the whitespace is different.  I'll commit a
fixed up version shortly.

josh
