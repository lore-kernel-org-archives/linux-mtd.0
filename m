Received: from pacific.moreton.com.au ([203.143.235.130]
	helo=dorfl.internal.moreton.com.au)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QGnP-0008JX-A5
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 02:22:31 +0100
Message-ID: <3EE7D5CB.1090305@snapgear.com>
Date: Thu, 12 Jun 2003 11:22:19 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <Pine.LNX.4.44.0306041127320.8546-100000@evo.evopolska.com>
	<1055325225.2097.38.camel@passion.cambridge.redhat.com>
In-Reply-To: <1055325225.2097.38.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD drivers for DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Wed, 2003-06-04 at 11:56, angainor@evo.evopolska.com wrote:
>>First of all, docprobe successfuly identifies DOCMP,
>>but total size of the DoC is only half of its actual
>>size (64MiB chip is identified as 32MiB).
> 
> Hmmm. Sounds like a bug in the hardware driver. Greg?

Sure does. I didn't know there was a 64MiB Plus part.
I'll see what I can find out about it.


>>I have studied the "DiskOnChip 2000 128Mb problem"
>>thread here on list and tried to change the
>>MAX_CHIPS_MPLUS define to something else than 1.
>>Well, this way I got an 128MiB disk, then a
>>256MiB one, and so on... :). way too many chips found.

We will need to find out a little bit more about this
part. The Millennium Plus family originally had 2 memebers,
each with their own high level ID. Easy to tell them
apart. There internal flash organization is quite different
though, the larger (32MiB) part has dual interleaved
flash.


>>INFTL: Media Header ->
>>     bootRecordID          = BNAND
>>     NoOfBootImageBlocks   = -1
>>     NoOfBinaryPartitions  = 1
>>     NoOfBDTLPartitions    = 1
>>     BlockMultiplerBits    = 0
>>     FormatFlgs            = 1
>>     OsakVersion           = 0x30343135
>>     PercentUsed           = 98
>>     PARTITION[0] ->
>>         virtualUnits    = 10
>>         firstUnit       = 0
>>         lastUnit        = 0
>>         flags           = 0x20000000
>>         spareUnits      = 0
>> INFTL: Media Header Parition 0  sanity check failed
>>     firstUnit 0 : lastUnit 0  >   virtualUnits 0
>>
>>   Basically, the start is ok and does reflect the
>>   reality. So what goes wrong afterwards?
> 
> 
> Can you dump the contents of the media header using the DOS tools? How
> big is the 'binary' partition? If you comment out that sanity check does
> it actually work? 

This sure does look odd. The doc I have states that the firstUnit
and lastUnit should be valid even for binary partitions.


>>2. doc2000.h
>>   
>>   I found the following definition:
>>
>>	#define DoC_Mplus_OutputControl         0x1002
>>
>>   Shouldn't this be rather:
>>
>>	#define DoC_Mplus_OutputControl         0x100c
>>
>>   This is what I found in DOC_Millennium_Plus_DS_Rev1.7.pdf.
>>   0x1002 is actually NOP. I don't think this will help me
>>   much though ;)
> 
> I haven't seen that documentation. Greg?

Yep, this is a bug. I'll fix that in CVS.
Shouldn't have any effect for you though, the driver
doesn't use that register at all.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear Pty Ltd                            PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
