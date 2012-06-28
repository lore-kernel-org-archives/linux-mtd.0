Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkIu9-0006tk-FB
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2012 17:53:22 +0000
Received: by werc12 with SMTP id c12so1911679wer.36
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2012 10:53:18 -0700 (PDT)
Date: Thu, 28 Jun 2012 20:53:03 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
Message-ID: <20120628205303.676fa2ea@halley>
In-Reply-To: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 25 Jun 2012 17:08:38 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
> diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
> index f6a7d7a..c2c6db0 100644
> --- a/drivers/mtd/ubi/misc.c
> +++ b/drivers/mtd/ubi/misc.c
> @@ -100,8 +100,9 @@ void ubi_calculate_reserved(struct ubi_device *ubi)
>  {
>  	ubi->beb_rsvd_level = ubi->good_peb_count/100;
>  	ubi->beb_rsvd_level *= CONFIG_MTD_UBI_BEB_RESERVE;

BTW Artem, I've always had an unresolved issue with this original
calculation... maybe you can shed some light here.

Why 'beb_rsvd_level' is set to RESERVE percent of the 'good_peb_count'?

As the device gets worn, number of 'good_peb_count' will lessen over
time - and as such, the 'beb_rsvd_level' may vary (lessen) over time.

I'd expect a fixed number of 'beb_rsvd_level' PEBs for a given mtd
partition, or more correctly, as Richard suggests, the *sum* of bad PEBs
plus the beb reserved PEBs should be constant for a partition - as I
do not expect more than a known constant of blocks to go bad during
device's (and thus, partition's) lifetime.

Regards,
Shmulik
