Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HP0LN-0000En-Fc
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 12:54:32 -0500
Date: Wed, 7 Mar 2007 18:54:24 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS2 Support for Large Flash Designs
Message-ID: <20070307175424.GA6245@xi.wantstofly.org>
References: <mailman.311.1173272465.2275.linux-mtd@lists.infradead.org>
	<200703071223.07485.ian@brightstareng.com>
	<1173289687.24738.654.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1173289687.24738.654.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, ian@brightstareng.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 07, 2007 at 06:48:07PM +0100, Thomas Gleixner wrote:

> SoC devices out of tree are a seperate steaming pile of ... I have
> seen too many chip vendor kernels explode when you just try to do
> anything else than run "hello world" on them.

Having spent quite some time looking at ARM SoC vendor ports, I'd
fully agree with Thomas here.  It's usually better to throw all the
crap they made away and start over from scratch, than to try to make
something useful out of what is there.
