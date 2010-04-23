Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O5HhW-0002if-NE
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 12:09:43 +0000
Subject: Re: simplifying the linux MTD Kconfig/Makefile structure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
In-Reply-To: <alpine.LFD.2.00.1003300824320.6061@localhost>
References: <alpine.LFD.2.00.1003300824320.6061@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Apr 2010 15:05:46 +0300
Message-ID: <1272024346.6917.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-30 at 08:29 -0400, Robert P. J. Day wrote:
> it seems like the various Kconfigs and Makefiles related to MTD
> could be tightened up a bit.  for instance, in drivers/mtd/Makefile:
> 
>   obj-$(CONFIG_MTD_UBI)           += ubi/
> 
> but given that selection, it's kind of redundant to then have
> drivers/mtd/ubi/Makefile start with:
> 
>   obj-$(CONFIG_MTD_UBI) += ubi.o
> 
> is it not?  why not just "obj-y"?
> 
>   along those lines, again from drivers/mtd/Makefile:
> 
> obj-y           += chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
> 
> obj-$(CONFIG_MTD_UBI)           += ubi/
> 
>   why not be consistent and have:
> 
> obj-y           += chips/ lpddr/ maps/ devices/ nand/ onenand/
> 
> obj-$(CONFIG_MTD_UBI)           += ubi/
> obj-$(CONFIG_MTD_TESTS)         += tests/
> 
> which would *massively* simplify drivers/mtd/tests/Makefile, would it
> not?
> 
>   i can submit some patches if there's any interest.  i suspect some
> of the other directories could be similarly tidied up.

Sounds like a reasonable clean-up to me.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
