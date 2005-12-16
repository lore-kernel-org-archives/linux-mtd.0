Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnLe9-0001sn-6s
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 14:53:43 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: Vitaly Wool <vwool@ru.mvista.com>
Date: Sat, 17 Dec 2005 08:53:32 +1300
References: <43A1484C.5030300@ru.mvista.com>
	<200512161144.19130.manningc2@actrix.gen.nz>
	<43A28959.1030108@ru.mvista.com>
In-Reply-To: <43A28959.1030108@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512170853.32451.manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] the way to proceed with OOB data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 16 December 2005 22:31, Vitaly Wool wrote:
> Charles Manning wrote:
> >>1. Change the API for nand_read_ecc and nand_write_ecc, namely add OOB
> >>read/write length parameter. This is what Charles proposes; it's nice
> >>for MTD users but it will overcomplicate nand_read_ecc/nand_write_ecc,
> >>which are complicated enough at the moment.
> >
> >I disagree that it needs to make the current code more complicated.
> >
> >I did submit a patch of sorts that was quite simple, but fractured the
> > logic in do_read_ecc, do_read_ecc is pretty convoluted and effort should
> > be made to not make it any more complicated.
> >
> >I think the better solution is to just wrap the code better. ie:
> >
> >static int nand_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
> >			  size_t * retlen, u_char * buf, u_char * oob_buf, struct nand_oobinfo
> >*oobsel)
> >{
> >
> >       if(buf) {    <--------
> >	/* use userspace supplied oobinfo, if zero */
> >	if (oobsel == NULL)
> >		oobsel = &mtd->oobinfo;
> >	return nand_do_read_ecc(mtd, from, len, retlen, buf, oob_buf, oobsel,
> > 0xff); } else {   <--------------------
> >            /* just read the oob according to oobinfo */
> ><---------------------
> >           call whatever local function <----------------------
> >      }  <----------------
>
> That doesn't seem to be a comprehensive solution to me. You imply here
> that in case buf is NULL, OOB area of only one page is to be read which
> may be inconvenient in some cases. Basically that means that you need to
> specify two more parameters - the OOB data length to read and (ptr to
> the var for) the OOB data length actually read. On the other hand, this
> means you shouldn't ignore these parameters in nand_do_read_ecc call,
> thus it's either you make everything a lot more complicated or you get
> routime with quite a limited functionality for OOB reading/writing
> (suppose you have a long, say, cleanmarker which is pread across several
> pages of the eraseblock; you willthen have to figure out how many read
> calls to do in order to retrieve it all).
> So, lemme a bit disagree with you, I hope that makes sense a bit :)

OK, I admit I'm looking at this through YAFFS eyes. YAFFS always writes one 
page at a time, so this would not be an issue.

Do any other fs or users write multiple NAND pages at a time? If so how do 
they handle any failures?

>
> >>3. Leave everything as is and add a new functionto the MTD interface
> >>that will read/write only free OOB bytes as a single chunk of data.
> >
> >In some ways this is the best since all the other options have either
> >compatability issues of one sort or another. It is also very clear what is
> >going on. For this reason, this would be my preferred approach.
>
> Yeah, to me as well :)
> I'm planning to work out something of a kind soon, maybe even before
> Christmas ;)

Cool :-) If you get that done by Christmas, I'll try to get the YAFFS side 
done by New Year. It is summer here so that is a bit of a challenge.

I don't think the programming effort is really going to be much different one 
way or another, it is just how to serve it up to the customers.

Thanx Vitaly.


-- Charles
