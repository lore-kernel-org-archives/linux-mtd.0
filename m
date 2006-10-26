Received: from kit-firewall.christiedigital.com ([216.94.43.2])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gd3mC-00044B-6r
	for linux-mtd@lists.infradead.org; Thu, 26 Oct 2006 07:52:10 -0400
Message-ID: <BBFE984BA7B87642BCF1C456FD48C17502553740@kit-mail.christiedigital.com>
From: "Crane, Matt" <Matt.Crane@christiedigital.com>
To: linux-mtd@lists.infradead.org
Subject: Mtd support for 512mbit and greater strataflash with more then on
	e die on chip?
Date: Thu, 26 Oct 2006 07:51:35 -0400
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

The cfi probe of the 2-die 512mb startflash chip we're using in our linux
target only reports the cfi data for the first die.  Is there a way to use
mtd to easily expose the other die and so use the entire chip?  Any input
much appreciated, thanks.

Matt.
