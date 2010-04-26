Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6PEL-00050k-AF
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2010 14:24:13 +0000
Message-ID: <09f0d0f0a023583f67e63708121e31c2.squirrel@webmail.plus.net>
In-Reply-To: <1272286767.17386.8.camel@localhost>
References: <afe027b8af6429f1eaf61baae36235d3.squirrel@webmail.plus.net>
	<1272286767.17386.8.camel@localhost>
Date: Mon, 26 Apr 2010 15:24:12 +0100
Subject: Re: Obtaining start/end address of an MTD partition
From: "Matthew Lear" <matt@bubblegen.co.uk>
To: dedekind1@gmail.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: matt@bubblegen.co.uk, linux-mtd@lists.infradead.org
Reply-To: matt@bubblegen.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Mon, 2010-04-26 at 12:05 +0100, Matthew Lear wrote:
>> Hello all,
>>
>> Is it possible to obtain an MTD partition's starting address through
>> usage
>> of the MTD ioctls? I've had a very quick look and from what I can tell,
>> this doesn't seem to be possible.
>>
>> To be clear, I'd like to obtain the addresses below (displayed by Linux
>> when it detects the MTD partitions on boot).
>>
>> Creating 6 MTD partitions on "physmap-flash.0":
>> 0x00000000-0x00120000 : "RedBoot"
>> 0x00120000-0x01000000 : "foo"
>> 0x01000000-0x01400000 : "bar"
>
> Did you try 'cat /proc/mtd' ?

Yes, of course but the only way I could easily obtain the start address of
a particular partition using /proc/mtd would be to increment the sizes of
each previous partition. It's doable but just seems clunky...
