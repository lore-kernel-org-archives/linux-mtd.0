Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOQDF-0006he-4v
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 04:56:34 +0000
Date: Wed, 30 Jul 2008 21:56:24 -0700
From: David Brown <mtd@davidb.org>
To: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Node CRC failures in latest mainline git?
Message-ID: <20080731045624.GA24431@old.davidb.org>
References: <48913EA3.9080603@billgatliff.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <48913EA3.9080603@billgatliff.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 30, 2008 at 11:25:07PM -0500, Bill Gatliff wrote:

>Were I more competent with git, I would figure out how to bisect down to the
>patch that caused the problem.  That's still a bit out of my skillset at the
>moment, unfortunately--- I've done bisects successfully in the past, but for
>some reason I just can't get git to play along this time...

I just recently asked a question on the git mailing list, and Linus replied
with these instructions for bisecting through a merge.  Basically, you
create a temporary branch where you flatten the merge, using rebase, and
then bisect that.

   # create a test-branch with the 'remote' side of the merge
   git checkout -b test-branch merge^2

   # rebase that remote side on top of the local side
   git rebase merge^

Haven't actually needed to try it, but let me know if it doesn't work, and
I'll figure out the proper incantation.

David Brown
