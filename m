Received: from tomts23.bellnexxia.net ([209.226.175.185] helo=tomts23-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Y847-0003x5-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2002 17:35:43 +0100
Date: Fri, 26 Jul 2002 12:35:40 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: Frank Oltmanns <frank.oltmanns.ml@gmx.de>, <linux-mtd@lists.infradead.org>
Subject: Re: Compiling Grub for DOC2000
In-Reply-To: <200207260940781.SM02488@there>
Message-ID: <Pine.LNX.4.44.0207261230250.6899-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 26 Jul 2002, Mark Meade wrote:

> I've had good luck patching GRUB 0.92 with the 2002-05-30 patch at:

It's the autoconf/automake change.  These now require CCAS and CCASFLAGS
variables instead of AS and ASFLAGS.  The June 2002 MTD patch at the
savannah link you've mentioned will change those in Makefile.am's as
needed.  I advise to apply the patch against the post July 2, 2002 version
of GRUB if you need serial port console at boot time.

Ilguiz
