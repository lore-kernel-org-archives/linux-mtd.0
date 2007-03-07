Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HP0un-00017H-DY
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 13:31:08 -0500
Subject: RE: JFFS2 Support for Large Flash Designs
From: Thomas Gleixner <tglx@linutronix.de>
To: ian@brightstareng.com
In-Reply-To: <200703071317.38907.ian@brightstareng.com>
References: <mailman.311.1173272465.2275.linux-mtd@lists.infradead.org>
	<200703071223.07485.ian@brightstareng.com>
	<1173289687.24738.654.camel@localhost.localdomain>
	<200703071317.38907.ian@brightstareng.com>
Content-Type: text/plain
Date: Wed, 07 Mar 2007 19:37:14 +0100
Message-Id: <1173292634.24738.663.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-03-07 at 13:17 -0500, ian@brightstareng.com wrote:
> On Wednesday 07 March 2007 12:48, Thomas Gleixner wrote:
> > SoC devices out of tree are a seperate steaming pile of ... I
> > have seen too many chip vendor kernels explode when you just
> > try to do anything else than run "hello world" on them.
> 
> I agree that this is far from ideal -- I have to deal with this 
> all the time.  But I also appreciate that some vendors do 
> actually bother to contribute some base code to support their 
> designs, even if I have to go in and fix it.
> 
> The vendors need to do better job at establishing a framework to 
> solicit fixes, improvements and new code from their customers, 
> integrate it, and feed it up the tree into the mainline. It is 
> clearly to their benefit.

As well as it would be for out of tree drivers and such. The time people
spend to catch up with mainline to maintain their #ifdef mess would be
much more useful spent when the stuff would be in tree.

	tglx
