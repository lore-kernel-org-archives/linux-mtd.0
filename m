Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp6u8-0005HE-2h
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 10:56:41 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 3.36 #1 (Debian))
	id 1Bp6u7-0002L6-00
	for <linux-mtd@lists.infradead.org>; Mon, 26 Jul 2004 15:56:39 +0100
Date: Mon, 26 Jul 2004 15:56:39 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20040726145639.GE7414@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org>
Subject: Suspend on 2.6.7-rc1 with mtd-snapshot-20040718
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a 2.6.7-rc2 kernel (PXA255) with a newish mtd
snapshot applied, and I have a problem with suspend-to-ram
with the mtdblockd and ntfld not going to sleep, and causing
the suspend to fail.

The kernel outputs the following:

stopping tasks failed (1 tasks remaining)
Restarting tasks...<6> Strange, mtdblockd not stopped

I guess mtdblockd isn't going to sleep when
requested, and is therefore causing the power
management to abort. Is there a fix in the newer
releases, or do I need to investiage this problem
further?

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
