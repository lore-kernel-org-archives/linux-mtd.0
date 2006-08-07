Received: from elvira.its.uu.se ([130.238.164.5])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GA2eA-0005AM-Dx
	for linux-mtd@lists.infradead.org; Mon, 07 Aug 2006 06:47:51 -0400
Received: from Psilocybe.Update.UU.SE (Psilocybe.Update.UU.SE [130.238.19.25])
	by elvira.its.uu.se (Postfix) with ESMTP id B4E171E1
	for <linux-mtd@lists.infradead.org>;
	Mon,  7 Aug 2006 12:42:32 +0200 (MSZ)
Date: Mon, 7 Aug 2006 12:42:32 +0200
To: linux-mtd@lists.infradead.org
Subject: Bad typecast in flash_eraseall ?
Message-ID: <20060807104232.GA27930@Update.UU.SE>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: samuel@Update.UU.SE (Samuel ]slund)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I recently dovnloaded the mtd-utils-1.0.0.tar.gz from www.infradead.org.
When running "flash_eraseall" on a Micrel ks8695p I get some wierd output: 

/ # flash_eraseall /dev/mtd1
Erasing 64 Kibyte @ 30000 -- 4294901765 % complete.

When I moved the typecast (unsigned long long)
at line 155 from before "erase.start" to before "100" :
                           ("\rErasing %d Kibyte @ %x -- %2llu %% complete.",
                             meminfo.erasesize / 1024, erase.start,
                             erase.start *
                             (unsigned long long) 100 / meminfo.size);

the output became correct:
/ # flash_eraseall /dev/mtd1
Erasing 64 Kibyte @ 100000 -- 26 % complete.

Seems like a bug, thought you might want to know.

//Samuel

PS.
Sorry if this has been mentioned before, I did google a bit on the 
list archives but the search interface is not very friendly.
DS.
