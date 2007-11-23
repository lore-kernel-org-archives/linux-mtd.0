Received: from mail.davidb.org ([66.93.32.219])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IvdSJ-0007wt-EH
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 13:40:53 -0500
Date: Fri, 23 Nov 2007 10:40:29 -0800
From: David Brown <mtd@davidb.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block
	Device Layer Over MTD ?
Message-ID: <20071123184029.GA11033@old.davidb.org>
References: <20071121213257.GI20871@lazybastard.org>
	<305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
	<20071121225425.GA24327@lazybastard.org>
	<Pine.LNX.4.64.0711220858190.523@lnxricardw.se.axis.com>
	<20071122132650.GA27525@lazybastard.org>
	<Pine.LNX.4.64.0711230836240.523@lnxricardw.se.axis.com>
	<1195805904.3231.87.camel@sauron>
	<Pine.LNX.4.64.0711231007070.523@lnxricardw.se.axis.com>
	<1195809712.3231.96.camel@sauron>
	<Pine.LNX.4.64.0711231026510.523@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0711231026510.523@lnxricardw.se.axis.com>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 23, 2007 at 10:28:24AM +0100, Ricard Wanderlof wrote:

>On second thought, I think that the degradation of the data in a
>flash memory cell is mostly due to read operations, so if no read 
>operations are performed, the data should be fairly secure. Then again, 
>there are subtle effects such as cosmic radiation flipping bits at any 
>random location, etc.

Flash should be reasonably immune to degradation from reads.  In fact, it
is fairly resiliant to degradation at all.

In NAND, the primary cause of read failures is caused by writes (and
rewrites) of subsequent pages within a block.  These can cause bit flips in
earlier written pages.  This gets worse with higher density, and is the
main reason the higher density devices have greater restrictions on
rewrites.

David
