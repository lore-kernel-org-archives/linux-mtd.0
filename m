Received: from imap.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGjUb-0004mT-Co
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 20:04:13 +0100
From: dkey <dk.dbox2@gmx.net>
To: linux-mtd@lists.infradead.org
Date: Thu, 22 Apr 2004 21:09:23 +0200
References: <4087DC65.7010703@fh-landshut.de>
	<4087EE53.2000608@fh-landshut.de>
In-Reply-To: <4087EE53.2000608@fh-landshut.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200404222109.24118.dk.dbox2@gmx.net>
Subject: Re: (interleaved chips) cfi_cmdset_0002 -> Kernel Panic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

Did you tried the last diff for cfi_cmdset_0002.c from the mailinglist?

greets dkey


On Thursday 22 April 2004 18:09, Oliver Korpilla wrote:
> Hello
>
> I patched a revision of MTD with version 1.93 (as suggested elsewhere)
> of this file (cfi_cmdset_0002.c) against the kernel. Configured fine,
> built fine (kernel.org 2.4.25), but did not autodetect the interleaved
> chip (as the newest snapshot fails to do as well).
>
> So I guess if reverting would be an option, I still do not know where to
> revert to.
>
> Any ideas?
>
> Thanks in advance,
> Oliver Korpilla
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
