Received: from richardson.uni2.net ([130.227.52.104])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKdp5-00084T-5w
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2003 13:17:15 +0000
Received: from intermail2000.pallasdomain (firewall.pallas.dk [130.227.11.8])
	by richardson.uni2.net (8.11.6/8.11.6) with ESMTP id hAEDFpA04718
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2003 14:15:51 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 14 Nov 2003 14:15:51 +0100
Message-ID: <E8B61FD29D18EE4F849311F6423A9AF41DDCF6@intermail.pallas.dk>
From: "Agust Karlsson" <Gusti@pallas.dk>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 force erase.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all. I'm not quite sure if this is the forum to ask questions about =
jffs2, but i'll stick my neck out anyway.

My problem is that I have a small MTD system based on 2 AM29F016 chips =
i.e. 4MB and 32 128K erase sectors.

The definitions of JFFS2_RESERVED_BLOCKS_* are:
#define JFFS2_RESERVED_BLOCKS_BASE 1	//Opr. 3					/* Number of free =
blocks there must be before we... */
#define JFFS2_RESERVED_BLOCKS_WRITE (JFFS2_RESERVED_BLOCKS_BASE + 1)		/* =
... allow a normal filesystem write */
#define JFFS2_RESERVED_BLOCKS_DELETION (JFFS2_RESERVED_BLOCKS_BASE + 1)		=
/* ... allow a normal filesystem deletion */
#define JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE + 2)	=
/* ... wake up the GC thread */
#define JFFS2_RESERVED_BLOCKS_GCBAD (JFFS2_RESERVED_BLOCKS_BASE + 1)		/* =
... pick a block from the bad_list to GC */
#define JFFS2_RESERVED_BLOCKS_GCMERGE (JFFS2_RESERVED_BLOCKS_BASE)		/* =
... merge pages when garbage collecting */

On a freshly erased disk I have 14 free blocks, and then during run they =
decrease to JFFS2_RESERVED_BLOCKS_GCTRIGGER -1 before the garbage =
collector starts and it seems that the GC only erases down to =
JFFS2_RESERVED_BLOCKS_GCTRIGGER blocks.

Now I wonder, is there a possibility to force the garbage collector to =
erase all possibly erasable blocks.
At the moment I have a handle to see if the GC is running and once in a =
while i start it with SIGHUP if its not running already.
This in due amount of time erases those blocks I want.

But in some situations (software updates) I replace about 1M and after =
that replacement (and during) the disk access is unacceptably slow.

I would like to, as I know nothing is going to happen for a while, force =
the GC to erase all possible blocks in one sequence (even if it takes =
far amount of time) on my command.

Does anybody know if this is possible and how...

On beforehand thanks.

Gusti

--
Agust Karlsson            mailto:gusti@pallas.dk
Pallas Informatik A/S     http://www.pallas.dk
Aller=F8d Stationsvej 2D    Tel.: +45 48 10 24 10
DK-3450 Aller=F8d           Fax.: +45 48 10 24 01
