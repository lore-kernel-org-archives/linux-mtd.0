Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SEl94-0006eF-LT
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 17:34:23 +0000
Message-ID: <4F79E314.609@newsguy.com>
Date: Mon, 02 Apr 2012 10:34:12 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/4] MTD: flash drivers set ecc strength
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_BxgTMJb0beyDC17jcmavmuz0WGvLw3NbJRCiuvB4VnA@mail.gmail.com>
In-Reply-To: <CAN8TOE_BxgTMJb0beyDC17jcmavmuz0WGvLw3NbJRCiuvB4VnA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

I was just reviewing things and realized that I accidentally ignored one of your
comments...


On 03/29/2012 10:24 AM, Brian Norris wrote:
>>
>>        case NAND_ECC_SOFT_BCH:
>> @@ -3384,6 +3385,8 @@ int nand_scan_tail(struct mtd_info *mtd)
>>                        pr_warn("BCH ECC initialization failed!\n");
>>                        BUG();
>>                }
>> +               chip->ecc.strength =
>> +                       chip->ecc.bytes*8 / fls(8*chip->ecc.size);
> 
> Isn't this spacing against coding style? I'd suggest spaces around the
> '*'. Also, after a few minutes, I have no idea where this calculation
> comes from. But I'm not familiar with SOFT_BCH. Maybe a comment is in
> order?


I'm no bch expert myself (ping, Ivan), but I believe this is correct, and it is
consistant with the equations used to determine the 't' parameter (i.e.,
ecc_strength) from nand_bch_init() in drivers/mtd/nand/nand_bch.c.  (BTW,
currently only nandsim uses SOFT_BCH.)  As for coding style... honestly, I
mostly just rely on checkpatch.pl, but I'll check the style guide document.

Thanks,
Mike
