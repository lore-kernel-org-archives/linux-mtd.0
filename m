Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177uxG-0001dI-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 10:20:19 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Boot from NAND flash ???
Date: Wed, 15 May 2002 21:14:53 +1200
Cc: franck.fleter@netbricks.com, linux-mtd@lists.infradead.org
References: <20020513101623.DE1A14235@tiger.actrix.co.nz> <16389.1021282176@redhat.com> <23974.1021291528@redhat.com>
In-Reply-To: <23974.1021291528@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020515092011.79D4040E0@tiger.actrix.co.nz>
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

On Tue, 14 May 2002 00:05, David Woodhouse wrote:
> manningc2@actrix.gen.nz said:
> >  There are however two mechanisms to get around this: * Some people
> > and micros implement a "data pump" state machine to extract an
> > executable sequence from a NAND device.
>
> The DiskOnChip Millennium does this. Which is how it's used for LinuxBIOS
> -- the device has 512 bytes of SRAM which is initialised from the flash at
> reset time, and that's just about enough to initialise the system and pull
> the rest of the startup code off the flash.
>
> Note that the DiskOnChip 2000 has ROM instead of RAM, so you can't change
> the startup code from the PC BIOS extension header that it ships with,
> hence can't use it for such things.

Another difference is that the DOC's RAM and ROM are surely random access and 
hence can hold branching code etc.
