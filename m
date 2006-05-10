Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdoqM-0000E7-Kv
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 09:35:25 -0400
Date: Wed, 10 May 2006 15:35:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20060510133510.GD31935@wohnheim.fh-wedel.de>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1147249742.16853.16.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] reserved pool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 May 2006 12:29:02 +0400, Artem B. Bityutskiy wrote:
> +
> +int jffs2_parse_options(struct super_block *sb, char *opts)
> +{
> +	unsigned int opt;
> +	char *p;
> +	substring_t args[JFFS2_MAX_ARGS];
> +	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
> +
> +	if (!opts)
> +		return 0;
> +
> +	while ((p = strsep(&opts, ",")) != NULL) {

" != NULL" is superfluous.

> +		int token;
> +
> +		if (!*p)
> +			continue;
> +		
> +		token = match_token(p, tokens, args);
> +
> +		switch (token) {
> +			case JFFS2_OPT_RP_SIZE:

One level of indentation can be save here.  Unlike dwmw2, I don't
participate in the terminal size arms race and still care about 80
columns. ;)

> +				if (match_int(&args[0], &opt))
> +					return -EINVAL;
> +				c->rp_size = opt * 1024;
> +				if (c->rp_size > c->mtd->size) {
> +					JFFS2_WARNING("too large reserved pool size, max is %u KB\n",
> +						      c->mtd->size/1024);
> +					return -EINVAL;
> +				}
> +				break;
> +			default:
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}

Rest looks fine to me.

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster
