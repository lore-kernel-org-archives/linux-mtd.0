Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15o5cr-0000Eq-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2001 17:09:01 +0100
Message-ID: <20011001091720.A10960@recycle.lbl.gov>
Date: Mon, 1 Oct 2001 09:17:20 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Cc: Cristiano Paris <c.paris@libero.it>
Subject: MTD newbie
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Cristiano -

> At the moment the jffs2 is unusable for me. I'm using linux-2.4.9-ac10 on

The MTD/JFFS2 in that version dates back to about June 2001.
There have been big changes since then.  I'm at about the same
level of testing as you, but using the current CVS things seem
to basically work.  Dropping in the code from CVS takes a little
thought, but it only took me a couple of tries to get on the air.

Another approach is to apply a patch from Russell King, like
  ftp://ftp.arm.linux.org.uk/pub/linux/arm/source/kernel-patches/v2.4/patch-2.4.9-ac10-rmk2.gz

That one in particular looks like it takes you up to an early
September CVS snapshot of the MTD subsystem.

        - Larry
