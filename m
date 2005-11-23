Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ef0Vt-00037h-KA
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 14:42:45 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQF001LLANA8ZE0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 14:40:22 -0500 (EST)
Date: Wed, 23 Nov 2005 14:40:22 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <520AB2AD990DC04082102F77CA17263801D4063E@dlee03.ent.ti.com>
To: "Menon, Nishanth" <x0nishan@ti.com>
Message-id: <Pine.LNX.4.64.0511231426230.6022@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <520AB2AD990DC04082102F77CA17263801D4063E@dlee03.ent.ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 Nov 2005, Menon, Nishanth wrote:

> Sibley: Found 1 x16 devices at 0x0 in 16-bit bank
> Sibley: Found 1 x16 devices at 0x4000000 in 16-bit bank

What if you limit your map_info.size to 0x4000000 just to prevent the 
second chip from being detected?  I only ever tested the Sibley support 
with a single 1x16 chip so...

Can you also test with the stock MTD and JFFS2 code as found in Linux 
2.6.15-rc2?

If the problem still persist for you in those conditions while it works 
for me then you'll have to look at your own changes outside of JFFS2 or 
cfi_cmdset_0001 for the culprit.


Nicolas
