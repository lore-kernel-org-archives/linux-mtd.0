Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CDLVf-00031y-NC
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 07:23:36 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1CDLVc-0005Vy-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Oct 2004 12:23:32 +0100
Date: Fri, 1 Oct 2004 12:23:32 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20041001112332.GN22627@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org>
Subject: Suspend problem on 2.6.x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtdblockd when running on 2.6 is either ignorning or
not dealing with the suspend-to-memory request, and therefore
the system is not shutting down when asked to.

bash-2.05a# echo mem > /sys/power/state
Stopping tasks: ==
 stopping tasks failed (1 tasks remaining)
Restarting tasks...<6> Strange, mtdblockd not stopped
 done
bash-2.05a#

I have worked round this for the moment by
adding PF_NOFREEZE to the current->flags at the start of 
mtd_bldevs.c:mtd_blktrans_thread()

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
