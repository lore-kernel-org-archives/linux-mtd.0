Received: from moutng.kundenserver.de ([212.227.17.8])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OBkNW-0002wy-RD
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 07:59:47 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Some questions on bit-flips and JFFS2
Date: Tue, 11 May 2010 09:59:35 +0200
References: <201005031505.18604.muehlfelder@enertex.de>
	<1273049480.3702.129.camel@localhost>
	<Pine.LNX.4.64.1005051119100.22753@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1005051119100.22753@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201005110959.36213.muehlfelder@enertex.de>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Wednesday 05 May 2010 11:20:42 schrieb Ricard Wanderlof:
> > I did not really follow the discussion, so sorry if the following is
> > unrelated: I think it should not be too difficult to teach JFFS2 to
> > force GC on eraseblocks with bit-flips.
>
> I think in this case the partition in question just held a raw Linux
> kernel with no file system, so JFFS2 is out of the picture here.
>
> /Ricard

After investigating the problem I can tell you, that you are completly 
right ;-)
Atmel's flash tool Sam-ba 2.5 was used to flash the first NAND partition as 
follows:
1. Bootstrap
2. U-Boot bootloader
3. U-Boot environment variables
4. uImage Linux kernel
All these things are just written raw to predefined memory addresses and if 
some bit in there will flip, the system won't boot anymore.
So my idea was to create an image of that partition from within running Linux, 
check if the partition changes and if so write it back before shutdown. At 
least this may reduce the failing rate.
But unfortunately the Sam-Ba 2.5 tool has a bug: it uses different bad block 
table structure and Linux refuses to read/write every block, that was written 
by Sam-Ba 2.5 because it recognizes them as bad blocks.
So for now I have no idea what I can do to reduce the failing rate.
At least there is still no board using Samsung flash that has failed and I 
hope all problems are related to the Micron flash.

Kind regards
Thorsten
