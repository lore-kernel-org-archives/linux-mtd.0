Received: from web10304.mail.yahoo.com ([216.136.130.82])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VVEP-0004Iy-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 11:15:45 +0000
Message-ID: <20030106114629.39183.qmail@web10304.mail.yahoo.com>
Date: Mon, 6 Jan 2003 03:46:29 -0800 (PST)
From: Sanal Kumar <p_sanalk@yahoo.com>
Subject: Re: Problem with DiskOnChipMillenium
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi Mark,


Thanks for your reply.
I have tried as you said . But it is giving exactly
the same error as before any other ideas.

TIA

Best Regrads
Ssanal


--- Mark Meade <mark@lakeshoremicro.com> wrote:
> Try using the following options:
> 
> # Memory Technology Devices (MTD)
> CONFIG_MTD=y
> CONFIG_MTD_DEBUG=y
> CONFIG_MTD_CHAR=y
> CONFIG_NFTL=y
> CONFIG_NFTL_RW=y
> 
> # Disk-On-Chip Device Drivers
> CONFIG_MTD_DOC2000=y
> CONFIG_MTD_DOCPROBE=y
> 
> (turn off CONFIG_MTD_DOC2001, and
> CONFIG_MTD_DOCPROBE ADDRESS).
> 
> Sanal Kumar wrote:
> > I am working on an Assabet like board(SA1110).
> > but when I enable mtd device(M-systems Millenium)I
> am
> > able to see the driver recognizing the Millenium
chip.


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
