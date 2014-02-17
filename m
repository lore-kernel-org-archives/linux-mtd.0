Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFQ26-0001ES-9x
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 15:22:59 +0000
Message-ID: <1392650551.21319.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 1/3] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 17 Feb 2014 17:22:31 +0200
In-Reply-To: <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-02-16 at 17:03 -0300, Ezequiel Garcia wrote:
> +static int ubiblock_read(struct ubiblock *dev, char *buffer, int pos, int len)
> +{
> +	int leb, offset, ret;
> +	int bytes_left = len;
> +	int to_read = len;

"pos" sounds like byte offset, which cannot be true because 'int' would
be too short type for it. 

....

> +static int do_ubiblock_request(struct ubiblock *dev, struct request *req)
> +{
> +	int pos, len, ret;
> +
> +	if (req->cmd_type != REQ_TYPE_FS)
> +		return -EIO;
> +
> +	if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
> +	    get_capacity(req->rq_disk))
> +		return -EIO;
> +
> +	if (rq_data_dir(req) != READ)
> +		return -ENOSYS; /* Write not implemented */
> +
> +	pos = blk_rq_pos(req) << 9;

So 'pos' is actually the 512-byte sector number? Would you please better
name then, something self-documenting like 'sec' or 'sector' ?

> +
> +	/*
> +	 * Let's prevent the device from being removed while we're doing I/O
> +	 * work. Notice that this means we serialize all the I/O operations,
> +	 * but it's probably of no impact given the NAND core serializes
> +	 * flash acceses anywafy.
> +	 */
> +	mutex_lock(&dev->vol_mutex);
> +	ret = ubiblock_read(dev, req->buffer, pos, len);
> +	mutex_unlock(&dev->vol_mutex);

Would you please a better name for 'vol_mutex'. Just makes me confused
because this is what we use in UBI to lock the entire volume. And here
it is different mutex. Let's express the code in clearer terms and use
something like just 'device_lock' or something which would suggest that
this is locks the entire ubiblock device.

-- 
Best Regards,
Artem Bityutskiy
