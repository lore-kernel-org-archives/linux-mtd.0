Received: from port-19.ottawa4.achilles.net ([209.151.2.118] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RgLO-0005dJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 21:42:25 +0100
Date: Tue, 31 Jul 2001 16:47:14 -0400 (EDT)
From: David Woodhouse <dwmw2@infradead.org>
To: "Walser, Martin" <mwalser@harris.com>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: unable to mount Disk on Chip -> unknown partition table
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB1921BCE91@ranmx1.ran.harris.com>
Message-ID: <Pine.LNX.4.33.0107311645340.27691-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 31 Jul 2001, Walser, Martin wrote:

> $Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $

Update to a version from this year and try again. Preferably the latest 
from CVS. (v1.76 of nftlcore.c and v1.19 of nftlmount.c). Make sure you 
have the latest doc*.c hardware driver code too.

-- 
dwmw2
