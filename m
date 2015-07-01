Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZA6Mc-0006BM-LT
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 00:58:59 +0000
Received: by oiyy130 with SMTP id y130so20884834oiy.0
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2015 17:58:38 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Jul 2015 12:58:38 +1200
Message-ID: <CAHSWo-gfiu0EupJj1_2cMkRzxinTtyWRt-Y9yc5T=ht8A_sFaQ@mail.gmail.com>
Subject: NAND/GPMC bus arbitration and MTD/OTP access
From: Yani Dubin <yani.dubin@taitradio.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a NAND driver question I was hoping someone could shed some light on
- it touches on the area of mtd, and I gather this is where the expertise
in such areas lies?

We have an extended NAND driver which adds OTP functionality (which works),
and I now want to determine whether this is robust. We access OTP functions
directly at the NAND driver level via sysfs (read, write, set page
number/offset), rather than coming through the mtd layer.

These (legacy) functions do not put the device into an exclusive OTP mode
(which would alter the semantics of read/write while active and hence would
require an exclusive lock).

We are using a TI Sitara AM3352 (OMAP) processor via its GPMC module,
connected to a parallel 8-bit Micron NAND (MT29F8G08ADBDAH4), with the
Linux-3.14.29ltsi kernel.

While I have locking around the OTP functions
(nand_chip.controller.lock/wq), other requests will be coming in via the
mtd layer.

The bus is driven using hwcontrol, and the command sequences look like:
Drive CLE (command byte 1 sets operation)
Drive ALE (5 cycles to set page row/col address)
[if write operation] write data to bus
Drive CLE (command byte 2 begins read or write)
[if read operation] poll gpmc status register for ready, then read data
from bus
[if write operation] poll gpmc status register for completion

How does bus arbitration work with a NAND device? What (if anything)
ensures the whole operation completes, preventing some other read/write
request coming in (say between first/last CLE) and using the bus?

Is there something at a lower level (perhaps by the GPMC peripheral), or
does this tend to be handled at the higher level (mtd layer)? I couldn't
see any code polling the gpmc register prior to starting a read/write in
the standard read/write functions (omap2-nand - ioread8_rep/iowrite8).

I'm new to this area, so if someone could provide some pointers /
explanation, this would be greatly appreciated.

Regards,
Yani.

-- 
Yani Dubin
Senior Design Engineer
Tait Communications
DDI: +64-3-357-1565
Email: yani.dubin@taitradio.com


www.taitradio.com

-- 

------------------------------
This email, including any attachments, is only for the intended recipient. 
It is subject to copyright, is confidential and may be the subject of legal 
or other privilege, none of which is waived or lost by reason of this 
transmission.
If you are not an intended recipient, you may not use, disseminate, 
distribute or reproduce such email, any attachments, or any part thereof. 
If you have received a message in error, please notify the sender 
immediately and erase all copies of the message and any attachments.
Unfortunately, we cannot warrant that the email has not been altered or 
corrupted during transmission nor can we guarantee that any email or any 
attachments are free from computer viruses or other conditions which may 
damage or interfere with recipient data, hardware or software. The 
recipient relies upon its own procedures and assumes all risk of use and of 
opening any attachments.
------------------------------
