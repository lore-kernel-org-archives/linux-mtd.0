Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1En1ps-000148-W9
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 17:44:32 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Fri, 16 Dec 2005 11:44:19 +1300
References: <43A1484C.5030300@ru.mvista.com>
In-Reply-To: <43A1484C.5030300@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512161144.19130.manningc2@actrix.gen.nz>
Cc: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [RFC] the way to proceed with OOB data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 15 December 2005 23:41, Vitaly Wool wrote:
> Hi folks,
>
> you may have noticed the RFC patches for OOB handling rework I've posted
> to this list about two weeks ago.
> The main idea of those was a) to provide uniform method for handling OOB
> by such MTD users like JFFS2/YAFFS2 b) to hide the OOB internal
> structure from the users. However, people talking to me on that convined
> me that those changes were too radical for the moment and also pointed
> out the following problems that arise if my changes are accepted:
> 1. No more legacy support for jffs/yaffs OOB layouts. This is the point
> I don't consider to be major, since if something's deprecated it means
> that it'd go away at some point, so maybe now is the time? But maybe
> most of you guys think differently.
> 2. No more ability to read raw OOB data from the userspace which might
> turn to be a serious problem while debugging stuff. I must admit this is
> something we should preserve.
> 3. No binary compatibility for MTD utilities. Here I'm also willing to
> admit being too radical.
>
> On the other hand, it's really necessary to provide means for  kernel
> MTD users not to mess with the oobinfos.
> So, the question is: how to do it then? I see several ways of doing that.
> 1. Change the API for nand_read_ecc and nand_write_ecc, namely add OOB
> read/write length parameter. This is what Charles proposes; it's nice
> for MTD users but it will overcomplicate nand_read_ecc/nand_write_ecc,
> which are complicated enough at the moment.

I disagree that it needs to make the current code more complicated.

I did submit a patch of sorts that was quite simple, but fractured the logic 
in do_read_ecc, do_read_ecc is pretty convoluted and effort should be made to 
not make it any more complicated.

I think the better solution is to just wrap the code better. ie:

static int nand_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
			  size_t * retlen, u_char * buf, u_char * oob_buf, struct nand_oobinfo 
*oobsel)
{

       if(buf) {    <-------- 
	/* use userspace supplied oobinfo, if zero */
	if (oobsel == NULL)
		oobsel = &mtd->oobinfo;
	return nand_do_read_ecc(mtd, from, len, retlen, buf, oob_buf, oobsel, 0xff);
       } else {   <--------------------
            /* just read the oob according to oobinfo */  
<---------------------
           call whatever local function <----------------------
      }  <----------------
}

This gives the neat interface without forcing more pain into do_read_ecc.


> 2. Change the API for nand_read_oob/nand_write_oob so that it read/wrote
> either raw OOB or free OOB. This way has been discouraged by Artem
> during our discussion in #mtd, but this might be an option.

> 3. Leave everything as is and add a new functionto the MTD interface
> that will read/write only free OOB bytes as a single chunk of data.

In some ways this is the best since all the other options have either  
compatability issues of one sort or another. It is also very clear what is 
going on. For this reason, this would be my preferred approach.

To explain:....
If we look at the nand_read_ecc soultion, there is compatability issue because 
if a new YAFFS is used with an old mtd then the fist time someone will know 
that something is wrong is when mtd oopses on a NULL buf. However, with an 
explicit read_oob_avail() function, we know at compile time.
