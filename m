Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKvrC-0002Ek-9T
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 08:32:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: paul.vangool@rinconnetworks.com
In-Reply-To: <20031115002533.GA15967@rinconnetworks.com>
References: <20031115002533.GA15967@rinconnetworks.com>
Message-Id: <1068885063.29549.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 15 Nov 2003 08:31:03 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: problem writing to /dev/mtd0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-11-14 at 16:25 -0800, Paul van Gool wrote:
> Hi,
> 
> I'm trying to read and write from/to a flash partition using its char
> device. Reading seems to work fine but I can't seem to get writing  to
> work.

> I use this flash chip through its block device all the time and writing
> through that device (/dev/mtdblock0) hasn't been an issue.

Did you erase the block in question first?

-- 
dwmw2
