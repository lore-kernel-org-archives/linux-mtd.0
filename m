Received: from hardrain.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZHv9-0008QJ-C5
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 23:23:47 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Russ.Dill@asu.edu,
	Gregg C Levine <hansolofalcon@worldnet.att.net>
Date: Mon, 7 Jul 2003 10:27:18 +1200
References: <000001c34351$aa810520$239efea9@who5>
	<1057473735.2659.247.camel@localhost>
In-Reply-To: <1057473735.2659.247.camel@localhost>
MIME-Version: 1.0
Message-Id: <20030706222358.8B57143EF@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: File systems and Disk on Chips
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 06 July 2003 18:42, Russ Dill wrote:
> On Sat, 2003-07-05 at 17:00, Gregg C Levine wrote:
> > Hello from Gregg C Levine
> > I have here a 2 Megabyte Disk on Chip device, plugged into a carrier
> > board. It is now wearing the GRUB based firmware. How when I bring up
> > my system, the DOC device complains about the lack of a file system.
> > Any ideas as to how I could put a file system on this device?
> > Preferably as a native Linux format.
>
> Basically, you put a block filesystem on top of NFTL that grub
> understands. Grub does not at this point understand YAFFS or JFFS2 on
> NAND flash, but I'm sure there a lot of people who are looking for that
> and it wouldn't be difficult to do.

There is a YAFFS bootloader in CVS. Integrating into any loader (eg. grub) 
should not be a big effort. estimate less than a day.

-- CHarles
