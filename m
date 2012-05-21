Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWSkT-00042R-Pm
 for linux-mtd@lists.infradead.org; Mon, 21 May 2012 13:34:10 +0000
Message-ID: <4FBA4448.20509@nod.at>
Date: Mon, 21 May 2012 15:34:00 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
 <1337173272.24809.52.camel@sauron.fi.intel.com>
In-Reply-To: <1337173272.24809.52.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16.05.2012 15:01, Artem Bityutskiy wrote:
> I started looking at the code, and made some notes at the same time and
> few minor changes - here is the diff which you can apply on top of your
> patches.
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 2399511..2f5c362 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -869,15 +869,22 @@ static int attach_by_fastmap(struct ubi_device *ubi)
>
>   	fm_start = ubi_find_fastmap(ubi);
>   	if (fm_start<  0)
> +		/* TODO: instead, return 1 which means that fall-back to
> +		 * scanning is needed */

fm_start is the PEB number of the fastmap super block.
It will return 1 if the super block was found at PEB 1.
That's why it returns a negative values in case of an error.

> +	/* TODO: Before checking version - check the CRC.

The CRC covers only the fastmap data, not the super block.

>   	for (i = 0; i<  nblocks; i++) {
> +		/* TODO: you basically perform the scanning here - you should
> +		 * share the same code as we use in scan.c: use process_peb().
> +		 */

What exactly do you mean by that?
process_eb() will not help much because the fastmap data is written 
"raw" to the flash. (Without any interaction from the WL sub-system)

I'll release v6 now and address all other issues in v7.

Thanks,
//richard
