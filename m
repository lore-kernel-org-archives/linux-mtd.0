Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eYYU-0002Sj-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 10:01:06 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B22@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>,
   Wojciech Kromer
	 <krom@dgt-lab.com.pl>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Wed, 5 Sep 2001 11:06:03 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> The mtdblock driver ought to deal with it correctly. If it 
> doesn't, it's 
> broken.

I'm not using the mtdblock driver for the cramfs partition.
I guess it's me that's broken...

/Jonas
