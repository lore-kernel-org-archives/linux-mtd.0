Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O78T5-0003IV-4Z
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2010 14:42:27 +0000
Message-ID: <4BD8494D.2010505@bubblegen.co.uk>
Date: Wed, 28 Apr 2010 15:42:21 +0100
From: Matthew Lear <matt@bubblegen.co.uk>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Obtaining start/end address of an MTD partition
References: <afe027b8af6429f1eaf61baae36235d3.squirrel@webmail.plus.net>
	<1272286767.17386.8.camel@localhost>
	<09f0d0f0a023583f67e63708121e31c2.squirrel@webmail.plus.net>
In-Reply-To: <09f0d0f0a023583f67e63708121e31c2.squirrel@webmail.plus.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/26/10 15:24, Matthew Lear wrote:
>> On Mon, 2010-04-26 at 12:05 +0100, Matthew Lear wrote:
>>> Hello all,
>>>
>>> Is it possible to obtain an MTD partition's starting address through
>>> usage
>>> of the MTD ioctls? I've had a very quick look and from what I can tell,
>>> this doesn't seem to be possible.
>>>
>>> To be clear, I'd like to obtain the addresses below (displayed by Linux
>>> when it detects the MTD partitions on boot).
>>>
>>> Creating 6 MTD partitions on "physmap-flash.0":
>>> 0x00000000-0x00120000 : "RedBoot"
>>> 0x00120000-0x01000000 : "foo"
>>> 0x01000000-0x01400000 : "bar"
>>
>> Did you try 'cat /proc/mtd' ?
> 
> Yes, of course but the only way I could easily obtain the start address of
> a particular partition using /proc/mtd would be to increment the sizes of
> each previous partition. It's doable but just seems clunky...

Actually, it's worse than that. This will only work if each partition is
adjacent. If there is any gap (ie unpartitioned space on the device)
between partitions, this will not work at all.

Surely, I'm not the first person to try to obtain this info from MTD?

Any help appreciated...
--  Matt
