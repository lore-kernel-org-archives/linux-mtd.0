Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19D9UG-0001C6-4j
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 21:56:32 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Alex Pavloff <apavloff@eason.com>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 7 May 2003 08:58:03 +1200
References: <D3AF5F134D627243993F2F2FC32EE4D229C730@mailman.eason.com>
In-Reply-To: <D3AF5F134D627243993F2F2FC32EE4D229C730@mailman.eason.com>
MIME-Version: 1.0
Message-Id: <20030506205634.D88B04585@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: CompactFlash...
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> 1) Do CF cards when used in ATA (or other modes) have built in wear
> leveling?  Mfg docs appear to be inconsistent.

The docs are inconsistent. Personally I am not really bothered by the lack of 
wear levelling on some NAND systems. If a block dies, it is replaced by a 
reserved one.  The SmartMedia block management scheme results in a 
"statistical wear levelling". ie. Explicite wear levelling is not performed, 
but the net result is some degree of wear levelling. My understanding is that 
full-size (PCMCIA) ATA cards support explicite wear levelling, but CF does 
not.

IMHO, far more critical to robustness is state corruption due to 
crashes/power loss. These are best addressed by a journaling file system 
directly on NAND (eg. JFFS2 or YAFFS). CF can get internal corruptions which 
can defeat the robustness of any file system (just like ext3 can't save you 
from a six inch spike through your hard drive).

>
> 2) Would JFFS2 or other journaled file systems be applicable when using
> CompactFlash in I/O or Memory Mode (rather than True IDE mode)?

No. Regardless of the hook-up, the functional interface you get is still IDE 
equivalent. You do not get access to the raw NAND. For that you need 
something like SmartMedia.

-- CHarles
