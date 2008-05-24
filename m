Received: from web36708.mail.mud.yahoo.com ([209.191.85.42])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JztXt-0005q3-7a
	for linux-mtd@lists.infradead.org; Sat, 24 May 2008 13:12:25 +0000
Date: Sat, 24 May 2008 06:12:23 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: "Jörn" Engel <joern@logfs.org>
In-Reply-To: <20080523132853.GC22384@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <380082.38285.qm@web36708.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Jörn Engel <joern@logfs.org> wrote:

> On Fri, 23 May 2008 05:49:48 -0700, Alex Dubov wrote:
> > 
> > We are talking about somewhat different things here. Userspace visible
> devices
> > (highest layer in mtd stack) must support something complex. Lower levers
> in
> > the mtd stack - not necessarily so.
> > 
> > Highest level "raw mtd" devices can be normal block devices with support
> for
> > custom commands. Intermediate and low level modules can do with simple
> > interface.
> 
> Either I misunderstand you or you are forgetting that filesystems deal
> with raw mtd devices, which are the lowest levels in your stack afaics.
> JFFS2 and LogFS will deal directly with the chip driver and bypass any
> intermediate layers.  UBIFS will talk to UBI as a middle layer, which
> again talks directly to the chip driver.
> 

Do UBI and JFFS always operate in terms of whole eraseblocks or they may
attempt  partial block writes? Different flash chips have different
capabilities in regard to writing and this can be used to some advantage.




      
