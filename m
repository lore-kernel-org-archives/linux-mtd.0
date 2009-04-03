Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LphLu-0000Hs-9W
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 11:14:32 +0000
Date: Fri, 3 Apr 2009 13:14:21 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Manish D <manish2312@gmail.com>
Subject: Re: jffs2 on a 32k partition.
In-Reply-To: <d7ca49770904030303y293921b8o767bd5fd8c11af0@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0904031309190.9213@lnxricardw.se.axis.com>
References: <d7ca49770904030303y293921b8o767bd5fd8c11af0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 3 Apr 2009, Manish D wrote:

> I have a 32k flash partition that is used with jffs2. (4k * 8
> eraseblock). [linux kernel 2.4.32]
> ...
> Problem i am facing is, I am not able to use more than 10-12k of flash
> ...
> I am not really sure why so much of flash space is not allowed to be
> used. I understand 32k is a really small partition for any filesystem,
> ...

First of all Linux 2.4 is no longer supported by the mtd developers. But=20
the basic problem would be the same with a more up-to-date kernel and mtd=
=20
subtree.

Basically, JFFS2 needs several eraseblocks of overhead. A long time ago,=20
it was fixed at 5, but it's no longer a fixed figure and can vary=20
depending on flash size and other parameters. With the old kernel you=20
have, 5 blocks is probably in the right ballpark, which would give you 3=20
eraseblocks or 12 kbytes usable data.

> I plan to move to raw read-write now without wear-levelling (with a
> smarter write algorithm to even out writes to one of 8 blocks).

Yes, that might be a good solution if you have a very simple file=20
structure (i.e. one single file that needs updating).

> Would really appreciate inputs and pointers on how i can go about
> using jffs2 (disabling gcd / wear levelling ? ) on such a small
> partition.

I don't think any of that can be disabled in any useful way, JFFS2 would=20
not function properly if you did. So writing directly to the flash is=20
probably a better option than trying to get JFFS2 to work with such a=20
small partition.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
