Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FRm4v-0008Tp-7S
	for linux-mtd@lists.infradead.org; Fri, 07 Apr 2006 04:12:32 -0400
Date: Fri, 7 Apr 2006 10:12:20 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Holger Schurig <h.schurig@mn-solutions.de>
Message-ID: <20060407081220.GE10831@localhost.localdomain>
References: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>
	<200604070828.33546.h.schurig@mn-solutions.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200604070828.33546.h.schurig@mn-solutions.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem of "JFFS2 summary"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 07, 2006 at 08:28:33AM +0200, Holger Schurig wrote:
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
> > 0x00080000: 0x00b0 instead jffs2_scan_eraseblock(): Magic bitmask
> > 0x1985 not found at 0x00080004: 0x00b0 instead
> 
> I got similar problems with stock kernel 2.6.16.1 and sumtool from 
> mtd-utils, CVSDATE 2006-02-23.
> 
> After this, I thought "nice idea", recompiled my kernel without 
> CONFIG_JFFS2_SUMMARY and flashed the normal jffs2 image to get a 
> working system.

Just for the sake of completeness: I too tried it yesterday with
2.6.16-git and sumtool from mtd cvs and got the same errors.
Continued to work without summary support then.

Sascha
