Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196Evi-000289-F1
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 20:20:18 +0100
From: Russ Dill <Russ.Dill@asu.edu>
To: "Brian T." <btuch@usa.net>
In-Reply-To: <002001c30514$f78e78a0$150a0ac0@jbmsoft.com>
References: <002001c30514$f78e78a0$150a0ac0@jbmsoft.com>
Message-Id: <1050607396.30761.26.camel@russ.local>
Mime-Version: 1.0
Date: 17 Apr 2003 12:23:16 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 compression question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I have jffs2 running on a 2.4.20 kernel custom Embedded box with 16MB ROM
> (Intel flash) and 32MB RAM.  The file system is about 52% full, and has
> about 22MB of free RAM.  When I copy 4 ~1.6MB programs over to the ROMFS I
> loose about 3MB of space with compression.  The system however also uses
> another ~3MB RAM once the files are done being copied.  My question is, when
> does (if ever) that 3MB RAM get freed up?  If I delete the files I just
> copied, the RAM appears to be freed up.   If I reboot the unit, the RAM gets
> reset back to the original 22MB RAM free.

linux tries not to let any RAM go to waste, so if there is free ram, it
uses it for caches and buffers. If you were to read these files again,
it would happen quickly because they are in RAM. If more RAM is needed
for other things, then less caches and buffers are used (see
/proc/meminfo for more info)

> Thanks for any insite.

don't worry, everything is working rite.
