Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KHDHx-0000P7-8y
	for linux-mtd@lists.infradead.org; Fri, 11 Jul 2008 07:43:34 +0000
Message-ID: <415761812.24316@cqu.edu.cn>
Subject: [ubi][wl] the W/R performance of my wear-leveling unit
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2008 15:42:43 +0800
Message-Id: <1215762163.2784.60.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've compared the current WL unit algorithm with 
my new WL unit one on the W/R time.


modprobe nandsim + ubi + ubifs.
And then copy a file (9338201 Bytes) to 

##time for i in `seq 1 20`; do sudo dd if=~/tmp/file of=/mnt/ubifs/file
count=1024&> /dev/null; sync; done

in the first time. the time of currenty algorithm and mine is as
following:

current UBI gives:

real	0m3.145s
user	0m0.124s
sys	0m0.700s

mine:
real	0m2.539s
user	0m0.140s
sys	0m0.772s


some more experiment share:

-- 
yours Sincerely,

xiaochuan-xu (许小川)
