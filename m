Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7GW3-0004HR-KW
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 16:18:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: David Updegraff <dave@cray.com>
In-Reply-To: <4065A81B.6020607@cray.com>
References: <406328A2.3060905@cray.com>
	 <200403270907.07298.tglx@linutronix.de>
	 <1080383077.17352.5.camel@imladris.demon.co.uk>
	 <200403271210.30061.tglx@linutronix.de>
	 <1080386714.17352.52.camel@imladris.demon.co.uk>
	 <4065A81B.6020607@cray.com>
Content-Type: text/plain
Message-Id: <1080404311.17352.69.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 27 Mar 2004 16:18:31 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: nand oob layout assumptions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-03-27 at 10:13 -0600, David Updegraff wrote:
> In all this discussion, the need for anyone outside the driver to know
> hardware positions of ECC and badblock markers still elludes me.  Yes, 
> various FS need to scribble oob info of their own in a particular 
> format, and in a way that won't scribble over ecc/badblock, but is there 
> anything more than that?

Nope. The file system just need to be told which are bad blocks, where
the ECC data are, and which bytes are still available. In fact, it
possibly doesn't even need to know where the ECC data are in the general
case.

> So, again, what if the 'oobsize' and 'oob_buf' (or a renamed relative 
> thereof) were interpreted to mean "region available in OOB for misc. 
> file system housekeeping, that will not stomp on private ECC or badblock 
> areas and will not be interpreted by nand driver".  And let the driver 
> put it wherever it wants/needs to in OOB.  Driver gets to ignorant of FS 
> details, FS gets to be ignorant of chip-HW-dependent ECC and badblock 
> layout.

Seems reasonable. We can make it a bitmask of available bytes, perhaps?

-- 
dwmw2
