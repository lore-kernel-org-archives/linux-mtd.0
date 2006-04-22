Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXLdx-0002Hi-Nz
	for linux-mtd@lists.infradead.org; Sat, 22 Apr 2006 13:11:49 -0400
Date: Sat, 22 Apr 2006 19:11:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060422171133.GF6629@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060422165138.GE6629@wohnheim.fh-wedel.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [HOWTO] Using git for mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Next version with the FIXMEs filled in.  If anyone has comments, spots
errors, etc., please tell me.

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

  $ git commit -a -s

  Don't forget the '-s' part or you have to add the Signed-Off-By:
  line yourself.

8. Create private tree on pentafluge

  $ ssh pentafluge.infradead.org
  $ mkdir public_git
  $ cd public_git
  $ ln -s ~/public_git
  $ git clone -l -n -s --bare /home/git/mtd-2.6.git mtd-2.6.git

9. Push to private tree on pentafluge

  $ git push ssh://pf/~/public_git/mtd-2.6.git

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
