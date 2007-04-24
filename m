Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgGOi-0006qb-Cm
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 04:29:18 -0400
Message-ID: <462DBFD8.1080906@ru.mvista.com>
Date: Tue, 24 Apr 2007 12:29:12 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vitalywool@gmail.com>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>	
	<4628CB3A.3000701@ru.mvista.com>
	<acd2a5930704240021y7badb098ybc2b5b04f5b7daeb@mail.gmail.com>
In-Reply-To: <acd2a5930704240021y7badb098ybc2b5b04f5b7daeb@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Wool wrote:
>> >> +
>> >> +    /* Register the partitions */
>> >> +    err = add_mtd_partitions(ixp4xx_mtd, ixp4xx_nand_parts,
>> >> nb_of_parts);
>> >> +    if (err)  {
>> >> +        printk(KERN_ERR "Failed to add MTD partitions\n");
>> >> +        if ( ixp4xx_nand_parts != plat->parts )
>> >> +        kfree(ixp4xx_nand_parts);
>> >>
>> > Wrong indentation.
>> > Moreover, if the number of partitions obtained by parse_mtd_partitions
>> > is the same as the one provided by platform data, you'll get leakage
>> > here.
>> how this can happens? Please describe.
>
> Suppose that the number of partitions obtained by parse_mtd_partitions
> is the same as configured statically. If add_mtd_partitions fails,
> ixp4xx_nand_parts != plat->parts is false and kfree won't be called.
>
> Vitaly
It's impossible because ixp4xx_nand_parts and plat->parts hold pointers 
to mtd_partions structure, not number of partions. Number of partitions 
held in nb_of_parts variable.

Thank you,
Ruslan
