Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qdVF-0003PM-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 17:15:57 +0000
content-class: urn:content-classes:message
Subject: RE: JFFS2 NAND flash support
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 Mar 2002 17:23:10 -0000
Message-ID: <541025071C7AC24C84E9F82296BB9B952CE6@OPTEX1.optex.local>
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

> > The jffs2 stuff in my kernel sources doesn't seem very up to date so
> > I've got the latest CVS stuff. Which branch of cvs do I need to use?
> > Should I update the whole of the mtd subsystem or can I just use the
> > updated jffs2 stuff?

> The current developer branch. Take care there were a lot of changes in
> nand.c and hardware driver files. See nand.c / autcpu12.c

I've tried compiling the latest stuff on the CVS trunk, but cannot get
JFFS2 to work. I've compiled it as a module, but when I try to load it I
get a whole load of messages about missing zlib_ symbols:

e.g.
/lib/modules/2.4.17-rmk5/kernel/fs/jffs2/jffs2.o: unresolved symbol
zlib_inflate

I'm guessing that the zlib code has been moved recently so it can be
shared across several modules in the kernel. I am using 2.4.17; what is
the best thing for me to do?

Regards,
John Hall
