Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIedv-0003GN-52
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2016 15:44:28 +0000
Subject: Re: ubifs query
To: pavi1729 <pavitra1729@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <CAMf7+LghhyuLVgbg1A3+CMG_tUri1-rFe3-D9L7zRduXdJRcpg@mail.gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <5693CDC1.3030008@sigma-star.at>
Date: Mon, 11 Jan 2016 16:44:01 +0100
MIME-Version: 1.0
In-Reply-To: <CAMf7+LghhyuLVgbg1A3+CMG_tUri1-rFe3-D9L7zRduXdJRcpg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/2016 04:07 PM, pavi1729 wrote:
> Hi,
>   I was looking at 'ubifs_lookup_level0' which is calling 'tnc_prev' function.
> 
> LINK: http://lxr.free-electrons.com/source/fs/ubifs/tnc.c?v=3.10#L1267
> 

The code you link to is _quite_ old (June 2013?). If you want to browse through the
source you might want to look at the current state from the git repo.

> FUNCTION: tnc_prev
> 'tnc_prev' could return a negative 'n' if znode->iip is 0.
> 
> LINK: http://lxr.free-electrons.com/source/fs/ubifs/tnc.c?v=3.10#L670
> 
> nn = znode->iip - 1;

No. Neither in the current version nor in the version your refered to. If nn is set
to a negative value, the branch below is skipped an the loop does not terminate, i.e.
goes into the next iteration where a new value for nn is computed. Assuming nn will
always come out negative, zp will eventually become NULL and the function returns -ENOENT.

At this point, ubifs_lookup_level0 detects an error, sets *n to -1 and returns 0.

> If n is negative then below code will do a negative indexing since
> this is the next line
> 
> if (keys_cmp(c, key, &znode->zbranch[*n].key)) {
> 
> LINK: http://lxr.free-electrons.com/source/fs/ubifs/tnc.c?v=3.10#L1275
> 
> 
> Is this a possibility ?

See above.


Sincerely,

David
