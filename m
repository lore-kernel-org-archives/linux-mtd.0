Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWl0-0006X3-MZ
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 07:11:31 +0000
Received: by mail-pd0-f170.google.com with SMTP id fp1so2240351pdb.15
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 23:10:46 -0800 (PST)
Date: Tue, 25 Nov 2014 23:10:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: alison_chaiken@mentor.com
Subject: Re: [PATCH 2/2] MTD: m25p80: fix inconsistency in m25p_ids compared
 to spi_nor_ids
Message-ID: <20141126071042.GL3212@norris-Latitude-E6410>
References: <1415634895-3082-1-git-send-email-alison_chaiken@mentor.com>
 <1415634895-3082-3-git-send-email-alison_chaiken@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415634895-3082-3-git-send-email-alison_chaiken@mentor.com>
Cc: ben@decadent.org.uk, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 10, 2014 at 04:54:54PM +0100, alison_chaiken@mentor.com wrote:
> From: Alison Chaiken <alison_chaiken@mentor.com>
> 
> As stated in a5b7616c5, "mtd: m25p80,spi-nor: Fix module aliases for
> m25p80", m25p_ids[] in m25p80.c needs to be kept in sync with
> spi_nor_ids[] in spi-nor.c.   The change here corrects a misalignment.
> 
> Rebased on linux-next.  Replaces an earlier version with a more terse
> commit message.

You don't need to put the last two sentences into the commit message.

But given the wrapping of this table, it probably helps to clarify
*what* the misalignment was in the commit message. So you're adding
the missing "m25px80" and removing a duplicate "w25q128"?

Also, I don't think we should be extending the table in m25p80 much
more. We should be adding support for a more generic device
compatibility name (like 'spi-nor,jedec-rdid'), and only allowing
probing/binding against generic terms. So then, we won't need to keep
messing with two copies of this table, for no real benefit.

> Signed-off-by: Alison Chaiken <alison_chaiken@mentor.com>
> 
> ---
>  drivers/mtd/devices/m25p80.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 2783e94..f5cb8d5 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -291,11 +291,11 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"m45pe10"},	{"m45pe80"},	{"m45pe16"},
>  	{"m25pe20"},	{"m25pe80"},	{"m25pe16"},
>  	{"m25px16"},	{"m25px32"},	{"m25px32-s0"},	{"m25px32-s1"},
> -	{"m25px64"},
> +	{"m25px64"},	{"m25px80"},
>  	{"w25x10"},	{"w25x20"},	{"w25x40"},	{"w25x80"},
>  	{"w25x16"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
> -	{"w25x64"},	{"w25q64"},	{"w25q128"},	{"w25q80"},
> -	{"w25q80bl"},	{"w25q128"},	{"w25q256"},	{"cat25c11"},
> +	{"w25x64"},	{"w25q64"},	{"w25q80"},	{"w25q80bl"},
> +	{"w25q128"},	{"w25q256"},	{"cat25c11"},
>  	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
>  	{ },
>  };

Anyway, I fixed the description and applied this to l2-mtd.git.

Brian
