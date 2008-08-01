Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOkfc-0008B6-OI
	for linux-mtd@lists.infradead.org; Fri, 01 Aug 2008 02:47:09 +0000
Date: Thu, 31 Jul 2008 19:47:07 -0700
From: David Brown <davidb@davidb.org>
To: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Node CRC failures in latest mainline git?
Message-ID: <20080801024706.GB2296@old.davidb.org>
References: <48913EA3.9080603@billgatliff.com>
	<20080731045624.GA24431@old.davidb.org>
	<4892205F.2080005@billgatliff.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4892205F.2080005@billgatliff.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 31, 2008 at 03:28:15PM -0500, Bill Gatliff wrote:

>I have no idea what all that would be doing, I still don't grok the syntax for
>commits and deltas, and "rebase" in particular always scares me.  :)

>Here's what I'm trying:
>
>$ git-checkout -b test-branch 9ee08c2df47c10ba624ff05a6c0f2500748bcb69^2
>$ git rebase 9ee08c2df47c10ba624ff05a6c0f2500748bcb69^
>
>CONFLICT (delete/modify): drivers/mtd/maps/mtx-1_flash.c deleted in HEAD and
>modified in MTD/JFFS2: remove CVS keywords. Version MTD/JFFS2: remove CVS
>When you have resolved this problem run "git rebase --continue".
>If you would prefer to skip this patch, instead run "git rebase --skip".
>To restore the original branch and stop rebasing run "git rebase --abort".
>
>Poking at it more now.  Does it look like I'm on the right track, at least?

Yes.  Basically, there are merge conflicts that got resolved at the end.
You're trying to linearize that which means you have to figure them out for
the pieces.  It's kind of a pain, but this particular one isn't all that
hard.

So, I was able to do this rebase as follows:

   $ git rebase 9ee08c2df47^
   ...
   $ git rm drivers/mtd/maps/mtx-1_flash.c
   $ git rebase --continue
   ...

Now we have a real conflict in arch/arm/mach-at91/board-yl-9200.c.

   $ vi arch/arm/mach-at91/board-yl-9200.c

What you want is actually the first one, but with the first line changed
to:

      static struct atmel_nand_data __initdata yl9200_nand_data = {

(with atmel_nand_data, instead of at91_nand_data).

   $ git add arch/arm/mach-at91/board-yl-9200.c
   $ git rebase --continue

As a sanity check, I can compare the end result:

   $ git diff HEAD..9ee08c2df47c10ba624ff05a6c0f2500748bcb69

and see that at least the end result is the same.

Now
    $ git bisect start
    $ git bisect bad
    $ git bisect good 9ee08c2df47c10ba624ff05a6c0f2500748bcb69^
    Bisecting: 28 revisions left to test after this

and that should help you find the problem.  No guarantee that each
intermediate commit is quite right.  You can either fix them, and then
continue, or 'git bisect skip' ones that don't work, but you might miss the
bad one if it just happened to not compile.

David
