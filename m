Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZrFP-00057K-CP
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 13:07:03 +0100
From: Juergen Beisert <jbeisert@eurodsn.de>
To: tglx@linutronix.de
Date: Tue, 8 Jul 2003 14:05:55 +0200
References: <200307081001.10555.jbeisert@eurodsn.de>
	<200307081242.54207.tglx@linutronix.de>
In-Reply-To: <200307081242.54207.tglx@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200307081405.56822.jbeisert@eurodsn.de>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND-Flash ECC data not used
Reply-To: jbeisert@eurodsn.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 8. Juli 2003 12:42 schrieben Sie:
> On Tuesday 08 July 2003 10:01, Juergen Beisert wrote:
>
> Have you enabled CONFIG_JFFS2_NAND ?

I cannot find any source- or "Config.in" file that uses or defines this macro. 
Not in my 2.4.21pre4 nor in the mtd snapshot (from July 1. 2003).

> This happens on boot up too, if you have not given the fs type in the
> commandline and the kernel tries to mount the partition with ext2 first.
> It should not happen with jffs2.

Id did: mount -t jffs2 /dev/mtdblock5 /flash

JB
