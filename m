Received: from rwcrmhc53.attbi.com ([204.127.198.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JkrM-0000q5-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 01:31:24 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: R/db <daryl.bunce@attws.com>
Subject: Re: DoC2000 288MiB / grub clobbered after partitioning
Date: Wed, 4 Dec 2002 21:00:52 -0500
References: <20021202182358.A1534@attws.com>
In-Reply-To: <20021202182358.A1534@attws.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E18JkrM-0000q5-00@pentafluge.infradead.org>
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

R/db wrote:
> Thanks everyone for all the good stuff.
> Mark (Meade), could you add a note into
> your howto about dropping the right-most
> zero when feeding the win: param to dformat?
> (It was confusing to me, especially after
> reading the M-Sys documentation)

Sure.  I'm in the process of updating it now.  

> Cannot calculate an NFTL geometry to match size of 0x8d040
> Using C:1002 H:16 S:36 (== 0x8ce80 sects)

Have you had any more luck with your geometry problem?  I've seen this 
before, but I wasn't able to figure out exactly what was going on.  I haven't 
seen it lately with my 32MB DoC 2000.

Does it happen if you don't install Grub?  Just use DFORMAT without the BDKF 
option.  fdisk should show the one FAT partition created by dformat.

Maybe specifying some extra room for Grub (/BDKL0:<size> option to DFORMAT) 
might help -- make the total size divisible by 8k or 16k?   I'm not sure 
about this, it's just a guess.

Let me know if you do get to the bottom of this, and I'll update the 
instructions accordingly.
