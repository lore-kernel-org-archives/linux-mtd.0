Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zzqI-0005ry-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 14:28:38 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Robert Sprockeels <robert.sprockeels@boat.be>
Subject: Re: DoC trouble on wafer PC
Date: Fri, 11 Oct 2002 09:25:53 -0400
Cc: linux-mtd@lists.infradead.org
References: <1034333338.2619.81.camel@roadie.boat.be> <20021011121330.SMCL11063.rwcrmhc52.attbi.com@there> <1034339639.2401.99.camel@roadie.boat.be>
In-Reply-To: <1034339639.2401.99.camel@roadie.boat.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021011132807.XZFA28253.sccrmhc01.attbi.com@there>
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

Robert Sprockeels wrote:
> What would you recommed as filesystem on a DoC? LEAF uses msdos FAT...

I would guess that FAT would work OK, and would probably be easier because 
the LEAF guys are using syslinux as the bootloader.

I attempted to put Bering on a DoC awhile back, using Grub as the bootloader, 
and ext2 as the filesystem.  This won't work (in rc3, anyway) without 
updating their kernel with newer MTD modules.  I also vaguely remember having 
to modify a startup script or two.

Piotr Trojanek wrote:
> look in archives, JFFS2.
> there also m-sys driver for their tffs.
  
JFFS2 might be overkill for a Bering firewall -- the boot device (floppy, 
DOC, etc) is read-only (and should be write-protected).  LEAF's entire 
filesystem ends up in RAM after booting.
