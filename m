Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hjx6p-00023C-76
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 08:42:04 -0400
Date: Fri, 4 May 2007 14:41:46 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/5] jffs2: Add LZO compression support to jffs2
Message-ID: <20070504144146.6a91d974@dhcp-252-105.norway.atmel.com>
In-Reply-To: <1178278532.11120.274.camel@pmac.infradead.org>
References: <1178278255.5839.47.camel@localhost.localdomain>
	<1178278532.11120.274.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Satyam Sharma <satyam.sharma@gmail.com>,
	Richard Purdie <rpurdie@openedhand.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 04 May 2007 12:35:32 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Fri, 2007-05-04 at 12:30 +0100, Richard Purdie wrote:
> > +config JFFS2_LZO
> > +       bool "JFFS2 LZO compression support" if JFFS2_COMPRESSION_OPTIONS
> > +       select LZO   
> 
> Please make it _depend_ on LZO instead. If you do that, I can merge the
> JFFS2 bits in anticipation of the core LZO code going upstream.

Hmm...everything else in lib/Kconfig is supposed to be _selected_, not
depended upon. And the only three items in there which can actually be
selected by the user all begin their helptexts with

"This option is provided for the case where no in-kernel-tree modules
require FOO functions".

Are you sure it's a good idea to break with existing practice? I'm
concerned that nobody will ever find the JFFS2_LZO option if it means
they will have to go all the way down to the "Library functions" menu
and select something to make the option visible...

Haavard
