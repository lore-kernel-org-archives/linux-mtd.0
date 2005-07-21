Received: from smtp4.wanadoo.fr ([193.252.22.27])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DvbyS-0006of-EF
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2005 10:24:40 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0401.wanadoo.fr (SMTP Server) with ESMTP id 5A7021C00317
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Jul 2005 16:24:30 +0200 (CEST)
Received: from [192.168.123.151] (ATuileries-111-1-6-126.w80-14.abo.wanadoo.fr
	[80.14.101.126])
	by mwinf0401.wanadoo.fr (SMTP Server) with ESMTP id 1EC7C1C00315
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Jul 2005 16:24:30 +0200 (CEST)
From: Jean-Philippe Francois <jp.francois@cynove.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1121844600.2619.8.camel@fedorabox>
References: <1121776529.2565.34.camel@fedorabox>
	<1121844600.2619.8.camel@fedorabox>
Content-Type: text/plain; charset=utf-8
Message-Id: <1121955868.2917.29.camel@fedorabox>
Mime-Version: 1.0
Date: Thu, 21 Jul 2005 16:24:28 +0200
Content-Transfer-Encoding: 8bit
Subject: Re: Understanding jffs2 warning message
Reply-To: jp.francois@cynove.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-07-20 at 09:30, Jean-Philippe Francois wrote:
> On Tue, 2005-07-19 at 14:35, Jean-Philippe Francois wrote:
> > Hi,
> > 
> > I am doing some test on a JFFS2 file system.
> > It is installed on a Macronix Flash 29LV320, with top boot block.
> > The part are cfi probed, and it works (almost) fine.
> > 
> > I am doing some tar/untar loop [1]. Every six or seven loop, I have a
> > serie of 8 warning messages :
> > 
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001040)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
> > Node totlen on flash (0xffffffff) != totlen in node ref (0x00000768)
> > 
> > I looked at the code, but I don't understand what is the meaning of
> > these messages.
> > Do you think it can be related to the Top Boot Block layout of this
> > flash (ie last 64 k sector is replaced by 8 8k sector) ?
> > I might be wrong, but I think the sector layout and erase size is taken
> > into account by CFI probing ?
> 
> Looking into the archive, I think I am in the case described by [1].
> The driver know about the various erase regions, but doesn't transmit
> this info to partition level. What is the status of the patch in [1] ?
> It is not part of the mtd code in 2.6.12 kernel.
> 
> Regards,
> 
> JP Francois
> 
> [1]
> http://lists.infradead.org/pipermail/linux-mtd/2004-December/011320.html
> 
> 
I tested this patch, and it solved my problem, in case anyone is
interested.

JP François
