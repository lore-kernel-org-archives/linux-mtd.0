Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Bd1d-0003J6-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 15:32:25 +0000
Date: Tue, 12 Nov 2002 17:02:35 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ian Campbell <icampbell@arcomcontrols.com>
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] Add a map_sram driver to drivers/chips/
Message-ID: <20021112160235.GD5031@wohnheim.fh-wedel.de>
References: <1037099125.26491.81.camel@LinuxDev>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1037099125.26491.81.camel@LinuxDev>
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

On Tue, 12 November 2002 11:05:25 +0000, Ian Campbell wrote:
> 
> The attached patch adds "map_sram" as a second chip driver in
> drivers/mtd/chips/map_ram.c.  The two are basically identical apart from
> the use of the MTD_VOLATILE flag.

Slightly OT.

Have you tried the slram driver? I have always used that one to access
plain old memory and was very happy. And now you make me wonder, if
there is another way that might even be better.

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
