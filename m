Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5CDS-0004eM-DF
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 08:59:38 +0000
Received: by weyr3 with SMTP id r3so1527057wey.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 01:59:36 -0700 (PDT)
Date: Sat, 25 Aug 2012 12:02:31 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
Message-ID: <20120825120231.73577d6a@halley>
In-Reply-To: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Sat, 25 Aug 2012 10:26:07 -0400 Huang Shijie <shijie8@gmail.com> wrote:
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index 4558e0f..fc960a3 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -344,7 +344,8 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  					       "%s: partitioning exceeds flash size, truncating\n",
>  					       part->mtd_id);
>  					part->parts[i].size = master->size - offset;
> -					part->num_parts = i;
> +					part->num_parts = i + 1;
> +					break;

Your analysis seems right, but let me offer an alternative approach.

I would simply:

-					part->num_parts = i;

(and not replace it with anything).

The specified cmdline partitions might not be ordered (according to
start offset), so next partition specified after the truncated one might
define a partition at the beginning of the device, which is okay
(regardless the truncation of current partition).

Your patch skips the definitions of next partitions, which can be legit.

I agree specifying "unsorted" partitions is not commonly used (and it
might make no sense when using the "remaining" syntax), but it is legit
to define all partitions _explicitly_ with their size@offset in an
unordered fashion.

Regards,
Shmulik
