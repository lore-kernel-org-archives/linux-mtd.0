Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CB1Ho-0006Ry-Su
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2004 21:23:42 -0400
Received: from [10.0.10.193] (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id SAA26202
	for <linux-mtd@lists.infradead.org>; Fri, 24 Sep 2004 18:23:35 -0700
Message-ID: <4154C897.3030008@mvista.com>
Date: Fri, 24 Sep 2004 18:23:35 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Supporting flash that is locked by default
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Various flash chips may be locked (at a chip or block level) at power-on 
(perhaps depending on the board wiring), requiring an unlock before 
writing to the device.  It doesn't seem unreasonable to require one to 
run flash_unlock on appropriate partitions before writing to the device, 
at least in the case of initially mounting filesystems during system 
startup.  Platforms that power-cycle the device during a suspend/resume 
make this a little more complicated, since there's not really a standard 
way to insert the necessary flash_unlock commands into the system resume 
sequence, especially for a writeable root filesystem.   (For example, 
the Intel XScale PXA27x uses K3 StrataFlash, which powers up with all 
blocks locked and power-cycles the chip on suspend.)

This could all be handled inside the kernel, unlocking blocks as written 
to (if the block has not been explicitly locked).  But keeping track of 
which blocks are supposed to be unlockable is a messy business, and 
could fairly be accused of placing intelligence or policy in the kernel 
that is better left to userspace.  I don't, however, have an easy answer 
for how to handle the suspend/resume case.  The embedded engineers I've 
talked to felt this was a hardware detail the kernel should take care of 
for them, and it might not be that bad of an idea to have the kernel 
restore the flash to pre-suspend state by keeping track of 
previously-unlocked blocks.

So I thought I'd ask whether an architectural direction for linux-mtd 
has been set in this regard, or whether anybody has an opinion on this. 
  Thanks for any insight you can add,

-- 
Todd Poynor
MontaVista Software
