Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uM6K-00041D-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 23:25:04 +0100
Message-ID: <3AEDE678.51C6F94E@daniel.com>
Date: Mon, 30 Apr 2001 17:26:00 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>,
	jffs-dev <jffs-dev@axis.com>,
 	David Woodhouse <dwmw2@infradead.org>
Subject: Wear Leveling in JFFS2 NOT working!(?)
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

I setup a simple test to measure the wear leveling. During my power down
tests (which are at 10,090 cycles!) I print to the console which sector
is being erased.

Then using a simple program, I went through the console log and got the
following result: (Note! This data is only from 3615 of the total 10,090
pwr cycles).

Sector Address:0x780000 Number Of Erases:2050
Sector Address:0x640000 Number Of Erases:1573
Sector Address:0x600000 Number Of Erases:1503
Sector Address:0x5c0000 Number Of Erases:1406
Sector Address:0x580000 Number Of Erases:1297
Sector Address:0x500000 Number Of Erases:1045
Sector Address:0x4c0000 Number Of Erases:824
Sector Address:0x7c0000 Number Of Erases:2283
Sector Address:0x740000 Number Of Erases:1906
Sector Address:0x700000 Number Of Erases:1817
Sector Address:0x6c0000 Number Of Erases:1753
Sector Address:0x680000 Number Of Erases:1654
Sector Address:0x540000 Number Of Erases:1190
Sector Address:0x480000 Number Of Erases:514
Sector Address:0x440000 Number Of Erases:216
Sector Address:0x400000 Number Of Erases:60
Sector Address:0x3c0000 Number Of Erases:13
Sector Address:0x380000 Number Of Erases:1

Total Unique Sectors Found= 20, total sum of all erases=21105

Obviously, not all sectors are being "cycled" evenly. As a matter of
fact, none of the sectors below 0x380000 are being cycled at all.

I am using 4x wide 8bit memory for a total of 8MBytes (for a total of 32
sectors). 12 sectors haven't even been touched.

The fs is a "root" fs, with about 4-5Megs of the 8MB with static OS data
and the rest being used to write out 100 binary files (about 100-400KB
total).

Now, one thing that may be tripping up the wear leveling algorithm is
the fact that the system is being cycled every 2-3 minutes.


David? What does the algorithm to "pickup" a new "less cycled" sector
and give a over-used sector a rest depend on?

Thanks

Vipin
