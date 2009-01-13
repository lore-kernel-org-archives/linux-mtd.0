Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LMf1X-0007EV-Nv
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 08:53:26 +0000
Subject: Re: Some problem in real application
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jacky Lam <jackylam@gsl.com.hk>
In-Reply-To: <496B05EF.7060401@gsl.com.hk>
References: <496B05EF.7060401@gsl.com.hk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2009 10:53:28 +0200
Message-Id: <1231836808.5973.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Theoretically, I cannot respond you because of the silly disclamer
you added to the end of your e-mail. However,

On Mon, 2009-01-12 at 16:57 +0800, Jacky Lam wrote:
> I use NFTL before. While in production, we use some self-made IO
> programmer to program the NAND flash. We first write the data and ecc
> (in spare area), and then read then back. After verify it with ECC, we
> can tell whether the data is written correctly or not.

Fine. Just do the same with UBI images.

> However, in UBI, it doesn't use spare area and embedded the ECC
> information in main area.

UBI itself does not use OOB. But the NAND driver or NAND controller
may use it to store ECC codes.

>  Will it be difficult to extract the ECC
> information from the read back data in order to do verification?

The ECC verification is done in the driver level. UBI is above the
driver - it asks the driver to read and write NAND pages. And the
driver verifies/calculates ECC codes.

I'm going to update UBI documentation soon and write a little bit more
about what the UBI-aware flasher should do. I'll send you a link later.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
