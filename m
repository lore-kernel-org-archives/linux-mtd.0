Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq2MK-0007V9-1B
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 15:02:57 +0000
Received: from leonp.plris.com (leonp.plris.com [192.168.50.57])
 by plris.com (Postfix) with ESMTP id 0334FA839B
 for <linux-mtd@lists.infradead.org>; Mon,  9 Dec 2013 17:02:30 +0200 (IST)
From: Leon Pollak <leonp@plris.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Erase error does not mark smth in BBT
Date: Mon, 09 Dec 2013 17:02:29 +0200
Message-ID: <2617855.2mDaZaEr79@leonp.plris.com>
In-Reply-To: <CAFLxGvyvB_tTsVm1j6H26W+its4+ko8Ug5vmSBk0zRp-t3HGuw@mail.gmail.com>
References: <1885453.87ds9Vg2nc@leonp.plris.com>
 <CAFLxGvyvB_tTsVm1j6H26W+its4+ko8Ug5vmSBk0zRp-t3HGuw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 08 December 2013 15:43:33 Richard Weinberger wrote:
> On Sun, Dec 8, 2013 at 10:51 AM, Leon Pollak <leonp@plris.com> wrote:
> > Hello, all.
> > I am studying the code in nand_base.c
> > I thought that when erase command ends with an error, the
> > corresponding block will be marked as bad or in OOB or in BBT or in
> > both.
> > I think I walked through the code carefully, but did not find this
> > BBT/OOB treatment.
> > 
> > Please, help me - where is my error?
> 
> You're looking at the wrong layer. :-)
> Look at the users of mtd_block_markbad().


Thank you very much, Richard.

Yes, I understood my problem - I expected to see the BBT update on 
erasure failure in the kernel driver.
But, as I understood after your hint and code study, the BBT update is 
totally on the "user's" responsibility.

---
So, I went to the mtd-utils package.
And there I have the similar problem - when looking into the 
flash_erase.c file I see the following:

if (mtd_erase(mtd_desc, &mtd, fd, eb) != 0) {
   sys_errmsg("%s: MTD Erase failure", mtd_device);
   continue;
}
and I was not able to find any usage of mtd_mark_bad.

Contrary, analyzing the nandwrite.c file, I found that the logic is as 
following (lines 537-555):
1. Try to write block data.
2. If failed, try to erase this block.
3. If erased failed (EIO) mark the block as bad and restart from (1).
---

So, here the question comes:
If the block erasure already failed once (in flash_erase.c) - doesn't 
this require the BBT update at this point?
Why do one need to retry to erase/program it?
AFAIK, most of NAND vendors state that the block once not erased is bad 
and even if you succeeded to erase it afterwords, it is dangerous to 
continue to use it.

Thank you very much for your help.
-- 
Leon
