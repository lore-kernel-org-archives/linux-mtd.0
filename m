Received: from smtp-vbr6.xs4all.nl ([194.109.24.26])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqnWh-0004BY-Oo
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 11:29:52 +0000
Message-ID: <48F8773B.40809@cs.vu.nl>
Date: Fri, 17 Oct 2008 13:30:03 +0200
From: Rutger Hofman <rutger@cs.vu.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Question on how NAND flash BBT is stored in the chip
References: <48F75131.9040002@cs.vu.nl>
	<7ccead5b0810170027h677520dav1ea09079175b93fe@mail.gmail.com>
In-Reply-To: <7ccead5b0810170027h677520dav1ea09079175b93fe@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Du Zhongdong <axdududu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Du Zhongdong wrote:
> 
> On Thu, Oct 16, 2008 at 10:35 PM, Rutger Hofman <rutger@cs.vu.nl 
> <mailto:rutger@cs.vu.nl>> wrote:
> 
>     Good afternoon list,
> 
>     I have a question how the BBT (bad block table) is stored in MTD NAND
>     devices. I googled for a while, and browsed the code, but I am still not
>     sure.
> 
>     The question:
>     Is the BBT stored/retrieved using a spare layout? Is ECC
>     generation/correction done for it?
> 
> I'm not quite sure about what you mean by "using a spare layout",  but I 
> think bbt is stored in the main area of the specific page(the member 
> "int pages[NAND_MAX_CHIPS" in struct nand_bbt_descr). 

With 'spare layout' I mean the thingy that does auto-placement etc, and 
wraps up ECC, bad block mark(s), and user data into the spare area.

> the function scan_write_bbt calls mtd->write_oob with struct 
> mtd_oob_ops.mode = MTD_OOB_PLACE, tracking down this procedure I think 
> the oob data does not change its layout when written to NAND flash.
> 
> hope this information might be of some help to you :)
> 
> 
> 
>     This question derives from the question above: is the BBT marker pattern
>     stored within a spare layout (with slots for ECC, bad block markers
>     etc)? Or is it written verbatim (raw and unmangled) into the spare area?

Thanks. When browsing the code, I thought as much, but I couldn't 
absolutely make sure whether the spare is mangled or not.

So this leaves the question: the BBT itself doesn't seem to use ECC. Is 
there a reason why not? Wouldn't it be better if it does?

Thanks,

Rutger Hofman
VU Amsterdam
