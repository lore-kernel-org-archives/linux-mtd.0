Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CveLp-00088K-KP
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 11:24:37 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 31 Jan 2005 17:22:58 +0100
Message-Id: <1107188578.21196.346.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 11:14 -0500, Robert P. J. Day wrote:
> > > -p, --pad[=SIZE] Pad output to SIZE bytes with 0xFF. If SIZE is
> > >                         not specified, the output is padded to the
> > > 			end of the final erase block
>
> at the moment, this is not being followed.  for instance, mkfs.jffs2
> has the --pad=SIZE option, where a simple number is treated as KiB.
> anyway, you get idea -- it's pretty confusing.

???

It's just missing the k and M suffixes. So its easy to fix.

tglx
