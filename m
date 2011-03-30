Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4puP-0003lg-40
	for linux-mtd@lists.infradead.org; Wed, 30 Mar 2011 07:33:42 +0000
Date: Wed, 30 Mar 2011 09:33:36 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Kelly Anderson <kelly@silka.with-linux.com>
Subject: Re: How to write to nand with an image containing oob data, including
	ECC?
In-Reply-To: <4D92566F.7040209@silka.with-linux.com>
Message-ID: <Pine.LNX.4.64.1103300909240.25520@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1103291723240.25520@lnxricardw.se.axis.com>
	<1301413371.21445.15.camel@localhost>
	<4D92566F.7040209@silka.with-linux.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 30 Mar 2011, Kelly Anderson wrote:

>>> $ nandwrite -o -n /dev/mtd3 /tmp/mtd3-badimage
>>>
>>> where /tmp/mtd3-badimage contains an image including all oobs for all
>>> pages.
>>>
>>> However, this fails saying
>>>
>>> Writing data to block 0 at offset 0x0
>>> libmtd: error!: cannot write 2048 bytes to mtd3 (eraseblock 0, offset 0=
)
>>>           error 22 (Invalid argument)
>>> nandwrite: error!: /dev/mtd3: MTD write failure
>>>              error 22 (Invalid argument)
>>> Data was only partially written due to error
>>> : Invalid argument
>>>
>>>
>>> Is this a known bug, or are the some other options I should be using?
>> Check this bug-report, probably it is about the same. Not sure, I did
>> not have time to look at this:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2011-March/034505.html
>>
>> would be great if someone just sent a fix :-)
>>
> OK, I'll be nice.
>
> When I sent the original bug report I was dog tired.  Now with a good
> nights sleep I've got the energy to write a fix.
> ...

Artem, my case seems to be a completely different problem. I tried=20
applying Kelly's patch and it didn't make a difference in my case. Makes=20
sense, as the error messages in the bug report were entirely different=20
from what I was getting.

(That's not to say Kelly's patch doesn't work or do what it's supposed to=
=20
do, it just didn't seem to be related to the problem I've been having).

But I am I right in understanding that nandwrite should perform as I=20
expect it to when I say -o and -n to it? I.e. the -o means there's oob=20
data in the image, and -n means don't write any ECC, so the image I'm=20
supplying should be written exactly as it looks to the flash, including=20
the oob?

If it is in fact the case I might have a go at fixing it eventually. Need=
=20
to find some other solution right now though (like patching the kernel to=
=20
force errors on write or something like that).

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
