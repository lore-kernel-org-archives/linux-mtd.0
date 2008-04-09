Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JjTNP-0001nJ-Hm
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 06:01:44 +0000
Message-ID: <47FC4A91.8010104@denx.de>
Date: Wed, 09 Apr 2008 06:48:17 +0200
From: Heiko Schocher <hs@denx.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [JFFS2] Garbage collector says "Checked all inodes but still
	0x5e3d0	bytes of unchecked space?"
References: <47FB884B.9050301@besancon.parkeon.com>
In-Reply-To: <47FB884B.9050301@besancon.parkeon.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Fabrice,

Fabrice GIRARDOT fgirardot at besancon.parkeon.com Tue Apr 8 10:59:23 EDT 2008 wrote:
> Sometimes, after several unclean system resets, JFFS2's garbage
> collector outputs this message :
> "Checked all inodes but still 0x5e3d0 bytes of unchecked space?
>  kernel BUG at fs/jffs2/gc.c:139!"
[...]
> I don't know which exact version of jffs2 I'm using ; my gc.c
> file is version 1.144 on 21-dec-2004, which may look a bit old.
> Unfortunately, I can not switch to a newer kernel version.

Thats bad ...

> Does somebody has more information on this problem ?
> Is it a bug in jffs2 and/or its GC ? Is it fixed ?

try the following Patch:

http://lists.infradead.org/pipermail/linux-mtd-cvs/2006-May/005354.html

I had the same Problem, and the above Patch fixed it.
But the "prefered" way should be, to update your kernel.

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
