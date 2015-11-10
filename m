Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwDq8-0005ZK-Bm
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 18:40:20 +0000
Received: by padhx2 with SMTP id hx2so4569931pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 10:39:59 -0800 (PST)
Date: Tue, 10 Nov 2015 10:39:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Saurabh Sengar <saurabh.truth@gmail.com>, andy.shevchenko@gmail.com,
 joern@lazybastard.org, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: error handling
Message-ID: <20151110183956.GQ12143@google.com>
References: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
 <1447050198-20562-1-git-send-email-saurabh.truth@gmail.com>
 <20151110182047.GP12143@google.com>
 <1447180387.2701.68.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447180387.2701.68.camel@perches.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 10, 2015 at 10:33:07AM -0800, Joe Perches wrote:
> Expand parse_err macro with hidden flow in-place.
> Remove the now unused parse_err macro.

Quick one... thanks, I guess.

> Miscellanea:
> 
> o Use invalid not illegal for error messages
> 
> Noticed-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> > Did you notice that
> > there's a "return" statement embedded in the parse_err() macro? So there
> > was no bug in the first place.

I forgot to add to that last sentence "except for a readability bug."
Thanks for following up.

>  drivers/mtd/devices/phram.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 8b66e52..d93b85e 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -199,11 +199,6 @@ static inline void kill_final_newline(char *str)
>  }
>  
>  
> -#define parse_err(fmt, args...) do {	\
> -	pr_err(fmt , ## args);	\
> -	return 1;		\
> -} while (0)
> -
>  #ifndef MODULE
>  static int phram_init_called;
>  /*
> @@ -226,8 +221,10 @@ static int phram_setup(const char *val)
>  	uint64_t len;
>  	int i, ret;
>  
> -	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
> -		parse_err("parameter too long\n");
> +	if (strnlen(val, sizeof(buf)) >= sizeof(buf)) {
> +		pr_err("parameter too long\n");
> +		return 1;
> +	}
>  
>  	strcpy(str, val);
>  	kill_final_newline(str);
> @@ -235,11 +232,15 @@ static int phram_setup(const char *val)
>  	for (i = 0; i < 3; i++)
>  		token[i] = strsep(&str, ",");
>  
> -	if (str)
> -		parse_err("too many arguments\n");
> +	if (str) {
> +		pr_err("too many arguments\n");
> +		return 1;
> +	}
>  
> -	if (!token[2])
> -		parse_err("not enough arguments\n");
> +	if (!token[2]) {
> +		pr_err("not enough arguments\n");
> +		return 1;
> +	}
>  
>  	ret = parse_name(&name, token[0]);
>  	if (ret)
> @@ -248,13 +249,15 @@ static int phram_setup(const char *val)
>  	ret = parse_num64(&start, token[1]);
>  	if (ret) {
>  		kfree(name);
> -		parse_err("illegal start address\n");
> +		pr_err("invalid start address\n");
> +		return 1;
>  	}
>  
>  	ret = parse_num64(&len, token[2]);
>  	if (ret) {
>  		kfree(name);
> -		parse_err("illegal device length\n");
> +		pr_err("invalid device length\n");
> +		return 1;
>  	}
>  
>  	ret = register_device(name, start, len);
> 

Looks better to me, though I think -EINVAL makes more sense than 1. That
could be a subsequent patch, I suppose.

I'll wait to see if the original reporter has anything to say.

Regards,
Brian
