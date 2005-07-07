Received: from mail.professional-internet.de ([213.69.77.2]
	helo=hermes.professional-internet.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DqWUH-00006h-H0
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2005 09:32:23 -0400
From: Ruediger Haertel <hae@port.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 7 Jul 2005 15:32:17 +0200
References: <200507061745.18226.hae@port.de> <200507071505.51557.hae@port.de>
	<1120742513.26713.106.camel@tglx.tec.linutronix.de>
In-Reply-To: <1120742513.26713.106.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200507071532.17991.hae@port.de>
Cc: tglx@linutronix.de
Subject: Re: MTD/ DoC Millenium Plus - Failure in flash detection
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 7. Juli 2005 15:21 schrieb Thomas Gleixner:
> On Thu, 2005-07-07 at 15:05 +0200, Ruediger Haertel wrote:
> > For the NAND DiskOnChip driver I had to apply the patch mentioned
> > here:
> > http://lists.infradead.org/pipermail/linux-mtd/2004-October/010640.
> >html
> >
> >
> > What irritates me is the output:
> > DiskOnChip BNAND Media Header not found.
> >
> > Why is that ?
>
> Obviously the header is not at the expected place.
>
> > />nanddump /dev/mtd5 /var/xxx 0 128
> > MTD_open
> > MTD_ioctl
> > Unknown flash (not normalM NAND)
>
> Is this nanddump from latest MTD-CVS ?

No. I use the one of the uClinux-dist-20041215. I'll give the one from 
mtd-cvs a try. Should I use realy the latest snapshot or the one I am 
using from date 2005.03.03.



So from your point the other messages from my output are ok ?

nand_read_ecc: Failed ECC read, page 0x00000020 on chip 0
ECC error scanning DOC at 0x4000
nand_read_ecc: Failed ECC read, page 0x00000040 on chip 0
ECC error scanning DOC at 0x8000
nand_read_ecc: Failed ECC read, page 0x00000060 on chip 0
ECC error scanning DOC at 0xc000
doc200x_correct_data corrected 2 errors
nand_read_ecc: Failed ECC read, page 0x00000080 on chip 0
ECC error scanning DOC at 0x10000


-- 

Ruediger Haertel
