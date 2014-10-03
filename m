Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa4ll-0007xp-N9
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 15:27:46 +0000
Message-ID: <1412350035.3795.101.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Fri, 03 Oct 2014 18:27:15 +0300
In-Reply-To: <1412089998-18978-1-git-send-email-tlinder@codeaurora.org>
References: <1412089998-18978-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, I guess a single patch is indeed OK. I have few nit-picks, though.

On Tue, 2014-09-30 at 18:13 +0300, Tanya Brokhman wrote:
> -		ubi_err("'ubi_io_read_ec_hdr()' returned unknown code %d", err);
> +		ubi_err(ubi,
> +		  "'ubi_io_read_ec_hdr()' returned unknown code %d", err);
>  		return -EINVAL;

I think it is fine if the line is long in these cases, let's keep the
message on the same line, this split does not contribute to better
readability, quite the opposite, in my opinion.

One line:
ubi_err(ubi, "long line")

Multiple lines:
ubi_err(ubi, "long line,
        parameters)

> -				ubi_msg("\"delete\" compatible internal volume %d:%d found, will remove it",
> +				ubi_msg(ubi,
> +				   "\"delete\" compatible internal volume %d:%d found, will remove it",
>  					vol_id, lnum);

Ditto.

> -			ubi_msg("read-only compatible internal volume %d:%d found, switch to read-only mode",
> +			ubi_msg(ubi,
> +				"read-only compatible internal volume %d:%d found, switch to read-only mode",
>  				vol_id, lnum);

Ditto. And so on, in many places.

> -				ubi_err("bad compat %d", vidh->compat);
> +				ubi_err(ubi,
> +					"bad compat %d", vidh->compat);

And for consistency, places like this would be:

				ubi_err(ubi, bad compat %d",
				        vidh->compat);
>  			if (av->used_ebs != be32_to_cpu(vidh->used_ebs)) {
> -				ubi_err("bad used_ebs %d", av->used_ebs);
> +				ubi_err(ubi,
> +					"bad used_ebs %d", av->used_ebs);

Ditto for all the similar cases.


> -	ubi_msg("volume %d (\"%s\") re-sized from %d to %d LEBs", vol_id,
> +	ubi_msg(ubi, "volume %d (\"%s\") re-sized from %d to %d LEBs",
> +		vol_id,
>  		vol->name, old_reserved_pebs, vol->reserved_pebs);

Please, in cases like this, try to pack more arguments to the second
line, and move those which do not fit there to the third line. So this
would be like:

	ubi_msg(ubi, "volume %d (\"%s\") re-sized from %d to %d LEBs",
		vol_id,	vol->name, old_reserved_pebs,
		vol->reserved_pebs);
 
