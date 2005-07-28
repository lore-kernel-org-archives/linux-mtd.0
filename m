Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy7Ki-0007oG-Ml
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 08:18:00 -0400
Received: from dsl-082-082-158-021.arcor-ip.net ([82.82.158.21]:40881
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1Dy7NZ-0005ZX-RA
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 14:20:49 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1Dy7Kd-0007OA-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2005 14:17:47 +0200
Date: Thu, 28 Jul 2005 14:17:47 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050728121746.GA28368@zappa>
References: <20050706144545.GA11447@zappa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050706144545.GA11447@zappa>
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Konstantin Kletschke <lists@ku-gbr.de> [Wed, Jul 06, 2005 at 04:45:45PM +0200]:

> I had XIP in linux-2.6.11 running very well.

Meanwhile I found out a solution.
I switched off CONFIG_FPE_NWFPE=y which the XIP System seems to depend
on!

K
