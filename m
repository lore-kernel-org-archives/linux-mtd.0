Received: from cerber.ds.pg.gda.pl ([153.19.208.18])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQLnt-0005AE-12
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 07:33:54 -0400
Date: Wed, 29 Aug 2007 12:22:41 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Sender: macro@blysk.ds.pg.gda.pl
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Prefix each line of multiline printk(KERN_<level>
	"foo\nbar") with KERN_<level>
In-Reply-To: <Pine.LNX.4.64.0708261305020.31149@anakin>
Message-ID: <Pine.LNX.4.64N.0708291205020.26167@blysk.ds.pg.gda.pl>
References: <1187999098.32738.179.camel@localhost>
	<Pine.LNX.4.64.0708261028120.31149@anakin>
	<8bd0f97a0708260354xb4c8546od0cc19a590820f32@mail.gmail.com>
	<Pine.LNX.4.64.0708261305020.31149@anakin>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-ide@vger.kernel.org, discuss@x86-64.org, linux-scsi@vger.kernel.org,
	Mike Frysinger <vapier.adi@gmail.com>,
	linux-acpi@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org,
	cluster-devel@redhat.com, blinux-list@redhat.com,
	tpmdd-devel@lists.sourceforge.net, linux-mips@linux-mips.org,
	jffs-dev@axis.com, mpt_linux_developer@lsi.com,
	Joe Perches <joe@perches.com>, linux-mtd@lists.infradead.org,
	osst-users@lists.sourceforge.net, linux-mm@kvack.org,
	parisc-linux@parisc-linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 26 Aug 2007, Geert Uytterhoeven wrote:

> What I mean is that probably there used to be a printk() call starting with
> `\n'. Then someone added a `KERN_ERR' in front of it.

 I gather '\n' at the beginning is to assure the following line is output 
on a separate line rather than as a continuation of another one which may 
have been output without a trailing '\n'.  A situation where printk() is 
called with a string containing no trailing '\n' may be discouraged, but 
there are some more or less justified exceptions.  For example the SCSI 
disk spin-up code is one.

 Therefore it may be reasonable for more critical messages -- perhaps not 
ones at KERN_ERR, but certainly KERN_CRIT and higher ones -- that may 
potentially happen asynchronously to start with '\n'.  In this case a call 
would look like this:

	printk("\n" KERN_CRIT "The actual message.\n");

Of course based on "console_loglevel" and "default_message_level" the 
leading '\n' may still get swallowed from what gets printed to the console 
terminal, but in reality I do not think that poses a problem, as these 
both can be set by a system administrator according to the local policy.

  Maciej
