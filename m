Received: from rwcrmhc52.attbi.com ([216.148.227.88])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zGAw-0001AK-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2002 13:42:54 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Booting from DOC2000
Date: Wed, 9 Oct 2002 08:41:50 -0400
References: <20021009080422.38779.qmail@web13608.mail.yahoo.com>
In-Reply-To: <20021009080422.38779.qmail@web13608.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Carlos Mateo <otepas@yahoo.es>
Message-Id: <20021009124222.XIJJ2722.rwcrmhc52.attbi.com@there>
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

Carlos Mateo wrote:
> I have used grub-0.92 patched with
> grub-0.92-doc.patch.  Initially it didn't work,
> because I have a DiskOnChip with UnitSizeFactor =
> 0x00.
>
> To make it work, I have commented out the
> UnitSizeFactor check that is done in
> stage2/bdev_diskonchip.c.  Since I am not an expert, I
> don't know if this could work with other DOC, but it
> works fine with mine so far.

The GRUB patch I just submitted to the list includes a small change to 
bdev_diskonchip.c that allows UnitSizeFactors of both 0xFF and 0x00.  It is 
assumed that 0x00 means the same thing as 0xFF, similar to nftlmount.c in the 
MTD code.

I've tested this a 32MB DoC 2000, and an 8MB Millennium, and it works fine on 
both.

If I remember correctly, other people have tried something similar, but it 
didn't work -- it may have been one of the very large DoC 2000s.
