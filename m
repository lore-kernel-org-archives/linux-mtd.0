Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EegvC-00083b-VH
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 17:47:38 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQD00DPVOMUUZ30@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 17:47:19 -0500 (EST)
Date: Tue, 22 Nov 2005 17:47:18 -0500 (EST)
From: Nicolas Pitre <npitre@mvista.com>
In-reply-to: <43839A91.6010101@mvista.com>
To: Todd Poynor <tpoynor@mvista.com>
Message-id: <Pine.LNX.4.64.0511221743310.6022@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
	<43839A91.6010101@mvista.com>
Cc: linux-mtd@lists.infradead.org, "Menon, Nishanth" <x0nishan@ti.com>
Subject: Re: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 Nov 2005, Todd Poynor wrote:

> Menon, Nishanth wrote:
> 
> > Sibley: buffer write error (status 0x190)
> 
> According to the datasheet that looks like:
> 
> SR[9] SR[8] SR[4]
> 0     1     1     = Error - Attempted rewrite to Object Mode region
> 
> but I've no clue what causes it...

Either the JFFS2 partition wasn't properly erased, or the JFFS2 
write-buffering support (mandatory for Sibley) has been broken somehow.


Nicolas
