Received: from mailout07.sul.t-online.com ([194.25.134.83])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19aGC4-0007cn-Pa
	for <linux-mtd@lists.infradead.org>; Wed, 09 Jul 2003 15:45:16 +0100
From: Juergen Beisert <jbeisert@eurodsn.de>
To: tglx@linutronix.de
Date: Wed, 9 Jul 2003 16:43:59 +0200
References: <200307081001.10555.jbeisert@eurodsn.de>
	<200307081405.56822.jbeisert@eurodsn.de>
	<200307081811.05797.tglx@linutronix.de>
In-Reply-To: <200307081811.05797.tglx@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200307091644.00414.jbeisert@eurodsn.de>
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

Am Dienstag, 8. Juli 2003 18:11 schrieben Sie:
> On Tuesday 08 July 2003 14:05, Juergen Beisert wrote:
> > Am Dienstag, 8. Juli 2003 12:42 schrieben Sie:
> > > On Tuesday 08 July 2003 10:01, Juergen Beisert wrote:
> > >
> > > Have you enabled CONFIG_JFFS2_NAND ?
                                      ^^^^^^^^^^^^^^^^^^^^^^^
Sorry, I have searched for the macro CONFIG_JFFS2_NAND, not for 
CONFIG_JFFS2_FS_NAND.

Now I have find it and patched in. Seems to work now (with ECC).

Thanks a lot
JB
