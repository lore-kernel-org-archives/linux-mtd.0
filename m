Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCwmm-0007nG-1p
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2012 18:08:08 +0000
Message-ID: <5054C407.1030507@newsguy.com>
Date: Sat, 15 Sep 2012 11:08:07 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: docg4: ecc.read_page() returns 0 on
 uncorrectible errors
References: <1347378650-3522-1-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE9--TGMshgGuWvz=5=TuBDe=Qw-bDn0OfAs_OOujzsDjQ@mail.gmail.com>
In-Reply-To: <CAN8TOE9--TGMshgGuWvz=5=TuBDe=Qw-bDn0OfAs_OOujzsDjQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, thanks for the Ack.  It seems I was careless with my own driver when I
did the bitflip patches.

BTW, the consequence of this oversight was seen when using mtdchar (e.g.,
mtd-utils 'nanddump') when uncorrectAble bitflips occurred.  The userspace app
just kept repeating the read call, because the prior call indicated that no data
was read.


On 09/14/2012 08:20 PM, Brian Norris wrote:
>> +       if (bits_corrected == -EBADMSG)   /* uncorrectible errors */
> 
> s/uncorrectible/uncorrectable/


Ha!  I actualy looked the word up in the dictionary, and either spelling is
correct.  But yours is more common.


> 
>> +               return 0;
>>         return bits_corrected;
>>  }
>>
> 
> With that change:
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> Also, not a blocker for this patch, but this made me look elsewhere in docg4.c:
> 
> static int __init read_factory_bbt(struct mtd_info *mtd)
> {
> ...
>         status = docg4_read_page(mtd, nand, buf, 0, DOCG4_FACTORY_BBT_PAGE);
>         if (status)
>                 goto exit;
> 
> This could cause problems if there are ever bitflips on the BBT page.
> Can the factory BBT contain bitflips?


Ah, yes, thank you for catching that!!  Overlooked when docg4_read_page() was
changed to return max bitflips; status should be tested for negative value.
Should also try to recover from uncorrectable bitflips (I believe that table is
stored redundantly).

Thanks again,
Mike
