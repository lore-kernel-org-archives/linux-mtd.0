Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1984p6-00007p-8v
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 21:57:04 +0100
Date: Tue, 22 Apr 2003 22:57:12 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Kelly, Mike - ACDIN" <Michael.Kelly@itt.com>
Message-ID: <20030422205712.GC662@wohnheim.fh-wedel.de>
References: <998FEBD9C16DD211881200A0C9D61AD705AD5F56@acdfwx3.acdin.de.ittind.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <998FEBD9C16DD211881200A0C9D61AD705AD5F56@acdfwx3.acdin.de.ittind.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Does jffs2 garbage collection include erasing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 April 2003 15:08:55 -0500, Kelly, Mike - ACDIN wrote:
> 
> When one discusses garbage collection, does that include erasure of the
> flash device?  Should manual activation of the garbage collection by sending
> the SIGHUP signal to the jffs2 process also cause the process to start
> erasing part of the flash device?

Short answer:
http://lxr.linux.no/ident?v=2.5.56&i=jffs2_garbage_collect_pass

Long answer:

jffs2_garbage_collect_pass is called from the GC thread, but also from
all processes writing to flash. The GC thread basically runs
permanently on idle systems and a little on busy ones. Sending SIGHUP
to it triggers exactly one run of jffs2_garbage_collect_pass, so a
single signal will barely be noticed. Not at all for idle systems.

> Thanks for any assistance you can give me -- a jffs2 newbie. 

Doing what I can, a newbie myself.

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
