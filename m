Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ThDb-0001UT-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 10:34:55 +0000
Date: Thu, 24 Jan 2002 11:45:55 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Navin Boppuri <navin.boppuri@newisys.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD partitioning for AMD flash chips
Message-ID: <20020124114555.A26273@wohnheim.fh-wedel.de>
References: <D3A72C5007329A4F991C0DD87202259F0EAFBA@sekhmet.ad.newisys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3A72C5007329A4F991C0DD87202259F0EAFBA@sekhmet.ad.newisys.com>; from navin.boppuri@newisys.com on Wed, Jan 23, 2002 at 05:21:26PM -0600
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

Hi!

> I am new the MTD mailing lists. I have two AM29LV641D( 4M X 16) flash
> chips connected to a 32 bit bus.(sector size is 128k). I  would like to
> partion this device so that I may mount a JFFS2 flash file system on one
> of the partitions and use the rest of the device for raw data.  I do see
> some examples to do this for some intel chips in drivers/mtd but I dont
> see anything for the AMD chips. Is the interface similar for the AMD
> chips?

You have two options:
1. Writing your own driver for this flash type, hardcoding the
partitioning. Try physmap first and hardcode the flash size, mapping
and pertitioning, once it works.

2. Using an existing one (physmap ought to work) and using one of the
existing partition parsers. The ones in the stock kernel are all
specific to a certain bootloader, I wrote an independent one but there
is no good howto for it (yet). See
http://wh.fh-wedel.de/~joern/software/kernel/ if you are interested.

Jörn

-- 
Often, the most striking and innovative solutions come from realizing
that your concept of the problem was wrong.
-- Eric Raymond in "The cathedral and the bazaar"
