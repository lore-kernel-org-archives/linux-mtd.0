Received: from mailbox1.avalonworks.net ([216.58.97.66])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6dH3-0000KN-V0
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 22:52:14 +0100
Received: from server (i216-58-9-209.igs.net [216.58.9.209])
	h96LpFDT001899	for <linux-mtd@lists.infradead.org>;
	Mon, 6 Oct 2003 17:51:15 -0400 (EDT)
	(envelope-from ilatypov@infradead.org)
Received: from ilgiz by server with local (Exim 3.36 #1 (Debian))
	id 1A6dG9-0001O1-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 17:51:17 -0400
Date: Mon, 6 Oct 2003 17:51:17 -0400
From: Ilguiz Latypov <ilatypov@infradead.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20031006215117.GA5320@ei.homeip.net>
References: <E1A6b7A-0004WA-Gx@pentafluge.infradead.org>
	<20031006213435.38037.qmail@web9906.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031006213435.38037.qmail@web9906.mail.yahoo.com>
Sender: Ilguiz Latypov <ilatypov@infradead.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, Oct 06, 2003 at 02:34:35PM -0700, Slim wrote:
> > When you can boot from doc using grub, that's a good start. You may
> > actually edit the boot command line when grub is booted. It supports
> > auto-completion for you to easily locate your kernel image.
> 
> I've tried now to boot the hard disk based kernel to allow editing to
> try the above, but the doc-grub always loads despite changing the boot
> device in the bios setup.

The GRUB's 'e' key will allow to edit the configuration file in-memory.
And the 'c' key will bring to the GRUB's shell prompt.

-- 
Ilguiz Latypov

tel.  +1 (519) 569-8746
66 Wildlark Crescent
Kitchener, Ontario N2N 3E9
