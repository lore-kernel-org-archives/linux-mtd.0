Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lzfO-0005Aj-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2002 21:55:14 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Fri, 15 Mar 2002 17:05:49 -0500
Cc: ilatypov@superbt.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200203151705703.SM01632@there>
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

On Tue, 12 Mar 2002, Ilguiz Latypov wrote:

> inform that DoC Millennium and DoC Millennium Plus feature a Download
> Engine which takes care of copying the flash image into the read-only area
>available at offset 0 of the window.

> Apparently, the XIP IPL doesn't need the DoC 2000 trick with duplicating
> the code for 256-byte and 512-byte page size devices at offsets 0x100 and
> 0x200 respectively.

Ilguiz,

With a DoC Millennium , the doc_stage1 logic will always copy the 
256-byte-page code to RAM, regardless of the chip type.  In fact, because of 
the Millennium's 512 byte "boot block" window, the actual 512-byte page code 
is never directly accessible -- it is always located at 0x200 in this case.

As I mentioned previously, my hack to get my part to work was simply to force 
the 512-byte-page code to 0x100, and everything worked great.  If there are 
256-byte-page parts, this obviously won't work.

One alternative is to have both 256- and 512-byte code located at 
0x100..0x1FF, and determine (at run time) which type of part we have.

One way of doing this would be to have a small look-up table, and based on 
the chip ID, determine the part type.  

Another way (which I've already tested) is to read from flash address 0x200, 
using the 256-byte-page access method.  If we are indeed on a 256-byte 
device, the word at 0x200 will always match the code word at %cs:doc_stage1b.

In a 512-byte device, reading this address actually reads 0x400, which will 
*most likely* not match, as it is actually stage 2 GRUB code.  We could 
compare more bytes, if necessary, to reduce the possibility that this could 
happen.

Maybe there is an easier, cleaner way to handle this problem -- but I haven't 
found it yet.  Does it make sense to pursue this further?

Regards,

Mark
