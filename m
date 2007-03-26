Received: from e33.co.us.ibm.com ([32.97.110.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HVoSf-000541-QW
	for linux-mtd@lists.infradead.org; Mon, 26 Mar 2007 13:38:10 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2QCboV4009752
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 08:37:50 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2QCbnxJ063268
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 06:37:49 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2QCbnDv032655
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 06:37:49 -0600
Subject: Re: JFFS2 SUMMARY nodes aren't working
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1174670673.26465.333.camel@gentoo-jocke.transmode.se>
References: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
	<46028675.30200@ru.mvista.com>
	<1174571529.26465.311.camel@gentoo-jocke.transmode.se>
	<1174670673.26465.333.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Mon, 26 Mar 2007 07:37:36 -0500
Message-Id: <1174912656.3454.1.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-03-23 at 18:24 +0100, Joakim Tjernlund wrote: 
> 
> I found that an all empty FS took about the same time to mount
> which I find very strange.
> 
> Looking into the code in scan.c I found that even though I have
> cleanmarkers in all EB:s, JFFS2 still scans the whole EB. Do
> you really need to scan the whole area after the cleanmarker?
> Should be enough to only check a few words after the clean marker
> and if that is 0xffffffff then assume that the EB is clean
> since it had a valid clean marker at the beginning.

No,  you can't just read a few words.  On some flash, the cleanmarker
cannot be marked invalid in place so you still need to scan the rest of
the block.  Sucks.

josh
