Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GdREY-0003eD-7j
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 13:54:51 +0100
Date: Fri, 27 Oct 2006 14:56:15 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: mtd-utils/flash_erase modifications
In-Reply-To: <1161952796.3080.8.camel@sauron>
Message-ID: <Pine.LNX.4.64.0610271446220.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610261052070.25906@lnxricardw.se.axis.com>
	<1161952796.3080.8.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 27 Oct 2006, Artem Bityutskiy wrote:

>> 2.
>> Furthermore, it would be nice to be able to disable the output of the
>> program. As it stands, it outputs a line for each block/sector it erases=
=2E
>> I would suggest a --verbose or -v option in order to enable this output.
>
> Err, are you talking about flash_erase?

Yes ... ?

>> 3.
>> And finally, by default, the program only erases the first block, unless
>> some options are given. If one wants to erase a whole mtd device or
>> ...
> There is flash_eraseall utility for this, isn't it? Although it may be
> reasonable to have all this functionality in one utility/

I'll have to admit, I totally forgot about flash_eraseall, because in my=20
initial application, I needed to erase only parts of the flash, and when=20
the need for badblock managament turned up, I'd forgotten about=20
flash_eraseall, so I have been using various patched variants of=20
flash_erase.

You are right of course, flash_eraseall erases a whole flash, and looking=
=20
more closely, also has badblock management. Nice.

It doesn't seem to be able to handle erasure of only part of a partition=20
though (naturally, given its name).

I think it would be nice to have all the functionality in the same=20
utility. After all, the functionality is really the same.

What would be best here:
1. flash_eraseall has the option to erase only parts of a partition ?
    - illogical, given its name
2. modify flash_eraseall to handle partial erases, change name to
    flash_erase (and throw out the old flash_erase).
3. retain both utilities, but basically with same functionality, except
    for the ability for partial erases.

I could understand that some folks would like to keep the old flash_erase=
=20
simply because they are used to the syntax ... ? Or perhaps hardly anyone=
=20
uses it?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
