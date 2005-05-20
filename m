Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYxR7-0007Nh-HE
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 03:40:29 +0100
Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYxR3-0001qk-NM
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 22:40:28 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: Ralph Siemsen <ralphs@netwinder.org>
In-Reply-To: <428C7CCF.50606@netwinder.org>
References: <1116226208.31694.26.camel@server11>
	<428899DA.3040507@netwinder.org> <1116293182.31694.47.camel@server11>
	<428BC09E.7070307@netwinder.org> <1116467146.18096.45.camel@server11>
	<428C7CCF.50606@netwinder.org>
Content-Type: text/plain
Date: Fri, 20 May 2005 10:40:11 +0800
Message-Id: <1116556811.18096.90.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: stdio.h and kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Ralph

The datasheet you are referring to is the right one and S29WSxxxN is
using JEDEC 42.4 command set standard.

I am not sure which JEDEC standard is impelmented by jedec_prob.c.

Further if a separate driver is provided on AMD's website it must
significantly be different otherwise they could simply have mentioned
about the one in jedec_probe.c

I believe that S29WSxxxN's MirrirBit technology provides many more
security features as yet not available in other flash technologies.


Recently they have sent me even a new version so now I have to study
that one and see how could that one be used.

Thanks for taking the trouble of going through the specs and the kernel
as well.

It really amazes me how keen people are to help each other.
I have got many problems solved by the wonderful community help.

Regards and thanks to all



On Thu, 2005-05-19 at 07:47 -0400, Ralph Siemsen wrote:
> Munira Ahmed wrote:
> > S29WSxxxN. Does not seem to be supported
> 
> According to datasheet the programming sequence looks rather like the 
> JEDEC standard method found in drivers/mtd/chips/jedec_probe.c, 
> particularly the jedec_reset() function matches the code shown on page 
> 28 of the datasheet.
> 
> Datasheet i'm looking at is 
> http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/s29ws-n_00_g0_e.pdf 
> hopefully this is the right one ;)
> 
> So the standard driver might just need an extra entry for vendor/device 
> codes.  Maybe ;)
> 
> -R
> 
-- 
Munira Ahmed
