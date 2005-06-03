Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1De7PQ-0000Xg-UV
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 04:20:05 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Benavides, Tony" <tony.benavides@intel.com>
In-Reply-To: <80C38847588CEF4EB97210D53B752C5D0BE3F253@fmsmsx402.amr.corp.intel.com>
References: <80C38847588CEF4EB97210D53B752C5D0BE3F253@fmsmsx402.amr.corp.intel.com>
Content-Type: text/plain
Date: Fri, 03 Jun 2005 10:20:29 +0200
Message-Id: <1117786829.20785.104.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Adding a latest snapshot to a 2.6.9 kernel base
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-02 at 18:33 -0700, Benavides, Tony wrote:
> I am trying to add the latest MTD snapshot to my 2.6.9 kernel base.
> After running the patchkernel.sh command I am assuming that my 2.6.9
> kernel is patched.

It is.

> Is this all I need to do to guarantee that the kernel is patched with
> the new MTD?

Yes

> I found that some files such as makefile.common and makefile.inc were
> not added and I had to manually add them.

The have not to be added, as the script copies/links Makefile.common to
targetpath/Makefile

> Is it common to have to go through every file and manually

Err, I guess we would not have a script if this is necessary.

>  add source or
> am I missing a flag passed to patchkernel.sh

patchkernel.sh -?

> It would be nice to streamline this?

If there is anything to streamline, feel free to provide a patch.


tglx
