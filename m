Received: from mail5.bluewin.ch ([195.186.1.207])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18duoB-0006tU-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 16:11:27 +0000
Subject: Re: NFTL not recognizing disk on chip in some cases
From: Raphael Hertzog <eng@eipm.ch>
To: Henrik Nordstrom <hno@marasystems.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1043851709.11449.118.camel@henrik.marasystems.com>
References: <1043844420.555.111.camel@localhost>
	 <1043851709.11449.118.camel@henrik.marasystems.com>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043858542.554.144.camel@localhost>
Mime-Version: 1.0
Date: 29 Jan 2003 17:42:22 +0100
Content-Transfer-Encoding: 8bit
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

Am Mit, 2003-01-29 um 15.48 schrieb Henrik Nordstrom:
> From what I recall you must not have the NFTL driver loaded while
> running nftl_format.. if the NTFL driver is loaded then I think bad
> things may happen such as those you describe.

Unless the bad things are irreversible this should not be the case.
AFAIR I always took care to remove the module before formating.

And it doesn't explain why I have the problem when I copy a set of files
and why I doesn't have it with another set of files. Even stranger when
I first copy the good set of files, then umount, remount, remove the
good set of files and copy the problematic set of files then it's ok.

But if I copy the problematic set of files directly during the first
mount after the partitioning/formating then I have the problem exposed
in my previous mail.

Cheers,
-- 
Raphaël Hertzog - EIPM SA
