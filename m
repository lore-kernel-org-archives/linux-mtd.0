Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpSkc-0004KQ-Ng
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 10:16:20 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Andy Hawkins <a.hawkins@cabletime.com>
In-Reply-To: <1090935846.17545.3.camel@adh>
References: <1090923928.2237.6.camel@adh>
	<1090930297.20889.93.camel@thomas.tec.linutronix.de>
	<1090935846.17545.3.camel@adh>
Content-Type: text/plain
Message-Id: <1090937404.20889.166.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Tue, 27 Jul 2004 16:10:04 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Large JFFS2 filesystem problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-27 at 15:44, Andy Hawkins wrote:
> 'kmalloc' to a 'vmalloc' and this appeared to work. Your patch also has
> the desired effect.

Thanks, fixed in CVS

tglx
