Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWUVs-0004ST-Ek
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 11:41:23 +0000
Date: Mon, 9 Feb 2009 12:41:17 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Michal Ludvig <mludvig@logix.net.nz>
Subject: Re: Writing Linux kernel to MTD
In-Reply-To: <49900F6A.1030508@logix.net.nz>
Message-ID: <Pine.LNX.4.64.0902091240040.19761@lnxricardw.se.axis.com>
References: <498FAE9A.4030208@logix.net.nz>
	<Pine.LNX.4.64.0902091007480.19761@lnxricardw.se.axis.com>
	<49900F6A.1030508@logix.net.nz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 9 Feb 2009, Michal Ludvig wrote:

>> My instinctive reaction is that there may be a difference in the way the
>> Linux and u-boot drivers access the NAND device in terms of bus timing
>> etc, so that the Linux driver breaks the timing causing bad
>> communication with the device. I.e., the timing setup of the Linux
>> driver is at fault here.
>
> Interesting idea, however I happily use UBIFS filesystem at the same
> time in the same NAND Flash and observe no problems. If it's broken it's
> broken in a very reliable and stable way...

Sounds like it's not that then.

>> Another similar condition I have experienced is that due to a
>> misconfiguration one of the control bits to the NAND flash was
>> inadvertently mapped to a network indicator LED, causing NAND read/write
>> to fail if network traffic occurred at the same time.
>
> Just in case I disabled network altogether and did the write test from
> UBIFSroot instead of from development NFSroot and it's still failing.
>
> Any other ideas?

Well, chances that's a contention with the network led is probably small,=
=20
but it could be some sort of other hardware interdependency.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
