Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 May 2010 18:16:58 +0100
Message-ID: <1273771018.12840.7077.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-03-20 at 11:03 +0100, Joakim Tjernlund wrote:
> Erasing blocks is a form of GC and therefore it should live in the
> GC task. By moving it there two problems will be solved:
> 1) unmounting will not hang until all pending blocks has
>    been erased.
> 2) Erasing can be paused by sending a SIGSTOP to the GC thread which
>    allowes for time critical tasks to work in peace.
> 
> Since erasing now is in the GC thread, erases should trigger
> the GC task instead.
> wbuf.c still wants to flush its buffer via write_super so
> invent jffs2_dirty_trigger() and use that in wbuf.
> Remove surplus call to jffs2_erase_pending_trigger() in erase.c
> and remove jffs2_garbage_collect_trigger() from write_super as
> of now write_super() should only commit dirty data to disk.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---

The only callers of jffs2_erase_pending_blocks() now call it with a
'count' argument of 1. So perhaps it's now misnamed and the 's' and the
extra argument should be dropped?

I don't much like the calculation you've added to the end of that
function either, which really ought to be under locks (even though right
now I suspect it doesn't hurt). Why recalculate that at all, though --
why not keep a 'ret' variable which defaults to 0 but is set to 1 just
before the 'goto done' which is the only way out of the function where
the return value should be non-zero anyway?

I've always been very careful to keep the GC thread as an
_optimisation_. It looks like this will still work, because the actual
erase will get done from jffs2_reserve_space()... but that'll only erase
blocks immediately when we actually need them. Before, we were erasing
them in advance. I suppose that's OK though.

-- 
dwmw2
