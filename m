Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16pWXu-0006cW-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2002 15:38:06 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Andrew Dixon" <andrew.dixon@seranoa.com>, <linux-mtd@lists.infradead.org>
Subject: RE: CVS tags?
Date: Mon, 25 Mar 2002 16:37:17 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLKEKGFCAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <3C9F38C4.510394D@seranoa.com>
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

>
> Jörn Engel wrote:
>
> <snip>
>  It
> > > looks like maybe "core_patch_applied" is a good one to go with.  Any
> > > thoughts?
> >
>
> <snip>
>
> > You should use it if you
> > - have more than one device that can be partitioned or
> > - want to get used to the new code from the beginning.
>
> As far as the MTD device goes I'm in a pretty good spot.  I put together
> a driver that takes two flashes, creates one device from them, and then
> partitions them the way I want.  Then I put jffs2 onto my one BIG flash
> partition.  And that's where I get problems.  It takes a very long time
> to mount the jffs2 partition and I'm looking for the latest jffs2 code
> to try to speed things up (I recall there was some talk about long mount
> times a little while back).
>
> So what I'm looking for is faster jffs2 code.  Also, does it matter if I
> grab stuff from the 2.5 branch if I'm using a 2.4 kernel?

You need the latest JFFS2 code to get faster mount time.
As far as I know, it works on 2.4 also. I haven't tried yet, I am on the
stable branch still, but I do run most of mount speedups and that reduced my
mount time from about 14 sec to about 4 sec(if my memory serves me right)

   Jocke

>
> Thanks,
> Andy
>
