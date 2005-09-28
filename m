Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKclc-0005vW-KU
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 10:19:02 -0400
Message-ID: <433AA62B.20102@ieee.org>
Date: Wed, 28 Sep 2005 10:18:19 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
References: <4339830F.14600.1D083FD@localhost>
In-Reply-To: <4339830F.14600.1D083FD@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot: "diskonchip" driver depreciated?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joseph M Dupre (AVAB Inc.) wrote:
> The DOCboot README refers to the kernel's diskonchip driver.

There are more than one.  By referring in the README to the "diskonchip" 
driver, I mean specifically the driver that is *called* "diskonchip". 
(The parenthesized hint in step one about doing "modprobe diskonchip" is 
intended to make this clear).

> I am currently working with an un-patched 2.6.11.12 kernel.  It it 
> there are drivers for Disk-On-Chip 2000 and various Millennium 
> devices.  These are all marked depreciated.  Menuconfig help suggests 
> to use the generic NAND device driver instead on the Disk-On-Chip 
> driver.

I'll have to check the menuconfig wording, but what it should say is to 
use the new DOC driver that works *with* the generic NAND device layer, 
rather than the old DOC driver(s) that doesn't.  If you enable NAND 
support, you'll find this new driver.

> Should this generic NAND driver work in conjunction with the DOCboot 
> code and a "newer" DOC 2000 device?

Yes.

> I'm not tied to this kernel by any means, it is just what was current 
> when I started.  But I _do_ need to get booting from the DOC 2000 
> device and have not yet figured out how to do this.  I am using the 
> DOC MD2202 series DIP on an i486 platform.

Should work fine; let me know if you need any more help.

	-Dan
