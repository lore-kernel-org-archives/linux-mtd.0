Date: Fri, 15 Nov 2013 06:11:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jeff Liu <jeff.liu@oracle.com>
Subject: Re: [PATCH 0/6] list: introduce list_last_entry_or_null()
Message-ID: <20131115141100.GA17659@infradead.org>
References: <5285A33C.4040808@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5285A33C.4040808@oracle.com>
Cc: jfs-discussion@lists.sourceforge.net, jiri@resnulli.us,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 "xfs@oss.sgi.com" <xfs@oss.sgi.com>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, oleg@redhat.com, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 15, 2013 at 12:29:48PM +0800, Jeff Liu wrote:
> Hi Folks,
> 
> This patch is trying to introduce a new list helper to retrieve the
> last entry or return NULL if the list is empty corresponding to it,
> which is inspired by Jiri Pirko's list_first_entry_or_null().

How did we end up with the stupid _or_null prefix there?  I think the
functionality is useful, but the naming is way to verbose, especially
given that a list_first_entry or list_last_entry that optimizes away
that one check doesn't seem useful.

Instead of encoding detailed semantics in the name a good kerneldoc
comment is way better.
