Received: from pd9eb99d9.dip.t-dialin.net ([217.235.153.217] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1OD-0004V1-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 22:08:33 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>,
   "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow
Date: Thu, 21 Feb 2002 23:22:52 +0100
Cc: <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se> <02022122583010.18560@thomas> <002f01c1bb23$dfceb540$e0d9b5d4@jocke>
In-Reply-To: <002f01c1bb23$dfceb540$e0d9b5d4@jocke>
MIME-Version: 1.0
Message-Id: <02022123225211.18560@thomas>
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

On Thursday, 21. February 2002 23:05, Joakim Tjernlund wrote:
> What did you try? My cfi_cmd0001.c changes(I guess not, since you are
> on NAND) or the inode cache thing?
the inode cache thing
-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
