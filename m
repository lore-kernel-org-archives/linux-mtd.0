Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC9UW-0001kk-6m
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 10:48:40 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Some questions on bit-flips and JFFS2
Date: Wed, 12 May 2010 12:48:36 +0200
References: <201005031505.18604.muehlfelder@enertex.de>
	<201005111009.06724.muehlfelder@enertex.de>
	<4BE96FD7.7020005@aimvalley.nl>
In-Reply-To: <4BE96FD7.7020005@aimvalley.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201005121248.36442.muehlfelder@enertex.de>
Cc: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tuesday 11 May 2010 16:55:19 schrieb Norbert van Bolhuis:
> Or can you put a kernel image on it beforehand ? are we talking about
> deployed systems or to be deployed systems ?

Of course the thoughts about UBIFS are only for future systems, that are not 
deployed yet. Also there is a newer version of the Atmel Sam-ba tool, that 
fixes the bad blocks problem.
But because of the Sam-ba problem it seems to be hard to get a fix done for 
already deployed systems.

> Anyway, if you switch to UBIFS and *can* put the kernel image on UBIFS
> fatal bit flips in the uImage on bare NAND don't matter.
> On the other hand: fatal bit flips in bootstrap/u-boot/u-boot_env will
> still prevent the system to boot. So maybe also refreshing those images is
> necessary.

This is right. But as long as the kernel Image is about 1.5 MB and all the 
U-Boot stuff is only about 300 kB it would still increase the security. 
Furthermore UBIFS will have other advantages (e.g. lower mount times), too.

> You need a recent linux kernel and u-boot for them to support UBIFS.
>
> Note that: if you would upgrade your system with a new u-boot/linux and
> UBIFS i.s.o. JFFS2, *everything* on flash will change. If you want to do
> this for deployed systems you need a huge upgrade script.

This won't be done for deployed systems ;-)

> I don't use NAND+UBIFS myself, so I have no experience there.
>
> The below pointers should have some relevant info though:
>
> - u-boot home-page: http://www.denx.de/wiki/U-Boot/WebHome
> - u-boot mailing list: http://lists.denx.de/pipermail/u-boot/
> - u-boot source code GIT tree:
> http://git.denx.de/cgi-bin/gitweb.cgi?p=u-boot.git;a=tree (checkout boards
> with NAND and boot-from-NAND support)
> - specialized GIT trees for NAND and UBI:
> http://www.denx.de/wiki/U-Boot/Custodians

Thanks, will have to take a look at it later. But for now it's a higher 
priority to reduce failure rate in already deployed systems.

Regards
Thorsten
