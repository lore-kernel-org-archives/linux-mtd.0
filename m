Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgQSH-0006tJ-SK
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 15:27:45 +0000
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1074001140.17620.3.camel@hades.cambridge.redhat.com>
References: <20040113125031.GA5146@angel.research.nokia.com>
	 <1074001140.17620.3.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1074007527.9219.11.camel@spawn.uab.ericsson.se>
Mime-Version: 1.0
Date: Tue, 13 Jan 2004 16:25:28 +0100
Content-Transfer-Encoding: 7bit
cc: MTD List <linux-mtd@lists.infradead.org>
cc: "Jarkko Lavinen \(NMP/Helsinki\)" <jarkko.lavinen@nokia.com>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-13 at 14:39, David Woodhouse wrote:
> On Tue, 2004-01-13 at 14:50 +0200, Jarkko Lavinen (NMP/Helsinki) wrote:
> > Is there anything that could be done to reduce the mount time of large
> > JFFS2 partitions?  Lazy mounting with prioritized scanning?
> 
> We improved it a lot by not checking CRC32 on all nodes until later --
> but we still need to read the whole medium at mount time.
> 
> We _can_ fix that. There's a limited amount of knowledge we're gaining
> from our scan at mount time. For each inode on the medium, we need:
> 		Its nlink
> 		A list of the physical addresses of all its nodes
> 
> We currently read the whole of every eraseblock to work this out.
> However, we could write a block 'tailer' at the _end_ of each eraseblock
> as we fill it, containing enough information in compressed form about
> the contents of the eraseblock.
> 
> That would mean that we only have to read a small proportion of each
> properly-finished eraseblock, and should speed up the mount
> significantly.

I have done some work on the JFFS2 code in u-boot and found that the
fastest way was to load the entire FLASH into a continuous disk image in
DRAM and then have code that directly dereference pointers into this
image without any access functions or read on demand.

When I tried to be smart and skip the copy and only read in what needed
to be read that was significantly slower.

Never underestimate brute force :)

If you have very very poor bandwidth from the flash the the reverse is
true but I had to slow down my flash 10 times to break even. 
