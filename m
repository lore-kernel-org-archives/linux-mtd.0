Received: from [81.6.214.140] (helo=mail.infocell-its.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DISDW-0004BF-Ep
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 10:06:15 -0400
Message-ID: <425157C5.4040007@infocell-its.com>
Date: Mon, 04 Apr 2005 16:05:41 +0100
From: Zeri Virgo <zerivirgo@infocell-its.com>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <4249C357.2040600@ieee.org>
	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>
	<424CA4EA.8090904@infocell-its.com> <424CAE31.8040302@ieee.org>
In-Reply-To: <424CAE31.8040302@ieee.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:
> Don't even bother trying it with a resized firmware tomorrow :)
Been far too busy, anyway :)

> So is it correct to say that you've just switched from the diskonchip 
> driver which is distributed as part of 2.6.11.5, to the diskonchip 
> driver from the MTD CVS repository?
> 
> If so, then any of the changes between the MTD version in 2.6.11.5 and 
> the current CVS are potentially the problem, not just my latest change 
> to diskonchip.c
Exactly. I didn't feel the need to use latest MTD sources for the
diskonchip driver until your patch. Looks like the problem is in 
nand_base.c.

> The version of diskonchip.c in 2.6.11.5 is 1.45.  I don't see anything 
> in the changes between then and now (1.50) that should cause the 
> behavior you're seeing, which means either the problem is in a different 
> file or I'm just not seeing it :)
The call stack goes from mtd->read into nand_base.c nand_read() then 
nand_do_read_ecc() passing NULL to oob_buf and oob_sel. The pointer 
dereference occurs on oobsel when defining ecc_calc and ecc_code... I 
(nervously) replaced these with hard values and the probing completed 
successfully. I think most of the activity lower down does null checks 
on oobsel or doesn't use these values due to the eccmode.

I have no idea what the fix should be! Maybe move the definitions of 
ecc_calc and ecc_code below the check and set of oobsel to &mtd->oobinfo?

- Zeri
