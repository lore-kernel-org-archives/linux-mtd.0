Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WhXo-0004yh-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 18:36:44 +0000
Subject: Re: CRAMFS on MTD/NAND Issue
From: Russ Dill <Russ.Dill@asu.edu>
To: Henrik Nordstrom <hno@marasystems.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Srinivasu.Vaduguri@nokia.com,
   linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0301090206130.14735-100000@filer.marasystems.com>
References: <Pine.LNX.4.44.0301090206130.14735-100000@filer.marasystems.com>
Content-Type: text/plain
Message-Id: <1042139267.10724.34.camel@timmy>
Mime-Version: 1.0
Date: 09 Jan 2003 12:07:48 -0700
Content-Transfer-Encoding: 7bit
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

On Wed, 2003-01-08 at 18:08, Henrik Nordstrom wrote:
> On Wed, 8 Jan 2003, Thomas Gleixner wrote:
> 
> > Mount your rootfs _readonly_ and you have the _same_ including bad block 
> > handling.
> 
> If a flag could be added to a jffs2 image denying it to be mounted 
> read-write then yes..
> 

I might reiterate that the end goal of cramfs is efficency, and decent
speed. The end goal of jffs2 is quite different (although it still
strives for those things). iirc, cramfs images usually end up being 5%
to 10% smaller than jffs2 images, they boot a lot faster, the code is a
lot smaller (especially helpfull if you want fs support in your
bootloader)

-- 
Russ Dill <Russ.Dill@asu.edu>
