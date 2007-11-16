Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ispx5-00025m-Oy
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 20:25:06 -0500
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_D3gXZUXEGUaitEEb7842YA)"
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JRK00L15RX6NQW0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 20:24:43 -0500 (EST)
Date: Thu, 15 Nov 2007 20:24:42 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH][MTD] adding physical address to point()
In-reply-to: <20071116003221.GC13834@lazybastard.org>
Message-id: <alpine.LFD.0.9999.0711152019100.21255@xanadu.home>
References: <473CE5EC.9040902@gmail.com>
	<20071116003221.GC13834@lazybastard.org>
Cc: linux-mtd@lists.infradead.org
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

--Boundary_(ID_D3gXZUXEGUaitEEb7842YA)
Content-type: TEXT/PLAIN; charset=utf-8
Content-transfer-encoding: 8BIT

On Fri, 16 Nov 2007, Jörn Engel wrote:

> On Thu, 15 November 2007 16:35:56 -0800, Jared Hulbert wrote:
> > 
> > --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> > @@ -82,8 +82,8 @@ static struct mtd_info *cfi_intelext_setup (struct 
> > mtd_info *);
> > static int cfi_intelext_partition_fixup(struct mtd_info *, struct 
> > cfi_private **);
> 
> Word-wrapped again.  Mutt on lazybastard.org works, you know? ;)

The file Documentation/email-clients.txt in the kernel source tree has 
tips about proper usage wrt sending patches for a couple email clients, 
including Thunderbird.


Nicolas

--Boundary_(ID_D3gXZUXEGUaitEEb7842YA)--
