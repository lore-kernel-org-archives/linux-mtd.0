Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXepR-00074M-9m
	for linux-mtd@lists.infradead.org; Sun, 23 Apr 2006 14:40:47 +0100
Date: Sun, 23 Apr 2006 15:40:39 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060423134039.GE19326@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
	<20060423122721.GC19326@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060423122721.GC19326@wohnheim.fh-wedel.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [HOWTO] Using git for mtd (v4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Next version.  This time the push should actually work.

1. Clone Linus' tree

  $ git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git mtd

  The mtd git server is behind a slow DSL line and does not have
  enough network bandwith for people to clone the full tree on a
  regular basis.

2. Change into soon-to-be mtd tree

  $ cd mtd

3. Setup mtd remotes files

  $ vi .git/remotes/mtd_in
  URL: git://git.infradead.org/mtd-2.6
  Pull: master:mtd
  $ vi .git/remotes/mtd_out
  URL: ssh://git.infradead.org/~/public_git/mtd-2.6.git
  Push: Push: mtd:master

4. Fetch mtd tree

  $ git fetch mtd_in

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

  $ ssh git.infradead.org
  $ mkdir public_git
  $ cd public_git
  $ ln -s ~/public_git
  $ git clone -l -n -s --bare /home/git/mtd-2.6.git mtd-2.6.git
  $ chmod og+rx ~ ~/public_git

9. Push to private tree on pentafluge

  $ git push mtd_out

  http://git.infradead.org/ will index the tree every five minutes via
  cron.

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
