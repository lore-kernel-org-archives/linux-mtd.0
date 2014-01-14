Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W37vn-0003Hc-Vm
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 17:37:40 +0000
Received: by mail-ie0-f177.google.com with SMTP id ar20so774592iec.22
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2014 09:37:16 -0800 (PST)
Date: Tue, 14 Jan 2014 09:37:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 3/6] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page bit-flip correction for H/W ECC
 schemes
Message-ID: <20140114173713.GD8919@ld-irv-0074>
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
 <1388803698-26252-4-git-send-email-pekon@ti.com>
 <20140114040554.GB8919@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140114040554.GB8919@ld-irv-0074>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 balbi@ti.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Mon, Jan 13, 2014 at 08:05:54PM -0800, Brian Norris wrote:
> On Sat, Jan 04, 2014 at 08:18:15AM +0530, Pekon Gupta wrote:
> >  - Irrespective of number of bit-flips an erased-page will only contain
> >    all(0xff), So its safe to return error-code -EUCLEAN with data_buf=0xff,
> >    instead of -EBADMSG.
> 
> Are you saying that all bitflips in erased pages should yield -EUCLEAN?
> I agree that they shouldn't return -EBADMSG (up to the strength
> threshold), but I also think that we should still be able to report the
> number of bitflips "corrected" in our erased page handling. That way,
> pages with small numbers of bitflips can still be corrected.
> 
> Put another way: what if every page starts to experience at least one
> bitflip? Do you want UBIFS to scrub the page every time? Rather, I think
> you want to calculate the proper count so that MTD can mask the bitflips
> if they are under the threshold. See my comment labeled [***] in the
> patch context below.

I totally forgot to put the [***] below when I got to it! See below (for
real this time!)

[...]
> > --- a/drivers/mtd/nand/omap2.c
> > +++ b/drivers/mtd/nand/omap2.c
> > @@ -1436,19 +1397,35 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
[...]
> > +				switch (ecc_opt) {
> > +				case OMAP_ECC_BCH4_CODE_HW:
> > +					if (memcmp(calc_ecc, bch4_vector,
> > +							 actual_eccbytes))
> > +						stat += eccstrength;

The [***] goes here!

[***] I don't think you can assume 'eccstrength' number of bitflips
here. This sidesteps the bitflip threshold accounting, and it means that
even a single bitflip will cause the entire block to be scrubbed, even
if it was just erased. The key point here is that eventually, we can't
assume that scrubbing will remove *all* bit errors in NAND flash. An
erased page is allowed to have a small number of bitflips or stuck bits.

> > +					break;
> > +				case OMAP_ECC_BCH8_CODE_HW:
> > +					if (memcmp(calc_ecc, bch8_vector,
> > +							 actual_eccbytes))
> > +						stat += eccstrength;

[***] Same here.

(BTW, this switch/case block can be reduced to a single case if you
select bch4_vector vs. bch8_vector in the switch/case from earlier in
this function.)

> > +					break;
> > +				default:
> > +					return -EINVAL;
> >  				}
> > +				memset(&data[i * eccsize], 0xff, eccsize);
> >  			}
> >  		}
> >  

Brian
