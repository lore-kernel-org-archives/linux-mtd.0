Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8a0H-0003zS-Pm
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2004 08:19:13 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HVF00FODJ00I3@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 31 Mar 2004 09:19:12 +0200 (MEST)
Date: Wed, 31 Mar 2004 08:15:38 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <406A2A5F.7040005@setabox.com>
To: "William J. Beksi" <wjbeksi@setabox.com>, linux-mtd@lists.infradead.org
Message-id: <200403310915.38528.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406A2A5F.7040005@setabox.com>
Subject: Re: bad block replacement
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 31 March 2004 04:18, William J. Beksi wrote:
> I'm using a Samsung KM29U256T 32Mb nand flash with 4 partitions on a
> cramfs. I'm trying to implement ECC and a method for replacing bad
> blocks. The spare array consists of 16 bytes, positions 512-528, the
> 517th position being reserved for the bad block marker.

The generic nand driver knows all about this. ECC is implemented and bad block 
management is done in  NAND aware filesystems. 

Using cramfs on NAND is not really a good idea. Cramfs is _NOT_ aware of NAND 
flash. There exist JFFS2 (compressing) and YAFFS (not compressing), which are 
NAND aware. Use one of those and you are done with out any changes in the 
code. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
