Received: from pd9eb8d14.dip.t-dialin.net ([217.235.141.20] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e10m-0004QN-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 21:44:20 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>,
   "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow
Date: Thu, 21 Feb 2002 22:58:30 +0100
Cc: <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Message-Id: <02022122583010.18560@thomas>
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

On Thursday, 21. February 2002 15:34, Joakim Tjernlund wrote:
>
> > Sorry. Can you make sure it still applies to the current CVS tree and
> > resend it?
> Well, I not using the current CVS at the moment. It will take some time
> until I upgrade again.

I tried it with current CVS and there is no difference without or with 
optimizing. Mount time for a 8MB NAND partition in all variants ~11 sec. on a 
74MHz ARM7.
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
