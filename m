Received: from finch-post-12.mail.demon.net ([194.217.242.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sPZw-0002xK-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2002 15:48:08 +0100
content-class: urn:content-classes:message
Subject: RE: JFFS2 NAND flash support
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 2 Apr 2002 15:56:12 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B950804D4@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: <gleixner@autronix.de>
Cc: <linux-mtd@lists.infradead.org>
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

On 28 March 2002 18:12 Thomas Gleixner <gleixner@autronix.de> wrote:

> > OK, I will take a look at the feasability of merging the two next
> > week after the holidays.

> I will check it in the next days too and will prepare the stuff,
> what's neccecary to support your hardware. This are only 3 things to
> do, IMHO
> 1. give the possibility to provide a hardware specific command write
> function
> 2. give the possibility to provide a hardware specific wait
> function,which can be interrupt driven, if the hardware has this
> feature.
> 3. rewrite the erase blocking
> Have a look in CVS after your Easter weekend.=20

Thomas,

Have you made any progress on this? If not, then I am willing to start
making the changes myself. I've been looking through the code and
started to create a smartmedia hardware-specific file similar to spia.c.
A change that I need is a function in nand.c that fills in most of the
fields of the mtd, as an alternative to nand_scan. I have therefore
added a function nand_fillin_mtd that fills in the fields in the mtd
that are relevant to nand flash apart from those to do with its size.
nand_scan also calls this.

> > In your opinion, is the solution that I have chosen (an interrupt
> > handler which schedules a tasklet) the best one for handling erases?
> > It seems a little little untidy, because reads and writes are
> > handled differently since they are synchronous. I haven't done much
> > 2.4 development, so I'm still feeling my way.

> Yep, it's a nice feature at all. But we should keep the synchronous
> functions for read/write as the max. delay is less, than running
> through an interrupt handler.

You're right - the context switches would give too big an overhead.

Regards,
John Hall
