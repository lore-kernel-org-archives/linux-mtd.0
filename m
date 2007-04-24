Received: from wx-out-0506.google.com ([66.249.82.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgGU7-00073z-HW
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 04:35:00 -0400
Received: by wx-out-0506.google.com with SMTP id t8so2172639wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Apr 2007 01:34:50 -0700 (PDT)
Message-ID: <acd2a5930704240134s5f7e79f3t25ab9e6d0831870b@mail.gmail.com>
Date: Tue, 24 Apr 2007 12:34:50 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
In-Reply-To: <462DBFD8.1080906@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
	<4628CB3A.3000701@ru.mvista.com>
	<acd2a5930704240021y7badb098ybc2b5b04f5b7daeb@mail.gmail.com>
	<462DBFD8.1080906@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/24/07, Ruslan V. Sushko <rsushko@ru.mvista.com> wrote:
> > Suppose that the number of partitions obtained by parse_mtd_partitions
> > is the same as configured statically. If add_mtd_partitions fails,
> > ixp4xx_nand_parts != plat->parts is false and kfree won't be called.
> It's impossible because ixp4xx_nand_parts and plat->parts hold pointers
> to mtd_partions structure, not number of partions. Number of partitions
> held in nb_of_parts variable.

Oh shoot, right, thanks!

Vitaly
