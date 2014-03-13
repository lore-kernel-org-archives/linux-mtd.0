Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO5Cy-0007ls-CN
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 12:58:00 +0000
Date: Thu, 13 Mar 2014 09:57:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140313125717.GB1758@arch.cereza>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
 <20140313062845.GT31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140313062845.GT31517@norris-Latitude-E6410>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 12, Brian Norris wrote:
> Hi Pekon,
> 
> On Thu, Mar 13, 2014 at 05:55:32AM +0000, Pekon Gupta wrote:
> > >From: Brian Norris [mailto:computersforpeace@gmail.com]
> > >On Wed, Mar 12, 2014 at 01:45:15PM +0100, Elie De Brauwer wrote:
> > >> b) "determining you read an erased page". In case of the i.mx (and
> > >> thus GPMI) the BCH block can tell you three things:
> > >>  1. I read all 0xff's
> > >>  2. I read some data and nothing got corrected
> > >>  3. I read something but failed to correct it.
> > >> The third case can have two causes:
> > >>  3.a you read valid data with bitflips exceeding what the BCH could
> > >> correct
> > >>  3.b you read an erased page with bitflips.
> > >>
> > >> Obviously case 3.b is what this discussion is all about, and my quest
> > >> revolved around a means to quickly identify case '3.b'.
> > >
> > >Yes, 3.a vs. 3.b is the big problem.
> [...]
> 
> > I think for OMAP NAND driver there needs to be some help on "1." also.
> > There is no hardware support in GPMC (Ti's controller) to find out if the
> > (read_data + read_oob) == 0xff. So you have to do this comparison in
> > software.
> 
> Really? So if you read a blank (all 0xff) page that has no bitflips, you
> see an ECC error? I'm sorry, but I didn't realize that's how your
> hardware worked. That's the worst hardware ECC design I've seen so far
> :(
> 

I haven't had time to follow this discussion yet, but just wanted to point
out the above is also true for pxa3xx-nand.c.

If a completely erased page is read, the calculated ECC would be 0 and the
stored ECC would be all 0xff (although I never actually checked this).
See the snippet below:

static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
		struct nand_chip *chip, uint8_t *buf, int oob_required,
		int page)
{
	[..]
	} else if (info->retcode == ERR_UNCORERR) {
		/*
		 * for blank page (all 0xff), HW will calculate its ECC as
		 * 0, which is different from the ECC information within
		 * OOB, ignore such uncorrectable errors
		 */
		if (is_buf_blank(buf, mtd->writesize))
			info->retcode = ERR_NONE;
	}
	[..]
}

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
