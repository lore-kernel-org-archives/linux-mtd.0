Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrsJK-0000L1-GV
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 03:39:27 -0500
Date: Wed, 6 Dec 2006 09:38:45 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Duke <ezbonites@gmail.com>
Subject: Re: write verify
In-Reply-To: <79ac09b60612050947x5072acfay9df3554fd4e1fbfe@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0612060934320.29536@lnxricardw.se.axis.com>
References: <79ac09b60612050947x5072acfay9df3554fd4e1fbfe@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 5 Dec 2006, Duke wrote:

> How do I verify flash have been written to? Do I read it back in a
> file and then compare it to the original? That's using double the
> memory so I assuming there is another way, perhaps to compare the
> original directly in flash. Is there?

For NAND flash at least, there is an automatic verify-after-write option=20
which can be enabled in the kernel. Not sure about NOR though. On the=20
other hand it's on a sector level and you probably want to verify the=20
whole file after the whole image has been written.

But it shouldn't be too hard to write a small application which opens the=
=20
file and the flash and reads a reasonable amount of data at a time,=20
comparing them with each other. Shouldn't require any large amounts of=20
memory, and not much time to implement it either.

If the original image file is the same size as the flash partition, you=20
should be able to use a standard command line tool like diff or cmp,=20
assuming you are not using NAND flash.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
