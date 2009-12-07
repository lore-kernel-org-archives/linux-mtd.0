Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHjqC-0000q1-97
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 20:05:57 +0000
Message-ID: <4B1D600A.10507@nokia.com>
Date: Mon, 07 Dec 2009 22:05:30 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: twebb <taliaferro62@gmail.com>
Subject: Re: ubifs wear leveling across entire device
References: <dbdb2ea60912030931j380a7702hc92d4fbe72341730@mail.gmail.com>	
	<4B18F300.7080006@nokia.com>
	<dbdb2ea60912070741l7a0dde1dt49ba0f5413accf61@mail.gmail.com>
In-Reply-To: <dbdb2ea60912070741l7a0dde1dt49ba0f5413accf61@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

twebb wrote:
>>> I'm confused about how wear leveling occurs across the entire device
>>> in the following example.  Could someone help me understand what I'm
>>> missing?
>>>
>>> 4 GiB flash device (nand MLC):
>>> 4 MTD partitions defined:
>>> 0 - "p1" - 0x00000000 - 0x00800000
>>> 1 - "p2" - 0x00800000 - 0x10000000
>>> 2 - "p3" - 0x10000000 - 0x80000000
>>> 3 - "p4" - 0x80000000 - 0x100000000
>>>
>>> kernel args specify 3 ubi volumes:
>>> ubi.mtd=p1 ubi.mtd=p2 ubi.mtd=p3
>>> (p4 is reserved and no volumes or filesystems sit on top of it)
>> That is 3 UBI devices not 3 UBI volumes
>>
> 
> Excuse me.  I'm new to using UBI and UBIFS and am not completely
> familiar with the terminology.  I think what I described in the
> example is 3 UBI devices, with a single volume associated with each
> device.  I had neglected to show that each UBI device had a single
> volume.
> 
> Maybe there's a better way to word my question.  Does UBI wear
> leveling occur independently across each MTD device (p1, p2, and p3
> only in example above) or does it somehow occur over the entire
> physical device (p1-p4 inclusive)?
> 
> I'm trying to understand this so I can determine how to partition the
> physical device to provide the best wear leveling, while still
> allowing a portion of the physical device (p4) to exist outside of any
> UBI device or volume.

Wear-levelling occurs within a single UBI device which is generally
a single MTD partition.

You need 1 MTD partition and 1 UBI device with 3 volumes.  Make the
3 volumes total less than the whole UBI device and you can add a 4th
volume later.
