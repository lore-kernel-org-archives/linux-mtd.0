Received: from rwcrmhc51.attbi.com ([204.127.198.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lVt9-0003rb-00
	for <linux-mtd@lists.infradead.org>; Sun, 01 Sep 2002 15:39:43 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: 48meg DOC
Date: Sun, 1 Sep 2002 10:38:39 -0400
Cc: linux-mtd@lists.infradead.org
References: <20020830140409.A7B5B11DE6@sitemail.everyone.net> <200208301749.24444.hno@marasystems.com>
In-Reply-To: <200208301749.24444.hno@marasystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020901143912.MCJQ12451.rwcrmhc51.attbi.com@there>
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

The UnitSizeFactor problem will go away if you reformat the DoC with the 4.2 
version of the M-Sys DFORMAT utility.  This version is still available at 
www.m-sys.com.

After reformatting with 4.2, you should be able to use Grub for booting, and 
also have multiple partitions on the DoC.

Mark

Henrik Nordstrom wrote:
> But I have not yet figured out how to do this in a stable manner. GRUB does
> not like my DOC chips complaining about a UnitSizeFactor parameter in the
> NFTL header (perhaps because of them being formatted by the new firmware? 
