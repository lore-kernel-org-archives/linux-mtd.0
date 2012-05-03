Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ0XB-0001qM-7P
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 18:13:45 +0000
Received: by lbbgg6 with SMTP id gg6so1815204lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 11:13:42 -0700 (PDT)
Date: Thu, 3 May 2012 21:13:34 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
Message-ID: <20120503211334.17c91b31@halley>
In-Reply-To: <Pine.LNX.4.64.1205030930540.8107@lnxricardw.se.axis.com>
References: <jnrm65$im4$1@dough.gmane.org>
 <Pine.LNX.4.64.1205030930540.8107@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Grant Edwards <grant.b.edwards@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard,
	
On Thu, 3 May 2012 09:35:14 +0200 (CEST) Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> 
> On Wed, 2 May 2012, Grant Edwards wrote:
> 
> > The NAND flash I'm using has to be written in 4K blocks -- isn't that
> > the "page size"?
> 
> The smallest writable unit in a NAND flash is called a 'page', but AFAIK 
> this is not what the -s option in mkfs.jffs2 is for. Instead, it is 
> related for the kernel memory managament page size, which is 4k for most 
> architectures.

According to MKFS.JFFS2(1),

	-s, --pagesize=SIZE
		Use page size SIZE.  The default is 4 KiB.  This size is
		the maximum size of a data node.

And according to http://linux-mtd.infradead.org/~dwmw2/jffs2.pdf

	In order to facilitate rapid decompression of
	data upon readpage() requests, nodes contain
	no more than a single page of data, according to
	the hardware page size on the target platform.

Wow.
I always assumed I had to set it according to NAND's page size, not
according to target system's mm page size.

Can you tell what's the effect of incorrectly setting it to values such
as: 512 or 2048 bytes (instead of 4KiB)?

Well, I guess as data is written during runtime by the jffs2 itself, and
as the GC gets working, new inodes will be correctly created, and their
sizes will be up to system's page size.

However what happens with these small inodes initially created by
mkfs.jffs2? "Only" a performance penalty or something worse?

Thanks,
Shmulik
