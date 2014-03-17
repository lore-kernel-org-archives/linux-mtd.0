Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPcfs-0003mu-QD
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 18:54:13 +0000
Received: by mail-pb0-f52.google.com with SMTP id rr13so6063283pbb.25
 for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2014 11:53:50 -0700 (PDT)
Date: Mon, 17 Mar 2014 11:53:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140317185347.GC3834@ld-irv-0074>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
 <20140313062845.GT31517@norris-Latitude-E6410>
 <20140313125717.GB1758@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140313125717.GB1758@arch.cereza>
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

On Thu, Mar 13, 2014 at 09:57:17AM -0300, Ezequiel Garcia wrote:
> On Mar 12, Brian Norris wrote:
> > Really? So if you read a blank (all 0xff) page that has no bitflips, you
> > see an ECC error? I'm sorry, but I didn't realize that's how your
> > hardware worked. That's the worst hardware ECC design I've seen so far
> > :(
> > 
> 
> I haven't had time to follow this discussion yet, but just wanted to point
> out the above is also true for pxa3xx-nand.c.

I'm learning every day!

> If a completely erased page is read, the calculated ECC would be 0 and the
> stored ECC would be all 0xff (although I never actually checked this).
> See the snippet below:
> 
> static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
> 		struct nand_chip *chip, uint8_t *buf, int oob_required,
> 		int page)
> {
> 	[..]
> 	} else if (info->retcode == ERR_UNCORERR) {
> 		/*
> 		 * for blank page (all 0xff), HW will calculate its ECC as
> 		 * 0, which is different from the ECC information within
> 		 * OOB, ignore such uncorrectable errors
> 		 */
> 		if (is_buf_blank(buf, mtd->writesize))
> 			info->retcode = ERR_NONE;
> 	}
> 	[..]
> }

Looks like pxa3xx_nand will probably need the same flag, then we could
probably kill the is_buf_blank() check.

Brian
