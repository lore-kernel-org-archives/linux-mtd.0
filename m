Received: from ns2.discountwebhost.com ([64.170.22.131] helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17axOU-000603-00
	for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2002 12:48:26 +0100
Message-Id: <5.1.0.14.0.20020803070206.03f02008@64.170.22.132>
Date: Sat, 03 Aug 2002 07:09:34 -0500
To: MTD mailing list <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: MTD partitioning code broken?
Cc: David Woodhouse <dwmw2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Hi Folks,

I'm just getting back into playing with this again after successfully 
setting up partitioning up last year..

Is there something broken with the mtd partitioning code?

I defined 3 mtd partitions on one 8MB flash in my map file (based off the 
maps/netsc520.c). The partitions look fine on the printk debug log and a 
"cat /proc/mtd" shows three devices with the proper sizes and names as 
defined in my "mtd_partition" map structure in my map file.

However, it seems that 6 mtd partitions have been added (even though just 3 
show up in /proc/mtd)!
All 6 mtd devices from /dev/mtd0...5 allow a "less -f on them".

Each of mtd[0,1], mtd[2,3] and mtd[4,5] pairs point to partitions 1,2&3 
respectively. Each of the *pairs* above point to the same partitions (have 
the same stuff in them, pair 1 points to partition 1 etc.).

However mtdblock0,1,2 each points to the correct partition! In fact I'm 
booting root fs from /dev/mtdblock1 which does contain the correct 
compressed root fs.

And I've checked that my /dev/mtd0,1,2,3,4,5 devices are pointing to char 
devices 30,1...5

Any clues?

Vipin

P.S. This is a resend of my mail yesterday from my work address that 
apparently did not make it even though the MX-verify script did not have a 
problem with my work address(?). In case that one shows up too- apologies!
