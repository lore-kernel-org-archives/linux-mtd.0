Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkqAt-0004qf-OD
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 10:15:17 +0000
Subject: Re: [PATCH v2 11/17] UBI: simplify recover_peb() code
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473087908-27862-12-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <bfcc6841-b5a7-8e40-5a6b-9e64f42390d7@nod.at>
Date: Fri, 16 Sep 2016 12:14:04 +0200
MIME-Version: 1.0
In-Reply-To: <1473087908-27862-12-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 05.09.2016 17:05, Boris Brezillon wrote:
> + * This function is called in case of a write failure and moves all good data
> + * from the potentially bad physical eraseblock to a good physical eraseblock.
> + * This function also writes the data which was not written due to the failure.
> + * Returns 0 in case of success, and a negative error code in case of failure.
> + * This function tries %UBI_IO_RETRIES before giving up.
> + */
> +static int recover_peb(struct ubi_device *ubi, int pnum, int vol_id, int lnum,
> +		       const void *buf, int offset, int len)
> +{
> +	int err, idx = vol_id2idx(ubi, vol_id), tries;
> +	struct ubi_volume *vol = ubi->volumes[idx];
> +	struct ubi_vid_hdr *vid_hdr;
> +
> +	vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
> +	if (!vid_hdr)
> +		return -ENOMEM;
> +
> +	for (tries = 0; tries <= UBI_IO_RETRIES; tries++) {
> +		err = try_recover_peb(vol, pnum, lnum, buf, offset, len,
> +				      vid_hdr);
> +		if (!err || err == -ENOSPC)
> +			break;

Why do you handle ENOSPC as fatal error? Since the loop is bound by UBI_IO_RETRIES
IMHO we can retry also upon ENOSPC.

Thanks,
//richard
