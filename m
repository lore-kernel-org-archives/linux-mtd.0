Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184IAy-0000I9-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 10:51:44 +0100
Received: from mail.fh-wedel.de ([195.37.86.23])
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 1842v5-0000Rm-00
	for linux-mtd@lists.infradead.org; Tue, 22 Oct 2002 18:34:19 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.12.6/8.12.6/Debian-5) with ESMTP id g9MHT5wJ031698
	for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2002 19:29:05 +0200
Date: Tue, 22 Oct 2002 19:29:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021022172914.GA18411@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021022103936.GA24369@jupiter>
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

On Tue, 22 October 2002 12:39:36 +0200, Frank Neuber wrote:
> > Hmm, somewhere in my collection of yet-to-be-committed patches, I have
> > a variant of the physmap driver that does exactly this and is capable
> > of mapping up to eight independent devices. Interested?
> > 
> Yes, it would be nice to test your code :-)
> Maybe we can do this more generic to add this to cmdline.c.
> What do you think?

Actually, I am not very sure about cmdline.c at all. Is there a single
mapping driver that could not be replaced by physmap.c or mphysmap.c?

The ones I casually looked at did nothing more than hardcoding
addresses and similar stuff. Basically, they condense several config
options into a single one, making the kernel configuration easier.

A quick grep on 2.4.19-ac4 showed that 32 out of 32 mapping drivers
use ioremap.


Ok, enough rambling. Try this patch:
http://wh.fh-wedel.de/~joern/software/kernel/mtd.patch.mphysmap.2.4.19-untested

Should work fine, but I am living without test hardware, feedback or
motivation for six weeks now. "der Entwickler keine Haftung"

Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
