Received: from mail.iok.net ([62.249.129.22] helo=mail05.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1969K6-0000G2-Aa
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 14:21:06 +0100
Received: from lin01.mn-logistik.de (frdb-d9b94bc1.pool.mediaWays.net
	[217.185.75.193])
	by mail05.iok.net (8.12.5/8.12.5) with ESMTP id h3HDLAsA025075
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 15:21:11 +0200
Received: from mnz66.mn-logistik.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-logistik.de (Postfix) with ESMTP id 18C141FF1A
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Apr 2003 15:05:39 +0200 (CEST)
From: Holger Schurig <h.schurig@mn-logistik.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 17 Apr 2003 15:05:38 +0200
References: <1050513945.1172.265.camel@tubarao>
In-Reply-To: <1050513945.1172.265.camel@tubarao>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304171505.38785.h.schurig@mn-logistik.de>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: device info in /proc/mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> It would be nice to be able to query
> this information at any time - a specific model of motherboard might
> socket a different chip depending on cost/availability and I'd like to
> be able to track which BIOS flash chip is being used.

For what do you need this?     Do "dmesg >/var/log/dmesg" at boot-time and you 
can grep this file whenever you want it.

Many people won't need this info, they run linux in a tightly defined 
environment where you always load the same drivers for the MTD subsystem. 
They know if the have a 49FL004 or whatever. No need to retrieve this info 
from somewhere else.

Adding fields after the output of /proc/mtd may break some applications that 
use this info, e.g. flash utilities.
