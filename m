Received: from dhcp695.linuxsymposium.org ([209.151.10.193]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g4e3-0003Ca-F6
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 16:38:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f4ebb46f6708c1c@[130.161.115.44]>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
Message-Id: <1059147413.28255.40.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 25 Jul 2003 11:36:55 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-07-25 at 11:12, J.D. Bakker wrote:
> Hi all,
> 
> I have an expansion board for the LART (an embedded computer based on 
> the DEC/Intel StrongARM) with eight NAND flash devices on it. As 
> suggested by the Toshiba datasheet, they share data, CLE, ALE, nWE 
> and nRE and RDY. Each chip has its own nCE line.
> 

If they each had their own data/CLE/ALE etc you'd use mtdconcat. As it
is, you want the code I've half-written to handle multiple chips in one
MTD device.

> I would like to use all eight chips with mtdconcat and YAFFS. Given 
> the above, how should I hook the eight NANDs up to the mtd layer ? 
> I've gone through CVS, but haven't found any hints in The Source.

Look at the changes I've made recently. They're the first half of what's
needed.

> By the way, is mtd multi-threaded whne using multiple devices ? 
> Should I worry about overlapping address/data phases to separate NAND 
> chips ?

It will be, yes -- but at the moment it doesn't actually _use_ multiple
devices; it only manages the probe. We need to fix the read/write/erase
methods to handle multiple chips; selecting the right chip, etc.

> [who inflicted the LART_ENDIAN_BYTE ordering on mtd]

:)

-- 
dwmw2
