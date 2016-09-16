Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bktBC-0004sI-1z
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 13:27:47 +0000
Date: Fri, 16 Sep 2016 15:27:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/17] UBI: simplify recover_peb() code
Message-ID: <20160916152724.5af02c43@bbrezillon>
In-Reply-To: <bca2db4f-8bef-8a62-dee7-267e9947c521@nod.at>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473087908-27862-12-git-send-email-boris.brezillon@free-electrons.com>
 <bfcc6841-b5a7-8e40-5a6b-9e64f42390d7@nod.at>
 <20160916132355.22c354f8@bbrezillon>
 <bca2db4f-8bef-8a62-dee7-267e9947c521@nod.at>
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

On Fri, 16 Sep 2016 15:23:31 +0200
Richard Weinberger <richard@nod.at> wrote:

> Boris,
> 
> On 16.09.2016 13:23, Boris Brezillon wrote:
> > On Fri, 16 Sep 2016 12:14:04 +0200
> > Richard Weinberger <richard@nod.at> wrote:
> >   
> >> Boris,
> >>
> >> On 05.09.2016 17:05, Boris Brezillon wrote:  
> >>> + * This function is called in case of a write failure and moves all good data
> >>> + * from the potentially bad physical eraseblock to a good physical eraseblock.
> >>> + * This function also writes the data which was not written due to the failure.
> >>> + * Returns 0 in case of success, and a negative error code in case of failure.
> >>> + * This function tries %UBI_IO_RETRIES before giving up.
> >>> + */
> >>> +static int recover_peb(struct ubi_device *ubi, int pnum, int vol_id, int lnum,
> >>> +		       const void *buf, int offset, int len)
> >>> +{
> >>> +	int err, idx = vol_id2idx(ubi, vol_id), tries;
> >>> +	struct ubi_volume *vol = ubi->volumes[idx];
> >>> +	struct ubi_vid_hdr *vid_hdr;
> >>> +
> >>> +	vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
> >>> +	if (!vid_hdr)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	for (tries = 0; tries <= UBI_IO_RETRIES; tries++) {
> >>> +		err = try_recover_peb(vol, pnum, lnum, buf, offset, len,
> >>> +				      vid_hdr);
> >>> +		if (!err || err == -ENOSPC)
> >>> +			break;    
> >>
> >> Why do you handle ENOSPC as fatal error? Since the loop is bound by UBI_IO_RETRIES
> >> IMHO we can retry also upon ENOSPC.  
> > 
> > I was just trying to mimic the existing behavior: if ubi_wl_get_peb()
> > fails to return a free PEB it returns -ENOSPC, and the current
> > implementation does not retry in this case.  
> 
> Whoops. I thought the current code does retry upon -ENOSPC.
> 
> > I also realize that we should not retry if the error happened when
> > reading from the source PEB.
> > 
> > Maybe we should have an extra 'bool *retry' parameter to let
> > recover_peb() know whether the operation should be retried or not.
> > What do you think?  
> 
> Since your change does not change the current behaviour, let's keep it as-is.

Actually it does. Now I'm retrying even when we have errors on the
reads :-(.

> 
> Thanks,
> //richard
