Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195ktW-0004Xj-FV
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 12:16:02 +0100
Date: Wed, 16 Apr 2003 13:16:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jasmine Strong <jasmine@regolith.co.uk>
Message-ID: <20030416111608.GA21544@wohnheim.fh-wedel.de>
References: <20030415161442.GF7721@wohnheim.fh-wedel.de>
	<A97C8A02-6F5E-11D7-B468-000393AD6294@regolith.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A97C8A02-6F5E-11D7-B468-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: Esben Nielsen <esn@cotas.dk>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 April 2003 17:23:59 +0100, Jasmine Strong wrote:
> On Tuesday, Apr 15, 2003, at 17:14 Europe/London, Jörn Engel wrote:
> >On Tue, 15 April 2003 17:11:44 +0100, Jasmine Strong wrote:
> >>Unless it would cause many erases, which would slow things down a 
> >>lot...
> >Erases get triggered by garbage collection, which depends on the
> >amount of data written, not the chunk size.
> 
> yes.  I think my two points were actually the same point taken twice :-)
> If you're only updating a few bytes of data you will end up writing
> a large proportion of log control data.  That'll end up being
> responsible for most of the erase traffic.

Actually, that shouldn't matter too much. For comparison, I did some
benchmarks using jffs2 (without compression) as a filesystem for a
ramdisk.

The benchmark wrote data to jffs2, deleted it and repeated this
several times to remove statistical noise. Horrible results.
Then I got a clue and added "sleep 6" after both writing and deleting,
getting roughly twice the performance. Why?

Under normal operation, the system is idle a lot and the garbage
collector (GC) has plenty of time to clean up the mess you made. But
the first benchmark was measuring a system without idle times, so all
writes were waiting for GC to finally free some space. Wrong.

Back to the Database:
Even if you write data in very small chunks, the system should have
enough free time to GC those fragments and reassemble them into larger
chunks with less overhead, so this doesn't matter.

Unless you permanently operate near the limit. Without the free time
for GC, this does matter.

> Still, if you need to be powerfail-safe, I can't see any way of not
> doing this.

Right.

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
