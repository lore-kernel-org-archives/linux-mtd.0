Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19K6Fd-0003B2-SS
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 01:54:09 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19K6EO-0001x6-00
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 02:52:52 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Sun, 25 May 2003 17:54:52 -0700
Message-ID: <m34r3izfvn.fsf@bfnet.com>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: mtd/utils automake attic?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to compile the utils directory following the automake
instructions, but there seem to be files missing in my version of
CVS:  

  automake: `configure.ac' or `configure.in' is required
  automake: configure.in: required file `./install-sh' not found
  automake: configure.in: required file `./missing' not found
  configure.in: 4: required file `./config.h.in' not found

When I look at the web CVS, I can see those files:

http://www.infradead.org/cgi-bin/cvsweb.cgi/mtd/util/?hideattic=0&sortby=date

They appear to be "in the attic".  What does that mean?  Is there a
way to download these files using cvs?

Thanks,
Dave
