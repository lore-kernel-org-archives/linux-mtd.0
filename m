Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhMQ7-0000Y3-1d
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 16:39:00 +0000
Date: Fri, 15 Nov 2013 17:39:57 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Jeff Liu <jeff.liu@oracle.com>
Subject: Re: [PATCH 3/6] gfs2: simplify current_tail() via
 list_last_entry_or_null()
Message-ID: <20131115163957.GA28467@redhat.com>
References: <5285A3F4.4040000@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5285A3F4.4040000@oracle.com>
Cc: jfs-discussion@lists.sourceforge.net, jiri@resnulli.us,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15, Jeff Liu wrote:
>
> @@ -441,13 +441,9 @@ static unsigned int current_tail(struct gfs2_sbd *sdp)
>  
>  	spin_lock(&sdp->sd_ail_lock);
>  
> -	if (list_empty(&sdp->sd_ail1_list)) {
> -		tail = sdp->sd_log_head;
> -	} else {
> -		tr = list_entry(sdp->sd_ail1_list.prev, struct gfs2_trans,
> -				tr_list);
> -		tail = tr->tr_first;
> -	}
> +	tr = list_last_entry_or_null(&sdp->sd_ail1_list, struct gfs2_trans,
> +				     tr_list);
> +	tail = tr ? tr->tr_first : sdp->sd_log_head;
>  

Personally I agree with Steven. At least in this case
list_last_entry_or_null() doesn't really help to simplify the code.

But probably list_last_entry() makes sense in the "else" branch,
athough this is minor.


Off-topic. Not sure this really makes sense, but I was thinking about

	list_get_first(pos, head, member)	\
		((pos) = list_first_entry(head, typeof(*pos), member))

and list_get_first() last of course. The obvious advantage is that
compared to

	tr = list_last_entry(sdp->sd_ail1_list, struct gfs2_trans, tr_list);

above you do not need to type "struct gfs2_trans",

	list_get_last(tr, sdp->sd_ail1_list, tr_list);

looks a bit better.

Oleg.
