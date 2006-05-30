Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl9bZ-0005TK-V7
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 15:11:13 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J03003W5EKWV7D0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 30 May 2006 15:10:08 -0400 (EDT)
Date: Tue, 30 May 2006 15:10:08 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060530185017.GG26220@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <Pine.LNX.4.64.0605301506470.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_y5cVKT2h/A0v+CREmTsUtw)"
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_y5cVKT2h/A0v+CREmTsUtw)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Tue, 30 May 2006, Jörn Engel wrote:

> Here is another migration path, that will likely receive Artems
> objections as well.
> 
> Invariant:
> In the end, initialization of the wbuf code will be identical for all
> devices that require wbuf.  Whether a device requires wbuf is simply
> checked by looking at mtd->size.  If mtd->size is greater than 1, we
> need wbuf.
> 
> Step 1:
> Turn MTD_NOR into MTD_GENERIC_TYPE and call the current initialization
> for NOR the generic one.
> 
> Step 2:
> Turn MTD_DATAFLASH into MTD_GENERIC_TYPE, remove its special cased
> wbuf initialization and make sure the generic one is usable for
> DATAFLASH as well.
> 
> Step 3:
> Turn MTD_NAND into MTD_GENERIC_TYPE, remove its special cased wbuf
> initialization and make sure the generic one is usable for NAND as
> well.

If presented that way you're indeed up for more protests.

Just don't "turn MTD_* into MTD_GENERIC_TYPE".  Instead, try to "move 
MTD_* away from using mtd->type".  Or something like that.


Nicolas

--Boundary_(ID_y5cVKT2h/A0v+CREmTsUtw)--
