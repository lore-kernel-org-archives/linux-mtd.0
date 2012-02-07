Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RukGP-0007v9-7k
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 12:35:13 +0000
Received: by wgbdt13 with SMTP id dt13so4693891wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2012 04:35:10 -0800 (PST)
Date: Tue, 7 Feb 2012 14:35:05 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/3] mtd: move zero length verification to MTD API
 functions
Message-ID: <20120207143505.6fba6d5b@pixies.home.jungo.com>
In-Reply-To: <1328529789-2106-2-git-send-email-dedekind1@gmail.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
 <1328529789-2106-2-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  6 Feb 2012 14:03:08 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> @@ -712,6 +717,8 @@ int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
>  		return -EOPNOTSUPP;
>  	if (from < 0 || from > mtd->size || len > mtd->size - from)
>  		return -EINVAL;
> +	if (!len)
> +		return 0;
>  	return mtd->_point(mtd, from, len, retlen, virt, phys);
>  }

Previously, '_point' implementors usually assigned *virt (e.g. for NOR -
to the relevant ioremapped address), regardless 'len' value.
Meaning, *virt was set, even in the 'len == 0' case.
New 'mtd_point()' does not set *virt in this case.

(Luckily, seems there are no calls to 'mtd_point' with zero 'len'...)

I guess it is safe to assume the *virt assignment in the '!len' case was
wrong?

Regards
Shmulik
