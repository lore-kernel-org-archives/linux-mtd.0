Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15C3Bk-0002kB-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 18:51:48 +0100
Date: Mon, 18 Jun 2001 18:50:37 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Xavier DEBREUIL <xde@inventel.fr>
cc: Abraham vd Merwe <abraham@2d3d.co.za>,
    Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
In-Reply-To: <3B2E3326.41CDE263@inventel.fr>
Message-ID: <Pine.LNX.4.33.0106181850210.24172-100000@imladris.demon.co.uk>
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

On Mon, 18 Jun 2001, Xavier DEBREUIL wrote:

> when using cfi :
> clep7211 flash: probing for 2 partitions (buswidth = 4)
> clep7211: Found 2 x16 devices at 0x0 in 32-bit mode
> 
> seems that I have to write a piece of code or simply add a configuration
> to amd_flash.c corresponding to that flash.

It's working. You don't need to do anything.

-- 
dwmw2
