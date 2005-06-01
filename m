Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DdL1l-00009S-PJ
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2005 00:40:27 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Ludovic Guilhamat <lguilhamat@perax.fr>,
	uClinux development list <uclinux-dev@uclinux.org>,
	linux-mtd@lists.infradead.org
Date: Wed, 1 Jun 2005 16:41:50 +1200
References: <429C4D96.7000302@perax.fr>
In-Reply-To: <429C4D96.7000302@perax.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050601044012.1392D47AF@blood.actrix.co.nz>
Cc: 
Subject: Re: Samsung RFS Filesystem
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 31 May 2005 23:42, Ludovic Guilhamat wrote:
> Hi,
>
> I would maybe interested in testing the Samsung RFS File System...
>
> Does someone, here, already used it, and what are the conclusions ?


Please do do some testing. It would be good to see the results, positive or 
negative.

I have not used it, but from a description I can draw some immediate 
conclusions.

RFS = Robust FAT file system

>From the blurb at 
http://www.samsung.com/Products/Semiconductor/Flash/TechnicalInfo/rfs.htm

this looks a bit like FATFS running on top of DOC. It might have some 
transactioning which would make it look a bit more like Microsoft's TFAT.

Neither of these are a proven reliable system. DOC can still get FAT 
corruptions if you don't umount before power loss (== potentially a 
completely scrambled fs). TFAT is completely unprovedn and is slower and not 
always robust (not robust with typical mount options). Perhaps RFS gets the 
robustness right.


Running FAT on NAND costs some performance due to the FTL etc.  To make a 
journaling system on FAT, as RFS claims, costs even more performance.

IMHO: If you want robustnes on NAND use a log structured fs designed for 
flash: YAFFS or JFFS2.

For completeness, I will state that I wrote YAFFS, but I don't think this 
biases my answer.

-- CHarles
