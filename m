Received: from e36.co.us.ibm.com ([32.97.110.154])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GlQJs-00067y-13
	for linux-mtd@lists.infradead.org; Sat, 18 Nov 2006 08:33:28 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kAIDWtS3010389
	for <linux-mtd@lists.infradead.org>; Sat, 18 Nov 2006 08:32:55 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kAIDWt7F289422
	for <linux-mtd@lists.infradead.org>; Sat, 18 Nov 2006 06:32:55 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kAIDWsKQ026836
	for <linux-mtd@lists.infradead.org>; Sat, 18 Nov 2006 06:32:55 -0700
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1163855713.5597.70.camel@sauron>
References: <20061117184055.569da7ad@localhost.localdomain>
	<1163855713.5597.70.camel@sauron>
Content-Type: text/plain
Date: Sat, 18 Nov 2006 07:33:03 -0600
Message-Id: <1163856784.20835.2.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kbaidarov <kbaidarov@dev.rtsoft.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-11-18 at 15:15 +0200, Artem Bityutskiy wrote:
> Hello Konstantin,
> 
> On Fri, 2006-11-17 at 18:40 +0300, kbaidarov wrote:
> > Description:
> > The following patch adds readonly block device layer over mtd
> > that allows to use any filesystem on this device in RO mode and
> > thus gain faster mount times and better throughput rates.
> 
> This is very ambition claim. In comparison with what?
> 
> > How it works:
> > Blocks translation routine was added to read sector function. Assuming
> > that bad block won't appear during MTD reading and BBT is correct, bad
> > block is skipped and requested block is lazily mapped to good one.
> > Block driver based on the mtd readonly device driver mtdblock_ro.c and
> > translation routine was taken from the patch of Pantelis Antoniou
> > (which can be found at
> > http://lists.infradead.org/pipermail/linux-mtd/2004-May/009672.html).
> > 
> 
> So basically this is bad eraseblock-aware mtdblock_ro? But why you
> created a new driver and with so weird name :-) ? Why didn't you just
> changed mtdblock_ro? IOW, why you didn't adapt Pantelis' patch instead
> and re-send it? (I have no idea why this patch isn't im MTD still,

Because we've consistently told people not to do that.

josh
