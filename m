Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DIVwC-00058i-3M
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 14:04:37 -0400
Message-ID: <425181A7.2010809@ieee.org>
Date: Mon, 04 Apr 2005 14:04:23 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>
	<424CAE31.8040302@ieee.org> <425157C5.4040007@infocell-its.com>
In-Reply-To: <425157C5.4040007@infocell-its.com>
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

Zeri Virgo wrote:

> The call stack goes from mtd->read into nand_base.c nand_read() then 
> nand_do_read_ecc() passing NULL to oob_buf and oob_sel. The pointer 
> dereference occurs on oobsel when defining ecc_calc and ecc_code... I 
> (nervously) replaced these with hard values and the probing completed 
> successfully. I think most of the activity lower down does null checks 
> on oobsel or doesn't use these values due to the eccmode.
>
> I have no idea what the fix should be! Maybe move the definitions of 
> ecc_calc and ecc_code below the check and set of oobsel to &mtd->oobinfo?


You're 100% correct.  A recent modification to support variable-sized 
ecc_calc and ecc_code arrays didn't take into account the possibility of 
NULL oobsel.  Fixed in CVS.

Let me know if DOCBoot finally works for you, please!

    -Dan
