Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZpjd-0007hN-H2
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 10:16:10 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9HEFvP1015933
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 16:15:57 +0200
Date: Tue, 17 Oct 2006 16:17:11 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: mtd-utils/nandwrite: what if write fails?
Message-ID: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="218815243-790689146-1161094631=:25906"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--218815243-790689146-1161094631=:25906
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


I have a question regarding writes to NAND flash; for instance, in=20
mtd-utils/nandwrite.c, prior to writing to a block, it is checked so that=
=20
it isn't bad (using the MEMGETBADBLOCK ioctl). However, what happens if=20
the block goes bad during write? If the pwrite() call which writes out the=
=20
page data fails, the application says perror() and exits. Shouldn't it=20
mark the block as bad, and re-write the data so far written to the block=20
to the next good block? As I understand it, mtd doesn't mark a block bad,=
=20
it is up to the application or overlying file system (e.g. JFFS2). So it=20
won't even help to run nandwrite again as the block has not been marked=20
bad.

Or have I missed something here?

(Or is it simply that normally nandwrite is only used during testing, or=20
writing an initial filesystem, and the likelyhood of a block failing at=20
precisely this time is rather small, compared to the rest of the lifetime=
=20
of the memory (i.e. repeated JFFS2 accesses)?)

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-790689146-1161094631=:25906--
