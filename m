Received: from web63403.mail.re1.yahoo.com ([69.147.97.43])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeBuK-0003vu-PM
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 16:54:09 +0000
Date: Fri, 12 Sep 2008 09:54:07 -0700 (PDT)
From: Fundu <fundu_1999@yahoo.com>
Subject: Re: Flash Mapping and gpio
To: linux-mtd@lists.infradead.org, Allon Stern <allon.stern@argonst.com>
In-Reply-To: <85A33091-283C-48B9-AD6B-01E3E4BECD94@argonst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15184.25981.qm@web63403.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First off thanks Allon, I really appreciate your input.
> static map_word __xipram custom_map_read(struct map_info
> *map,
> unsigned long ofs)
> {
>       CUSTOM_BANKSWITCH(ofs);
>       return inline_map_read(map, ofs & BANK_MASK); //
> mask out the bank
> }
> 
that makes sense. but one question don't you need to adjust the offset before calling inline_map_read ? or does the macro do that for you ? 

> In my case, I asserted that a copy won't be more than
> 16MB, and two
> the copy in two chunks, switching banks in the middle, if
> need be.
yeah i have setup mtd partitions such that they don't span across the banks.

> HTH.
yup you bet. 


      
