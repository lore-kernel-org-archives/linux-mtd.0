Date: Thu, 12 May 2016 04:49:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at,
 david@fromorbit.com, dedekind1@gmail.com, alex@nextthing.co,
 akpm@linux-foundation.org, sasha.levin@oracle.com,
 iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 kirill.shutemov@linux.intel.com, hch@infradead.org,
 hughd@google.com, mgorman@techsingularity.net, vbabka@suse.cz
Subject: Re: UBIFS and page migration (take 3)
Message-ID: <20160512114948.GA25113@infradead.org>
References: <1462974823-3168-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462974823-3168-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

the series looks fine to me, but it fails to address the root cause:
that we have an inherently dangerous default for ->migratepage that
assumes that file systems are implemented a certain way.  I think the
series should also grow a third patch to remove the default and just
wire it up for the known good file systems, although we'd need some
input on what known good is.

Any idea what filesystems do get regular testing with code that's using
CMA? A good approximation might be those that use the bufer_head
based aops from fs/buffer.c
