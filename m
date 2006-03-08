Received: from topsns2.toshiba-tops.co.jp ([202.230.225.126])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGnUu-0005Zb-8m
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 20:29:55 -0500
Date: Wed, 08 Mar 2006 10:29:44 +0900 (JST)
Message-Id: <20060308.102944.124550323.nemoto@toshiba-tops.co.jp>
To: chuckmeade@mindspring.com
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <IIEEICKJLNEPBBDJICNGIEIAKDAA.chuckmeade@mindspring.com>
References: <IIEEICKJLNEPBBDJICNGIEIAKDAA.chuckmeade@mindspring.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MTD] cmdlineparts.c: fix to allow partition offset zero for
 any partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> On Mon, 6 Mar 2006 12:38:46 -0500, "Chuck Meade" <chuckmeade@mindspring.com> said:
chuck> Here is the patch I sent earlier today (that email is pending
chuck> moderator approval) in the MTD-approved patch format.  Sorry I
chuck> didn't see this MTD patch format earlier.

chuck> [MTD] cmdlineparts.c: fix to allow partition offset zero for
chuck> any partition

I sent same fix to LKML (CC: David Woodhouse, Andrew Morton) on 29
January.  And it has been in -mm tree since 2.6.16-rc1-mm4.  You can
get the latest version from:

http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc5/2.6.16-rc5-mm3/broken-out/mtd-cmdlinepart-allow-zero-offset-value.patch

I wish it was merged to mainline someday ...
---
Atsushi Nemoto
