Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bmtow-00005K-9X
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 08:34:10 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <40FCDE5A.6080504@magellan-technology.com>
References: <40FCDE5A.6080504@magellan-technology.com>
Content-Type: text/plain
Date: Tue, 20 Jul 2004 08:33:05 -0400
Message-Id: <1090326785.4378.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: problems mounting >3.3MB JFFS2 partitions on Dataflash on
	AT91RM9200DK
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-20 at 18:56 +1000, Aras Vaichas wrote:
> I am running Linux-2.4.6-VRS-1 on the AT91RM9200DK development board. I 
> have tried using command line partitions and setting at91_dataflash.c, 
> it makes no difference.

That's a lot of eraseblocks. I think your problem is fixed in 2.6.8-rc2.

-- 
dwmw2
