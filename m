Received: from res-exch1.norcom.net ([12.26.73.16])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CokmD-00026o-3u
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 10:51:18 -0500
Message-ID: <294FD9D3403A0340BDAC38E48DCEFFDC935788@RES-EXCH>
From: Lokesh Kumar <kumar.lokesh@wrx-us.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 12 Jan 2005 10:50:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: how to behave on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have an embedded Linux (kernel 2.4.18) board at 50MHz, with jffs2 16MB
flash. My system creates small files of 700 bytes each and is required to
create ~3000 of such files. I see that when there are 1000 files, the system
takes 3 minutes or so to mount this partition and then another 3 to do "ls
-l". When there are 3000 files, the system takes 10 minutes each for mount
and "ls -l". 

Is that expected behaviour?

Lokesh Kumar
