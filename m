Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17avUJ-0005nI-00
	for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2002 10:46:19 +0100
Date: Sat, 3 Aug 2002 11:46:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Malik, Vipin [FRCO/HOU]" <Vipin.Malik@emersonprocess.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD Partition problems
Message-ID: <20020803094616.GA13044@wohnheim.fh-wedel.de>
References: <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
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

On Fri, 2 August 2002 16:59:07 -0500, Malik, Vipin [FRCO/HOU] wrote:
> I'm just getting back into playing with this.
> 
> Is there something broken with the mtd partitioning code?

Not really broken, but maybe useless.

> I defined 3 mtd partitions on one 8MB flash. The partitions look fine on the
> debug log and a "cat /proc/mtd" shows three devices with the proper sizes
> and names as defined in my "mtd_partition" map structure in my map file.
> 
> However, it seems that 6 mtd partitions have been added (even though just 3
> show up in /proc/mtd)!
> 
> Each of mtd[0,1], mtd[2,3] and mtd[4,5] pairs point to partitions 1,2&3
> respectively. Each of the pairs point to the same partitions (have the same
> stuff in them).

One device of each pair is read-only. This is by design and scheduled
to be ripped out sometime.

David, 2.4.19 is released, but I am right in my exam period. Does end
of August and/or beginning of September sound ok for the merge?

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
