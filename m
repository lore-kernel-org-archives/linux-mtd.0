Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sa2lX-0001Gy-PE
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 10:38:04 +0000
Message-ID: <4FC74A04.30100@intel.com>
Date: Thu, 31 May 2012 13:37:56 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1337771191-95358-2-git-send-email-richard@nod.at>
In-Reply-To: <1337771191-95358-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23/05/12 14:06, Richard Weinberger wrote:
> Fastmap (aka checkpointing) allows attaching of an UBI volume in nearly
> constant time. Only a fixed number of PEBs has to be scanned.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/Makefile    |    2 +-
>  drivers/mtd/ubi/attach.c    |   34 +-
>  drivers/mtd/ubi/build.c     |   25 +
>  drivers/mtd/ubi/eba.c       |   18 +-
>  drivers/mtd/ubi/fastmap.c   | 1240 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/ubi/ubi-media.h |  119 +++++
>  drivers/mtd/ubi/ubi.h       |   68 +++-
>  drivers/mtd/ubi/wl.c        |  184 +++++++-
>  8 files changed, 1667 insertions(+), 23 deletions(-)
>  create mode 100644 drivers/mtd/ubi/fastmap.c
> 

...

> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> new file mode 100644
> index 0000000..7757e5a

...

> +/**
> + * ubi_find_fastmap - searches the first UBI_FM_MAX_START PEBs for the
> + * fastmap super block.
> + * @ubi: UBI device object
> + */
> +static int ubi_find_fastmap(struct ubi_device *ubi, int *fm_start)
> +{
> +	int i, ret;
> +	struct ubi_vid_hdr *vhdr;
> +
> +	vhdr = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
> +	if (!vhdr)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < UBI_FM_MAX_START; i++) {
> +		ret = ubi_io_read_vid_hdr(ubi, i, vhdr, 0);
> +		if (ret < 0)
> +			break;
> +		else if (ret > 0)
> +			continue;
> +
> +		if (be32_to_cpu(vhdr->vol_id) == UBI_FM_SB_VOLUME_ID) {
> +			*fm_start = i;
> +			dbg_bld("Found fastmap super block at PEB %i\n", i);
> +			ret = 0;
> +
> +			break;

How do you know that this is the current fastmap and not a remnant of an old
fastmap?

> +		}
> +	}
> +
> +	ubi_free_vid_hdr(ubi, vhdr);
> +
> +	return ret;
> +}
