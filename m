Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvwEf-0007SH-Pg
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 10:25:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <403C6FC3.1941.DDC08@localhost>
References: <6A03D4BC2018@baydel.com>  <403C6FC3.1941.DDC08@localhost>
Content-Type: text/plain
Message-Id: <1077704741.11584.953.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 25 Feb 2004 10:25:41 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-02-25 at 09:49 +0000, simon@baydel.com wrote:
> As I do mount read only on shutdown I assume this is corruption ?

Maybe. I doubt it's _harmful_ but I am very interested.

Any chance you can run with CONFIG_JFFS2_FS_DEBUG=1 and log _all_ the
messages over a serial console, then see what it wrote at the offending
address when you get a CRC error?

-- 
dwmw2
