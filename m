Received: from mta05bw.bigpond.com ([139.134.6.95])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QTFT-0003cw-Ac
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 15:40:19 +0100
Message-ID: <3EE89140.3070401@snapgear.com>
Date: Fri, 13 Jun 2003 00:42:08 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: angainor@evo.evopolska.com
References: <Pine.LNX.4.44.0306120922280.29227-100000@evo.evopolska.com>
In-Reply-To: <Pine.LNX.4.44.0306120922280.29227-100000@evo.evopolska.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD drivers for DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

angainor@evo.evopolska.com wrote:
>>>>I have studied the "DiskOnChip 2000 128Mb problem"
>>>>thread here on list and tried to change the
>>>>MAX_CHIPS_MPLUS define to something else than 1.
>>>>Well, this way I got an 128MiB disk, then a
>>>>256MiB one, and so on... :). way too many chips found.
>>
>>We will need to find out a little bit more about this
>>part. The Millennium Plus family originally had 2 memebers,
>>each with their own high level ID. Easy to tell them
>>apart. There internal flash organization is quite different
>>though, the larger (32MiB) part has dual interleaved
>>flash.
> 
>>This sure does look odd. The doc I have states that the firstUnit
>>and lastUnit should be valid even for binary partitions.
> 
> Well, i think i finally got something. As i thought, the
> problem was that the driver did not recognize the size of the
> DoC correctly. I played with MAX_CHIPS_MPLUS/MAX_FLOORS_MPLUS.
> The correct setting seems to be in this case:
> 
> 	MAX_CHIPS_MPLUS=1
> 	MAX_FLOORS_MPLUS=2

This would seem to make sense from what I know about
the Millennium Plus 32MiB part. I am talking with the
guys I know at M-Systems to get an understanding of
how to access the 64MiB.


> The detection code does not work here.
> Maybe it should be done differently with DoCMP?
> Greg, if you point me to proper data sheets, i might
> try to figure out.

I don't have anything for the 64MiB part. As fas as I know
the publicly available 32MiB datasheet doesn't give you
much information to go on for programming it.

The doc I have is under restricted access, I can't let it out.


> I get no sanity checks errors and the driver correctly
> recognized two linux partitions created earlier with M-Systems
> driver. At least the partition table was read correctly.

 From what I know so far the first 32MiB shoud look
pretty much like the 32MiB part. The upper 32MiB
is another flash device. So no suprise that you should
be able to read the partition table.


> Dumps of the partitions differed from the actual data
> in many places. The only thing the driver said that might
> be wrong was this (<X> is in range 1981-2047, so not all blocks
> are affected):
> 
> 	INFTL: formatting chain at block <X>
> 	INFTL: formatting chain at block <X>
> 	INFTL: formatting block <X>
> 	MTD: Error 0xffffffa5 erasing at 0x3f20000
> 	INFTL: error while formatting block <X>
> 
> Any writing causes immediate system death :))
> 
> Might my problems result from wrong cylinders/heads/sectors
> decided by the driver? I get:
> 
> 	INFTL: cannot calculate a geometry to match size of 0x1f1c0.
> 	INFTL: using C:995 H:16 S:8 (== 0x1f180 sects)

By my simple calculations that is about right. I think the
problem is that the doc2001plus.c code just doesn't know
how to correctly access the 2nd (upper 32MiB) flash in the
64MiB part. I try and find out exactly how to do that.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude          EMAIL:  gerg@snapgear.com
Snapgear Pty Ltd                               PHONE:    +61 7 3279 1822
825 Stanley St,                                  FAX:    +61 7 3279 1820
Woolloongabba, QLD, 4102, Australia              WEB:   www.SnapGear.com
