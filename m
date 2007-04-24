Received: from wx-out-0506.google.com ([66.249.82.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgFLX-00060b-Ua
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 03:21:58 -0400
Received: by wx-out-0506.google.com with SMTP id t8so2155359wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Apr 2007 00:21:52 -0700 (PDT)
Message-ID: <acd2a5930704240021y7badb098ybc2b5b04f5b7daeb@mail.gmail.com>
Date: Tue, 24 Apr 2007 11:21:52 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
In-Reply-To: <4628CB3A.3000701@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
	<4628CB3A.3000701@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > What the initialization to {0, NULL} is for?
> just through habit. What's wrong here?
It's just useless.

> >> +
> >> +    /* Register the partitions */
> >> +    err = add_mtd_partitions(ixp4xx_mtd, ixp4xx_nand_parts,
> >> nb_of_parts);
> >> +    if (err)  {
> >> +        printk(KERN_ERR "Failed to add MTD partitions\n");
> >> +        if ( ixp4xx_nand_parts != plat->parts )
> >> +        kfree(ixp4xx_nand_parts);
> >>
> > Wrong indentation.
> > Moreover, if the number of partitions obtained by parse_mtd_partitions
> > is the same as the one provided by platform data, you'll get leakage
> > here.
> how this can happens? Please describe.

Suppose that the number of partitions obtained by parse_mtd_partitions
is the same as configured statically. If add_mtd_partitions fails,
ixp4xx_nand_parts != plat->parts is false and kfree won't be called.

Vitaly
