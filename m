Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e0RG-0007Z1-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 22:12:11 +0000
Date: Wed, 29 Jan 2003 22:43:08 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Siddharth Choudhuri <choudhri@cs.tamu.edu>
cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.GSO.4.44.0301291359440.296-100000@unix.cs.tamu.edu>
Message-ID: <Pine.LNX.4.44.0301292241561.4791-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Subject: Re: Problems writing to mounted jffs...
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

On Wed, 29 Jan 2003, Siddharth Choudhuri wrote:

> I am following the mtd-jffs howto to have jffs on LART(ARM processor with
> 4MB Intel D28F160 Flash).

Why are you using JFFS instead of JFFS2?

> lart: write error at address 0x00100d64. //This address keeps increasing

Problem with the LART flash driver? Can you make it be more specific about 
what error it saw?

-- 
dwmw2
