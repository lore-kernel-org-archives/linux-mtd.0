Received: from port61.vestas.dk ([195.41.59.61] helo=cotas2.cotas.vestas.dom)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195LTJ-0008T3-1J
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 09:07:17 +0100
From: Esben Nielsen <esn@cotas.dk>
To: <manningc2@actrix.gen.nz>,
 <linux-mtd@lists.infradead.org>
Date: Tue, 15 Apr 2003 10:06:51 +0200
References: <20030414230258.A173D155EF@desire.actrix.co.nz>
In-Reply-To: <20030414230258.A173D155EF@desire.actrix.co.nz>
MIME-Version: 1.0
Message-Id: <200304151006.51147.esn@cotas.dk>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Database on JFFS2?
Reply-To: esn@cotas.dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our flash is NOR (Intel statoflash). What we a going for is a standeard SQL 
solution  - so it isn't enough that the filesystem has a database-like 
behaviour.

Someone from this list pointed out sqlite to me yesterday. I am looking into 
that now.  It has a log system. The most optimal would be if the database 
could be tuned not to write too often and on other hand when it does it is 
flush to flash immediately to prevent datacorruption. I am not quite sure how 
to make it work with JFFS2. DoesJFFS2 write immediately on fsync() or it is 
buffered in ram making the database believe it is safe to delete it's 
transactionlog?

Esben

On Tuesday 15 April 2003 01:03, Charles Manning wrote:
> On Mon, 14 Apr 2003 20:08, Esben Nielsen wrote:
> > Is it posible to run a sql database (mysql forinstance) on a JFFS2
> > filesystem?
>
> What kind of flash? NOR flash is very slow for writing, making some
> database solutions impractical.
>
> People are using NAND with YAFFS in database-like solutions.
>
> -- CHarles
