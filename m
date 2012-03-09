Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5uKe-0006Fg-Pv
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 07:33:45 +0000
Message-ID: <1331278562.22872.18.camel@sauron.fi.intel.com>
Subject: Re: [patch] Adding Secure Deletion to UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 09 Mar 2012 09:36:02 +0200
In-Reply-To: <alpine.DEB.2.00.1203011434220.2462@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1330536308.3545.158.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203011434220.2462@eristoteles.iwoars.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-03-01 at 14:41 +0100, Joel Reardon wrote:
> This is true. The reason its done is as an optimization for the 
> following reason.
> 
> When deleting a data node, the key position is marked as deleted.

Would you please explain again how the key position is being marked as
deleted please. Would be nice to have a wiki or a public document with
design reference somewhere, so you could just point "see page 5" as an
answer, and update it if needed.

>  The key 
> positions then requires a datanode read to find.

Sorry, would you please provide a bit more detailed information. I am
sure you explained it before, but the explanation is buried somewhere.

I am ready to create an ubifs branch for you and keep a text file with
design/FAQ there, and update the branch as UBIFS moves forward, and
apply your small incremental patches - as soon as we have an
applicable / nice patch.

>  By keeping it in memory (thus the TNC), 
> marking a key pos as deleted doesn't require a flash read.


Well, I'd say that this should be solved with another layer of caching.
E.g., we have so called "LNC" (Leaf node cache) - we keep direntries at
the leaf level to avoid extra reads. You could extend LNC and keep keys
there.

Consider this approach:

1. You throw out this optimization so far
2. Keep working on your stuff - you have enough issues to deal with.
You'll have less compatibility issues when you throw that out. The
design will be simpler as well.
3. When / if other things are done, you try to extend LNC to always
cache the keys.

>  This improves 
> e.g., truncations and full file deletion speed, which would otherwise read 
> each data node from flash to get the positions. If it is not stored in 
> ubifs_branch (but still stored in the tree), then it would have to be 
> loaded once 'on-demand' after mounting. This is also an option, of course. 
> Currently, deleting a file performs a walk on all the TNC's data nodes 
> that are removed, so the extra mark-delete incurs no observable cost.

I wonder also if it is wise to enable secure deletion globally. Yes, we
pay the cost of maintaining the keys anyways, but we could avoid paying
the costs at deletion time when deleting non-securely.

Isn't it wiser to have a special interface for secure deletion which
would be slower than normal deletion? I believe this is the right
approach. And I believe block-based file-systems would go this way. Just
think about MMC which has secure erase trim which is so slow - I do not
think anyone would use it for everything by default - people would have
a separate interface.

Did you explore, by the way, if something like this is being worked on
for other FSes in Linux?


-- 
Best Regards,
Artem Bityutskiy
