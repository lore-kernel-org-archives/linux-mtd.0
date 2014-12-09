Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XyLlx-0004JU-92
 for linux-mtd@lists.infradead.org; Tue, 09 Dec 2014 14:28:18 +0000
Date: Tue, 9 Dec 2014 15:27:42 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH RFC]: mtd: nand: Driver for Evatronix NAND flash controller
In-Reply-To: <54840DE3.90705@rempel-privat.de>
Message-ID: <alpine.DEB.2.02.1412091517090.8366@lnxricardw1.se.axis.com>
References: <54840DE3.90705@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 7 Dec 2014, Oleksij Rempel wrote:

> > From: Ricard Wanderlof <ricardw at axis.com>
> > 
> > This is a request for comments for a driver for the Evatronix 
> > NANDFLASH-CTRL IP (version 1.15). It is designed to be applied to 
> > Linux 3.16 or the current linux-mtd tree.
> 
> it looks like we are working on a driver for same IP core. I have working 
> HW, and working driver which need need reworking. Both driver are not 
> upstream ready. So it will be good if we collaborate with each other :)

After an off-list discussion between Oleksij and myself it seems that 
while the NAND flash controller in the SoC Oleksij is using (Alphascale 
ASM9260T) and the one I wrote the driver for above come from a common 
origin, they are fairly different when it comes to detail.

Looking at the documentation, the names of registers and bit fields etc 
clearly show a common origin, but there are a lot of details which differ 
as well, including the actual presence of certain registers, register 
offsets, bitfield locations within registers, the interpretation of 
bitfields with the same name, etc. It is also not clear from a cursory 
glance how much the underlying implementation differs between the IP 
versions.

Consequently we've decided that it at this time we cannot coordinate these 
two drivers.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
