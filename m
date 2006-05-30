Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl7IJ-0001rG-2N
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:42:28 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0300GCN7Q542C0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:42:05 -0400 (EDT)
Date: Tue, 30 May 2006 12:42:05 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060530155001.GA26220@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <Pine.LNX.4.64.0605301235420.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_Onu3ZVGSxcLt7pOIrCScDg)"
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
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

--Boundary_(ID_Onu3ZVGSxcLt7pOIrCScDg)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Tue, 30 May 2006, Jörn Engel wrote:

> Or, more realistically, in something like the recent situation, where
> each one of those cases had its own copy of special code because
> people don't realize that their type is no different from another
> long-merged type.  Note that Nico didn't notice and copied the ECC_NOR
> code almost verbatim.  Considering that he is a solid developer
> otherwise, what would an average or below-average hacker come up with?

Well, given I'm not really intimate with the JFFS2 code I'm most 
probably in the below-average category here.


Nicolas

--Boundary_(ID_Onu3ZVGSxcLt7pOIrCScDg)--
