Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YupLI-0000wv-DF
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 21:46:29 +0000
Received: by padbw4 with SMTP id bw4so40944067pad.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 14:46:06 -0700 (PDT)
Date: Tue, 19 May 2015 14:45:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 5/6 linux-next] ubifs: remove unnecessary else after break
Message-ID: <20150519214558.GZ11598@ld-irv-0074>
References: <1431726240-4675-1-git-send-email-fabf@skynet.be>
 <1431726240-4675-5-git-send-email-fabf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431726240-4675-5-git-send-email-fabf@skynet.be>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 15, 2015 at 11:43:59PM +0200, Fabian Frederick wrote:
> else is not needed after break in dbg_check_old_index()
> This also solves the {} parity.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
>  fs/ubifs/commit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
> index 63f5661..dd9ba81 100644
> --- a/fs/ubifs/commit.c
> +++ b/fs/ubifs/commit.c
> @@ -680,9 +680,9 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
>  				if (iip + 1 < le16_to_cpu(idx->child_cnt)) {
>  					iip = iip + 1;
>  					break;
> -				} else
> -					/* Nope, so go up again */
> -					iip = i->iip;
> +				}
> +				/* Nope, so go up again */
> +				iip = i->iip;
>  			}
>  		} else
>  			/* Go down left */

I think the 'else' structure makes things clearer, so I'd personally
just fix the braces. But of course coding style is more opinion than
science.

Brian
