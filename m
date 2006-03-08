Received: from [66.174.85.155] (helo=txslsmtp1.vzwmail.net)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGpEB-0006y2-Ek
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 22:20:47 -0500
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Date: Tue, 7 Mar 2006 22:21:31 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGIENBKDAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20060308.102944.124550323.nemoto@toshiba-tops.co.jp>
Cc: linux-mtd@lists.infradead.org
Subject: RE: [MTD] cmdlineparts.c: fix to allow partition offset zero for
	any partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Atsushi,

> I sent same fix to LKML (CC: David Woodhouse, Andrew Morton) on 29
> January.  And it has been in -mm tree since 2.6.16-rc1-mm4.  You can
> get the latest version from:
>
>
http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc5/2.6.16-rc5-mm3/broken-out/mtd-cmdlinepart-allow-zero-offset-va
lue.patch
>
> I wish it was merged to mainline someday ...

That is quite a coincidence!  I viewed your patch -- since yours has the
additional advantage of using UINT_MAX instead of 0xffffffff, plus it is
already in -mm, it makes much more sense to proceed with your version of
the patch.

Thanks for the info,
Chuck
