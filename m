Received: from tele-post-20.mail.demon.net ([194.217.242.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qWIL-0002tx-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 09:34:09 +0000
content-class: urn:content-classes:message
Subject: RE: JFFS2 NAND flash support
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 Mar 2002 09:41:17 -0000
Message-ID: <541025071C7AC24C84E9F82296BB9B952CE4@OPTEX1.optex.local>
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

On 27 March 2002 18:16 Thomas Gleixner <gleixner@autronix.de> wrote:

> > I've adapted the NAND flash driver in the kernel tree and=20
> > that now seems
> > to work for me.

> maybe you have done duplicated work . See below.

> > The jffs2 stuff in my kernel sources doesn't seem very up to date so
> > I've got the latest CVS stuff. Which branch of cvs do I need to use?
> > Should I update the whole of the mtd subsystem or can I just use the
> > updated jffs2 stuff?

> The current developer branch. Take care there were a lot of changes in
> nand.c and hardware driver files. See nand.c / autcpu12.c Adaptions
> should made in hardware drivers like autcpu12 and not in nand.c If
> there's a neccecarity to do this, please contact me or David
> Woodhouse.

Which is the current development branch?

Our hardware interface is a btit weird (ALE and CLE are controlled by
address lines...). I also can get interrupts from the busy pin, so I've
changed the code so it doesn't do busy waits as nand.c does.

> > I also came across some problems with the existing NAND flash
> > driver, especially with erases. It doesn't seem to mark an erase as
> > done,
> >   i.e. instr->state =3D MTD_ERASE_DONE;

> It's fixed in CVS long ago

OK - I hadn't looked at the latest versions very carefully. Now I've
looked, I notice that if the erase fails the user callback is not
called. The documentation on the mtd website seems to imply that you
should set the status to FAILED and still call the callback. Is that
correct?

> > Also, when doing an erase it obtains a spin lock that disables all
> > bottom halves from running. It holds this lock for the duration of
> > the erase, which is up to 4ms in the code - is this really a good
> > idea? The Smartmedia specs say that this delay can be up to 400ms!=20

> There's no better to ensure, that erase read and write can coexist at
> the moment. But you're invited to hack a better solution :)

But you're holding a spinlock to ensure that your driver doesn't get
re-entered. Why do bottom halves need to be disabled at all?

> I this a new card type ? All chips and card types I know, have maximum
> block erase times of 20ms.

I'm just going by the Smartmedia spec. It says the maximum erase time is
400ms.

Regards,
John Hall
