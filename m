Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkUnk-0006kY-Vp
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 07:07:50 +0000
Received: by mail-ee0-f49.google.com with SMTP id c4so2942093eek.36
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2012 23:07:47 -0800 (PST)
Date: Mon, 17 Dec 2012 09:07:43 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH 2/2] mtd: cmdlinepart: skip partitions truncated to zero
Message-ID: <20121217090743.398ace11@pixies.home.jungo.com>
In-Reply-To: <78eb5cec3f992756ef28276f9022aa27dc6f0579.1355438632.git.christophercordahi@nanometrics.ca>
References: <cover.1355438632.git.christophercordahi@nanometrics.ca>
 <78eb5cec3f992756ef28276f9022aa27dc6f0579.1355438632.git.christophercordahi@nanometrics.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Chris,

On Sun, 16 Dec 2012 19:59:30 -0500 Christopher Cordahi <christophercordahi@nanometrics.ca> wrote:
> Perform flash size truncation before skipping zero sized partition
> so that if the result is a zero sized, it will be skipped like the
> others.
> 
> Signed-off-by: Christopher Cordahi <christophercordahi@nanometrics.ca>

Acked-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

> @@ -330,6 +330,14 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  		if (part->parts[i].size == SIZE_REMAINING)
>  			part->parts[i].size = master->size - offset;
>  
> +		if (offset + part->parts[i].size > master->size) {
> +			printk(KERN_WARNING ERRP
> +			       "%s: partitioning exceeds flash size, truncating\n",
> +			       part->mtd_id);
> +			part->parts[i].size = master->size - offset;
> +		}
> +		offset += part->parts[i].size;
> +
>  		if (part->parts[i].size == 0) {
>  			printk(KERN_WARNING ERRP
>  			       "%s: skipping zero sized partition\n",
> @@ -338,16 +346,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>  			memmove(&part->parts[i], &part->parts[i + 1],
>  				sizeof(*part->parts) * (part->num_parts - i));
>  			i--;
> -			continue;
>  		}

Taking another look (this relates to your prev patch as well), maybe
it would be cleaner to avoid the "i--" by converting this 'for' loop to a
'while' loop, executing the "i++" at the end of the loop, keeping the
explicit 'continue' in the 'size == 0' case.

Regards,
Shmulik
