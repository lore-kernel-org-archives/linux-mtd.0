Received: from [2001:470:b:3e:219:66ff:fee3:2c84] (helo=silka.with-linux.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5aG4-0004EQ-QE
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 09:03:25 +0000
Received: from [IPv6:2001:470:b:3e:d69a:20ff:fe56:76db] (comer.internal
	[IPv6:2001:470:b:3e:d69a:20ff:fe56:76db])
	by silka.with-linux.com (8.14.4/8.14.4) with ESMTP id p3192o4s002254
	for <linux-mtd@lists.infradead.org>; Fri, 1 Apr 2011 03:02:50 -0600
Message-ID: <4D9594B9.1020402@silka.with-linux.com>
Date: Fri, 01 Apr 2011 03:02:49 -0600
From: Kelly Anderson <kelly@silka.with-linux.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Mtd alignment bug affecting 1.4.X including current git
References: <4D9091B1.80002@silka.with-linux.com>
	<1301645767.2789.25.camel@localhost>
In-Reply-To: <1301645767.2789.25.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/01/11 02:16, Artem Bityutskiy wrote:
> On Mon, 2011-03-28 at 07:48 -0600, Kelly Anderson wrote:
>> If you create a patch I'll test it for you.
> Kelly, would you please test the following patch:

Seems to work fine.

> From: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] libmtd: fix OOB read and write interface
>
> When reading and writing OOB we specify the address as absolute
> offset from the beginning of the MTD device. This offset is
> basically an absolute page offset plus the OOB offset. And it does
> not have to be aligned to the min. I/O unit size (NAND page size).
>
> So fix the 'do_oob_op()' function and remove incorrect checking
> that the offset is page-aligned. This check leads to the following
> errors:
>
> libmtd: error!: unaligned address 2, mtd0 page size is 2048
>
> But obviously, the intent was to write to offset 2 of the OOB area
> of the very first NAND page.
>
> Instead of that incorrect check, we should check that the OOB offset
> we write to is within the OOB size and the length is withing the OOB
> size. This patch adds such check.
>
> Reported-by: Kelly Anderson<kelly@silka.with-linux.com>
> Signed-off-by: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
> ---
>   lib/libmtd.c |   12 ++++++++----
>   1 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index e0c0934..e313fc3 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -1083,6 +1083,7 @@ int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
>   	struct mtd_oob_buf64 oob64;
>   	struct mtd_oob_buf oob;
>   	unsigned long long max_offs;
> +	unsigned int oob_offs;
>   	const char *cmd64_str, *cmd_str;
>   	struct libmtd *lib = (struct libmtd *)desc;
>
> @@ -1102,10 +1103,13 @@ int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
>   		errno = EINVAL;
>   		return -1;
>   	}
> -	if (start % mtd->min_io_size) {
> -		errmsg("unaligned address %llu, mtd%d page size is %d",
> -		       (unsigned long long)start, mtd->mtd_num,
> -		       mtd->min_io_size);
> +
> +	oob_offs = start&  (mtd->min_io_size - 1);
> +	if (oob_offs + length>  mtd->oob_size) {
> +		errmsg("Cannot write %llu OOB bytes to address %llu "
> +		       "(OOB offset %u) - mtd%d OOB size is only %d bytes",
> +		       (unsigned long long)length, (unsigned long long)start,
> +		       oob_offs, mtd->mtd_num,  mtd->oob_size);
>   		errno = EINVAL;
>   		return -1;
>   	}
