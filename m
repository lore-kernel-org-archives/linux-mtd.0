Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18J0MQ-00046T-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 23:52:22 +0000
Date: Tue, 3 Dec 2002 01:22:52 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: PK MK <linuxrouter2@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Single JFFS on Mutiple Partition problem
Message-ID: <20021203002252.GG10391@wohnheim.fh-wedel.de>
References: <20021202173039.75657.qmail@web14505.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021202173039.75657.qmail@web14505.mail.yahoo.com>
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

On Mon, 2 December 2002 09:30:39 -0800, PK MK wrote:
> 
>      Can anybody tell me whether a single
> MTD partion can span mutiple Flash ?
> This is so that I can have a single JFFS
> on mutiple flash.
>       Or can I have a single JFFS on
> Mutiple MTD partitions?

One jffs2, one partition, always.
You can combine several partitions into a single one using the concat
stuff, though.

And several flash chips can be put into a single device/partition if
they are NOR flash and use consecutive memory ranges.

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
