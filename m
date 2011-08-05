Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QpErn-00013Y-9m
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2011 07:30:51 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtdinfo: don't open NULL pointer when getting region_info
	with `-a'
Date: Fri, 5 Aug 2011 09:29:40 +0200
References: <1312480051-19208-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312480051-19208-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201108050929.40370.brian.foster@maxim-ic.com>
Cc: Mike Frysinger <vapier@gentoo.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 04 August 2011 19:47:31 Brian Norris wrote:
> This "fixes" a regression found in:
>   commit 266061ebd5d72391f0a0e831b018e8fc7fea68a1
>   mtdinfo: add regioninfo/eraseblock map display
> 
> On certain flash (NOR flash that have eraseblock region info),
> `mtdinfo -a' tries to open the MTD node file, for use with the ioctl
> MEMGETREGIONINFO; however, we didn't supply a device node path to
> `mtdinfo -a', so it's using NULL, resulting in errors like:
> 
>   mtdinfo: error!: couldn't open MTD dev: (null)
>            error 14 (Bad address)
> 
> For now, we can just skip dumping region_info with the `-a' flag. If
> we find a better way to do this (e.g., export via sysfs, find device
> nodes via automatic routines, etc.), then we can kill the workaround
> and this FIXME should be removed.
> 
> The regression was first reported at:
> 
>   http://lists.infradead.org/pipermail/linux-mtd/2011-July/037232.html
> 
> Reported-by: Brian Foster <brian.foster@maxim-ic.com>
> CC: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  ubi-utils/mtdinfo.c |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
> index e72d69e..f2fcd38 100644
> --- a/ubi-utils/mtdinfo.c
> +++ b/ubi-utils/mtdinfo.c
> @@ -239,8 +239,14 @@ static void print_region_info(const struct mtd_dev_info *mtd)
>  	region_info_t reginfo;
>  	int r, fd;
>  
> -	/* If we don't have any region info, just return */
> -	if (!args.map && mtd->region_cnt == 0)
> +	/*
> +	 * If we don't have any region info, just return
> +	 *
> +	 * FIXME: We can't get region_info (via ioctl) without having the MTD
> +	 *        node path. This is a problem for `mtdinfo -a', for example,
> +	 *        since it doesn't provide any filepath information.
> +	 */
> +	if (!args.node || !args.map && mtd->region_cnt == 0)

 I suggest adding some round brackets:

	if (!args.node || (!args.map && mtd->region_cnt == 0))

 Less confusing.  Otherwise, looks Ok
 to me (not actually built or tested).
cheers!
	-blf-

>  		return;
>  
>  	/* First open the device so we can query it */
> -- 
> 1.7.0.4

-- 
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
