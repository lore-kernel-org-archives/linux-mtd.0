Received: from mailf.telia.com ([194.22.194.25])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1Vr-0004W2-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 22:16:27 +0000
Message-ID: <004501c1bb26$eb668380$e0d9b5d4@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <gleixner@autronix.de>, "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se> <02022122583010.18560@thomas> <002f01c1bb23$dfceb540$e0d9b5d4@jocke> <02022123225211.18560@thomas>
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow
Date: Thu, 21 Feb 2002 23:27:17 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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


> On Thursday, 21. February 2002 23:05, Joakim Tjernlund wrote:
> > What did you try? My cfi_cmd0001.c changes(I guess not, since you are
> > on NAND) or the inode cache thing?
> the inode cache thing

hmm, how big is your FS? Maybe, if you have a small FS the inode 
cache thing gets lost in "noise" from the NAND driver?

My FS is 63 MB and df reports 31% used.

      Jocke
