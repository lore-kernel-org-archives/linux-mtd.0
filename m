Received: from mail-pb0-f48.google.com ([209.85.160.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqW6l-0003ex-3m
 for linux-mtd@lists.infradead.org; Fri, 30 May 2014 23:21:07 +0000
Received: by mail-pb0-f48.google.com with SMTP id rr13so2208594pbb.35
 for <linux-mtd@lists.infradead.org>; Fri, 30 May 2014 16:20:42 -0700 (PDT)
Date: Fri, 30 May 2014 16:20:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v3] ubifs: respect MS_SILENT mount flag
Message-ID: <20140530232039.GH3599@ld-irv-0074>
References: <1401265736.2118.2.camel@sauron.fi.intel.com>
 <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
 <5384B772.4030506@makrotopia.org> <538545B4.7070103@huawei.com>
 <1401264104.983.12.camel@sauron.fi.intel.com>
 <1401264446.983.17.camel@sauron.fi.intel.com>
 <1401264889.983.19.camel@sauron.fi.intel.com>
 <20140530220149.GA30631@earthship.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140530220149.GA30631@earthship.lan>
Cc: hujianyang@huawei.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniel,

On Sat, May 31, 2014 at 12:01:56AM +0200, Daniel Golle wrote:
> When attempting to mount a non-ubifs formatted volume, lots of error
> messages (including a stack dump) are thrown to the kernel log even if
> the MS_SILENT mount flag is set.
> Fix this by introducing adding an additional state-variable in
> struct ubifs_info and suppress error messages in ubifs_read_node if
> MS_SILENT is set.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: use state variable in ubifs_info instead of 

Instead of what?? I'm dying to know!

(Just kidding; I can read your previous conversations. Hint: the answer
is "a function argument.")

>  fs/ubifs/io.c    | 14 ++++++++------
>  fs/ubifs/super.c |  4 ++++
>  fs/ubifs/ubifs.h |  9 +++++++++
>  3 files changed, 21 insertions(+), 6 deletions(-)
> 
[...]
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index e8c8cfe..6aa1550 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -52,6 +52,14 @@
>  	pr_warn("UBIFS warning (pid %d): %s: " fmt "\n",            \
>  		current->pid, __func__, ##__VA_ARGS__)
>  
> +/*
> + * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
> + * object as an argument.
> + */
> +#define ubifs_errc(c, fmt, ...)                                    \
> +	if (!(c)->probing)                                         \
> +		ubifs_err(fmt, ##__VA_ARGS__)

Nitpick: might you want to wrap the whole condition in do { } while (0),
so that a user can't shoot themselves in the foot with something like:

	if (condition)
		ubifs_errc(c, "hello world");
	else
		do_something_else();

which will expand to the following unexpected code:

	if (condition)
		if (!c->probing)
			ubifs_err("hello world");
		else
			do_something_else();

> +
>  /* UBIFS file system VFS magic number */
>  #define UBIFS_SUPER_MAGIC 0x24051905
>  

Brian
