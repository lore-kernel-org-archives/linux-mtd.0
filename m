Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJAL5-0003rO-3e
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 09:13:00 -0400
Message-ID: <4253E056.5050603@ieee.org>
Date: Wed, 06 Apr 2005 09:12:54 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>	<424CAE31.8040302@ieee.org>	<425157C5.4040007@infocell-its.com>	<425181A7.2010809@ieee.org>	<42527DD5.4080009@infocell-its.com>	<4252EC5D.4090806@ieee.org>
	<4253D280.6090308@infocell-its.com>
	<4253D61C.6010109@infocell-its.com>
In-Reply-To: <4253D61C.6010109@infocell-its.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zeri Virgo wrote:

>> ...<snip>...
>> Loading kernel ... page 0x.... <- this seems to start at zero and be 
>> going up at roughly 0x200 a second up to 0xFFFF then restarting at 
>> zero again over and over.
>

The page number you see there is the offset (in 512-byte pages) on the 
diskonchip that DOCBoot is currently scanning, trying to find your 
kernel.  DOCBoot looks for a special tag in the OOB area of each page 
belonging to your kernel image.  I can think of two reasons for this 
process to loop forever:

  1) The image didn't get written properly (using nandwrite without the 
-o option would certainly have this effect, but you indicated that you 
did use -o).
  2) DOCBoot is having trouble reading your device, perhaps because my 
new non-TSOP DOC2k support is not general enough.


>> Just to give you a clearer picture, the bzImage is 1148021 bytes and 
>> doc_spl is 1187472 bytes. The nandwrite command writes doc_spl from 0 
>> up to the erase block at 0x118000 which is well within the 0x208000 
>> firmware area.
>
>
> Hey, I just noticed that 0x11c000 (0x118000 + 4000) is only 1163264 
> bytes - doesn't that mean doc_spl wasn't fully written to the chip!?


No.  Each 512-byte page on the flash is associated with 16 bytes of 
out-of-band (OOB) data.  doc_spl contains this data interspersed with 
the normal data.  nandwrite reports the page address, which only 
reflects the location of the normal data.  So, the amount of normal data 
in doc_spl is

  length * 512 / (512 + 16)

In your case that's 1151488, or 0x119200 bytes of normal data.  Thus the 
image should end in the erase block which starts at 0x118000 and ends at 
0x11C000, as reported by nandwrite.

Note that a partially-written image would NOT result in an infinite loop 
in DOCBoot, because (as you saw) it will eventually wrap all the way 
around to the start of the device if it can't find the number of tagged 
pages it's expecting.  After it wraps around, it will (stupidly) make up 
the missing pages by reloading tagged pages from the start of the device.

I'm not sure where to go next.  Can you please run "mtd_debug info 
/dev/mtd0" and tell me the result, just as a sanity check?

    -Dan
