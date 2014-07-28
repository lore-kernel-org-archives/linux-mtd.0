Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBnQx-0006wr-3M
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 16:05:55 +0000
Message-ID: <1406563525.23376.32.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 for v3.15 0/3] UBI: block: Support very large volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 28 Jul 2014 19:05:25 +0300
In-Reply-To: <20140725231001.GA29798@arch.cereza>
References: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1401188546.1304.128.camel@sauron.fi.intel.com>
 <20140527123017.GA1655@arch.cereza> <20140725231001.GA29798@arch.cereza>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-07-25 at 20:10 -0300, Ezequiel Garcia wrote:
> I think this series got lost :-(
> 
> It's not in today's -next, and I'm looking at your pull for v3.16 and it's
> not there either. It seems I overlooked it, and realised just now, just before
> sending a new fix.
> 
> Any idea what happened?

Shame, but no idea. May be I applied them on a laptop, and forgot to
push, and then never noticed. Anyway, sorry, just applied and pushed
out.

>  	return 0;
> @@ -412,7 +412,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
>  	gd->first_minor = dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
>  	gd->private_data = dev;
>  	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
> -	disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
> +	disk_capacity = vi->used_bytes >> 9;

I think you should first align up and then divide.  Something like

disk_capacity = ALIGN(vi->used_bytes, 512) / 512

may be?

By the way, do you really need to shift instead of just dividing, which
is more readable. I think with nowadays' compilers ">> 9" and "/ 512"
will give the same code, and the latter seems a bit more readable, no?

-- 
Best Regards,
Artem Bityutskiy
