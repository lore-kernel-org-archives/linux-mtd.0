Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A3vPG-00031q-QQ
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2003 11:37:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: daniel@dmhome.net
In-Reply-To: <20030929102718.27650.qmail@mailshell.com>
References: <1064826976.29857.116.camel@host35>
	 <1064827342.29569.17.camel@hades.cambridge.redhat.com>
	 <20030929093754.7956.qmail@mailshell.com>
	 <1064829280.12791.3.camel@hades.cambridge.redhat.com>
	 <20030929102718.27650.qmail@mailshell.com>
Message-Id: <1064831794.13668.2.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 29 Sep 2003 11:36:34 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: raw nand on x86 - reference boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-09-29 at 18:27 +0800, daniel@dmhome.net wrote: 
> > drivers/mtd/nand/diskonchip.c
> Yep, i've seen that one, I completely forgot about it! Good idea, also
> the boards I am working with all have a doc socket already.  

Bear in mind you can use a Millennium to replace BIOS flash too -- if
you're arguing on grounds of cost, you need to compare the cost of your
NOR flash _and_ the NAND with the cost of a DiskOnChip Millennium of
similar size.

> Originally I was thinking about using etherboot as a base to start from,
> add support for booting images from a raw flash partition. (they already
> have this for booting from disk). 

If you're going to stick to booting from raw NAND flash that makes
sense. If you want to boot a kernel from a JFFS2 partition on NAND,
it'll be a lot of work to make it happen in etherboot.

-- 
dwmw2
