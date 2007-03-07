Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HOxGk-0006MY-1v
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 09:37:31 -0500
Date: Wed, 7 Mar 2007 15:34:14 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: falls huang <falls.huang@gmail.com>
Subject: Re: Does mtd support two-plane page program for nand flash?
Message-ID: <20070307143414.GA16439@lazybastard.org>
References: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 March 2007 14:57:02 +0800, falls huang wrote:
> 
>     AFAIK , the samsung's nand flash K9LAG08U0M/K9HBG08U1M/K9MCG08U5M
> support two-plane page program. For example: The K9LAG08U0M is
> arranged in four 4Gb memory planes.Each plane contains 2,048 blocks
> and 2112 byte page registers. This allows it to perform simultaneous
> page program and block erase by selecting one page or block from each
> plane. ( refer to the datasheet of K9LAG08U0M)

Interesting.  I was wondering when devices like this would show up.
Do you have a spec for those chips?

>   I have searched the source of mtd/jffs2/jffs3 and I found that them
> don't support two-plane page program . How should I add two-plane page
> program ? Should I modify the source of mtd or jffs2/jffs3 ?

Not sure how much interest in this exists for JFFS2.  Two NOR chips can
work in parallel just as easily as your two-plane chip.  But noone has
ever tried to use this in any way.

For LogFS I am very interested.  Supporting parallel writes to several
chips (or planes on one chip) is on my list.  MTD should export roughly:
 - one device for all planes/chips,
 - preferrably eraseblock interleaving between all planes/chips or
 - alternatively linearly appending all planes/chips,
 - information about how many planes/chips exists.

What is the latency of reads/writes/erases?  I have already asked for
the spec, haven't I? ;)

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
