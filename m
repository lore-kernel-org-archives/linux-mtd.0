Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtKTY-0000xN-7P
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 03:19:49 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <20050715031948.GA22659@slurryseal.ddns.mvista.com>
References: <20050715031948.GA22659@slurryseal.ddns.mvista.com>
Content-Type: text/plain
Date: Fri, 15 Jul 2005 09:22:48 +0200
Message-Id: <1121412168.24449.98.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND bbt build reads wrong oob data
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-14 at 20:19 -0700, Todd Poynor wrote:
> The value read seems to be a different byte, perhaps offset 14 instead
> of offset 5 as specified by the placement scheme.  The hack that seems
> to fix it for me, namely to read the whole OOB area instead of the
> individual byte, is below. 

That's pretty strange. Which chip type are you using ? 

>(I also got rid of some refs to scanlen
> which is forced to zero for the ! NAND_BBT_SCANEMPTY case, 

The check_short stuff carries some needless arguments anyway. I
committed a cleanup, no functional change. I like to know more about
that before changing it.

> and
> NAND_BBT_SCAN2NDPAGE is triggering a BUG I haven't investigated yet.)

You introduced it by setting readlen = mtd->ooblock. I know that the
name of this is confusing. oobblock is the page size. So readlen is >
buffersize.

tglx
