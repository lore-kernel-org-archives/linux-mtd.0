Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhKNW-0000sw-Pt
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2013 14:28:11 +0000
Subject: Re: [Cluster-devel] [PATCH 0/6] list: introduce
 list_last_entry_or_null()
From: Steven Whitehouse <swhiteho@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <20131115141100.GA17659@infradead.org>
References: <5285A33C.4040808@oracle.com>
 <20131115141100.GA17659@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Nov 2013 14:26:53 +0000
Message-ID: <1384525613.2747.60.camel@menhir>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jfs-discussion@lists.sourceforge.net, jiri@resnulli.us,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>, cluster-devel@redhat.com,
 Jeff Liu <jeff.liu@oracle.com>, linux-mtd@lists.infradead.org, oleg@redhat.com,
 akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2013-11-15 at 06:11 -0800, Christoph Hellwig wrote:
> On Fri, Nov 15, 2013 at 12:29:48PM +0800, Jeff Liu wrote:
> > Hi Folks,
> > 
> > This patch is trying to introduce a new list helper to retrieve the
> > last entry or return NULL if the list is empty corresponding to it,
> > which is inspired by Jiri Pirko's list_first_entry_or_null().
> 
> How did we end up with the stupid _or_null prefix there?  I think the
> functionality is useful, but the naming is way to verbose, especially
> given that a list_first_entry or list_last_entry that optimizes away
> that one check doesn't seem useful.
> 
> Instead of encoding detailed semantics in the name a good kerneldoc
> comment is way better.
> 

Also, in two of the cases (patch 3 and patch 6) we don't want NULL in
the case that the list is empty, and instead want another pointer which,
after the patches, requires an extra "if". Now I suspect that the
optimizer will sort that out (I've not checked) so its probably not too
big an issue. However, if instead of returning NULL for list empty, we
had an extra argument to the function, then it could return whatever
pointer was required for each case, whether NULL or otherwise,

Steve.
