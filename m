Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QpMrS-0000Ic-6g
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2011 16:02:59 +0000
Date: Fri, 5 Aug 2011 18:03:25 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Subject: Re: logfs unmount bug
Message-ID: <20110805160325.GM26160@logfs.org>
References: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMjNe_d9WVnKS_4416Kj21YgVEh3d6W4Wa6qWZObex+=LG4J6w@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 5 August 2011 01:05:11 +0530, srimugunthan dhandapani wrote:
> 
> With the latest kernel logfs unmount produces kernel BUG at
> fs/logfs/segment.c:858[2]. The problem is in the invalidatepage
> implementation of the device_mapping inode.
> It is assumed  in the code that invalidatepage of the mapping_inode
> shouldnt be invoked. The present invalidatepage implementation just
> calls BUG(). I don't know why it is assumed like that.

Probably warrants a comment in the code.  The PagePrivate pages are
supposed to be removed before calling generic_shutdown_super.  Clearly
that isn't the case any more.

> But i modified the invalidatepage to clear the page private and update
> flag as shown in patch [1]. With that, i tested with nandsim and  i am
> able to do a clean unmount. I am curious to know what is correct
> solution.

In principle that works.  But it means that any private pages that
shouldn't be private will also be silently cleared.  So effectively
your patch has removed an assertion that may still become useful.  A
different patch can be found here:
http://git.kernel.org/?p=linux/kernel/git/joern/logfs.git;a=commitdiff;h=cc417cd06e2f496d64ac46041bd08287c677ad3d

The tree also contains two other patches that fix clear bugs in logfs.
Does that work for you?

> [1]
> Signed-off-by: srimugunthan <srimugunthan.dhandapani@gmail.com>
> ---
>  fs/logfs/segment.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/logfs/segment.c b/fs/logfs/segment.c
> index 9d51873..d83b778 100644
> --- a/fs/logfs/segment.c
> +++ b/fs/logfs/segment.c
> @@ -855,7 +855,10 @@ static struct logfs_area *alloc_area(struct
> super_block *sb)
> 
>  static void map_invalidatepage(struct page *page, unsigned long l)
>  {
> -	BUG();
> +	ClearPagePrivate(page);
> +	page->private = 0;
> +	
> +	ClearPageUptodate(page);
>  }
> 
>  static int map_releasepage(struct page *page, gfp_t g)

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
