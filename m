Received: from cpe-66-189-17-154.ma.charter.com ([66.189.17.154]
	helo=server.bluepeach.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTg1c-00049n-H1
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 07:59:49 -0400
Message-ID: <65335.10.0.1.2.1085744407.squirrel@mail.bluepeach.com>
Date: Fri, 28 May 2004 07:40:07 -0400 (EDT)
From: "Richard Schmitt" <rschmitt@bluepeach.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: NAND Bad Block Algorithm, JFFS2, and CRAMFS
Reply-To: rschmitt@bluepeach.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We are using JFFS2 on NAND devices and are currently running into a
problem that I was hoping to get some guidance on.

We've created a 14MB partition.  We've configured the NAND driver to -
Verify Writes
- Enable ECC
- Disable Bad Block Checking

We've disabled Bad Block checking because as we understand it, this must
be disabled in order to support JFFS2.  I have a question on this that
I'll raise a bit further on.

We can copy a 64K jffs2 image onto the flash and mount it without problem.
 When we try to copy a 7MB image onto the flash, the copy will fail with a
generic 'input/output error'.

Our hypothesis is that there is a bad block somewhere in the flash that is
not hit with the 64K image but is hit with the 7MB image.  Because of this
and with Verify Writes enabled, the copy will fail.

This brings us back to the question introduced earlier.  If we need to
disable bad block checking with NAND in order to support JFFS2, then how
do we copy a JFFS2 image onto the flash if the flash has a bad block in
it?

The second piece of this question is that we really wanted to support two
partitions, one with a JFFS2, and another with CRAMFS.  We wanted to run
with the bad block algorithm on CRAMFS and without it on the JFFS2 one.
We've heard rummblings that this is not supported. Is that true or is
there some way that we can get that to work.

Rich
-- 
Richard Schmitt
CTO
Blue Peach Solutions
Phone: 877.BLU.PEACH (877.258-7322) x 704
Fax: 508.302.6183
http://www.bluepeach.com
