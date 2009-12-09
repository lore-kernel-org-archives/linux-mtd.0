Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NIJwn-0000qP-HX
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 10:39:10 +0000
From: David Jander <david.jander@protonic.nl>
To: dedekind1@gmail.com
Subject: Re: UBIFS on kernel 2.6.24?
Date: Wed, 9 Dec 2009 11:40:03 +0100
References: <200911231510.40294.david.jander@protonic.nl>
	<200912081745.03588.david.jander@protonic.nl>
	<1260348108.19669.1220.camel@localhost>
In-Reply-To: <1260348108.19669.1220.camel@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200912091140.03345.david.jander@protonic.nl>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 09 December 2009 09:41:48 am Artem Bityutskiy wrote:
>[...]
> > $ flash_eraseall /dev/mtd1
> > Erasing 128 Kibyte @ 3980000 --  5 % complete.
> > Skipping bad block at 0x039a0000
> > Erasing 128 Kibyte @ 3f80000 --  6 % complete.
> > Skipping bad block at 0x03fa0000
> > Erasing 128 Kibyte @ 10080000 -- 25 % complete.
> > /usr/local/sbin/flash_eraseall: /dev/mtd1: MTD Erase failure:
> > Input/output error
> > Erasing 128 Kibyte @ 18760000 -- 38 % complete.
> > Skipping bad block at 0x18780000
> > Erasing 128 Kibyte @ 3ff60000 -- 99 % complete.
> > Skipping bad block at 0x3ff80000
> > Skipping bad block at 0x3ffa0000
> > Skipping bad block at 0x3ffc0000
> > Skipping bad block at 0x3ffe0000
> > Erasing 128 Kibyte @ 40000000 -- 100 % complete.
> >
> > Did this test kill my nand-flash chip?
> 
> Probably a bad block, which is normal on NAND. This is one of the
> reasons why NAND-aware software is not-so-simple.

I know bad blocks can occur at any time after manufacturing, although this is 
the first time I see it happening. I wouldn't have expected this to start 
occurring so early, though (the chip is new).

>[...]
> > > You will get all patches. Then you can merge them if you want, but this
> > > is a bad idea, IMHO.
> >
> > Hmmmm.... If you know how to do it the right way with git, why don't you
> > just take the little trouble of putting into the web-page? A lot of
> > people would learn from it (me included).
> 
> It is about git basics, there are many good tutorials. This is just
> about doing the basic operation - 'git pull'.

Off-topic: Probably. I must admit that I feel quite dumb having to ask this, 
but I have lost so much time already because I thought I understood some git 
command, which I didn't, and ended up destroying my git repository several 
times, so I stopped trying to figure things out on my own. Ask me about kernel 
internals what you want, but Git (and its documentation!) just goes over my 
head (I am a humble subversion user).

Back on topic:
I have repeated the nand-tests on another board, and they ran just fine, 
repeating for quite a while without any error, so I guess that proves that the 
hardware and nand-driver are working reasonably well. OTOH, The two failed 
systems, also were running for several months with very heavy flash-disk I/O 
(not as much as to wear it out though, there's still roughly 40% free space on 
the UBI volume). It has gone through installing ubuntu on it, and building 
several debian packages from source, etc... all apparently without problems, 
until one day 'ls -l /etc/' just failed.
I will try to pull from ubifs-v2.6.24.git, but I'd like to know your opinion 
on what the chances are that this update will fix the problem or bug that 
caused this corruption?
Your opinion is valuable, because otherwise it may take months before I find 
out I should have looked somewhere else for the problem.

Thanks a lot again!

Best regards,

-- 
David Jander
Protonic Holland.
