Received: from ext-ch1gw-3.online-age.net ([216.34.191.37])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Awoyz-0001sN-OS
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2004 20:53:17 +0000
Received: from int-ch1gw-3.online-age.net (int-ch1gw-3 [3.159.232.67])
	id i1RKqpFc008282	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Feb 2004 15:52:51 -0500 (EST)
Received: from uswaumsxb4medge.med.ge.com (localhost [127.0.0.1])
	id i1RKqo1S005275	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Feb 2004 15:52:50 -0500 (EST)
Message-ID: <77FE4A1FA59FF947845A42194AD6676277311E@uswaumsx07medge.med.ge.com>
From: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 27 Feb 2004 14:52:41 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: How to access NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been trying to figure out how to access NOR flash using MTD for the
last couple days but without success.  Can someone point me in the right
direction?

I have two NOR flash chips, each with it's own Chip Select, that are
mapped into physical memory.  I just need to be able to erase and write
whole blocks without the use of an overlaying filesystem.

I looked through the archives (is there a good way to search it?) and
noticed that there were significant changes made last Oct/Nov that
invalidate the howto.  I'm not sure how to proceed to setup the
necessary partitions and mtdblock devices.  What configuration options
and changes do I have to make?

Any assistance would be greatly appreciated.

Dan
