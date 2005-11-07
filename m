Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZCXR-0006Ci-Pw
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 14:20:23 -0500
Received: from mail.tec.linutronix.de (unknown [192.168.0.1])
	by mail.tglx.de (Postfix) with ESMTP id 825B665C3FA
	for <linux-mtd@lists.infradead.org>;
	Mon,  7 Nov 2005 20:16:53 +0100 (CET)
Received: from tglx.tec.linutronix.de (tglx.tec.linutronix.de [192.168.0.68])
	by mail.tec.linutronix.de (Postfix) with ESMTP id D7F2C28062
	for <linux-mtd@lists.infradead.org>;
	Mon,  7 Nov 2005 20:20:23 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 7 Nov 2005 20:24:09 +0100
References: <200511071915.03263.tglx@linutronix.de>
In-Reply-To: <200511071915.03263.tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200511072024.10121.tglx@linutronix.de>
Subject: Re: MTD git repository status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 07 November 2005 19:15, Thomas Gleixner wrote:
> I've updated the mtd git repository hopefully in time for 2.6.15.

Some rant about MTD CVS commits

I asked some time ago for some discipline regarding the CVS usage.

Some MTD developers gracefully provide

=2D separate commits for non related changes
=2D patches without trailing white spaces
=2D syntactically correct commit messages
=2D understandable short and long comments

	Thanks


Some others use the CVS down to their whim.

Is it so hard to comply to some simple rules ?

1. Commit after testing and do not abuse the CVS as your private trash bin

If you have the urge to document your hacking sessions, do this in your=20
private CVS or create a branch in the MTD-CVS preferably named=20
mtd-yourname-tinkerbox

2. Check for trailing white space _before_ you commit.

3. Do _not_ commit changes which add=20
   a)	// old code or
	/* old code */
   b)	#if 0
		old code
	#endif

   a) is a no no
   b) use when such an exclude is necessary:
	/* Comment why this is disabled */
	#ifdef ENABLE_BROKEN_FEATURE
	#endif

4. Commit unrelated changes in separate commits

5. Use the requested commit message format
   [MTD] <core, chips, maps, nand, onenand> <file>: Short description
   or
   [JFFS2] Short description
   <Blank line>
   <Long description>=09

6. Write understandable comments, which give an information what the commit=
 is=20
doing, rather than some sloppy blurb. Using cryptic abbreviations is also n=
ot=20
really helpful. See also linux/Documentation/SubmittingPatches


Some example commits for illustration:

=2D--------------------------------------------------------

[JFFS2] minor refinements
[JFFS2] remove forgotten stuff

Really descriptive !

=2D--------------------------------------------------------

Add support for "4G Systems MTX-1 Flash device", better known as meshcube.
Modified Files:
        Kconfig Makefile.common mphysmap.c
=2E..

This is obviously a patch for non kernel parts of the CVS. Err, wait....

Depends mphysmap.c on MTX-1 support or is it the other way round ?

=2D--------------------------------------------------------

[JFFS2] Fix debugging stuff here as well

Here ? In Timbuktu ?

=2D--------------------------------------------------------

Commits with commit messages consisting of 3 empty lines

Is this a guessing game ?

=2D--------------------------------------------------------

[JFFS2] roll-back the last fix. JFFS2 uses strange technique - upper caller=
s=20
clean the shit which the lower function leave... In theory, everybody shoul=
d=20
free its own crap... Would be nice to fix - i believe, not everything is=20
cleaned well.

Excellent short description! Perfectly fitting in a line of 80 chars. And t=
he=20
careful wording is extraordinary.

It definitely leads to extended eruptions of swearing when somebody has to=
=20
review and clean up that #=A7$%&@*!

=2D--------------------------------------------------------

=46ive consecutive commits changing one file forth and back within 10 minut=
es !

Really simple to review, especially when the commit messages are so clear a=
nd=20
the commit flood changes random files aside the one which is the main worki=
ng=20
target.

=2D--------------------------------------------------------

[OneNAND] More fancy handling of DDP
<END of commit message>

Is [OneNAND] a new subsystem ?

DDP ?=20
I know what DDP means in this context, but when somebody else tries to=20
understand the message, he might try Google first:

Some Google explanantions from the first page
Delivery Duty Paid
Distributed Data Processing
Data Delivery Protocol
Decentralized Development Planning

=2D--------------------------------------------------------

Trailing white spaces introduced since the last git update

diffstat whitespace.diff
 drivers/mtd/Kconfig                 |    4 -
 drivers/mtd/chips/cfi_cmdset_0001.c |    6 -
 drivers/mtd/inftlmount.c            |    2
 drivers/mtd/maps/ixp2000.c          |    2
 drivers/mtd/maps/mtx-1_flash.c      |    2
 drivers/mtd/maps/pq2fads.c          |   14 +--
 drivers/mtd/maps/tqm834x.c          |    8 +-
 drivers/mtd/maps/ts5500_flash.c     |    2
 drivers/mtd/nand/au1550nd.c         |    6 -
 drivers/mtd/nand/s3c2410.c          |    2
 drivers/mtd/nand/sharpsl.c          |    6 -
 drivers/mtd/onenand/onenand_base.c  |   24 +++---
 drivers/mtd/rfd_ftl.c               |  112 ++++++++++++++---------------
 fs/jffs2/build.c                    |    2
 fs/jffs2/debug.c                    |   28 +++----
 fs/jffs2/debug.h                    |    8 +-
 fs/jffs2/gc.c                       |    4 -
 fs/jffs2/nodelist.c                 |  136=20
++++++++++++++++++------------------
 fs/jffs2/nodemgmt.c                 |    6 -
 fs/jffs2/readinode.c                |   64 ++++++++--------
 fs/jffs2/summary.c                  |    8 +-
 fs/jffs2/wbuf.c                     |   14 +--
 include/linux/jffs2.h               |    2
 include/linux/jffs2_fs_sb.h         |    2
 include/linux/mtd/bbm.h             |    2
 include/linux/mtd/cfi.h             |    2
 include/linux/mtd/onenand.h         |    2
 27 files changed, 235 insertions(+), 235 deletions(-)

=46igure yourself, who earns the most credits for being sloppy

	tglx
