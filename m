Received: from mxsfrcohou01.daniel.com ([12.19.98.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17akWV-0004dE-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 23:03:51 +0100
Message-ID: <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
From: "Malik, Vipin [FRCO/HOU]" <Vipin.Malik@EmersonProcess.com>
To: linux-mtd@lists.infradead.org
Cc: 'David Woodhouse' <dwmw2@infradead.org>
Subject: MTD Partition problems
Date: Fri, 2 Aug 2002 16:59:07 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I'm just getting back into playing with this.

Is there something broken with the mtd partitioning code?

I defined 3 mtd partitions on one 8MB flash. The partitions look fine on the
debug log and a "cat /proc/mtd" shows three devices with the proper sizes
and names as defined in my "mtd_partition" map structure in my map file.

However, it seems that 6 mtd partitions have been added (even though just 3
show up in /proc/mtd)!

Each of mtd[0,1], mtd[2,3] and mtd[4,5] pairs point to partitions 1,2&3
respectively. Each of the pairs point to the same partitions (have the same
stuff in them).

However mtdblock0,1,2 point to the correct partitions!

And I've checked that my /dev/mtd0,1,2,3,4,5 devices are pointing to char
devices 30,1...5

Any clues?

Vipin
 
