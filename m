Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE7oR-0000SC-JQ
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 15:25:55 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <1082019603.16753.37.camel@scapa.ramix-uk.cho.ge.com>
References: <1193074139@web.de>
	 <1082019533.16750.35.camel@scapa.ramix-uk.cho.ge.com>
	 <1082019603.16753.37.camel@scapa.ramix-uk.cho.ge.com>
Content-Type: text/plain
Message-Id: <1082038705.8150.178.camel@tubarao>
Mime-Version: 1.0
Date: 15 Apr 2004 08:18:26 -0600
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Tobias Arp <tobiasarp@web.de>
Subject: Re: patch kernel 2.4.21 (including the arm-linux patch rmk2) with
	the latest CVS snapshot
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-04-15 at 03:00, Martin Donnelly wrote:
> On Thu, 2004-04-15 at 09:58, Martin Donnelly wrote:
> > Apply the two attached patches chips-config.patch to
> > 'drivers/mtd/chips/Config.in' and nand-config.patch to
> > 'drivers/mtd/nand/Config.in' which should sort out a couple of syntax
> > errors. e.g `cd linux-2.4.21; patch -p1 -i chips-config.patch`
> 
> And it helps if the patches are attached :-)

Committed.  Thanks.

-- 
Thayne Harbaugh
Linux Networx
