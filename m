Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJY5L-0007r2-3U
	for linux-mtd@lists.infradead.org; Sun, 25 Sep 2005 11:06:39 -0400
Date: Sun, 25 Sep 2005 17:06:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Peter Grayson <pgrayson@realmsys.com>
Message-ID: <20050925150635.GD28978@wohnheim.fh-wedel.de>
References: <1127433949.6937.30.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127433949.6937.30.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2 whitespace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 September 2005 18:05:49 -0600, Peter Grayson wrote:
> 
> I'm not sure if anyone else really cares about these kind of cleanup
> changes, but just in case someone does, here is a patch that fixes up
> several whitespace issues in the jffs2 code.
> 
> I believe all of these changes are consistent with what the mtd
> developers like to see in the code. There seems to be a lot of precedent
> for all of these changes.
> 
> There are no functional changes in this patch.
> 
> Here are the specific issues addressed:
> 
> * Remove all trailing whitespace
> * Use tab-indentation consistently (there was some space indentation)
> * Consistent placement of parenthesis for "if", "for", "while", and
> "switch" expressions (i.e. "if (a == b)" instead of "if( a == b )")
> * Space follows all commas
> * Space around binary operators (i.e. "a = b + c;" instead of "a=b+c;")

This one may be controversial.  Ime, there are cases when spaces
should not be used based on some strict rule, but rather to logically
group expressions.

> * Opening brace of function definition on its own line
> * Put the "else" on the same line as the preceding and following braces
> 
> This is a rather large patch, but the changes are trivial. If this patch
> goes over well, I would be happy to create a similar patch for the rest
> of the mtd code.

I'm not sure about this.  Apart from the binary operator cases, your
changes are definitely a slight improvement.  But the patch is also
peeing on every lantern pole in the county:
 61 files changed, 1677 insertions(+), 1713 deletions(-)

How can I trust you that you didn't introduce a security problem on
line 6789 of your 9485 line patch, by intention or not.  I'd have to
read it all, which is quite boring.

And if all goes well, pretty much every single patch maintained
outside of cvs would break after merging this.  There must be a
collision _somewhere_, after all.

So I guess the short answer is "no".

My usual approach to whitespace cleanup, btw., is as a first step
before I change some code anyway.  Even whitespace patches should get
tested and since I need some testing anyway and they help me read and
change the code, the cleanup is gaining me more than it costs.

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
