Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WMgb-0002PB-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 20:20:25 +0000
Date: Wed, 8 Jan 2003 21:51:11 +0100 (CET)
From: Henrik Nordstrom <hno@marasystems.com>
To: Thomas Gleixner <tglx@linutronix.de>
cc: Russ Dill <Russ.Dill@asu.edu>, <Srinivasu.Vaduguri@nokia.com>,
   <linux-mtd@lists.infradead.org>
Subject: Re: CRAMFS on MTD/NAND Issue
In-Reply-To: <200301082127.24636.tglx@linutronix.de>
Message-ID: <Pine.LNX.4.44.0301082150360.9902-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 8 Jan 2003, Thomas Gleixner wrote:

> > roll your own: Please, make a static compressed filesystem (like cramfs)
> > that incorporates extra blocks, so that when the checksum is bad while
> > initially writing the filesystem, or reading the file system (in the
> > case where ecc can save the data), it rewrites this block to a free
> > sector). It would seem like a simple modification to cramfs to me.
> Don't reinvent the wheel! :)

Having a image based filesystem which cannot be written to has it's 
beauty..

Regards
Henrik
