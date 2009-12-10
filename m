Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NIfAa-0000tX-8B
	for linux-mtd@lists.infradead.org; Thu, 10 Dec 2009 09:18:49 +0000
From: David Jander <david.jander@protonic.nl>
To: dedekind1@gmail.com
Subject: Re: UBIFS on kernel 2.6.24?
Date: Thu, 10 Dec 2009 10:19:45 +0100
References: <200911231510.40294.david.jander@protonic.nl>
	<200912091140.03345.david.jander@protonic.nl>
	<1260356109.19669.1289.camel@localhost>
In-Reply-To: <1260356109.19669.1289.camel@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200912101019.45873.david.jander@protonic.nl>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 09 December 2009 11:55:09 am Artem Bityutskiy wrote:
> On Wed, 2009-12-09 at 11:40 +0100, David Jander wrote:
> > Back on topic:
> > I have repeated the nand-tests on another board, and they ran just fine,
> > repeating for quite a while without any error, so I guess that proves
> > that the hardware and nand-driver are working reasonably well. OTOH, The
> > two failed systems, also were running for several months with very heavy
> > flash-disk I/O (not as much as to wear it out though, there's still
> > roughly 40% free space on the UBI volume). It has gone through installing
> > ubuntu on it, and building several debian packages from source, etc...
> > all apparently without problems, until one day 'ls -l /etc/' just failed.
> > I will try to pull from ubifs-v2.6.24.git, but I'd like to know your
> > opinion on what the chances are that this update will fix the problem or
> > bug that caused this corruption?
> 
> I cannot tell for sure, it may.

Ok, thanks.

> What I can say for sure is that I personally is not very interested in
> solving problems for too old UBIFS code-base. Well, problems I can
> reproduce here, in my setup, are OK, but subtle problems which I cannot
> reproduce here are not OK - I really want to be sure UBI/UBIFS are
> up-to-date and this is not something we already fixed.

I understand. All I wanted is to see if someone would jump up and say 
something like: "Oh, no, this old version is known to be broken, you need some 
important bug-fixes that went into the updates". That obviously didn't happen, 
so I know what I am facing: Update to the latest version, test it thoroughly, 
and hope for the best :-(

> BTW, from now on 2.6.24 back-port support is dropped. But it is
> up-to-date _now_ :-)

Ouch. Unfortunately for our platform there is no reasonable chance I could 
move to a newer kernel anytime soon (still no mainline support) :-(

Thanks a lot.

Best regards,

-- 
David Jander
Protonic Holland.
