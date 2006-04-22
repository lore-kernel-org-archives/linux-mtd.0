Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXLLN-0001wY-Mo
	for linux-mtd@lists.infradead.org; Sat, 22 Apr 2006 12:52:32 -0400
Date: Sat, 22 Apr 2006 18:51:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060422165138.GE6629@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: [HOWTO] Using git for mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is likely still full of omissions and plain errors, but there
doesn't seem to be a better document floating around.  Many thanks to
Arnd Bergmann who helped me a lot!


1. Clone Linus' tree

  $ git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git mtd

2. Change into soon-to-be mtd tree

  $ cd mtd

3. Setup mtd remotes file

  $ vi .git/remotes/mtd
  URL: git://git.infradead.org/mtd-2.6
  Pull: master:mtd

4. Fetch mtd tree

  $ git fetch mtd

5. Checkout mtd tree

  $ git checkout mtd

6. Edit some files

  Use your favorite editor.  Don't forget to tell git about new files
  with "git add".

7. Commit changes

  $ git commit -a

  FIXME: It is easy to forget a Signed-Off-By: line.  This needs to be
  automated.

8. Create private tree on pentafluge

  FIXME

9. Push to private tree on pentafluge

  $ git push ssh://pf/~/public_git/mtd-2.6.git

Jörn

-- 
There are two ways of constructing a software design: one way is to make
it so simple that there are obviously no deficiencies, and the other is
to make it so complicated that there are no obvious deficiencies.
-- C. A. R. Hoare
