Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163by3-0004ah-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2001 11:43:03 +0000
Date: Tue, 13 Nov 2001 12:52:22 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Simon Barber <simon@barber.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in mtdblock_ro
Message-ID: <20011113125222.A2490@wohnheim.fh-wedel.de>
References: <20011105172238.A10542@wohnheim.fh-wedel.de> <20011106133944.A1828@wohnheim.fh-wedel.de> <000201c16bc4$dae53120$7f01010a@instant802.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000201c16bc4$dae53120$7f01010a@instant802.com>; from simon@barber.net on Tue, Nov 06, 2001 at 05:11:17AM -0800
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

Moin!

> the call in mtdblock_request to MTD_READ/WRITE passes nr_sectors, it should
> pass current_nr_sectors.

Could you quickly add, what version has this problem? The filename
should be enough. When I get back from vacation (Thursday), I will
have a look at it.

Jörn

-- 
If you treat your beta-testers as if they're your most valuable resource, 
they will respond by becoming your most valuable resource.
