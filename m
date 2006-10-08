Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GWQxe-00034x-Pq
	for linux-mtd@lists.infradead.org; Sun, 08 Oct 2006 06:12:27 +0100
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17704.36546.119343.648387@vaishnavi.localdomain>
Date: Sun, 8 Oct 2006 11:08:10 +0530
To: dedekind@infradead.org
Subject: Re: [PATCH 1/2] NAND: nandsim sector-wise allocation
In-Reply-To: <1160117357.13696.37.camel@sauron>
References: <17701.14724.377713.929566@vaishnavi.localdomain>
	<17701.15123.205461.480037@vaishnavi.localdomain>
	<1160117357.13696.37.camel@sauron>
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    >> +config  MTD_NAND_NANDSIM_CHIP_MAP
    >> +	bool "Mapped flash image"
    >> +	help
    >> +	  The flash data is stored in an image mapped to memory.

    Artem> Is this option really needed? I've never heard somebody
    Artem> using it. Do you use it? If no, will you mind to get rid of
    Artem> it at all? And then of course MTD_NAND_NANDSIM_CHIP_ALLOC
    Artem> won't be needed as well.

If you think the CHIP_MAP option is not required, I will get rid of
it. I will remove the CHIP_ALLOC option as well.

Regards,
Vijay

-- 
Free the Code, Free the User.
Website: http://www.bravegnu.org
