Received: from pacific.moreton.com.au ([203.143.235.130]
	helo=dorfl.internal.moreton.com.au)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19TEld-0006yS-TR
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jun 2003 06:48:58 +0100
Message-ID: <3EF2A02B.1000002@snapgear.com>
Date: Fri, 20 Jun 2003 15:48:27 +1000
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
> 
> The detection code does not work here.
> Maybe it should be done differently with DoCMP?
> Greg, if you point me to proper data sheets, i might
> try to figure out.

According to M-Systems the 2nd flash is just accessed
by setting the DeviceSelect register appropriately.

So your above defines are correct. If this does not
detect the 2nd flash then there must be a problem in
the DoC_IdentChip() code. Reading the code nothing is
immediately obviously wrong to me.

You do need to skip using the 3 reserved blocks at
the front of every flash device inside this thing though.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear Pty Ltd                            PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
