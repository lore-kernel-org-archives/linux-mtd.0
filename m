Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4c8M-0004z5-TK
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 04:51:44 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Keshavamurthy Anil S <anil.s.keshavamurthy@intel.com>
In-Reply-To: <20050224155559.A727@unix-os.sc.intel.com>
References: <44BDAFB888F59F408FAE3CC35AB47041014F9285@orsmsx409>
	<1109206700.8215.4.camel@windu.rchland.ibm.com>
	<20050223171559.A23461@unix-os.sc.intel.com>
	<1109259722.3796.22.camel@localhost.localdomain>
	<20050224155559.A727@unix-os.sc.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1109325105.3033.10.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Fri, 25 Feb 2005 10:51:45 +0100
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, lorenzo@gun.org,
	Lorenzo =?ISO-8859-1?Q?Hern=E1ndez_?= =?ISO-8859-1?Q?Garc=EDa-Hierro?=
	<lorenzo@gnu.org>
Subject: Re: xattr support  for JFFS3
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-25 at 00:56, Keshavamurthy Anil S wrote:
> On Thu, Feb 24, 2005 at 04:42:02PM +0100, Lorenzo Hernández García-Hierro wrote:
> > I've read the tech. specs. of JFFS2 as David recommended to me, so, we
> > should separate two possible solutions:
> Can you please point me to the same spec.
> > 
> > 	- use a new node type(s)     <- what David likes (& wants AFAIK)
> > 	- use reiserfs style-storage <- what I have done partially

I backup Davids POV. xattrs should go into new node type(s) rather than
into the reiser style "everything is a directory" approach. It's an ugly
hack. I prefer designed functionality over the patchwork approach. I
know that it will take more time, but it will fit better and will be
easier to maintain.

tglx
