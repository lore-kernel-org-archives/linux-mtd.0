Received: from pu90.internetdsl.tpnet.pl ([80.55.20.90]
	helo=evo.evopolska.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QP0a-0002ZX-So
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 11:08:41 +0100
Date: Thu, 12 Jun 2003 12:10:56 +0200 (CEST)
From: angainor@evo.evopolska.com
To: Greg Ungerer <gerg@snapgear.com>
In-Reply-To: <3EE7D5CB.1090305@snapgear.com>
Message-ID: <Pine.LNX.4.44.0306120922280.29227-100000@evo.evopolska.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> >>I have studied the "DiskOnChip 2000 128Mb problem"
> >>thread here on list and tried to change the
> >>MAX_CHIPS_MPLUS define to something else than 1.
> >>Well, this way I got an 128MiB disk, then a
> >>256MiB one, and so on... :). way too many chips found.
> 
> We will need to find out a little bit more about this
> part. The Millennium Plus family originally had 2 memebers,
> each with their own high level ID. Easy to tell them
> apart. There internal flash organization is quite different
> though, the larger (32MiB) part has dual interleaved
> flash.

> This sure does look odd. The doc I have states that the firstUnit
> and lastUnit should be valid even for binary partitions.

Well, i think i finally got something. As i thought, the
problem was that the driver did not recognize the size of the
DoC correctly. I played with MAX_CHIPS_MPLUS/MAX_FLOORS_MPLUS.
The correct setting seems to be in this case:

	MAX_CHIPS_MPLUS=1
	MAX_FLOORS_MPLUS=2

The detection code does not work here.
Maybe it should be done differently with DoCMP?
Greg, if you point me to proper data sheets, i might
try to figure out.

I get no sanity checks errors and the driver correctly
recognized two linux partitions created earlier with M-Systems
driver. At least the partition table was read correctly.
Dumps of the partitions differed from the actual data
in many places. The only thing the driver said that might
be wrong was this (<X> is in range 1981-2047, so not all blocks
are affected):

	INFTL: formatting chain at block <X>
	INFTL: formatting chain at block <X>
	INFTL: formatting block <X>
	MTD: Error 0xffffffa5 erasing at 0x3f20000
	INFTL: error while formatting block <X>

Any writing causes immediate system death :))

Might my problems result from wrong cylinders/heads/sectors
decided by the driver? I get:

	INFTL: cannot calculate a geometry to match size of 0x1f1c0.
	INFTL: using C:995 H:16 S:8 (== 0x1f180 sects)
