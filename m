Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bmr7B-00088v-Rg
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 05:40:50 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <40FCDE5A.6080504@magellan-technology.com>
References: <40FCDE5A.6080504@magellan-technology.com>
Content-Type: text/plain
Message-Id: <1090316488.6864.0.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Tue, 20 Jul 2004 11:41:28 +0200
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: problems mounting >3.3MB JFFS2 partitions on Dataflash on
	AT91RM9200DK
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-20 at 10:56, Aras Vaichas wrote:
> I did notice one other strange thing. I turned on a DEBUG option in 
> at91_dataflash.c that showed all access to the dataflash device. When I 
> mounted the mtd3 or mtd4, it showed reading activity going on with the 
> dataflash. But when I mounted mtd2, the dataflash was not even accessed. 
> It is like the software isn't even getting that far.

Turn on MTD_DEBUG and JFFS2_DEBUG and provide the output of those

tglx
