Received: from [64.244.22.242] (helo=mail.seranoa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16pVs4-0006XS-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2002 14:54:52 +0000
Received: from seranoa.com (IDENT:andrew.dixon@[172.16.1.202])
	by mail.seranoa.com (8.11.0/8.11.0) with ESMTP id g2PF2Xs10692
	for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2002 10:02:33 -0500
Message-ID: <3C9F38C4.510394D@seranoa.com>
Date: Mon, 25 Mar 2002 09:48:36 -0500
From: Andrew Dixon <andrew.dixon@seranoa.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: CVS tags?
References: <3C9BA0DD.B3827964@seranoa.com> <20020323112215.B13151@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Jörn Engel wrote:

<snip>
 It
> > looks like maybe "core_patch_applied" is a good one to go with.  Any
> > thoughts?
> 

<snip>

> You should use it if you
> - have more than one device that can be partitioned or
> - want to get used to the new code from the beginning.

As far as the MTD device goes I'm in a pretty good spot.  I put together
a driver that takes two flashes, creates one device from them, and then
partitions them the way I want.  Then I put jffs2 onto my one BIG flash
partition.  And that's where I get problems.  It takes a very long time
to mount the jffs2 partition and I'm looking for the latest jffs2 code
to try to speed things up (I recall there was some talk about long mount
times a little while back).

So what I'm looking for is faster jffs2 code.  Also, does it matter if I
grab stuff from the 2.5 branch if I'm using a 2.4 kernel?

Thanks,
Andy

-- 
Andrew Dixon
Software Engineer
Seranoa Networks
978.897.3434 x231
