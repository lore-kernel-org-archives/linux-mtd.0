Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTebY-00031C-66
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 06:28:48 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Andy Hawkins <a.hawkins@cabletime.com>
In-Reply-To: <1085737289.5617.3.camel@adh>
References: <1085737289.5617.3.camel@adh>
Content-Type: text/plain
Message-Id: <1085740123.26119.62.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 28 May 2004 11:28:43 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Large flash concatenation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-05-28 at 10:41 +0100, Andy Hawkins wrote:
> Hi,
> 
> I'm trying to add support to the kernel for concatenating a number of
> large flash devices (1Gb Samsung K9F1G08).
> 
> I've added the following line to nand_ids.c:
> 
> 	{"NAND 1GiB 3,3V", 0xf1, 30, 0x4000, 0},

Er, that part is 1Gib, not 1GiB. 1Gib is 128MiB.

> I want to be able to use these multiple chips as a single flash
> filesystem (probably JFFS2).

That's a lot of flash -- JFFS2 doesn't scale too well at the moment.

To make JFFS2 work better, we need to reduce the memory usage -- partly
by reducing the size of some structures (we can drop totlen from the
jffs2_raw_node_ref with a bit of effort), and partly by reducing the
_number_ of such structures -- perhaps we should increase the maximum
data payload on a single node from 4KiB to 16KiB or more -- thereby
reducing the number of nodes a lot.

We also really need to do checkpointing to reduce mount time.

It would be interesting to try JFFS2 -- but I suspect you may do better
with YAFFS2 at the moment.

-- 
dwmw2
