Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18LecS-0005Zd-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 07:15:53 +0000
Date: Tue, 10 Dec 2002 08:46:23 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: fred <fred@sc23.sc.mcel.mot.com>
Cc: linuxppc-embedded@lists.linuxppc.org, linux-mtd@lists.infradead.org
Subject: Re: Which filesystem can live on one flash sector?
Message-ID: <20021210074623.GA23134@wohnheim.fh-wedel.de>
References: <000001c2a011$ab5926f0$940879c8@sc.mcel.mot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000001c2a011$ab5926f0$940879c8@sc.mcel.mot.com>
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

On Tue, 10 December 2002 14:02:05 +0800, fred wrote:
> 
> I am using CRAMFS plus RAMFS on my board.
> And there is only one sector left for saving configuration data.
> Can I put a file system, e.g. JFFS, on it?

You can use ext2 or minix. The just ain't no journaling with only one
erase block, so forget about jffs[12], ext3 and so on.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
