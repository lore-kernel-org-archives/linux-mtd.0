Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195MV7-0000HK-2S
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 10:13:13 +0100
Date: Tue, 15 Apr 2003 11:13:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Esben Nielsen <esn@cotas.dk>
Message-ID: <20030415091306.GD10280@wohnheim.fh-wedel.de>
References: <20030414230258.A173D155EF@desire.actrix.co.nz>
	<200304151006.51147.esn@cotas.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200304151006.51147.esn@cotas.dk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: manningc2@actrix.gen.nz
cc: linux-mtd@lists.infradead.org
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 April 2003 10:06:51 +0200, Esben Nielsen wrote:
> 
> Our flash is NOR (Intel statoflash). What we a going for is a standeard SQL 
> solution  - so it isn't enough that the filesystem has a database-like 
> behaviour.
> 
> Someone from this list pointed out sqlite to me yesterday. I am looking into 
> that now.  It has a log system. The most optimal would be if the database 
> could be tuned not to write too often and on other hand when it does it is 
> flush to flash immediately to prevent datacorruption. I am not quite sure how 
> to make it work with JFFS2. DoesJFFS2 write immediately on fsync() or it is 
> buffered in ram making the database believe it is safe to delete it's 
> transactionlog?

afaik jffs2 writes immediately to flash, even without fsync, as long
as you use NOR. NAND holds a buffer for 2s, I'd have to check when
this is flushed exactly.

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
