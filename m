Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18OtyM-0001lK-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 06:15:55 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Paul Nash <paulnash@wildseed.com>, Russ Dill <Russ.Dill@asu.edu>,
	linux-mtd@lists.infradead.org
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thought s? -->NAND
Date: Thu, 19 Dec 2002 19:41:49 +1300
References: <43CB1396676FD4119F03001083FD299401A1C91F@neptune.kirkland.local>
In-Reply-To: <43CB1396676FD4119F03001083FD299401A1C91F@neptune.kirkland.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021219064630.BCABD14EC0@dragon.actrix.co.nz>
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

On Thu, 19 Dec 2002 02:13, Paul Nash wrote:
> So what are people out there using in their designs for NAND primarily? 
> Raw NAND?  NAND plus some bootable sector?  DiskOnChip?
>

NAND has been around for over ten years now, but the real uptake has only 
been very recent.

Until recently, most people have used DiskOnChip which is essentially just a 
raw NAND + an ASIC to do ECC + a very expensive price tag.

Probably most NAND in use is SmartMedia (numerically speaking) - using FAT. 
These are just raw nand on a carrier card. Just ask David Woodhouse what he 
thinks about that! THis is being superceded by XD card. 

Now that there are very reliable NAND file systems (JFFS2 and YAFFS) that run 
under Linux and other OSs, it is becoming increasingly palatable to use raw 
NAND parts soldered down, or use SmartMedia/XD if you want an expanadable 
system.

The new generation NAND parts expand to 16-bit data buses and have bootable 
code space. This makes it possible to build systems that are all NAND with no 
NOR in sight.

-- CHarles
