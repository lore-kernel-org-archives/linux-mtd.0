Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auyDA-0004ln-9R
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 08:19:13 +0000
Date: Tue, 26 Apr 2016 10:18:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH 4/8] mtd-utils: Add flash stress test Utility
Message-ID: <20160426101850.2ccde903@bbrezillon>
In-Reply-To: <1461622409-14970-5-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-5-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 Apr 2016 00:13:25 +0200
Richard Weinberger <richard@nod.at> wrote:

> diff --git a/misc-utils/flash_stress.c b/misc-utils/flash_stress.c
> new file mode 100644
> index 0000000..2dd2da1
> --- /dev/null
> +++ b/misc-utils/flash_stress.c

[...]

> +static void process_options(int argc, char **argv)
> +{
> +	int i;
> +
> +	for (i=1; i<argc; ++i) {
> +		if (!strcmp(argv[i], "--help") || !strcmp(argv[i], "-h")) {
> +			usage(EXIT_SUCCESS);
> +		} else if (!strcmp(argv[i], "--keep") || !strcmp(argv[i], "-k")) {
> +			if (flags & KEEP_CONTENTS)
> +				goto failmulti;
> +			flags |= KEEP_CONTENTS;
> +		} else if (!strcmp(argv[i], "--seed") || !strcmp(argv[i], "-s")) {
> +			if (flags & SEED_SET)
> +				goto failmulti;
> +			srand(read_num(i, i+1, argc, argv));
> +			flags |= SEED_SET;
> +		} else if (!strcmp(argv[i], "--count") || !strcmp(argv[i], "-c")) {
> +			if (flags & COUNT_CHANGED)
> +				goto failmulti;
> +			count = read_num(i, i+1, argc, argv);
> +			if (count <= 0)
> +				goto failarg;
> +			++i;
> +			flags |= COUNT_CHANGED;
> +		} else {
> +			if (mtddev)
> +				usage(EXIT_FAILURE);
> +			mtddev = argv[i];
> +		}
> +	}

Please use getopt_long(). I guess this applies to all your patches, so
I'll stop mentioning it.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
