Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vKzp-0000wN-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 16:26:26 +0100
Message-ID: <3AF178EB.89D9D094@daniel.com>
Date: Thu, 03 May 2001 10:27:39 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd <linux-mtd@lists.infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?)
References: <Pine.LNX.4.33.0104302356320.10289-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:

> On Mon, 30 Apr 2001, Vipin Malik wrote:
>
> > Obviously, not all sectors are being "cycled" evenly. As a matter of
> > fact, none of the sectors below 0x380000 are being cycled at all.
> >
> > Now, one thing that may be tripping up the wear leveling algorithm is
> > the fact that the system is being cycled every 2-3 minutes.
>
> That's almost certainly the reason. My testing on prolonged stress tests
> showed a fairly even wear levelling.

Ok, I logged the current state of the num of sectors erased, stopped cycling
power
(but let the infinite write to JFFS2 continue). After 3 days I took another
snapshot
of the num erase sectors:

(The results are posted below if anyone is interested)
As hypothesized, the every few minutes cycling was what was screwing up the
wear leveling algorithm. After the cycling stopped, all sectors showed up in
the log
and additionally each was cycled the same number of times!

In my opinion, there should be no need to fix the algorithm to accommodate
the
frequent cycling. Power going down every few minutes is (usually) NOT a
normal
mode of operation of an embedded system.

At least I'm happy with it the way it currently is.

Vipin

************ Data follows *********************************************
***Snap shot1 (when power was being cycled, you can see the uneven wear
leveling of the sectors.
Additionally only 20 sectors have ever been erased in >3000 cycles) ****

Sector Address:0x780000 Number Of Erases:2823
Sector Address:0x640000 Number Of Erases:2162
Sector Address:0x600000 Number Of Erases:2077
Sector Address:0x5c0000 Number Of Erases:1939
Sector Address:0x580000 Number Of Erases:1795
Sector Address:0x500000 Number Of Erases:1454
Sector Address:0x4c0000 Number Of Erases:1146
Sector Address:0x7c0000 Number Of Erases:3143
Sector Address:0x740000 Number Of Erases:2627
Sector Address:0x700000 Number Of Erases:2499
Sector Address:0x6c0000 Number Of Erases:2410
Sector Address:0x680000 Number Of Erases:2280
Sector Address:0x540000 Number Of Erases:1644
Sector Address:0x480000 Number Of Erases:727
Sector Address:0x440000 Number Of Erases:301
Sector Address:0x400000 Number Of Erases:90
Sector Address:0x3c0000 Number Of Erases:17
Sector Address:0x380000 Number Of Erases:3
Total Unique Sectors Found= 20, total sum of all erases=29137

*** Power cycling was now stopped . Snapshot data follows (from after 1 days
worth of writes to JFFS2) *********

Sector Address:0x780000 Number Of Erases:3214
Sector Address:0x640000 Number Of Erases:2552
Sector Address:0x600000 Number Of Erases:2467
Sector Address:0x5c0000 Number Of Erases:2330
Sector Address:0x580000 Number Of Erases:2185
Sector Address:0x500000 Number Of Erases:1844
Sector Address:0x4c0000 Number Of Erases:1537
Sector Address:0x7c0000 Number Of Erases:3534
Sector Address:0x740000 Number Of Erases:3018
Sector Address:0x700000 Number Of Erases:2889
Sector Address:0x6c0000 Number Of Erases:2800
Sector Address:0x680000 Number Of Erases:2670
Sector Address:0x540000 Number Of Erases:2035
Sector Address:0x480000 Number Of Erases:1118
Sector Address:0x440000 Number Of Erases:691
Sector Address:0x400000 Number Of Erases:480
Sector Address:0x3c0000 Number Of Erases:407
Sector Address:0x380000 Number Of Erases:393
Sector Address:0x340000 Number Of Erases:390
Sector Address:0x300000 Number Of Erases:390
Sector Address:0x2c0000 Number Of Erases:390
Sector Address:0x280000 Number Of Erases:390
Sector Address:0x240000 Number Of Erases:390
Sector Address:0x200000 Number Of Erases:390
Sector Address:0x1c0000 Number Of Erases:390
Sector Address:0x180000 Number Of Erases:390
Sector Address:0x140000 Number Of Erases:389
Sector Address:0x100000 Number Of Erases:389
Sector Address:0xc0000  Number Of Erases:389
Sector Address:0x80000  Number Of Erases:389
Sector Address:0x40000  Number Of Erases:389
Sector Address:0x0      Number Of Erases:389
Total Unique Sectors Found= 34, total sum of all erases=41618

...and viola all sectors show up on the list and each has been erased *an
additional* 389-390 times from the last snapshot when power cycling was still
going on.
