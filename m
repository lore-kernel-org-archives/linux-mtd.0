Received: from smtp.argonst.com ([72.165.80.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kclj2-0006HU-Oh
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 18:44:37 +0000
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Message-Id: <BAD66201-5E11-4E14-BE35-F23A186DEF53@argonst.com>
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
To: linux-mtd@lists.infradead.org
From: Allon Stern <allon.stern@argonst.com>
Subject: a complex map
Date: Mon, 8 Sep 2008 14:44:39 -0400
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've got the unique pleasure of dealing with a hardware design  
cramming a 64MB NOR flash onto a 23 bit address bus (Coldfire M5282).
The memory chip is a Numonyx Strataflash (P30). It's a single part on  
a 16 bit data bus.

A couple of questions:
#1: this chip appears as two dies; Each die has four small (32K)  
blocks at the bottom, with 128K blocks elsewhere. Is this a problem,  
particularly if the small blocks appear in the middle of an MTD  
partition? I'm assuming no problem. (I have concatenating support  
enabled to allow my partition to span the two dies)
#2: I control the high two address bits on the flash (A24 and A25)  
using GPIOs. I have a customized map for this flash which sets the  
GPIOs appropraitely for the offset being accessed. Is this is all I  
need to do?


The reason I ask, is because I'm running into some issues. In  
searching, I've found others having similar issues with previously  
stable systems (gumstix, in particular) but I can't help but wonder  
if I'm not doing something quite right.

One issue is that the MTD driver seems to think that the chip is in  
FL_POINT or FL_READY mode, when in fact it's in status mode. So when  
I attempt to mount a filesystem, I see:

host:~ # mount /dev/mtdblock4 /opt
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at  
0x00000000: 0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at  
0x00000004: 0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at  
0x00000008: 0x0080 instead

... ad nauseum


I added some debugging in do_read_onechip() and do_point_onechip()  
which reveals that it thought it was in FL_POINT or FL_READY mode,  
even though I could then read and get 0x0080; I did a write of CMD 
(0xff), after which I didn't read 0x0080. (I did print a debugging  
message there). I found that after performing a write to the JFFS  
filesystem, my debugging messages no longer happened upon reading  
from the flash (indicating the flash and MTD driver were in agreement  
as to the state at that point).

Are there any known issues being tracked regarding this issue? Am I  
missing something in my map? Does having a 32MB part with only 16MB  
addressable at a time cause heartburn, especially with pointing? Will  
forcing the map_bankwidth to 2 help?

Anything else I should be aware of when it comes to weird mappings?  
(Mine must be a pretty tame map compared to what hardware designers  
are capable of ;)

Thanks.
-
allon
