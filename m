Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdmTO-00033A-HM
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 21:16:23 +0000
Received: by paboj16 with SMTP id oj16so14511416pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 14:16:01 -0700 (PDT)
Date: Thu, 2 Apr 2015 14:15:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Nam T. Nguyen" <namnguyen@chromium.org>
Subject: Re: [PATCH v3] mtd-utils: Add mtdpart to add/delete partition
Message-ID: <20150402211550.GJ32500@ld-irv-0074>
References: <1425498091-3505-1-git-send-email-namnguyen@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425498091-3505-1-git-send-email-namnguyen@chromium.org>
Cc: vapier@chromium.org, linux-mtd@lists.infradead.org, dehrenberg@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This doesn't even compile...

On Wed, Mar 04, 2015 at 11:41:31AM -0800, Nam T. Nguyen wrote:
> Add a simple utility to exercise BLKPG ioctl.
> 
> Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>
> ---
> Changes from v2:
> 
>   o Fix coding style
>   o Remove cleanup code since we exit()ing anyway.
> 
>  Makefile  |   2 +-
>  mtdpart.c | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 188 insertions(+), 1 deletion(-)
>  create mode 100644 mtdpart.c
> 
...
> diff --git a/mtdpart.c b/mtdpart.c
> new file mode 100644
> index 0000000..b944f49
> --- /dev/null
> +++ b/mtdpart.c
> @@ -0,0 +1,187 @@
[...]
> +		command = COMMAND_DEL;
> +	} else if (strcmp(s_command, "add") == 0 && (argc - optind) == 3) {
> +		part_name = argv[optind++];
> +		const char *s_start = argv[optind++];
> +		const char *s_length = argv[optind++];

The preferred style is to keep variable definitions before statements.

> +
> +		if (strlen(part_name) >= BLKPG_DEVNAMELTH)
> +			errmsg_die("Partition name (%s) should be less than %d characters"

^^ you're missing a comma on this line. I think that's the only compile
issue? But I'd expect you to compile and test what you're sending
first...

> +				   part_name, BLKPG_DEVNAMELTH);
> +
> +		start_addr = simple_strtoll(s_start, &error);
> +		if (start_addr < 0)
> +		       errmsg_die("Can't specify negative start offset: %lld",
> +				  start_addr);
> +
> +		length = simple_strtoll(s_length, &error);
> +		if (length < 0)
[snip]

Brian
