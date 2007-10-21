Subject: Re: BUG at mm/filemap.c:1749 (2.6.24, jffs2, unionfs)
From: David Woodhouse <dwmw2@infradead.org>
To: Nick Piggin <nickpiggin@yahoo.com.au>
In-Reply-To: <200710191716.53470.nickpiggin@yahoo.com.au>
References: <200710190605.l9J65kDe008069@agora.fsl.cs.sunysb.edu>
	<200710191703.12026.nickpiggin@yahoo.com.au>
	<200710191716.53470.nickpiggin@yahoo.com.au>
Content-Type: text/plain
Date: Sun, 21 Oct 2007 09:55:44 +0100
Message-Id: <1192956944.2672.6.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Erez Zadok <ezk@cs.sunysb.edu>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, jffs-dev@axis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-10-19 at 17:16 +1000, Nick Piggin wrote:
> 
>         if (writtenlen) {
> -               if (inode->i_size < (pg->index << PAGE_CACHE_SHIFT) + start + writtenlen) {
> -                       inode->i_size = (pg->index << PAGE_CACHE_SHIFT) + start + writtenlen;
> +               if (inode->i_size < pos + start + writtenlen) {
> +                       inode->i_size = pos + start + writtenlen;

This part seems wrong. Shouldn't it just be pos + writtenlen -- which is
basically what it was already: pos==(pg->index<<PAGE_CACHE_SHIFT)+start

-- 
dwmw2
