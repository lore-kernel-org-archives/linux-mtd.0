Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e9V6-0000GJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 07:52:45 +0000
Date: Thu, 30 Jan 2003 08:23:42 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Alex Samoutin <samoutin@hotbox.ru>
cc: linux-mtd@lists.infradead.org
In-Reply-To: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com>
Message-ID: <Pine.LNX.4.44.0301300822251.4791-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Subject: Re: NAND subsector writing problem
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

On Wed, 29 Jan 2003, Alex Samoutin wrote:
> When I do write and read using "nandwrite/nanddump" utilities - it is look
> like all working fine. However "nandtest" showed me error message during
> subsector writing (see log below). Can I use  jffs2 with this type of
> problem or I have to fix it? (And may be you know - what can cause this
> error?)

Are you expected to be able to use ECC with subsector writes? Surely you 
expect the ECC to fail?

JFFS2 doesn't do subsector writes on NAND, so shouldn't suffer. 

-- 
dwmw2
