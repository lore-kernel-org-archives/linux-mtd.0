Received: from mailf.telia.com ([194.22.194.25])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1Al-0004RC-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 21:54:39 +0000
Message-ID: <002f01c1bb23$dfceb540$e0d9b5d4@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <gleixner@autronix.de>, "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se> <02022122583010.18560@thomas>
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow
Date: Thu, 21 Feb 2002 23:05:29 +0100
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

> On Thursday, 21. February 2002 15:34, Joakim Tjernlund wrote:
> >
> > > Sorry. Can you make sure it still applies to the current CVS tree and
> > > resend it?
> > Well, I not using the current CVS at the moment. It will take some time
> > until I upgrade again.
>
> I tried it with current CVS and there is no difference without or with
> optimizing. Mount time for a 8MB NAND partition in all variants ~11 sec.
on a
> 74MHz ARM7.

What did you try? My cfi_cmd0001.c changes(I guess not, since you are
on NAND) or the inode cache thing?

Has someone else tried? results?

    Jocke
