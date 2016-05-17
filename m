Date: Tue, 17 May 2016 02:12:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at,
 david@fromorbit.com, dedekind1@gmail.com, alex@nextthing.co,
 akpm@linux-foundation.org, sasha.levin@oracle.com,
 iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 kirill.shutemov@linux.intel.com, hughd@google.com,
 mgorman@techsingularity.net
Subject: Re: UBIFS and page migration (take 3)
Message-ID: <20160517091228.GB23943@infradead.org>
References: <1462974823-3168-1-git-send-email-richard@nod.at>
 <20160512114948.GA25113@infradead.org> <5739C0C1.1090907@nod.at>
 <5739C53B.1010700@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5739C53B.1010700@suse.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 16, 2016 at 03:03:55PM +0200, Vlastimil Babka wrote:
> On 05/16/2016 02:44 PM, Richard Weinberger wrote:
> >MM folks, do we have a way to force page migration?
> 
> On NUMA we have migrate_pages(2).

Do we have existing sets of it?  Otherwise it would be good to find
a way to wire it up for xfstests so that we enforce migratepage
is called.  Once I get some time I'll see how often we end up
calling migratepage for a normal QA run.
